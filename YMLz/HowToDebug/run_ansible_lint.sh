#!/bin/bash

## Ansible-lint https://github.com/ansible/ansible-lint проверяет плэйбуки и роли на наличие методов и поведения, которые потенциально могут быть улучшены и конечно проверит синтаксис.
## Линтер обычно присутствует при тестировании molecule и не даст вам смержить в мастер-ветку сырой, некрасивый, неблагополучный код.
## Запускаем линтер очень просто:
## 	Проверка плейбука - ansible-lint your_playbook.yml
## 	Проверка роли - линтер пройдет по всем файлам роли ansible-lint your_rolename.yml
## 	Найдет yml файлы или роли в текущей директории и проверит их ansible-lint

ansible-lint $1
VAR_RESULT=$?
if [ $VAR_RESULT == 2 ]
then
    exit 0
else
    exit $VAR_RESULT
fi
