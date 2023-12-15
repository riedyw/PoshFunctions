function Resolve-PathForce {
<#
.SYNOPSIS
    Resolves a path to a single file/folder, even if it does not exist
.DESCRIPTION
    Resolves a path to a single file/folder, even if it does not exist
.PARAMETER Path
    String path to file/folder. Can be relative path. Must not contain wildcards or invalid characters
.PARAMETER IncludeInput
    Switch to include the input as part of the output
.NOTES
    Inspired by post: https://stackoverflow.com/questions/3038337/powershell-resolve-path-that-might-not-exist
.EXAMPLE
    Resolve-PathForce \dne\dne.txt -IncludeInput -Verbose
    VERBOSE: Starting [Resolve-PathForce]
    VERBOSE: Path specified [\dne\dne.txt]
    VERBOSE: Path [\dne\dne.txt] does not exist

    VERBOSE: Ending [Resolve-PathForce]
    Path         Exists Type    ResolvedPath
    ----         ------ ----    ------------
    \dne\dne.txt  False Unknown C:\dne\dne.txt
.EXAMPLE
    Resolve-PathForce \temp -IncludeInput

    Path  Exists Type   ResolvedPath
    ----  ------ ----   ------------
    \temp   True Folder C:\temp
.EXAMPLE
    Resolve-PathForce \temp

    C:\temp
#>

    [CmdletBinding()]
    param (
        [string] $Path,

        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "Path specified [$Path]"
    }

    process {
        if (Test-Path -Path $Path -IsValid) {
            $Type = 'Unknown'
            $Exists = $false
            if (Test-Path -Path $Path) {
                $Item = Get-Item -Path $Path
                $Exists = $true
                if ($Item.PsIsContainer) {
                    $Type = 'Folder'
                } else {
                    $Type = 'File'
                }
                $ReturnVal = (Resolve-Path -Path $Path).Path
            } else {
                Write-Verbose -Message "Path [$Path] does not exist"
                $ReturnVal = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Path)
            }
            if ($IncludeInput) {
                New-Object -TypeName psobject -Property ([ordered] @{
                    Path = $Path
                    Exists = $Exists
                    Type = $Type
                    ResolvedPath = $ReturnVal
                })
            } else {
                Write-Output -InputObject $ReturnVal
            }
        } else {
            Write-Error -Message "Path [$Path] can not contain wildcards or invalid characters"
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
} # EndFunction Resolve-PathForce
