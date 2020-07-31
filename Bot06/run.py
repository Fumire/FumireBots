import re
import bs4
import pymysql
import requests


def make_chosung(text):
    chosung = ['ㄱ', 'ㄲ', 'ㄴ', 'ㄷ', 'ㄸ', 'ㄹ', 'ㅁ', 'ㅂ', 'ㅃ', 'ㅅ', 'ㅆ', 'ㅇ', 'ㅈ', 'ㅉ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ']
    answer = ""
    for character in text:
        if character == " ":
            answer += character
        else:
            answer += chosung[(ord(character) - ord('가')) // 588]
    return answer


regex = re.compile(r"[^가-힣\ ]+")

with open("password.txt", "r") as f:
    connection = pymysql.connect(host="fumire.moe", user="fumiremo_admin", password=f.readline().strip(), db="fumiremo_Bots", charset="utf8", port=3306)
cursor = connection.cursor(pymysql.cursors.DictCursor)

session = requests.Session()

html_data = bs4.BeautifulSoup(session.post("http://www.gdks.org/index.php?document_srl=61564&mid=koreanBbs", headers={"User-Agent": '"user-agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.47 Safari/537.36"'}).text, "html.parser")

data = re.split(r"[0-9]+\.", html_data.find("div", {"class": "document_61564_0 xe_content"}).text)
for idiom in data:
    idiom = idiom.strip().split("☞ ")

    if len(idiom) != 2:
        print(idiom)
        continue

    idiom[0] = regex.sub("", idiom[0]).strip()
    idiom[1] = idiom[1].replace("'", "")

    query = "INSERT INTO `WordQuiz` (`IndexColumn`, `Which`, `Word`, `Chosung`, `Meaning`) VALUES (NULL, 'idiom', '%s', '%s', '%s');" % (idiom[0], make_chosung(idiom[0]), idiom[1])
    cursor.execute(query)

connection.close()
