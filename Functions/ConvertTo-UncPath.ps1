function ConvertTo-UncPath {
<#
.SYNOPSIS
    A simple function to convert a local file path and a computer name to a network UNC path.
.DESCRIPTION
    A simple function to convert a local file path and a computer name to a network UNC path.
.PARAMETER LocalFilePath
    A file path ie. C:\Windows\somefile.txt
.PARAMETER ComputerName
    One or more computers in which the file path exists on. Aliased to 'CN', 'Server'
.PARAMETER IncludeInput
    Switch to include input parameters in output
.EXAMPLE
    ConvertTo-UncPath -Path 'c:\adminTools\SomeFolder' -ComputerName 'SomeRemoteComputer'
    \\SomeRemoteComputer\c$\adminTools\SomeFolder
.EXAMPLE
    ConvertTo-UncPath -Path 'c:\adminTools\SomeFolder' -ComputerName 'SomeRemoteComputer','SomeAnotherComputer'
    \\SomeRemoteComputer\c$\adminTools\SomeFolder
    \\SomeAnotherComputer\c$\adminTools\SomeFolder
.EXAMPLE
    ConvertTo-UncPath -Path 'c:\Temp' -ComputerName DemoLaptop -IncludeInput

    Would return
    ComputerName Path    UNCPath
    ------------ ----    -------
    DemoLaptop   c:\Temp \\DemoLaptop\c$\Temp
.OUTPUTS
    Will create a string for remote computer path
.NOTES
    Inspired by: https://www.powershellgallery.com/packages/PPoShTools/1.0.19
    * added -IncludeInput
#>

    [CmdletBinding()]
    [OutputType('String')]
    param (
        [Parameter(Mandatory, HelpMessage = 'Add help message for user', ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [Alias('LocalFilePath')]
        [string] $Path,

        [Alias('CN', 'Server')]
        [string[]] $ComputerName = $env:COMPUTERNAME,

        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        try {
            foreach ($Computer in $ComputerName) {
                $RemoteFilePathDrive = ($Path | Split-Path -Qualifier).TrimEnd(':')
                $ReturnVal = "\\$Computer\$RemoteFilePathDrive`$$($Path | Split-Path -NoQualifier)"
                if ($IncludeInput) {
                    New-Object -TypeName psobject -Property ([ordered] @{
                        ComputerName = $Computer
                        Path = $Path
                        UNCPath = $ReturnVal
                    })
                } else {
                    Write-Output -InputObject $ReturnVal
                }
            }
        } catch {
            Write-Log -Error -Message $_.Exception.Message
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
