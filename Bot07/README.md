# Bot07

## Deprecated

Bot07 is an older Korean quiz importer. It reads the same committed dictionary
dumps used by Bot05 and inserts hard quiz rows into the legacy `WordQuiz3`
table.

Prefer Bot05 for the current `WordQuiz` importer unless you specifically need
to rebuild `WordQuiz3`.

## Inputs

- `korean_dictionary1.json` and `korean_dictionary2.json`: line-oriented source
  dictionary dumps.
- `password.txt`: MySQL password, stored in `Bot07/`; ignored by Git.

The script keeps only words matching Korean syllables, spaces, and periods,
then removes HTML and example text from the meaning field.

## Database side effects

The script connects to:

```text
host=fumire.moe
db=fumiremo_Bots
user=fumiremo_admin
port=3306
```

It inserts rows into `WordQuiz3` with:

- `Word`: cleaned dictionary word.
- `Chosung`: generated initial-consonant prompt.
- `Meaning`: cleaned dictionary meaning.

## Run with Docker

```sh
cd Bot07
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
cd Bot07
python3 -m pip install PyMySQL bs4
python3 run.py
```

Run from `Bot07/` so the dictionary files and `./password.txt` are found.

## Expected output

The script prints each word before inserting it. No local result file is
produced.
