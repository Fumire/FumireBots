import json
import re
import bs4
import requests

regex = re.compile(r"[^가-힣]+")
regex2 = re.compile(r"[^ㄱ-ㅎ가-힣]+")
regex3 = re.compile(r"[^ㅏ-ㅣ가-힣]+")

session = requests.Session()

file_name = "/result/result.json"


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


with open(file_name, "w") as f:
    f.write("{\n")

html_data = bs4.BeautifulSoup(session.post("https://ko.wiktionary.org/wiki/부록:자주_쓰이는_한국어_낱말_5800").text, "html.parser")
white_list = [dd.find("a").text for dd in html_data.find_all("dd")][1:]

for filename in ["korean_dictionary1.json", "korean_dictionary2.json"]:
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

            data["raw"] = bs4.BeautifulSoup(data["raw"], "html.parser").text
            data["raw"] = data["raw"].replace(data["word"], "~")

            with open(file_name, "a") as f:
                f.write("\"" + data["word"] + "\":")
                f.write(json.dumps({"Meaning": data["raw"], "which": which, "Chosung": make_chosung(data["word"])}))
                f.write(",\n")

            print(data["word"])

with open(file_name, "a") as f:
    f.write("}")
