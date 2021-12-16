function Remove-TeamsCache {
<#
.SYNOPSIS
    Removes the data that is in the Teams cache for the current user
.DESCRIPTION
    Removes the data that is in the Teams cache. If you are running from an elevated prompt you can remove Teams cache for all users.
.PARAMETER All
    A switch to indicate removing the Teams cache for all users
.EXAMPLE
    Remove-TeamsCache
.NOTES
    Inspired by https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/deleting-microsoft-teams-cache-data
#>

    [CmdletBinding(ConfirmImpact = 'Medium')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    param(
        [switch] $All
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        if (Get-Process -Name teams -ErrorAction SilentlyContinue -Verbose:$false) {
            Write-Error -Message 'Teams is currently running. Please exit Teams and run again'
            break
        }
        if ($All) {
            Write-Verbose -Message '-Admin specified'
            if (-not (Test-IsAdmin -Verbose:$false)) {
                Write-Error -Message 'In order to run as -All you must be running an elevated Administrator prompt'
                break
            } else {
                $parentFolder = 'c:\users\*\AppData\Roaming\Microsoft\Teams\*'
            }
        } else {
            $parentFolder = "$env:userprofile\AppData\Roaming\Microsoft\Teams\*"
        }

        # list of subfolders that cache data
        $list = 'application cache', 'blob storage', 'databases', 'GPUcache', 'IndexedDB', 'Local Storage', 'tmp'

        # delete the folders found in the list
        Get-ChildItem -Path $parentFolder -Directory | Where-Object name -In $list | Remove-Item -Recurse -Verbose
    }

    end {
        if ($All) {
            Write-Output -InputObject 'Finished deleting Teams cache for all users'
        } else {
            Write-Output -InputObject 'Finished deleting Teams cache for the current user'
        }
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
