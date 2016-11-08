# BlogEngine.NET webapp on two containers - web fronten and db backend

## Build & Run (Docker Compose)

```
docker-compose build
docker-compose up
```


## Build

```
docker build -t db .
docker build -t web .
```

## Run (interactive mode)

```
docker run -it --name "db" -p 1433:1433 db
docker run -it --name "web" -p 80:80 web
```

## Run (detach mode)

```
docker run -d --name "db" -p 1433:1433 db
docker run -d --name "web" -p 80:80 web
```