const scriptName = "Bot02";

var md5 = require("md5");

const denyList = JSON.parse(FileStream.read("/storage/emulated/0/Bots/Bot02/password_deny.txt"));
const clockList = JSON.parse(FileStream.read("/storage/emulated/0/Bots/Bot02/password_clock.txt"));
const emojiList = JSON.parse(FileStream.read("/storage/emulated/0/Bots/Bot02/emoji.txt"));

const helpMessages = {
    "general": "--- General ---\n//도움 → 간단한 도움말\n//소개 → 자기소개\n--- Productive ---\n//주식 → 주식 관련 기능\n--- Fun ---\n//팩토 → 팩토리오 관련 기능\n//타자 → 타자 연습\n//초성 → 초성 퀴즈\n--- Verbosity ---\n⭐ 가끔 말도 한답니다!\n//speak → 더 자주 말합니다.\n//quiet → 덜 말합니다.\n--- 마법의 소라고둥---\n마법의 소라고둥님~~요?\n마법의 소라고둥님~~죠?\n--- etc. ---\n⭐ 몇몇 이스터에그가 숨어있어요!\n",
    "introduce": "안녕하세요? 저는 후미레(봇)이에요!\nhttps://namecard.kakao.com/Fumire",
    "stock": "//주식 추천 → 머신러닝이 오늘 수익이 나올 것 같은 종목을 추천해줍니다!",
    "wordquiz": "//초성 시작 → 초성 퀴즈를 시작합니다!\n//초성 힌트 → 살짝 힌트를 볼 수 있어요!\n//초성 포기 → 초성 퀴즈를 포기합니다.\n//초성 점수 → 점수 현황을 볼 수 있어요!\n⭕: 맞으면 점수를 획득합니다.\n❌: 포기하면 점수를 잃습니다.\n⭐: 힌트를 보면 점수를 잃습니다.",
};
const speakMessages = {
    "shutup": "읍읍읍!",
    "probability": " %의 확률로 말합니다!",
    "already": "이미 많이 떠들고 있는 걸요!",
};
const stockMessages = {
    "ask": "추천 받으셨으니 광고 한 번 눌러주실래요?\nhttps://fumire.moe/stock",
};
const wordquizMessages = {
    "loading": "로딩 중이에요! 잠시만 기다려주세요!!",
    "already": "이미 초성 퀴즈가 진행 중이에요!",
    "typo": " 님, 오타 났으니깐 1점 감점 할게요!",
    "empty": "진행 중인 초성 퀴즈가 없습니다. < //초성 시작 >으로 시작해보세요!",
    "knavish": "한 글자에 힌트 쓰는 건 치사한 거 아녜요?\n아무튼 점수는 깎을 거에요!",
    "answer": "\n정답입니다!!!\n\n",
    "jackpot": "\n잭팟이 터졌어요!!\n\n",
}

const probability = {};
const wordquiz = {};

function getRandomInt(min, max) {
    return Math.floor(Math.random() * (max - min) + min);
}

function getProbability(probability) {
    return getRandomInt(0, 100) <= probability;
}

function randomPicker(arr) {
    return arr[Math.floor(Math.random() * arr.length)]
}

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function addEmoji(str) {
    reply = "";
    for (var i = 0; i < 5; i++) {
        reply += randomPicker(emojiList) + "\n";
    }
    reply += str;
    for (var i = 0; i < 5; i++) {
        reply += randomPicker(emojiList) + "\n";
    }
    return reply;
}

function getInitSound(text) {
    var init = ['ㄱ', 'ㄲ', 'ㄴ', 'ㄷ', 'ㄸ', 'ㄹ', 'ㅁ', 'ㅂ', 'ㅃ', 'ㅅ', 'ㅆ', 'ㅇ', 'ㅈ', 'ㅉ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ'];
    var chosung = "";
    for (var i = 0; i < text.length; i++) {
        var index = Math.floor(((text.charCodeAt(i) - 44032) / 28) / 21);
        if (index >= 0) {
            chosung += init[index];
        } else {
            chosung += text.charAt(i);
        }
    }
    return chosung;
}

