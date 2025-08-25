function Get-LocalProfile {
<#
.SYNOPSIS
    Gets a list of all the local profiles on the computer
.DESCRIPTION
    Gets a list of all the local profiles on the computer and returns SID, Account, ProfilePath as result
.EXAMPLE
    Get-LocalProfile

    SID                                           Account                      ProfilePath
    ---                                           -------                      -----------
    S-1-5-18                                      NT AUTHORITY\SYSTEM          C:\WINDOWS\system32\config\systemprofile
    S-1-5-19                                      NT AUTHORITY\LOCAL SERVICE   C:\WINDOWS\ServiceProfiles\LocalService
    S-1-5-20                                      NT AUTHORITY\NETWORK SERVICE C:\WINDOWS\ServiceProfiles\NetworkService
    S-1-5-21-3173356244-827506543-1080815787-1001 LAPTOP\SampleUser            C:\Users\SampleUser
.NOTES
    Requires Resolve-SID also available in this module
#>


    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
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


    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
