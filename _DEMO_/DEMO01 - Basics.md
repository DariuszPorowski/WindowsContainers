docker version
docker images
docker search microsoft
docker pull microsoft/iis
docker run microsoft/windowsservercore hostname
docker run -it microsoft/windowsservercore cmd
	hostname
	ipconfig
	exit
docker ps
docker ps -a
docker rm <CONTAINER ID>
docker run -it --name myname microsoft/windowsservercore cmd
	hostname
	exit
docker rm myname
docker run -d --name iis01 --hostname iis01 -p 80:80 microsoft/iis cmd
docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" iis01
	Invoke-WebRequest <IP Address>
	"show www internal"
docker exec -it iis01 cmd
	del C:\inetpub\wwwroot\iisstart.htm
	echo "Hello World from Windows Server Container" > C:\inetpub\wwwroot\index.html
	"show www internal"
	"show www external"
	exit
docker stop iis01
docker commit iis01 myiis
docker images
docker run -d --name iis02 --hostname iis02 -p 80:80 myiis cmd
	"show www external"
docker kill iis02