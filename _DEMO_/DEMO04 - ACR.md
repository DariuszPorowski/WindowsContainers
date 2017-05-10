docker login <ACR NAME>-microsoft.azurecr.io -u <ACR UID> -p <ACR KEY>
docker images
docker tag myiis <ACR NAME>-microsoft.azurecr.io/samples/myiis
docker images
docker push <ACR NAME>-microsoft.azurecr.io/samples/myiis
docker rmi <ACR NAME>-microsoft.azurecr.io/samples/myiis
docker images
docker pull <ACR NAME>-microsoft.azurecr.io/samples/myiis
docker run -d --rm -p 8383:80 --name=myiisacr <ACR NAME>-microsoft.azurecr.io/samples/myiis
    "show www external"
docker stop myiisacr