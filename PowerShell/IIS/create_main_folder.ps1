# Usage sample: create_main_folder.ps1 1CLICK.LV C:\Web

param (
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$PROJECT_NAME,

    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$ROOT_Folder
)

try 
{
    # Check if the root folder exists
    if (-not (Test-Path -Path $ROOT_Folder -PathType Container)) 
    {
        throw "Error: Root folder '$ROOT_Folder' does not exist."
    }

    $projectFolderPath = Join-Path -Path $ROOT_Folder -ChildPath $PROJECT_NAME

    # Check if the project folder exists, create it if it doesn't
    if (-not (Test-Path -Path $projectFolderPath -PathType Container)) 
    {
        $null = New-Item -Path $projectFolderPath -ItemType Directory
        Write-Host "Project folder '$projectFolderPath' created successfully."
    }
}
catch 
{
    Write-Host "Error: $_"
}
