# Usage sample: create_new_website.ps1 C:\Web 1CLICK.LV IUSR_1CLICK.LV SuperSecretPassword

param (
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$PhysicalPath,

    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$WebsiteName,

    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$IUSRUsername,

    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$IUSRPassword
)

# Step 1: Create an App Pool
$AppPoolName = $WebsiteName
$LogFolder = $PhysicalPath + "\" + $WebsiteName + "\Log"
$PhysicalPath = $PhysicalPath + "\" + $WebsiteName + "\wwwroot"

New-WebAppPool -Name $AppPoolName

# Step 2: Set the App Pool Identity to the specified user
Set-ItemProperty "IIS:\AppPools\$AppPoolName" -Name "managedPipelineMode" -Value "Integrated"
Set-ItemProperty "IIS:\AppPools\$AppPoolName" -Name "processModel.identityType" -Value 3
Set-ItemProperty "IIS:\AppPools\$AppPoolName" -Name "processModel.userName" -Value $IUSRUsername
Set-ItemProperty "IIS:\AppPools\$AppPoolName" -Name "processModel.password" -Value (ConvertTo-SecureString $IUSRPassword -AsPlainText -Force) # Replace with the user's password

# Step 3: Create the website
New-Website -Name $WebsiteName -PhysicalPath $PhysicalPath -ApplicationPool $AppPoolName

# Step 4: Modify the default binding to the correct one
Set-WebBinding -Name $WebsiteName -BindingInformation "*:80:" -PropertyName "HostHeader" -Value $WebsiteName

# Step 5: Change the logging output folder
Set-WebConfigurationProperty -Filter "/system.applicationHost/sites/site[@name='$WebsiteName']/logFile" -Name "directory" -Value $LogFolder



#$BindingInformation = "*:80:"
#New-WebBinding -Name $WebsiteName -IPAddress "*" -Port 80 -Protocol "http"


# Step 4: Set permissions for the IUSR user on the website folder
#$WebsitePath = Join-Path $env:SystemDrive $PhysicalPath
#$Acl = Get-Acl -Path $WebsitePath
#$Permission = New-Object System.Security.AccessControl.FileSystemAccessRule($IUSRUsername, "Modify", "ContainerInherit, ObjectInherit", "None", "Allow")
#$Acl.SetAccessRule($Permission)
#Set-Acl -Path $WebsitePath -AclObject $Acl

# Step 5: Bind the website to port 80
# $BindingInformation = "*:80:"
# Set-WebBinding -Name $WebsiteName -BindingInformation $BindingInformation


# Step 6: Change the logging output folder
Set-WebConfigurationProperty -Filter "/system.applicationHost/sites/site[@name='$WebsiteName']/logFile" -Name "directory" -Value $LogFolder


# Step Last: Stop the website
Stop-Website -Name $WebsiteName


Write-Host "IIS website '$WebsiteName' created and stopped successfully."

