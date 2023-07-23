
#### Use Case : Hosting a Website

    - List of WebServers :
        To Hosting a Website, We need to use webservers: i.e. Apache httpd, Apache2, Nginx, IIS etc...
            
    - Host A Website on Linux Distributions :
        - Ubuntu / Amazon Linux 

    - Host A Website on Windows:
        - IIS  

#### Sample WebSite Code :

https://github.com/kesavkummari/kesavkummari-website-code.git

#### Host A Website on Windows:
 
Below process using PowerShell:

```
Sure, here are the step by step notes to install IIS using PowerShell on Windows and deploy code from GitHub:

Open PowerShell ISE or Visual Studio Code with PowerShell extension installed.

Run PowerShell as an administrator.

Install the Web-Server feature using the command below:

 % Install-WindowsFeature -Name Web-Server -IncludeManagementTools

This will start the installation process of IIS. Wait until the installation is completed.

Once the installation is completed, you can verify the installation by opening the browser and navigating to http://localhost.

Next, clone the GitHub repo containing the code you want to deploy using the command below:

% git clone <repository_url>

% git clone https://github.com/kesavkummari/kesavkummari-website-code.git

This will download the code to your local machine.

Navigate to the downloaded code directory and locate the IIS configuration file. The file is usually named Web.config.

Open PowerShell and navigate to the directory where the code is located.

Use the following command to copy the contents of the current directory to the IIS web root directory:

% Copy-Item * -Destination C:\inetpub\wwwroot

This command will copy all the files and folders from the current directory to the IIS web root directory, which is typically located at 

C:\inetpub\wwwroot.

Verify that the code is deployed by opening the browser and navigating to http://localhost.

That's it! You have successfully installed IIS using PowerShell on Windows and deployed code from GitHub.
```

    