function getMiddleSound(src) {
    var t = ['ㅏ', 'ㅐ', 'ㅑ', 'ㅒ', 'ㅓ', 'ㅔ', 'ㅕ', 'ㅖ', 'ㅗ', 'ㅘ', 'ㅙ', 'ㅚ', 'ㅛ', 'ㅜ', 'ㅝ', 'ㅞ', 'ㅟ', 'ㅠ', 'ㅡ', 'ㅢ', 'ㅣ'];
    var middle = '';
    for (var i = 0; i < src.length; i++) {
        var index = Math.floor(((src.charCodeAt(i) - 44032) / 28) % 21);
        if (index >= 0) {
            middle += t[index];
        }
    }
    return middle;
}

function getFinalSound(src) {
    var t = ['', 'ㄱ', 'ㄲ', 'ㄳ', 'ㄴ', 'ㄵ', 'ㄶ', 'ㄷ', 'ㄹ', 'ㄺ', 'ㄻ', 'ㄼ', 'ㄽ', 'ㄾ', 'ㄿ', 'ㅀ', 'ㅁ', 'ㅂ', 'ㅄ', 'ㅅ', 'ㅆ', 'ㅇ', 'ㅈ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ'];
    var final = '';
    for (var i = 0; i < src.length; i++) {
        var index = (src.charCodeAt(i) - 44032) % 28;
        if (index >= 0) {
            final += t[index];
        }
    }
    return final;
}

function getHash() {
    return md5(FileStream.read("/storage/emulated/0/Bots/Bot02/password.txt").trim() + String(Math.floor(Date.now() / 10000)));
}

Utils.getTextFromWeb = function(url) {
    try {
        var url = new java.net.URL(url);
        var con = url.openConnection();

        if (con != null) {
            con.setConnectTimeout(10000);
            con.setUseCaches(true);
            var isr = new java.io.InputStreamReader(con.getInputStream());
            var br = new java.io.BufferedReader(isr);
            var str = br.readLine();
            var line = "";
            while ((line = br.readLine()) != null) {
                str += "\n" + line;
            }
            isr.close();
            br.close();
            con.disconnect();
        }
        if (str == null) return "";
        else return str.toString();
    } catch (e) {
        Log.debug(e);
        return "";
    }
};

