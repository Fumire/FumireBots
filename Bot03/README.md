# Bot03

Bot03 imports Factorio locale names and recipe ingredient data into the bot
database. It loads Factorio Lua recipe data, reads Korean locale `.cfg` files,
and writes missing rows to MySQL tables used by the Factorio bot.

## Inputs

- `core/lualib/`: Factorio Lua helper files required by the loader.
- `recipes/base/`: Factorio base recipe data loaded through `lupa`.
- `locale/*.cfg`: Korean locale files used to populate item and entity names.
- `password.txt`: MySQL password for the `fumiremo_admin` user; ignored by Git.
- `location.txt`: note pointing to the local Factorio Korean locale path used
  when sourcing locale files.

## Database side effects

The script connects to:

```text
host=fumire.moe
db=fumiremo_Bots
user=fumiremo_admin
port=3306
```

It inserts new rows into:

- `FactorioLocale`: maps Factorio entity/item/fluid keys to localized names.
- `FactorioItems`: maps recipe result names to serialized ingredient lists.

## Run with Docker

```sh
cd Bot03
make build
make start
```

For an interactive run:

```sh
make test
```

The Dockerfile uses Python 3.9.7 and installs `PyMySQL==1.0.2` and
`lupa==1.10`.

## Run locally

```sh
cd Bot03
python3 -m pip install PyMySQL==1.0.2 lupa==1.10
python3 run.py
```

Run from `Bot03/` so the script can resolve `core/`, `recipes/`, `locale/`, and
`./password.txt`.

## Expected output

The importer prints each newly inserted recipe item and its ingredient list.
No result file is written; the MySQL tables are the output.
