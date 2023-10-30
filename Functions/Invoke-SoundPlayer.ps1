function Invoke-SoundPlayer {
    <#
.SYNOPSIS
    Use the SoundPlayer in Powershell. Can be synchronous or asynchronous.
.DESCRIPTION
    Use the SoundPlayer in Powershell. Can be synchronous or asynchronous.
.PARAMETER Path
    The Path to a .wav file. Defaults to 'c:\windows\media\tada.wav'.
    The file must exist, it must resolve to a single file (no wildcards) and it must end in the '.wav' extension.
.PARAMETER Async
    Switch to make the playing asynchronous. Normally the next statement in your script
    does not run until the play process is done playing the whole file.
.EXAMPLE
    Invoke-SoundPlayer

    Will play the default sound synchronously
.EXAMPLE
    Invoke-SoundPlayer -Path C:\windows\media\Ring09.wav -Async

    Will play the sound asynchronously
.NOTES
    inspired by: https://devblogs.microsoft.com/scripting/powertip-use-powershell-to-play-wav-files/
#>

    [CmdletBinding()]
    param(
        [string] $Path = 'c:\windows\media\tada.wav',

        [switch] $Async
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.MyCommand)]"
    }

    process {
        if (Test-Path -Path $Path) {
            $ResolveFile = Resolve-Path -Path $Path
            if ($ResolveFile.count -gt 1) {
                Write-Error -Message "ERROR: File specification [$Path] resolves to more than 1 file."
            } else {
                $ResolveFile = Get-Item -LiteralPath $ResolveFile
                if ($ResolveFile.Extension -ne '.wav') {
                    Write-Error -Message "ERROR: File does not end in extension '.wav'"
                } else {
                    $SoundPlayer = New-Object -TypeName System.Media.SoundPlayer
                    $SoundPlayer.SoundLocation = $ResolveFile.FullName
                    if ($Async) {
                        $SoundPlayer.Play()
                    } else {
                        $SoundPlayer.PlaySync()
                    }
                }
            }
        } else {
            Write-Error -Message "ERROR: File [$Path] does not exist"
        }
    }

    end {
        $SoundPlayer.Dispose()
        Write-Verbose -Message "Ending [$($MyInvocation.MyCommand)]"
    }

}
