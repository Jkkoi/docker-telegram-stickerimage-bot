# docker-telegram-stickerimage-bot

基于[phoenixlzx/telegram-stickerimage-bot](https://github.com/phoenixlzx/telegram-stickerimage-bot)使用 Docker 打包

用 Docker 构建了一下，来让某些不能编译某些必要的库的系统开心（

实例 [@anotherstickerset2packbot](https://t.me/anotherstickerset2packbot)

#Usage 用法

从 @BotFather 那里拿到 token 和 bot name 替换下面 `<>` 中的对应内容

`docker run --restart=always  --net=host -e TOKEN=<bottoken> -e USERNAME=<botname> jkkoi/docker-telegram-stickerimage-bot`

#License
MIT
