# Windows Server container image with Apache and PHP

Environment: Windows Server Core Base OS Image

## Build

```
docker build -t apache-http-php:latest .
```

## Run (detach mode)

```
docker run --name apache-http-php-demo -d -p 80:80 apache-http-php
```