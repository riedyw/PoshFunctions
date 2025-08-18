function Remove-TemporaryFile {
    <#
.SYNOPSIS
    Cleans user profiles of temporary files and folders that are greater than 3 days
.DESCRIPTION
    Gets list of all local profiles, ignoring those belonging to 'NT Authority'. It then searches that profiles %TEMP% folder and
    removes top level files and folders older than $Days day old.
.PARAMETER Days
    Integer value of days back in time looking for candidate files and folders. Valid range 1-7
    Defaults to 3
.NOTES
    Designed to run in a Remote System Powershell prompt

    Should be run as administrator

    Author:  Bill Riedy
    Moddate: 4/29/2025
    Ver:     1.0
#>

    [CmdletBinding(ConfirmImpact = 'Low', SupportsShouldProcess = $true)]
    param
    (
        [ValidateRange(1, 7)]
        [int] $Days = 3,

        [switch] $All
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $UserProfile = Get-LocalProfile | Where-Object { $_.Account -notmatch 'nt authority' }
        Write-Verbose "Days older than [$Days], All profiles [$All]"

        if (-not $All) {
            Write-Verbose "Only removing temporary files for current user"
            $UserProfile = $UserProfile | Where-Object { $_.ProfilePath -eq $env:USERPROFILE }
        }

        Write-Verbose 'BEFORE CLEANUP'
        if ($PSCmdlet.MyInvocation.BoundParameters.ContainsKey("Verbose")) {
            Get-PSDrive -Name C -Verbose:$false | Format-Table -AutoSize
        }

    }

    process {

        $UserProfile | ForEach-Object {
            $Item = $_
            Write-Verbose "Cleaning temp folders for [$($Item.Account)] in [$($Item.ProfilePath)]"

            Write-Verbose '    Removing files...'
            $CandidateFiles = Get-ChildItem -Path (Join-Path -Path $Item.ProfilePath -ChildPath 'AppData\Local\Temp') -File |
            Where-Object { $_.LastWriteDate -lt (Get-Date).AddDays(-$Days) }
            $CandidateFiles | ForEach-Object {
                if ($PSCmdlet.ShouldProcess($_.FullName, "Remove")) {
                    $_.FullName | Remove-Item -Confirm:$false -Force -ErrorAction Ignore
                }
            }

            Write-Verbose '   Removing folders...'
            $CandidateFolders = Get-ChildItem -Path (Join-Path -Path $Item.ProfilePath -ChildPath 'AppData\Local\Temp') -Directory |
            Where-Object { $_.LastWriteDate -lt (Get-Date).AddDays(-$Days) }
            $CandidateFolders | ForEach-Object {
                if ($PSCmdlet.ShouldProcess($_.FullName, "Remove")) {
                    $_.FullName | Remove-Item -Recurse -Confirm:$false -Force -ErrorAction Ignore
                }
            }
        }

    }

    end {
        Write-Verbose 'AFTER CLEANUP'
        if ($PSCmdlet.MyInvocation.BoundParameters.ContainsKey("Verbose")) {
            Get-PSDrive -Name C -Verbose:$false | Format-Table -AutoSize
        }
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
