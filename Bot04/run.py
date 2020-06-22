import re
import twitterscraper
import pymysql

regex = re.compile("[^ ㄱ-ㅣ가-힣]+")

with open("./password.txt", "r") as f:
    connection = pymysql.connect(host="fumire.moe", user="fumiremo_admin", password=f.readline().strip(), db="fumiremo_Bots", charset="utf8", port=3306)
cursor = connection.cursor(pymysql.cursors.DictCursor)


def type_count(text):
    answer = 0
    chousung = [1, 2, 1, 1, 2, 1, 1, 1, 2, 1, 2, 1, 1, 2, 1, 1, 1, 1, 1]
    jungsung = [1, 1, 1, 2, 1, 1, 1, 2, 1, 2, 2, 2, 1, 1, 2, 2, 2, 1, 1, 2, 1]
    jongsung = [0, 1, 2, 2, 1, 2, 2, 1, 1, 2, 2, 2, 2, 2, 2, 2, 1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1]
    for character in text:
        if not ('가' <= character <= '힣'):
            answer += 1
            continue
        answer += chousung[(ord(character) - ord('가')) // 588]
        answer += jungsung[(ord(character) - ord('가')) % 21]
        answer += jongsung[(ord(character) - ord('가')) % 28]
    return answer


for tweet in twitterscraper.query.query_tweets_from_user("poetrybot_kr", limit=1000):
    text = " ".join(list(filter(lambda x: x, list(map(lambda x: regex.sub("", x), tweet.text.split("\n")[:-1])))))
    count = type_count(text)

    if not text or not count:
        continue

    text = "\n".join(text[i:i + 20] for i in range(0, len(text), 20))

    query = "SELECT * FROM `TypingData` WHERE `Sentence` LIKE '%s' ORDER BY `Sentence` ASC" % text
    cursor.execute(query)

    if cursor.fetchall():
        continue

    query = "INSERT INTO `TypingData` (`IndexColumn`, `AddedTime`, `Sentence`, `Count`) VALUES (NULL, CURRENT_TIMESTAMP, '%s', '%d');" % (text, count)
    cursor.execute(query)

connection.close()