function response(room, msg, sender, isGroupChat, replier, imageDB, packageName) {
    var minutes = new Date().getMinutes();
    if (minutes == "00") {
        const hours = new Date().getHours();
        if (AppData.getInt("clock") != hours) {
            AppData.putInt("clock", parseInt(hours));
            for (var clockRoom in clockList) {
                replier.reply(clockRoom, "지금은 " + hours + "시 정각입니다!");
            }
        }
    }

    msg = msg.trim();
    sender = sender.trim();
    room = room.trim();
    profile = md5(imageDB.getProfileImage());

    if (isGroupChat == true)
    {
        return;
    }

    if (isGroupChat == false && false) {
        replier.reply(helpMessages["introduce"]);
        return;
    }

    if (probability[room] == undefined) {
        probability[room] = 5;
    }

    if (isGroupChat == true && denyList.includes(room) == true) {
        if (/[ㅋ]+$/.test(msg) == true && !msg.endsWith("ㅇㅋ") && !msg.endsWith("ㄹㅇㅋㅋ")) {
            if (getProbability(probability[room])) {
                replier.reply(room, "ㅋ".repeat(getRandomInt(1, 10)));
            }
        }

        if (/[ㅎ]+$/.test(msg) == true && !msg.endsWith("ㅇㅎ")) {
            if (getProbability(probability[room])) {
                replier.reply(room, "ㅎ".repeat(getRandomInt(1, 10)));
            }
        }

        if (/[ㅠㅜ]+$/.test(msg) == true) {
            if (getProbability(probability[room])) {
                replier.reply(room, "ㅠ".repeat(getRandomInt(1, 10)));
            }
        }

        return;
    }

    if (msg == "//도움") {
        replier.reply(room, helpMessages["general"]);
        return;
    }

    if (msg == "//소개") {
        replier.reply(room, helpMessages["introduce"]);
        return;
    }

    if (msg == "//주식 추천") {
        var data = JSON.parse(Utils.getTextFromWeb("https://fumire.moe/bots/query1?hash=" + getHash()));
        var reply = "";
        for (var key in data) {
            reply += String(parseInt(key) + 1) + "위! " + data[key]["Name"] + " (" + data[key]["Code"] + ")\n"
            reply += "→ 예상: " + ((parseFloat(data[key]["Estimation"]) - 1) * 100).toFixed(3) + " % 현재: " + ((parseFloat(data[key]["RealValue"]) - 1) * 100).toFixed(3) + "%\n";
        }

        replier.reply(room, reply);
        replier.reply(room, stockMessages["ask"]);

        return;
    } else if (msg == "//주식") {
        replier.reply(helpMessages["stock"]);
        return;
    }

    if (wordquiz[room] == undefined) {
        wordquiz[room] = {"score": 0, "word": "", "chosung": "", "meaning": "", "level": "basic"};
    } else if (msg == "//초성 힌트" || msg == "//ㅊㅅ ㅎㅌ") {
        if (wordquiz[room]["word"] == "") {
            replier.reply(room, wordquizMessages["empty"]);
            return;
        }

        var bomb = String(getRandomInt(5, 10));
        Utils.getTextFromWeb("https://fumire.moe/bots/wordscore?Room=" + encodeURIComponent(room) + "&Sender=" + encodeURIComponent(sender) + "&SenderProfile=" + encodeURIComponent(profile) + "&Action=-" + bomb + "&hash=" + getHash());

        if (wordquiz[room]["word"].length == 1) {
            replier.reply(room, wordquizMessages["knavish"]);
            return;
        } else {
            var tmp = -1;
            do {
                tmp = getRandomInt(0, wordquiz[room]["word"].length);
            }
            while (wordquiz[room]["word"].charAt(tmp) == " ")

            replier.reply("초성 힌트: " + wordquiz[room]["chosung"].slice(0, tmp) + "'" + wordquiz[room]["word"].charAt(tmp) + "'" + wordquiz[room]["chosung"].slice(tmp + 1) + "\n→ 뜻: " + wordquiz[room]["meaning"] + "\n[ " + sender + " ] 님의 점수가 " + bomb + "점 감점 되었습니다.");
        }
        return;
    } else if (msg.startsWith("//초성 시작") || msg.startsWith("//ㅊㅅ ㅅㅈ") || msg.startsWith("//ㅊㅅ")) {
        if (wordquiz[room]["word"] == "load") {
            replier.reply(room, wordquizMessages["loading"]);
            return;
        } else if (wordquiz[room]["word"] != "") {
            replier.reply(room, wordquizMessages["already"]);
            replier.reply("< " + getInitSound(wordquiz[room][1]) + " >\n→ 뜻: " + wordquiz[room][2]);
            return;
        }

        wordquiz[room]["word"] == "load";
        var level = "";

        if (msg == "//초성 시작" || msg == "//ㅊㅅ ㅅㅈ" || msg == "//ㅊㅅ") {
            level = wordquiz[room]["level"];
        } else if (msg.split(" ").length != 3) {
            replier.reply(room, sender + wordquizMessages["typo"]);
            Utils.getTextFromWeb("https://fumire.moe/bots/wordscore?Room=" + encodeURIComponent(room) + "&Sender=" + encodeURIComponent(sender) + "&SenderProfile=" + encodeURIComponent(profile) + "&Action=-1&hash=" + getHash());
            level = wordquiz[room]["level"];
        } else {
            level = wordquiz[room]["level"] = msg.split(" ")[2];
        }

        if (level == "기본" || level == "ㄱㅂ" || level == "basic") {
            wordquiz[room] = JSON.parse(Utils.getTextFromWeb("https://fumire.moe/bots/wordquiz?word=basic&hash=" + getHash()));
            level = wordquiz[room]["level"] = "basic";
        } else if (level == "보통" || level == "ㅂㅌ" || level == "hard") {
            wordquiz[room] = JSON.parse(Utils.getTextFromWeb("https://fumire.moe/bots/wordquiz?word=hard&hash=" + getHash()));
            level = wordquiz[room]["level"] = "hard";
        } else if (level == "어려움" || level == "ㅇㄹㅇ" || level == "extreme_hard") {
            wordquiz[room] = JSON.parse(Utils.getTextFromWeb("https://fumire.moe/bots/wordquiz?word=extreme_hard&hash=" + getHash()));
            level = wordquiz[room]["level"] = "extreme_hard";
        } else {
            replier.reply(room, sender + wordquizMessages["typo"]);
            Utils.getTextFromWeb("https://fumire.moe/bots/wordscore?Room=" + encodeURIComponent(room) + "&Sender=" + encodeURIComponent(sender) + "&SenderProfile=" + encodeURIComponent(profile) + "&Action=-1&hash=" + getHash());
            wordquiz[room] = JSON.parse(Utils.getTextFromWeb("https://fumire.moe/bots/wordquiz?word=basic&hash=" + getHash()));
            level = wordquiz[room]["level"] = "basic";
        }

        replier.reply(room, "초성 퀴즈를 시작합니다!\n< " + wordquiz[room]["chosung"] + " >\n→ 뜻: " + wordquiz[room]["meaning"] + "\n[ " + sender + " ] 님의 점수가 +1점 되었습니다.");
        Utils.getTextFromWeb("https://fumire.moe/bots/wordscore?Room=" + encodeURIComponent(room) + "&Sender=" + encodeURIComponent(sender) + "&SenderProfile=" + encodeURIComponent(profile) + "&Action=1&hash=" + getHash());
        return;
    } else if (msg == "//초성 포기") {
        if (wordquiz[room]["word"] == "") {
            replier.reply(room, wordquizMessages["empty"]);
            return;
        }

        var bomb = String(getRandomInt(5, 100));
        replier.reply(room, "초성 퀴즈를 포기했습니다.\n정답은 '" + wordquiz[room]["word"] + "' 이었습니다!" + "\n[ " + sender + " ] 님의 점수가 " + bomb + "점 감점 되었습니다.");
        Utils.getTextFromWeb("https://fumire.moe/bots/wordscore?Room=" + encodeURIComponent(room) + "&Sender=" + encodeURIComponent(sender) + "&SenderProfile=" + encodeURIComponent(profile) + "&Action=-" + bomb + "&hash=" + getHash());
        wordquiz[room] = ["", "", "", wordquiz[room][3]];
        return;
    } else if (getInitSound(msg) == wordquiz[room]["chosung"] && wordquiz[room]["word"] != "") {
        if (msg == wordquiz[room]["word"]) {
            wordquiz[room]["word"] = "load";

            reply = addEmoji(wordquizMessages["answer"]);
            reply += "\n정답: " + msg + "\n";
            reply += sender + " 님께서 " + String(wordquiz[room]["score"]) + "점을 얻었습니다!!\n" + randomPicker(emojiList)
            replier.reply(room, reply);

            Utils.getTextFromWeb("https://fumire.moe/bots/wordscore?Room=" + encodeURIComponent(room) + "&Sender=" + encodeURIComponent(sender) + "&SenderProfile=" + encodeURIComponent(profile) + "&Action=" + String(wordquiz[room]["score"]) + "&hash=" + getHash());
            wordquiz[room] = {"score": 0, "word": "", "chosung": "", "meaning": "", "level": wordquiz[room]["level"]};
        } else {
            var same = 0.0;
            for (var i = 0; i < msg.length; i++) {
                if (getMiddleSound(msg.charAt(i)) == getMiddleSound(wordquiz[room]["word"].charAt(i))) {
                    same += 1;
                }
                if (getFinalSound(msg.charAt(i)) == getFinalSound(wordquiz[room]["word"].charAt(i))) {
                    same += 1;
                }
            }
            same *= 100 / 2 / msg.length;
            if (getFinalSound(msg.charAt(msg.length - 1)) == "") {
                replier.reply(room, "[ " + sender + " ] 님, [" + msg + "]는 정답이 아니에요.\n일치도는 " + same.toFixed(3) + " % (초성 제외) 입니다.\n→ 뜻: " + wordquiz[room]["meaning"] + "\n→ 초성: " + wordquiz[room]["chosung"]);
            } else {
                replier.reply(room, "[ " + sender + " ] 님, [" + msg + "]은 정답이 아니에요.\n일치도는 " + same.toFixed(3) + " % (초성 제외) 입니다.\n→ 뜻: " + wordquiz[room]["meaning"] + "\n→ 초성: " + wordquiz[room]["chosung"]);
            }

            if (getProbability(99)) {
                wordquiz[room]["score"] += 1;
                replier.reply(room, "얻을 수 있는 점수가 +1점 올라 " + String(wordquiz[room]["score"]) + " 점이 되었습니다.");
            } else {
                wordquiz[room]["score"] += 100;
                replier.reply(room, addEmoji(wordquizMessages["jackpot"]));
                replier.reply(room, "얻을 수 있는 점수가 +100점 올라 " + String(wordquiz[room]["score"]) + " 점이 되었습니다.");
            }
        }
        return;
    } else if (msg == "//초성 점수") {
        var data = JSON.parse(Utils.getTextFromWeb("https://fumire.moe/bots/wordscore2?Room=" + encodeURIComponent(room) + "&hash=" + getHash()));
        var reply = "";
        for (var key in data) {
            reply += String(parseInt(key) + 1) + "위! " + data[key]["Sender"] + " (" + data[key]["Score"] + "점)\n";
        }

        replier.reply(room, reply);
        return;
    }

    if (msg == "//shutup") {
        probability[room] = 100;
        replier.reply(room, speakMessages["shutup"]);
    } else if (msg == "//speak") {
        if (probability[room] <= 95) {
            probability[room] += 5;
            replier.reply(room, probability[room].toString() + speakMessages["probability"]);
        } else {
            replier.reply(room, speakMessages["already"]);
        }
        return;
    } else if (msg == "//quiet") {
        if (probability[room] >= 5) {
            probability[room] -= 5;
            replier.reply(room, probability[room].toString() + speakMessages["probability"]);
        } else {
            replier.reply(room, speakMessages["shutup"]);
        }
        return;
    }

    if (/[ㅋ]+$/.test(msg) == true && !msg.endsWith("ㅇㅋ") && !msg.endsWith("ㄹㅇㅋㅋ")) {
        if (getProbability(probability[room])) {
            replier.reply(room, "ㅋ".repeat(getRandomInt(1, 10)));
            return;
        }
    }

    if (/[ㅎ]+$/.test(msg) == true && !msg.endsWith("ㅇㅎ")) {
        if (getProbability(probability[room])) {
            replier.reply(room, "ㅎ".repeat(getRandomInt(1, 10)));
            return;
        }
    }

    if (/[ㅠㅜ]+$/.test(msg) == true) {
        if (getProbability(probability[room])) {
            replier.reply(room, "ㅠ".repeat(getRandomInt(1, 10)));
            return;
        }
    }

    if (/마법의(|\s)소라고(동|둥)님(\S|\s)+(요|죠)\?/.test(msg) == true) {
        replier.reply(room, randomPicker(["응", "아니", "언젠가는", "가만히 있어", "다 안 돼", "좋아", "다시 한 번 물어봐", "안 돼"]));
        return;
    }
}

function onCreate(savedInstanceState, activity) {
    var textView = new android.widget.TextView(activity);
    textView.setText("Hello, World!");
    textView.setTextColor(android.graphics.Color.DKGRAY);
    activity.setContentView(textView);
}

function onStart(activity) {}

function onResume(activity) {}

function onPause(activity) {}

function onStop(activity) {}
