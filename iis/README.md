# Windows Server container image with IIS and ASP.NET

Created with PowerShell commands
Environment: Windows Server Core Base OS Image

## Build

```
docker build -t iis:latest .
```

## Run (detach mode)

```
docker run --name iis-demo -d -p 80:80 iis
```