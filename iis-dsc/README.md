# Windows Server container image with IIS and ASP.NET

Created with PowerShell DSC
Environment: Windows Server Core Base OS Image

## Build

```
docker build -t iis-dsc .
```

## Run (interactive mode)

```
docker run --name iis-dsc-demoit -it -p 80:80 iis-dsc cmd
```

## Run (detach mode)

```
docker run --name iis-dsc-demod -d -p 80:80 iis-dsc
```