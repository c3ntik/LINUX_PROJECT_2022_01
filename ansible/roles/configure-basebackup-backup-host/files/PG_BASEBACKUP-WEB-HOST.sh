#!/bin/bash

### !BEGIN

### Переменные ###
HOST_IP="10.10.10.61"

PG_USER="postgres"
PG_BASEBACKUP="$(which pg_basebackup)"

DATE=$(date '+%Y-%m-%d_%H-%M')

BACKUP_DIR="/opt/WEB_SQL_BACKUP"
LOG_FILE="$BACKUP_DIR/$DATE/BACKUP-$DATE.log"

### CREATE DIR
mkdir -p "$BACKUP_DIR/$DATE"

### Создание лог файла ###
{
	echo "### Резервное копирование запущено - $DATE ###"
	echo ""
} >> "$LOG_FILE"

### Запуск процесса резервного копирования ###
"$PG_BASEBACKUP" -h "$HOST_IP" -U "$PG_USER" -D "$BACKUP_DIR/$DATE/BACKUP-$DATE" -Ft -z -v -Z 9 -Xf >> "$LOG_FILE" 2>&1
PGBASEBACKUP_STATUS=$?

### Записать данные о статусе резервного копирования в лог файл ###
if [ "$PGBASEBACKUP_STATUS" -eq "0" ]; then
{
  echo  ""
  echo  "### Резервное копирование завершено успешно! Код возврата [EXITCODE=$PGBASEBACKUP_STATUS] - $DATE ###"
} >> "$LOG_FILE"
else
{
  echo  ""
  echo  "### Резервное копирование завершено с ошибкой! Код возврата [EXITCODE=$PGBASEBACKUP_STATUS] - $DATE ###"
} >> "$LOG_FILE"
fi

### !END
