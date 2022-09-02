### Параметры сервисного аккаунта YANDEX CLOUD
1. Создаем сервисный аккаунт:
- Смотрим параметр `filder_id` командой:
`yc config list`
- Создаем сервисный аккаунт `otus-linux` командой:
`yc iam service-account create --name otus-linux --description "LINUX PROJECT"`
    Переменная | Значение (пример)
    :-: | :-:
    id | 9999mlh294l6iqp79999
    folder_id | 9999sc1fkv9f229k9999
2. Назначим роль `admin` (что бы не было в последствии заморочек с доступами) сервисному аккаунту `otus-linux` командой:
`yc resource-manager folder add-access-binding --id <folder_id> --role admin --service-account-id <id>`
1. Создадим IAM KEY для сервисного аккаунта командой и укажем путь экспорта:
`yc iam key create --service-account-id <id> --output .~/yandex-cloud/YC_SRV_ACC_KEY.json`

