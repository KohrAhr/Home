param (
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$PhysicalPath,

    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$WebsiteName,

    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$IUSRUsername
)

# Step 1: Create an App Pool
$AppPoolName = "$WebsiteName-AppPool"
New-WebAppPool -Name $AppPoolName

# Step 2: Set the App Pool Identity to the specified user
Set-ItemProperty "IIS:\AppPools\$AppPoolName" -Name processModel -Value @{
    userName = $IUSRUsername
    password = (ConvertTo-SecureString "YourPasswordHere" -AsPlainText -Force) # Replace with the user's password
}

# Step 3: Create the website
New-Website -Name $WebsiteName -PhysicalPath $PhysicalPath -ApplicationPool $AppPoolName

# Step 4: Bind the website to port 80
$BindingInformation = "*:80:"
Set-WebBinding -Name $WebsiteName -BindingInformation $BindingInformation

# Step 5: Set permissions for the IUSR user on the website folder
$WebsitePath = Join-Path $env:SystemDrive $PhysicalPath
$Acl = Get-Acl -Path $WebsitePath
$Permission = New-Object System.Security.AccessControl.FileSystemAccessRule($IUSRUsername, "Modify", "ContainerInherit, ObjectInherit", "None", "Allow")
$Acl.SetAccessRule($Permission)
Set-Acl -Path $WebsitePath -AclObject $Acl

Write-Host "IIS website '$WebsiteName' created successfully.