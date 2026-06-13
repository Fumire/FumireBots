# FumireBots

FumireBots is a collection of small personal bot projects and data-loading
utilities. Each bot is self-contained in its own directory and has its own
runtime assumptions, credentials, and deployment path.

## Bot index

| Bot | Runtime | Purpose | Entry point |
| --- | --- | --- | --- |
| [Bot01](Bot01/) | Python, Discord | Discord chat bot for simple replies | `Bot01.py` |
| [Bot02](Bot02/) | KakaoTalk bot JavaScript runtime | Group-chat utility bot with stock, word quiz, chatter, and reaction features | `Bot02.js` |
| [Bot03](Bot03/) | Python, Docker | Factorio locale and recipe importer for MySQL-backed bot data | `run.py` |
| [Bot04](Bot04/) | Python, Docker | Typing-practice sentence loader | `run.py` |
| [Bot05](Bot05/) | Python, Docker | Korean word quiz dictionary importer | `run.py` |
| [Bot06](Bot06/) | Python, Docker | Korean idiom importer | `run.py` |
| [Bot07](Bot07/) | Python, Docker | Deprecated hard Korean quiz importer | `run.py` |
| [Bot08](Bot08/) | KakaoTalk bot JavaScript runtime | Passive chat-message collector | `Bot08.js` |

## Repository layout

- `Bot01/` contains a Discord bot and Docker wrapper.
- `Bot02/` contains a mobile KakaoTalk bot script, emoji data, and legacy game
  JSON data.
- `Bot03/` contains Factorio Lua data, Korean locale files, and an importer that
  writes Factorio item data into MySQL.
- `Bot04/` through `Bot07/` are Python data importers for typing and Korean word
  quiz tables.
- `Bot08/` contains a mobile KakaoTalk bot script that forwards chat metadata to
  the backend.

## Credentials and secrets

Credential files are intentionally ignored by Git through `**/password*.txt`.
Most bots expect a `password.txt` file in their own bot directory. Bot02 and
Bot08 expect the same kind of secret on the Android bot runtime filesystem:

```text
/storage/emulated/0/Bots/<BotName>/password.txt
```

Never commit real password files. The scripts use those files for Discord
tokens, MySQL passwords, or rolling hashes sent to `fumire.moe` bot endpoints.

## Running bots

Run commands from inside the target bot directory because the scripts use
relative paths for `password.txt`, local data files, and generated artifacts.

Python bots that include a `Makefile` generally support Docker:

```sh
cd Bot03
make build
make start
```

Bot05 uses `build.log` as its build target, so `make start` is the normal path
there. Bot02 and Bot08 are not standalone Node.js programs; they must be loaded
into a KakaoTalk bot environment that provides APIs such as `FileStream`,
`Utils`, `AppData`, `replier`, and Android/Java classes.

## Operational notes

- Several scripts immediately connect to `fumire.moe` MySQL databases or bot
  HTTP endpoints when run.
- The data importers perform database inserts as their main side effect. Review
  target database names in each bot README before running them.
- Large source dictionaries and Factorio locale files are committed as input
  data. Do not regenerate or replace them unless the target bot importer needs
  a data refresh.
- There is no shared dependency manager for the repository. Use each bot's
  Dockerfile, `requirements.txt`, or README for its specific dependencies.
