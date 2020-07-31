import json
import re
import bs4
import requests

regex = re.compile(r"[^가-힣]+")


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


session = requests.Session()
html_data = bs4.BeautifulSoup(session.post("https://ko.wiktionary.org/wiki/부록:자주_쓰이는_한국어_낱말_5800").text, "html.parser")
white_list = [dd.find("a").text for dd in html_data.find_all("dd")][1:]
print(white_list)

for filename in ["./korean_dictionary1.json", "./korean_dictionary2.json"]:
    with open(filename, "r") as f:
        for line in f.readlines():
            data = json.loads(line.replace("'", "\"", 6))
