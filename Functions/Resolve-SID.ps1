Function Resolve-Sid {
    <#
.SYNOPSIS
    Resolving a SID to a user account, either local or domain
.DESCRIPTION
    Resolving a SID to a user account, either local or domain
.PARAMETER SID
    A string representing the security identifier in a Windows environment
.PARAMETER IncludeInput
    Switch to include the input in the output
.NOTES
    Only works in a Windows environment
.LINK
    https://en.wikipedia.org/wiki/Security_Identifier
.EXAMPLE
    Resolve-Sid -SID 'S-1-5-18'

    NT AUTHORITY\SYSTEM
.EXAMPLE
    Resolve-Sid -SID 'S-1-5-20' -IncludeInput

    SID      Account
    ---      -------
    S-1-5-20 NT AUTHORITY\NETWORK SERVICE
#>

    [CmdletBinding()]
    param (
        [string] $SID,

        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        # Convert SID string to SecurityIdentifier object
        $SIDObject = New-Object System.Security.Principal.SecurityIdentifier($SID)

        # Translate SID to NTAccount (domain\user or computer\user)
        $Account = $SIDObject.Translate([System.Security.Principal.NTAccount])

        # Output the result
        if ($IncludeInput) {
            New-Object -TypeName psobject -Property ([ordered] @{
                    SID     = $SID
                    Account = $Account.Value
            })
        } else {
            $Account.Value
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
