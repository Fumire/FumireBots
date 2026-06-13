# Bot01

Bot01 is a small Discord bot for 이망톡. It logs in with a Discord token from
`password.txt`, sets an activity message, and responds to a few exact chat
messages.

## Behavior

- `In code` replies with `We trust`.
- `ping` replies with `pong`.
- On startup, the bot attempts to set its Discord activity to `In code we
  trust`.

## Required files

- `Bot01.py`: Discord bot implementation.
- `password.txt`: Discord bot token, stored next to `Bot01.py`; ignored by Git.
- `Dockerfile`: Python 3.9.7 image with `discord.py==1.7.3`.
- `Makefile`: Docker build, start, and delete commands.

## Run with Docker

```sh
cd Bot01
make build
make start
```

`make start` runs the image detached with `--restart always` and mounts this
directory to `/usr/src/app`, so `password.txt` must exist in `Bot01/` before the
container starts.

To remove the image:

```sh
make delete
```

## Run locally

```sh
cd Bot01
python3 -m pip install discord.py==1.7.3
python3 Bot01.py
```

Run from `Bot01/` so the script can open `./password.txt`.
