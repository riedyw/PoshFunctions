function Get-VssadminListVolumes {
    <#
.SYNOPSIS
    Runs 'vssadmin.exe list volumes' and parses the output into objects
.DESCRIPTION
    Runs 'vssadmin.exe list volumes' and parses the output into objects
.EXAMPLE
    Get-VssAdminListVolumes

    VolumePath                                        VolumeName
    ----------                                        ----------
    \\?\Volume{727a7233-cd8b-44bb-a2fc-dfa771957fe6}\ \\?\Volume{727a7233-cd8b-44bb-a2fc-dfa771957fe6}\
    C:\                                               \\?\Volume{e02a6fff-32f6-4c83-a7ac-527a0f0b3377}\
    \\?\Volume{cd99c472-eaed-4de9-a0e0-aa618450adaa}\ \\?\Volume{cd99c472-eaed-4de9-a0e0-aa618450adaa}\
#>

    [CmdletBinding(ConfirmImpact = 'None')]
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
                        VolumePath           = $volumepath
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
