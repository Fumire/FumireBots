# Bot04

Bot04 seeds Korean typing-practice text into the homepage database. It contains
a fixed list of Korean literary excerpts, normalizes each excerpt, calculates a
Korean keystroke count, and inserts rows that are not already present.

## Database side effects

The script connects to:

```text
host=fumire.moe
db=fumiremo_homepage
user=fumiremo_admin
port=3306
```

It reads and writes the `TypingData` table:

- `Sentence`: normalized Korean sentence text.
- `Count`: calculated typing effort based on Hangul initial, medial, and final
  components.
- `AddedTime`: inserted with `CURRENT_TIMESTAMP`.

## Required files

- `run.py`: typing data importer.
- `password.txt`: MySQL password, stored in `Bot04/`; ignored by Git.
- `Dockerfile`: Python 3.9.7 image with `PyMySQL==1.0.2` and `twint==2.1.20`.
- `Makefile`: Docker build, start, test, and delete targets.

## Run with Docker

```sh
cd Bot04
make build
make start
```

For an interactive run:

```sh
make test
```

## Run locally

```sh
cd Bot04
python3 -m pip install PyMySQL==1.0.2
python3 run.py
```

Run from `Bot04/` so `./password.txt` is found.

## Expected output

The script prints each calculated keystroke count before deciding whether to
insert the sentence. No local output file is produced.
