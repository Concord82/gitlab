# Установка сервера gitlab
## Настройка terraform

Переименуйте файл terraform.tfvars.example в terraform.tfvars

    mv terraform.tfvars.example terraform.tfvars

В данном файле внесите учетные данные для соединения с proxmox

    proxmox_ip = "192.168.90.6"
    api_token_id = "terraform-prov@pam!pm_token_api"
    api_token_secret = "set api token proxmox"

## Запуск создания сервера

Инициализация

    terraform init

выполнить создание

    terraform apply

## Уничтожить сервера

    terraform destroy





