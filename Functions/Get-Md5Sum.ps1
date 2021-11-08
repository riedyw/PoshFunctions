function Get-Md5Sum {
<#
.SYNOPSIS
    To calculate an Md5Sum for a file
.DESCRIPTION
    To calculate an Md5Sum for a file
.PARAMETER Path
    The path to the file you wish to calculate the Md5Sum. Can be a single string or an array of strings.
    Can also accept pipeline input. Aliased to 'File' and 'FileName'
.PARAMETER IncludeInput
    Switch to include input in the output stream. Aliased to 'IncludeFile'
.EXAMPLE
    Assume you have a file that has 4 lines of text in it as follows
    unicorn unicorn unicorn unicorn
    cat cat cat
    dog dog
    fish
.EXAMPLE
    Get-Md5Sum -Path .\sample.txt

    351a0b1fd339ec74e3ddd2ddde694d82
.EXAMPLE
    Get-Md5Sum -Path .\sample.txt -IncludeInput

    File         Md5Sum
    ----         ------
    .\sample.txt 351a0b1fd339ec74e3ddd2ddde694d82
#>

    [CmdletBinding()]
    [alias('Md5Sum')]
    [OutputType('string')]
    Param (
        [parameter(ValueFromPipeLine, ValueFromPipeLineByPropertyName)]
        [Alias('FileName', 'File')]
        [string[]] $Path,

        [Alias('IncludeFile')]
        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($currentFile in $Path) {
            Try {
                if (Test-Path -Path $currentFile) {
                    Write-Verbose -Message "File exists: $currentFile"
                    $md5 = New-Object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
                    Write-Verbose -Message "MD5object: $md5"
                    $hash = [System.BitConverter]::ToString($md5.ComputeHash([System.IO.File]::ReadAllBytes($(Resolve-Path -Path $currentFile))))
                    Write-Verbose -Message "Hash: $hash"
                    $hash = $($hash -replace '-', '').ToLower()
                    Write-Verbose -Message "Calculating MD5Sum for file: '$currentFile'"
                } else {
                    Write-Verbose -Message "The file specified does not exist: '$currentFile'"
                    $hash = 'ERROR'
                }
                if ($IncludeInput) {
                    New-Object -TypeName 'psobject' -Property ([ordered] @{
                            File   = $currentFile
                            Md5Sum = $hash
                        })
                } else {
                    Write-Output -InputObject $hash
                }

            } catch {
                Write-Verbose -Message "Get-Md5Sum encountered an error for file [$currentFile]"
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
