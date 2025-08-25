function New-LocalAdmin {
<#
.SYNOPSIS
    Creates a new local administrative account on local computer
.DESCRIPTION
    Creates a new local administrative account on local computer
.NOTES
    Information or caveats about the function e.g. 'This function is not supported in Linux'
.LINK
    Specify a URI to a help page, this will show when Get-Help -Online is used.
.EXAMPLE
    Test-MyTestFunction -Verbose
    Explanation of the function or its result. You can include multiple examples with additional .EXAMPLE lines
#>

    [cmdletbinding()]
    param (
        [Parameter(Mandatory)]
        [string] $LocalAdmin,

        [Parameter(Mandatory)]
        [string] $PasswordPlaintext,

        [Parameter(Mandatory)]
        [string] $Description = "New local admin created on: $(Get-Date)"
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        if (Test-IsAdmin) {
            $PasswordSecureString = $PasswordPlaintext | ConvertTo-SecureString -AsPlainText -Force
            $UserParam = @{
                Name                 = $LocalAdmin
                AccountNeverExpires  = $true
                PasswordNeverExpires = $true
                Description          = $Description
                Password             = $PasswordSecureString
            }
            if (-not (Get-LocalUser -Name $LocalAdmin -ea SilentlyContinue)) {
                New-LocalUser @UserParam
            } else {
                Set-LocalUser @UserParam
            }
            if (-not (Get-LocalGroupMember -Group administrators -Member $LocalAdmin -ea SilentlyContinue)) {
                Add-LocalGroupMember -Group administrators -Member $LocalAdmin
            }

        } else {
            Write-Error 'Not running from an elevated session. Please run as Administrator.'
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
