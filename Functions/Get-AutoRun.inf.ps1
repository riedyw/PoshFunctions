function Get-AutoRun.inf {
    <#
.SYNOPSIS
    Gets the content of an AutoRun.inf for a drive.
.DESCRIPTION
    Gets the content of an AutoRun.inf for a drive.
.PARAMETER Path
    The path to the drive. Must begin with a drive letter followed by a colon ':'. Defaults to $pwd
.EXAMPLE
    Assuming the D: drive has an AutoRun.inf file with the following contents

    [AutoRun]
    Icon=TemporaryFolder.ico
    Label=10 MB FAT VHD

    Get-AutoRun.inf -Path d:

    Path Label         Icon
    ---- -----         ----
    D:\  10 MB FAT VHD TemporaryFolder.ico

#>


    [CmdletBinding()]
    param (
        [ValidateScript({
            if ($_ -notmatch '^[a-z]:') {
                throw 'ERROR: Path specified must begin with a drive letter followed by a colon (ex. X:)'
                $false
            } else {
                $true
            }
        })]
        [string] $Path = 'D:\'
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $DriveLetter = "$($Path.Substring(0,2))\".ToUpper()
        if (-not (Test-Path -Path $DriveLetter)) {
            Write-Error "Drive [$DriveLetter] does not exist."
            break
        }
    }

    process {
        $AutoRun_inf = Join-Path -Path $DriveLetter -ChildPath 'AutoRun.inf'
        if (-not (Test-Path -Path $AutoRun_inf)) {
            throw "ERROR: No AutoRun.inf found on [$DriveLetter]."
            break
        }
        $Label = Get-PrivateProfileString -File $AutoRun_inf -Section 'AutoRun' -Key 'Label'
        $Icon = Get-PrivateProfileString -File $AutoRun_inf -Section 'AutoRun' -Key 'Icon'
        New-Object -TypeName psobject -Property ([ordered] @{
            Path  = $DriveLetter
            Label = $Label
            Icon  = $Icon
        })
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
