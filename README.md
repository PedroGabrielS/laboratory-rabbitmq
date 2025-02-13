# Projeto: Filas com RabbitMQ

Este repositório contém um projeto voltado para fins laboratoriais, com o objetivo de estudar o uso de filas (Queue) utilizando RabbitMQ em conjunto com Laravel. Irei aperfeiçoando e adicionando atualizações com o decorrer do tempo.

## Tecnologias Utilizadas

- **Laravel**: Framework PHP para desenvolvimento backend
- **RabbitMQ**: Mensageria para processamento assíncrono
- **Docker**: Para facilitar a execução do ambiente
- **Docker Compose**: Gerenciamento dos containers
- **PostgreSQL/MySQL**: Banco de dados relacional (dependendo da configuração)

## Configuração do Ambiente

### 1. Clonar o Repositório
```sh
git clone https://github.com/seu-usuario/nome-do-repositorio.git
cd nome-do-repositorio
```

### 2. Configurar o Ambiente
Copie o arquivo de exemplo do ambiente:
```sh
cp .env.example .env
```

Atualize as configurações no arquivo `.env`, especialmente as configurações de conexão com RabbitMQ:
```env
QUEUE_CONNECTION=rabbitmq
RABBITMQ_HOST=localhost
RABBITMQ_PORT=5672
RABBITMQ_USER=guest
RABBITMQ_PASSWORD=guest
```

### 3. Subir o Ambiente com Docker
Se estiver utilizando Docker, basta rodar:
```sh
docker-compose up -d
```

### 4. Instalar Dependências
```sh
composer install
php artisan migrate
```

### 5. Rodar as Filas
Inicie o worker para processar as mensagens da fila:
```sh
php artisan queue:work
```

## Testando o Envio para a Fila

Você pode testar o envio de uma mensagem para a fila rodando:
```sh
php artisan queue:table
php artisan queue:work
```

Se quiser enviar um job manualmente, use:
```sh
php artisan tinker
>>> dispatch(new \App\Jobs\MeuJob())
```

## Contribuição

Sinta-se à vontade para abrir issues e pull requests com melhorias e correções.

---

**Autor:** Pedro Gabriel da Silva
**Contato:** perdrog_silva@outlook.com

