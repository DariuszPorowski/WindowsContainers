# Remove existing default web site files
Remove-Item C:\inetpub\wwwroot\iisstart.*

# Ensure write permissions over web app project files
icacls C:\inetpub\wwwroot\blogengine /grant Everyone:F /t /q

# Import necessary IIS modules then set app project folder as web application
Import-Module IISAdministration
Import-Module WebAdministration
Remove-Website -Name 'Default Web Site'
New-Website -Name 'BlogEngine' -Port 80 -PhysicalPath 'C:\inetpub\wwwroot\blogengine'