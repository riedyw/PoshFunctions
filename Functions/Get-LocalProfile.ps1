function Get-LocalProfile {
    $RegKey = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList'
    Get-ChildItem -Path $RegKey | ForEach-Object {
        $CurSid = Split-Path -Path $_.Name -Leaf
        [pscustomobject]@{
            SID         = $CurSid
            Account     = Resolve-Sid -SidString $CurSid
            ProfilePath = (Get-ItemProperty -Path $_.PSPath).ProfileImagePath
        }
    }
}

function Resolve-Sid {
    <#
    .SYNOPSIS
        Given a SID string this will return the account associated with that SID
    .DESCRIPTION
        Given a SID string this will return the account associated with that SID
    .EXAMPLE
        Resolve-Sid S-1-5-18

        NT AUTHORITY\SYSTEM
    #>

    param (
        [string] $SidString
    )
    # Convert SID string to SecurityIdentifier object
    try {
        $Sid = New-Object System.Security.Principal.SecurityIdentifier($SidString)
        # Translate SID to NTAccount (domain\user or computer\user)
        $Account = $Sid.Translate([System.Security.Principal.NTAccount])
        # Output the result
        $Account.Value
    } catch {
        $null
    }

}
