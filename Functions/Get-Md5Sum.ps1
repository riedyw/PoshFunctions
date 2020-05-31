Function Get-Md5Sum {
<#
.SYNOPSIS
    To calculate an Md5Sum for a file
.DESCRIPTION
    To calculate an Md5Sum for a file
.PARAMETER File
    The path to the file you wish to calculate the Md5Sum. Can be a single string or an array of strings.
    Can also accept pipeline input.
.EXAMPLE
    Assume you have a file that has 4 lines of text in it as follows
    unicorn unicorn unicorn unicorn
    cat cat cat
    dog dog
    fish
.EXAMPLE
    Get-Md5Sum -File .\sample.txt

    351a0b1fd339ec74e3ddd2ddde694d82
.EXAMPLE
    Get-Md5Sum -File .\sample.txt -IncludeFile

    File         Md5Sum
    ----         ------
    .\sample.txt 351a0b1fd339ec74e3ddd2ddde694d82
#>

    [CmdletBinding()]
    [OutputType('string')]
    Param (
        [parameter(ValueFromPipeLine,ValueFromPipeLineByPropertyName)]
        [Alias('FileName','Path')]
        [string[]] $File,

        [switch] $IncludeFile
    )

    begin {

    }

    process {
        foreach ($currentFile in $File) {
            Try {
                if (Test-Path -path $currentFile) {
                    write-verbose -message "File exists: $currentFile"
                    $md5 = New-Object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
                    write-verbose -message "MD5object: $md5"
                    $hash = [System.BitConverter]::ToString($md5.ComputeHash([System.IO.File]::ReadAllBytes($(resolve-path -path $currentFile))))
                    write-verbose -message "Hash: $hash"
                    $hash = $($hash -replace '-', '').ToLower()
                    write-verbose -message "Calculating MD5Sum for file: '$currentFile'"
                } else {
                    write-verbose -message "The file specified does not exist: '$currentFile'"
                    $hash = 'ERROR'
                }
                if ($IncludeFile) {
                    New-object -TypeName 'psobject' -Property ([ordered] @{
                        File = $currentFile
                        Md5Sum = $hash
                    })
                } else {
                    write-output -inputobject $hash
                }

            } Catch {
                write-verbose -message "Get-Md5Sum encountered an error for file [$currentFile]"
            }
        }
        }


    end {

    }
} #EndFunction Get-Md5Sum

Set-Alias -Name 'Md5Sum' -Value 'Get-Md5Sum'
