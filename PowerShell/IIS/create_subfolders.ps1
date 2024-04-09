# Usage sample: create_subfolders.ps1 C:\Web\1click.lv\

param (
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$PROJECT_ROOT_Folder
)

$folders = @(
    "Log",
    "Backup",
    "Install",
    "Wwwroot",
    "SVN",
    "Err",
    "db"
)

try 
{
    # Check if the project folder exists
    if (-not (Test-Path -Path $PROJECT_ROOT_Folder -PathType Container)) 
    {
        throw "Error: Project folder '$PROJECT_ROOT_Folder' does not exist."
    }

    foreach ($folderName in $folders) 
    {
        $subFolderPath = Join-Path -Path $PROJECT_ROOT_Folder -ChildPath $folderName

        if (Test-Path -Path $subFolderPath -PathType Container) 
        {
            Write-Host "Folder '$subFolderPath' already exists."
        } 
        else 
        {
            $null = New-Item -Path $subFolderPath -ItemType Directory
            Write-Host "Folder '$subFolderPath' created successfully."
        }
    }
}
catch 
{
    Write-Host "Error: $_"
}
