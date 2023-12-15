function Set-AutoRun.inf {
    [CmdletBinding()]
    param (
        [ValidateScript({
            if ($_ -notmatch '^[a-z]:') {
                throw 'Path specified must begin with a drive letter followed by a colon (ex. X:)'
                $false
            } else {
                $true
            }
        })]
        [string] $Path = $pwd,

        [ValidateScript({
            if ($_.Length -gt 32) {
                throw 'Maximum label length is 32 characters'
                $false
            } else {
                $true
            }
        })]
        [string] $Label = '',

        [ValidateScript({
            if (Test-Path $_) {
                $true
            } else {
                throw "Icon specified [$_] does not exist."
                $false
            }
        })]
        [string] $Icon = ''
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $DriveLetter = "$($Path.Substring(0,2))\"
        if (-not (Test-Path -Path $DriveLetter)) {
            throw "Drive [$DriveLetter] does not exist"
            break
        }
        if ((-not $Label) -and (-not $Icon)) {
            throw 'Either -Label, -Icon, or both must be specified'
        }
#         if ($Icon -and (-not (Test-Path -Path $Icon))) {
#             throw "Icon [$Icon] does not exist."
#             break
#         }
    }

    process {
        $AutoRun_inf = Join-Path -Path $DriveLetter -ChildPath 'AutoRun.inf'
        if (-not (Test-Path -Path $AutoRun_inf)) {
            Set-Content -Path $AutoRun_inf -Value $null
        }
        if ($Label) {
            Set-PrivateProfileString -File $AutoRun_inf -Section 'AutoRun' -Key 'Label' -Value $Label
        }
        if ($Icon) {
            $Icon = Resolve-Path -Path $Icon
            $IconFile = Get-Item -Path $Icon
            Copy-Item -Path (Get-Item -Path $Icon) -Destination $DriveLetter
            Set-PrivateProfileString -File $AutoRun_inf -Section 'AutoRun' -Key 'Icon' -Value $IconFile.Name
        }
        Add-FileAttribute -Path $AutoRun_inf -FileAttribute 'Hidden', 'System'
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
