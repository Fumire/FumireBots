# Bot08

Bot08 is a passive KakaoTalk message collector. For every received message, it
forwards room, sender, profile hash, and message text to the backend endpoint.
It does not send chat replies.

## Runtime requirements

Bot08 is written for an Android KakaoTalk bot runtime, not standalone Node.js.
The runtime must provide `FileStream`, `Utils`, `Log`, `imageDB`, Java classes,
and the standard `response(...)` callback.

Required file on the Android device:

```text
/storage/emulated/0/Bots/Bot08/password.txt
```

`password.txt` is used to generate a rolling MD5 hash for authenticated backend
requests.

## Captured data

The `response(...)` callback sends these values to
`https://fumire.moe/bots/addword2`:

- `Room`: chat room name.
- `Sender`: sender display name.
- `SenderProfile`: Java hash of the sender profile image.
- `Message`: raw received message text.
- `Hash`: rolling hash based on `password.txt` and current time.

Because this bot forwards raw chat content, deploy it only in rooms where that
behavior is expected and allowed.

## Deployment

Copy `Bot08.js` into the Android bot runtime as script `Bot08`, then place
`password.txt` in the runtime bot directory:

```text
/storage/emulated/0/Bots/Bot08/
```

No Dockerfile or local run command is provided for Bot08 because it depends on
mobile bot runtime APIs.
