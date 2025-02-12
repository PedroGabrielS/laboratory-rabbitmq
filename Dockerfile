# Usa a imagem oficial do PHP com extensões necessárias
FROM php:8.2-cli

# Instala dependências do sistema
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    curl \
    libpq-dev \
    libzip-dev \
    zip \
    supervisor \
    && docker-php-ext-install pdo pdo_mysql zip sockets

# Instala o Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos do projeto
COPY . .

# Instala as dependências do Laravel
RUN composer install --no-dev --optimize-autoloader

# Dá permissão para o Laravel escrever no storage e bootstrap/cache
RUN chmod -R 777 storage bootstrap/cache

# Exibe comandos disponíveis
CMD ["php", "artisan", "list"]
