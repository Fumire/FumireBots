# Bot05

Bot05 builds Korean word-quiz rows from local dictionary dumps and a Wiktionary
frequency list. It classifies words by difficulty and inserts them into the
homepage database for Bot02's chosung quiz.

## Inputs

- `korean_dictionary1.json` and `korean_dictionary2.json`: line-oriented source
  dictionary dumps. Each line contains a `word` and raw HTML definition text.
- `wordslistUnique.txt`: committed word-list source data kept with the importer.
- Wiktionary page `부록:자주_쓰이는_한국어_낱말_5800`: fetched at runtime to
  identify common words.
- `password.txt`: MySQL password; ignored by Git and copied into the Docker
  image by `Dockerfile`.

## Classification

Rows are inserted into `WordQuiz` with one of these `Which` values:

- `basic`: Hangul-only words that appear in the frequent-word list.
- `hard`: Hangul-only words outside the frequent-word list.
- `extreme_hard`: words containing Hangul consonants plus syllables.
- `no_chosung`: words containing Hangul vowels plus syllables.

The script strips example text from the raw dictionary HTML and stores a cleaned
meaning with the word and generated chosung prompt.

## Database side effects

The script connects to:

```text
host=fumire.moe
db=fumiremo_homepage
user=fumiremo_admin
port=3306
```

It inserts rows into `WordQuiz`.

## Run with Docker

```sh
cd Bot05
make start
```

`make start` builds the image through the `build.log` target when needed, then
runs the importer with this directory mounted at `/result`.

To remove the image and build log:

```sh
make delete
```

## Run locally

```sh
cd Bot05
python3 -m pip install -r requirements.txt
python3 run.py
```

Run from `Bot05/` so the dictionary files and `./password.txt` are found.

## Expected output

The importer prints each word it inserts. It does not write a local result file;
the MySQL `WordQuiz` table is the output.
