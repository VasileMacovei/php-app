FROM php:8.2-cli

# Dependencias del sistema
RUN apt-get update && apt-get install -y unzip git

# Instalar Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /app

# Composer primero (mejor cache)
COPY composer.json composer.lock* ./
RUN composer install --no-interaction

# Código de la app
COPY . .

# Puerto de la app (NO Jenkins)
EXPOSE 8081

# Servidor web PHP
CMD ["php", "-S", "0.0.0.0:8081", "-t", "public"]
