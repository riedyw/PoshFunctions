function Get-VssVolume {
    <#
.SYNOPSIS
    Runs 'vssadmin.exe list volumes' and parses the output into objects
.DESCRIPTION
    Runs 'vssadmin.exe list volumes' and parses the output into objects
.EXAMPLE
    Get-VssVolume

    VssVolume                                         VolumeName
    ---------                                         ----------
    C:\                                               \\?\Volume{613fc8d3-61cc-4199-868b-530990bde935}\
    \\?\Volume{ddc280b3-b5f1-4feb-a12a-512d0488fbd8}\ \\?\Volume{ddc280b3-b5f1-4feb-a12a-512d0488fbd8}\
#>

    [CmdletBinding(ConfirmImpact = 'None')]
    [Alias('Get-VssadminListVolumes')] #FunctionAlias
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns','')]
    param()

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        if (-not (Test-IsAdmin)) {
            Write-Error -Message 'This function cannot be run because it must be running as Administrator. The current Windows PowerShell session is not running as Administrator. Start Windows PowerShell by using the Run as Administrator option, and then try running the function again.'
            break
        }
    }

    process {
        $vss = vssadmin.exe list volumes

        for ($i = 0; $i -lt $vss.count; $i++) {
            switch -Regex ($vss[$i]) {
                '^Volume path:' {
                    $volumepath = $vss[$i].Substring(13)
                    break
                }
                '^    Volume name:' {
                    $VolumeName = $vss[$i].Substring(17)
                    [PSCustomObject] @{
                        VssVolume           = $volumepath
                        VolumeName          = $VolumeName
                    }
                    break
                }
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
