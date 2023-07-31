param (
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$ROOT_Folder
)

# Check if the root folder exists
if (-not (Test-Path -Path $ROOT_Folder -PathType Container)) {
    Write-Host "Error: Root folder '$ROOT_Folder' does not exist."
    exit
}

try 
{
    $rootAcl = Get-Acl -Path $ROOT_Folder

    # Disable inheritance and convert inherited permissions to explicit permissions for root folder
    $rootAcl.SetAccessRuleProtection($true, $true)
    Set-Acl -Path $ROOT_Folder -AclObject $rootAcl

    # Get all subfolders recursively
    $subfolders = Get-ChildItem -Path $ROOT_Folder -Recurse -Directory

    # Disable inheritance and convert inherited permissions to explicit permissions for each subfolder
    foreach ($subfolder in $subfolders) 
    {
        $subfolderAcl = Get-Acl -Path $subfolder.FullName
        $subfolderAcl.SetAccessRuleProtection($true, $true)
        Set-Acl -Path $subfolder.FullName -AclObject $subfolderAcl
    }

    Write-Host "Inheritance disabled for the root folder and all subfolders."
}
catch 
{
    Write-Host "Error: $_"
}
