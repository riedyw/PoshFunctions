function Expand-String {
<#
.SYNOPSIS
    Expanding a string expression. Can handle Powershell string expressions or Environment variable expansion.
.DESCRIPTION
    Expanding a string expression. Can handle Powershell string expressions or Environment variable expansion.
.PARAMETER String
    The string that you want expanded.
.PARAMETER EnvironmentVariable
    A switch to expand the string expression as an environment variable.
.PARAMETER PowershellString
    A switch to expand the string expression as a Powershell string
.PARAMETER StringResource
    A switch to expand the string expression as a StringResource which can be found in desktop.ini and registry entries.
    An example is '@%SystemRoot%\system32\shell32.dll,-21770'
.PARAMETER IncludeInput
    A switch to determine if you want the original string expression to appear in the output. Aliased to 'IncludeOriginal'
.EXAMPLE
    # Expanding Powershell string
    Expand-String '$psculture'

    Assuming you have English US as the local installed culture this would return:
    en-US
.EXAMPLE
    # Expanding Powershell string including original string in the output
    Expand-String '$psculture' -PsString -IncludeInput

    #Assuming you have English US as the local installed culture this would return:
    String     Conversion Expanded
    ------     ---------- --------
    $psculture PsString   en-US
.EXAMPLE
    # Expanding environment variable
    Expand-String -String '%PROCESSOR_ARCHITECTURE%' -EnvironmentVariable

    #Assuming you are a 64 bit machine, the function would return:
    AMD64
.EXAMPLE
    # Expanding environment variable including orginal string
    Expand-String -String '%PROCESSOR_ARCHITECTURE%' -EnvironmentVariable -IncludeInput

    #Assuming you are a 64 bit machine, the function would return:
    String                   Conversion Expanded
    ------                   ---------- --------
    %PROCESSOR_ARCHITECTURE% EnvVar     AMD64
.EXAMPLE
    # Resource strings are stored within DLL's and are referenced by an ID number. An example would be
    # @%SystemRoot%\system32\shell32.dll,-21770
    # and they are found in Desktop.ini files and also the registry.

    $ResourceString = (Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation').DisplayName
    Expand-String -String $ResourceString -StringResource -IncludeInput

    # Would return the following if your Windows install culture was en-US
    String                                 Conversion  Expanded
    ------                                 ----------  --------
    @%systemroot%\system32\wkssvc.dll,-100 StrResource Workstation
.NOTES
    The c# source code was found by me on the Internet, but I can't determine where I originally found it. The ability to expand
    a StrResource is thanks to that code.
#>

    #region parameter
    [CmdletBinding(DefaultParameterSetName = 'PsString',ConfirmImpact='None')]
    [OutputType('string')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter','')]
    param(
        [Parameter(Mandatory,HelpMessage='Enter a string to expand',Position=0,ValueFromPipeline,ParameterSetName='PsString')]
        [Parameter(Mandatory,HelpMessage='Enter a string to expand',Position=0,ValueFromPipeline,ParameterSetName='EnvVar')]
        [Parameter(Mandatory,HelpMessage='Enter a string to expand',Position=0,ValueFromPipeline,ParameterSetName='StrResource')]
        [string[]] $String,

        [Parameter(ParameterSetName='PsString')]
        [Alias('PsString')]
        [switch] $PowershellString,

        [Parameter(ParameterSetName='EnvVar')]
        [Alias('EnvVar')]
        [switch] $EnvironmentVariable,

        [Parameter(ParameterSetName='StrResource')]
        [Alias('StrResource')]
        [switch] $StringResource,

        [Parameter(ParameterSetName='PsString')]
        [Parameter(ParameterSetName='EnvVar')]
        [Parameter(ParameterSetName='StrResource')]
        [Alias('IncludeOriginal')]
        [switch] $IncludeInput
    )
    #endregion parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "ParameterSetName [$($PsCmdlet.ParameterSetName)]"
        $source = @'
using System;
using System.Runtime.InteropServices;
using System.Text;

public class PFExtractData
{
[DllImport("kernel32.dll", SetLastError = true, CharSet = CharSet.Ansi)]
private static extern IntPtr LoadLibrary([MarshalAs(UnmanagedType.LPStr)]string lpFileName);

[DllImport("user32.dll", CharSet = CharSet.Auto)]
private static extern int LoadString(IntPtr hInstance, int ID, StringBuilder lpBuffer, int nBufferMax);

[DllImport("kernel32.dll", SetLastError = true)]
[return: MarshalAs(UnmanagedType.Bool)]
private static extern bool FreeLibrary(IntPtr hModule);

public string ExtractStringFromDLL(string file, int number) {
    IntPtr lib = LoadLibrary(file);
    StringBuilder result = new StringBuilder(2048);
    LoadString(lib, number, result, result.Capacity);
    FreeLibrary(lib);
    return result.ToString();
}
}
'@

        Add-Type -TypeDefinition $source
        $ExtractData = New-Object -TypeName PFExtractData
    }

    process {
        foreach ($currentString in $String) {
            Write-Verbose -Message "Current string is [$currentString]"
            $prop = ([ordered] @{ String = $currentString })
            switch ($PsCmdlet.ParameterSetName) {
                'PsString' {
                    $prop.Conversion = 'PsString'
                    $ReturnVal = $ExecutionContext.InvokeCommand.ExpandString($currentString)
                }
                'EnvVar' {
                    $prop.Conversion = 'EnvVar'
                    $ReturnVal = [System.Environment]::ExpandEnvironmentVariables($currentString)
                }
                'StrResource' {
                    $prop.Conversion = 'StrResource'
                    $Resource = $currentString -split ','
                    $ReturnVal = $ExtractData.ExtractStringFromDLL([Environment]::ExpandEnvironmentVariables($Resource[0]).substring(1), $Resource[1].substring(1))
                    #                    $ReturnVal = 'Placeholder'
                }
            }
            Write-Verbose -Message "ReturnVal is [$ReturnVal]"
            $prop.Expanded = $ReturnVal
            if ($IncludeInput) {
                New-Object -TypeName psobject -Property $prop
            } else {
                Write-Output -inputobject $ReturnVal
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

} #End function Expand-String
