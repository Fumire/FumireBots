import json
import re
import bs4
import pymysql
import requests

regex = re.compile(r"[^가-힣]+")
regex2 = re.compile(r"[^ㄱ-ㅎ가-힣]+")
regex3 = re.compile(r"[^ㅏ-ㅣ가-힣]+")

with open("./password.txt", "r") as f:
    connection = pymysql.connect(host="fumire.moe", user="fumiremo_admin", password=f.readline().strip(), db="fumiremo_Bots", charset="utf8", port=3306)
cursor = connection.cursor(pymysql.cursors.DictCursor)

session = requests.Session()


def make_chosung(text):
    chosung = ['ㄱ', 'ㄲ', 'ㄴ', 'ㄷ', 'ㄸ', 'ㄹ', 'ㅁ', 'ㅂ', 'ㅃ', 'ㅅ', 'ㅆ', 'ㅇ', 'ㅈ', 'ㅉ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ']
    jungsung = ['ㅏ', 'ㅐ', 'ㅑ', 'ㅒ', 'ㅓ', 'ㅔ', 'ㅕ', 'ㅖ', 'ㅗ', 'ㅘ', 'ㅙ', 'ㅚ', 'ㅛ', 'ㅜ', 'ㅝ', 'ㅞ', 'ㅟ', 'ㅠ', 'ㅡ', 'ㅢ', 'ㅣ']
    answer = ""
    for character in text:
        if character in chosung:
            answer += character
        elif character in jungsung:
            answer += " "
        else:
            answer += chosung[(ord(character) - ord('가')) // 588]
    return answer


html_data = bs4.BeautifulSoup(session.post("https://ko.wiktionary.org/wiki/부록:자주_쓰이는_한국어_낱말_5800").text, "html.parser")
white_list = [dd.find("a").text for dd in html_data.find_all("dd")][1:]

for filename in ["./korean_dictionary1.json", "./korean_dictionary2.json"]:
    with open(filename, "r") as f:
        for line in f.readlines():
            data = json.loads(line.replace("'", "\"", 6))

            if (regex.sub("", data["word"]) == data["word"]) and (data["word"] in white_list):
                which = "basic"
            elif (regex.sub("", data["word"]) == data["word"]) and (data["word"] not in white_list):
                which = "hard"
            elif regex2.sub("", data["word"]) == data["word"]:
                which = "extreme_hard"
            elif regex3.sub("", data["word"]) == data["word"]:
                which = "no_chosung"
            else:
                continue

            print(data["word"], which)

            data["raw"] = bs4.BeautifulSoup(data["raw"], "html.parser").text
            data["raw"] = data["raw"][:data["raw"].find("❖예문")].replace("'", "\\'")

            query = "INSERT INTO `WordQuiz` (`IndexColumn`, `Which`, `Word`, `Chosung`, `Meaning`) VALUES (NULL, '%s', '%s', '%s', '%s');" % (which, data["word"], make_chosung(data["word"]), data["raw"])
            cursor.execute(query)

connection.close()
