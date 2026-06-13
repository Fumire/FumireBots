# Bot02

Bot02 is a KakaoTalk group-chat bot script. It is written for an Android
KakaoTalk bot runtime, not for standalone Node.js.

## Runtime requirements

The script expects runtime globals such as `FileStream`, `Utils`, `AppData`,
`Log`, `replier`, `imageDB`, and Java/Android classes. Load `Bot02.js` into the
bot runtime under the script name `Bot02`.

Required files on the Android device:

```text
/storage/emulated/0/Bots/Bot02/password.txt
/storage/emulated/0/Bots/Bot02/password_deny.txt
/storage/emulated/0/Bots/Bot02/password_clock.txt
/storage/emulated/0/Bots/Bot02/emoji.txt
```

- `password.txt` is used to build a short-lived MD5 hash for backend requests.
- `password_deny.txt` is parsed as JSON and controls rooms where the bot only
  performs minimal reaction behavior.
- `password_clock.txt` is parsed as JSON and controls hourly clock messages.
- `emoji.txt` is a JSON array of decorative emoji strings used in replies.

## Main commands

| Message | Behavior |
| --- | --- |
| `//도움` | Show the general help message. |
| `//소개` | Show the bot introduction. |
| `//주식` | Show stock command help. |
| `//주식 추천` | Fetch stock recommendations from `https://fumire.moe/bots/query1`. |
| `//초성 시작` or `//ㅊㅅ` | Start a chosung word quiz using the current room difficulty. |
| `//초성 시작 기본` | Start a basic quiz. Also accepts `ㄱㅂ` or `basic`. |
| `//초성 시작 보통` | Start a hard quiz. Also accepts `ㅂㅌ` or `hard`. |
| `//초성 시작 어려움` | Start an extreme-hard quiz. Also accepts `ㅇㄹㅇ` or `extreme_hard`. |
| `//초성 힌트` or `//ㅊㅅ ㅎㅌ` | Reveal one character as a hint and subtract points. |
| `//초성 포기` | Give up the active quiz and subtract points. |
| `//초성 점수` | Fetch room and sender score summaries. |
| `//speak` | Increase random reaction frequency for the room. |
| `//quiet` | Decrease random reaction frequency for the room. |
| `//shutup` | Disable random reactions for the room. |
| `봇,<message>` | Send the message to the backend chat endpoint and reply with the response. |

The bot also has small automatic reactions for laughter/crying text, link
warnings for selected senders, and "magic conch" style yes/no responses.

## Backend endpoints

Bot02 calls multiple `fumire.moe` endpoints:

- `/bots/query1` for stock recommendations.
- `/bots/wordquiz` for quiz words.
- `/bots/wordscore`, `/bots/wordscore2`, and `/bots/wordscore3` for scoring.
- `/bots/chat1` for `봇,` chat replies.

All endpoint calls include a rolling hash generated from `password.txt`; keep
the device password file synchronized with the backend.

## Local files

- `Bot02.js`: deployed bot script.
- `md5.js`: standalone MD5 helper source kept with the bot.
- `emoji.txt`: JSON emoji list.
- `Data/*.json`: legacy game data grouped by difficulty and reward type. The
  current `Bot02.js` does not read these files directly.
