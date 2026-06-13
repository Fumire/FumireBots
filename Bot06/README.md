# Bot06

Bot06 imports Korean idioms into the bot word-quiz database. It scrapes an
external Korean idiom page, converts each idiom into a chosung prompt, and
stores the result with `Which='idiom'`.

## Inputs

- Source page: `http://www.gdks.org/index.php?document_srl=61564&mid=koreanBbs`
- `password.txt`: MySQL password, stored in `Bot06/`; ignored by Git.
- `requirements.txt`: currently lists `requests==2.32.4` and
  `PyMySQL==1.1.1`.

The script also imports Beautiful Soup through the `bs4` package. Install
`bs4` in the runtime environment before running the importer; the current
`requirements.txt` does not list it.

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

If the container exits with `ModuleNotFoundError: No module named 'bs4'`, add
`bs4` to the image or run locally with the dependency command below.

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
python3 -m pip install -r requirements.txt bs4
python3 run.py
```

Run from `Bot06/` so `password.txt` is available.

## Expected output

Malformed scrape chunks are printed for review. Successful inserts do not create
local output files; the database table is the output.
