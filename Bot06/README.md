# Bot06

Bot06 imports Korean idioms into the bot word-quiz database. It scrapes an
external Korean idiom page, converts each idiom into a chosung prompt, and
stores the result with `Which='idiom'`.

## Inputs

- Source page: `http://www.gdks.org/index.php?document_srl=61564&mid=koreanBbs`
- `password.txt`: MySQL password, stored in `Bot06/`; ignored by Git.
- `requirements.txt`: lists `bs4`, `requests`, and `PyMySQL`.

## Database side effects

The script connects to:

```text
host=fumire.moe
db=fumiremo_Bots
user=fumiremo_admin
port=3306
```

It inserts rows into `WordQuiz` with:

- `Which`: `idiom`
- `Word`: cleaned idiom text
- `Chosung`: generated Korean initial-consonant prompt
- `Meaning`: cleaned idiom explanation

## Run with Docker

```sh
cd Bot06
make build
make start
```

For an interactive run:

```sh
make test
```

Stop and remove the named container:

```sh
make stop
```

## Run locally

```sh
cd Bot06
python3 -m pip install -r requirements.txt
python3 run.py
```

Run from `Bot06/` so `password.txt` is available.

## Expected output

Malformed scrape chunks are printed for review. Successful inserts do not create
local output files; the database table is the output.
