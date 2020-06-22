import configparser
import itertools
import os
import lupa
import pymysql


def list_file(path):
    return sorted(list(filter(lambda x: os.path.isfile(x), list(map(lambda x: os.path.join(path, x), os.listdir(path))))))


def list_dir(path):
    return sorted(list(filter(lambda x: os.path.isdir(x), list(map(lambda x: os.path.join(path, x), os.listdir(path))))))


lua = lupa.LuaRuntime(unpack_returned_tuples=True)


def lua_run_file(f, pwd=None):
    global lua
    f = os.path.abspath(f)
    current_location = os.getcwd()
    if os.path.isfile(f):
        if pwd is None:
            os.chdir(os.path.dirname(f))
        else:
            os.chdir(pwd)
        print("Executing file:", os.path.abspath(f))
        print("PWD:", os.getcwd())
        lua.execute(open(f).read())
    os.chdir(current_location)


def load_mod(mod):
    global lua

    if os.path.isdir(os.path.join("recipes", mod, "prototypes", "recipe")):
        path = os.path.join("recipes", mod, "prototypes", "recipe")
    elif os.path.isdir(os.path.join("recipes", mod, "prototypes", "recipes")):
        path = os.path.join("recipes", mod, "prototypes", "recipes")
        lua_run_file(os.path.join("recipes", mod, "prototypes", "functions", "functions.lua"), os.path.join("recipes", mod))
    else:
        raise ValueError("Directory not existed")
    print("Entering directory:", os.path.abspath(path))
    for f in list_file(path):
        lua_run_file(f)


lua.execute('package.path = "' + os.path.abspath(os.path.join("core", "lualib")) + '/?.lua;" .. package.path')
lua_run_file(os.path.join("core", "lualib", "dataloader.lua"))
for mod in ["base"]:
    load_mod(mod)

if __name__ == "__main__":
    with open("./password.txt", "r") as f:
        connection = pymysql.connect(host="fumire.moe", user="fumiremo_admin", password=f.readline().strip(), db="fumiremo_Bots", charset="utf8", port=3306)
    cursor = connection.cursor(pymysql.cursors.DictCursor)

    query = "SELECT `EntityName` FROM `FactorioLocale`"
    cursor.execute(query)
    results = list(map(lambda x: x["EntityName"], cursor.fetchall()))

    config = configparser.ConfigParser()
    for locale_file in list_file("locale"):
        with open(locale_file, "r", encoding="utf-8-sig") as f:
            config.read_file(itertools.chain(["[global]"], f), source=locale_file)
        for section in (["entity-name", "item-name", "fluid-name"] if "fluid-name" in config.sections() else ["entity-name", "item-name"]):
            for item in config[section]:
                if item in results:
                    continue
                else:
                    results.append(item)

                query = "INSERT INTO `FactorioLocale` (`IndexColumn`, `EntityName`, `ItemName`) VALUES (NULL, '%s', '%s');" % (item, config[section][item].replace("'", "\\'"))
                cursor.execute(query)

    recipes = dict()
    for item in list(lua.globals().data.raw.recipe):
        if "ingredients" in list(lua.globals().data.raw.recipe[item]):
            recipes[item] = list()
            for i in list(lua.globals().data.raw.recipe[item].ingredients):
                ingredient = lua.globals().data.raw.recipe[item].ingredients[i]
                if len(list(ingredient.items())) >= 3:
                    recipes[item].append([ingredient["name"], ingredient["amount"]])
                elif len(list(ingredient.items())) == 2:
                    recipes[item].append([ingredient[1], ingredient[2]])
                else:
                    raise ValueError(list(lua.globals().data.raw.recipe[item].ingredients[i]))
        elif "normal" in list(lua.globals().data.raw.recipe[item]):
            result = lua.globals().data.raw.recipe[item].normal.result
            recipes[result] = list()
            for i in list(lua.globals().data.raw.recipe[item].normal.ingredients):
                ingredient = lua.globals().data.raw.recipe[item].normal.ingredients[i]
                if len(list(ingredient.items())) == 3:
                    recipes[result].append([ingredient["name"], ingredient["amount"]])
                elif len(list(ingredient.items())) == 2:
                    recipes[result].append([ingredient[1], ingredient[2]])
                else:
                    raise ValueError
        else:
            raise ValueError

    query = "SELECT * FROM `FactorioItems`"
    cursor.execute(query)
    results = list(map(lambda x: (x["Result"], x["Ingredient"]), cursor.fetchall()))

    for item in recipes:
        ingredient = "+".join(list(map(lambda x: "×".join(list(map(str, x))), sorted(recipes[item]))))

        if (item, ingredient) in results:
            continue
        else:
            results.append((item, ingredient))
        print(item, recipes[item])

        query = "INSERT INTO `FactorioItems` (`IndexColumn`, `Result`, `Ingredient`) VALUES (NULL, '%s', '%s');" % (item, ingredient)
        cursor.execute(query)

    connection.close()
