# fake-chinese-checker-bot

## これは何
- Discord の特定のチャンネルにおいて漢字以外の文字列が投稿された際に"🤖不正入国者検知!" と投稿するだけのDiscord Botです
    - emoji, メンション, 記号は検知対象外です

## 使い方
### 準備
- 事前に適切な権限を与えた Discord Botを作成し、動作させたいサーバに招待しておく
- Token と検知してほしいチャンネルのIDをコピーしておく

### Docker（ghcr.io イメージ利用・推奨）
```
$ cp .env.sample .env

$ vi .env
# BOT_TOKEN と CHANNEL_ID を記入

$ docker compose pull && docker compose up -d
```
- イメージ: `ghcr.io/haya58/fake-chinese-checker-bot`（タグはブランチ名・gitタグ・sha の3種。`compose.yaml` は `:main` 参照）
- イメージは `.github/workflows/build-push-docker-image.yaml` により `linux/amd64` でビルド・pushされる

### Docker（ローカルビルド）
```
$ cp .env.sample .env

$ vi .env
# BOT_TOKEN と CHANNEL_ID を記入

$ docker build -t fake-chinese-checker-bot .
$ docker run -d --rm --name fake-chinese-checker-bot --env-file .env fake-chinese-checker-bot
```