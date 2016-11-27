# Script to install the ChefDK on the Win10devbox.


Install-Module AzureRM -Force
Install-Module Azure -Force
choco install chefdk -force -yes
