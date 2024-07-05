function Get-RegistryValue {
<#
.SYNOPSIS
    Get the values from a specified registry key
.DESCRIPTION
    Get the values from a specified registry key. Registry keys can begin either
    with the 4 letter abbreviations or fully spelled out. ExpandString (aka REG_EXPAND_SZ)
    are NOT expanded.
.PARAMETER RegistryKey
    The full registry key. Values can actually be copied from regedit.exe in the address bar.
.PARAMETER IncludeInput
    Changed name from -IncludeRegistryKey to be consistent, aliased to 'IncludeRegistryKey' for backward compatibility
.EXAMPLE
    Get-RegistryValue -RegistryKey 'HKEY_CURRENT_USER\Environment'

    Name Type         Value
    ---- ----         -----
    Path ExpandString %USERPROFILE%\AppData\Local\Microsoft\WindowsApps;
    TEMP ExpandString %USERPROFILE%\AppData\Local\Temp
    TMP  ExpandString %USERPROFILE%\AppData\Local\Temp
.EXAMPLE
    Get-RegistryValue 'HKCU\Control Panel\Cursors' -IncludeInput | Select-Object -Last 4

    RegistryKey                Name      Type   Value
    -----------                ----      ----   -----
    HKCU\Control Panel\Cursors SizeWE    String C:\WINDOWS\cursors\aero_ew.cur
    HKCU\Control Panel\Cursors UpArrow   String C:\WINDOWS\cursors\aero_up.cur
    HKCU\Control Panel\Cursors Wait      String C:\WINDOWS\cursors\aero_busy.ani
    HKCU\Control Panel\Cursors (Default) String Windows Default
#>

    [CmdletBinding(ConfirmImpact='None')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter','')]
    param
    (
        [Parameter(Mandatory,HelpMessage='Enter a registry key',Position=0)]
        [string] $RegistryKey,

        [Alias('IncludeRegistryKey')]
        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {

        $Key = Get-Item -Path "Registry::$RegistryKey"
        $Key.GetValueNames() |
        ForEach-Object {
            $Name = $_

            if ($IncludeInput) {
                $TempReturnValue = ([ordered] @{
                        RegistryKey = $RegistryKey
                        Name        = ''
                        Type        = ''
                        Value       = ''
                })
            } else {
                $TempReturnValue = ([ordered] @{
                        Name        = ''
                        Type        = ''
                        Value       = ''
                })
            }

            $TempReturnValue.Name = $Name
            $TempReturnValue.Type = $Key.GetValueKind($Name).ToString()
            if ($TempReturnValue.Type -eq 'ExpandString') {
                $TempReturnValue.Value = $Key.GetValue($Name, $null, [Microsoft.Win32.RegistryValueOptions]::DoNotExpandEnvironmentNames)
            } elseif ($TempReturnValue.Type -eq 'DWord') {
                $TempReturnValue.Value = Convert-Int32ToUint32 -Number $Key.GetValue($Name) -Verbose:$false
            } elseif ($TempReturnValue.Type -eq 'QWord') {
                $TempReturnValue.Value = Convert-Int64ToUint64 -Number $Key.GetValue($Name) -Verbose:$false
            } else {
                $TempReturnValue.Value = $Key.GetValue($Name)
            }

            if (-not $TempReturnValue.Name) {
                $TempReturnValue.Name = '(Default)'
            }

            New-Object -TypeName 'psobject' -Property $TempReturnValue

        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
