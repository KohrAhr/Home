param (
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$Username,

    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$Password
)

try {
    # Check if the user already exists
    if (Get-LocalUser -Name $Username -ErrorAction SilentlyContinue) {
        throw "Error: User '$Username' already exists."
    }

    # Create the new user
    $securePassword = ConvertTo-SecureString -String $Password -AsPlainText -Force
    $neverExpires = $true

    $UserParams = @{
        Name = $Username
        Password = $securePassword
        PasswordNeverExpires = $neverExpires
        UserMayNotChangePassword = $true
        Description = "; $Password"
        FullName = $Username
    }

    $User = New-LocalUser @UserParams -ErrorAction Stop
    $User | Add-LocalGroupMember -Group 'IIS_IUSRS' -ErrorAction Stop

    Write-Host "New user '$Username' has been created under the 'IIS_IUSRS' group."
}
catch {
    Write-Host "Error: $_"
}
