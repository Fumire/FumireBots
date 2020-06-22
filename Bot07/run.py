import json
import bs4
import re
import pymysql

regex = re.compile("[^가-힣\ \\.]+")

with open("./password.txt", "r") as f:
    connection = pymysql.connect(host="fumire.moe", user="fumiremo_admin", password=f.readline().strip(), db="fumiremo_Bots", charset="utf8", port=3306)
cursor = connection.cursor(pymysql.cursors.DictCursor)


def make_chosung(text):
    chosung = ['ㄱ', 'ㄲ', 'ㄴ', 'ㄷ', 'ㄸ', 'ㄹ', 'ㅁ', 'ㅂ', 'ㅃ', 'ㅅ', 'ㅆ', 'ㅇ', 'ㅈ', 'ㅉ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ']
    answer = ""
    for character in text:
        answer += chosung[(ord(character) - ord('가')) // 588]
    return answer


for filename in ["./korean_dictionary1.json", "./korean_dictionary2.json"]:
    with open(filename, "r") as f:
        for line in f.readlines():
            data = json.loads(line.replace("'", "\"", 6))

            if regex.sub("", data["word"]) == data["word"]:
                print(data["word"])
            else:
                continue

            data["raw"] = bs4.BeautifulSoup(data["raw"], "html.parser").text
            data["raw"] = data["raw"][data["raw"].find("［"):data["raw"].find("❖예문")].replace("'", "")

            query = "INSERT INTO `WordQuiz3` (`IndexColumn`, `Word`, `Chosung`, `Meaning`) VALUES (NULL, '%s', '%s', '%s');" % (data["word"], make_chosung(data["word"]), data["raw"])
            cursor.execute(query)

connection.close()
