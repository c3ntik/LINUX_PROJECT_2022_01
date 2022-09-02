### SSH ключи
- Принимаем учетную запись `ubuntu` как основную учетную запись для YANDEX CLOUD
- Генерируем для нее ключи (подразумеваем что работаем с UNIX-пдобной гостевой ОС - LINUX, MACOS):
`ssh-keygen -t rsa -f ~/.ssh/ubuntu -C ubuntu -P ""`

