docker build -t helloworld .
docker run helloworld
docker build -t iis .
docker images
docker run -d --name iis -p 80:80 iis
    "show www external"
docker attach iis
	ctrl+c
docker stop iis
docker build -t iis-dsc .
docker run -d --name iis-dsc -p 8383:80 iis-dsc
    "show www external"
docker build -t apache-http-php .
docker run -d --name apache-http-php --hostname apache-http-php -p 80:80 apache-http-php
	"show www external"
docker ps
docker stop iis-dsc
docker stop apache-http-php