function Get-RegistryValue
{
<#
.SYNOPSIS
    Get the values from a specified registry key
.DESCRIPTION
    Get the values from a specified registry key. Registry keys can begin either
    with the 4 letter abbreviations or fully spelled out. ExpandString (aka REG_EXPAND_SZ)
    are NOT expanded.
.PARAMETER RegistryKey
    The full registry key. Values can actually be copied from regedit.exe in the address bar.
.EXAMPLE
    Get-RegistryValue -RegistryKey 'HKEY_CURRENT_USER\Environment'

    Name Type         Value
    ---- ----         -----
    Path ExpandString %USERPROFILE%\AppData\Local\Microsoft\WindowsApps;
    TEMP ExpandString %USERPROFILE%\AppData\Local\Temp
    TMP  ExpandString %USERPROFILE%\AppData\Local\Temp
.EXAMPLE
    Get-RegistryValue 'HKCU\Control Panel\Cursors' -IncludeRegistryKey | Select-Object -Last 4

    RegistryKey                Name      Type         Value
    -----------                ----      ----         -----
    HKCU\Control Panel\Cursors SizeWE    ExpandString %SystemRoot%\cursors\aero_ew.cur
    HKCU\Control Panel\Cursors UpArrow   ExpandString %SystemRoot%\cursors\aero_up.cur
    HKCU\Control Panel\Cursors Wait      ExpandString %SystemRoot%\cursors\aero_busy.ani
    HKCU\Control Panel\Cursors (Default) String       Windows Default
#>

    [CmdletBinding(ConfirmImpact='None')]
    param
    (
        [Parameter(Mandatory = $true,HelpMessage='Enter a registry key',Position=0)]
        [string] $RegistryKey,

        [switch] $IncludeRegistryKey
    )

    begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    process {

        $key = Get-Item -Path "Registry::$RegistryKey"
        $key.GetValueNames() |
        ForEach-Object {
            $name = $_

            if ($IncludeRegistryKey) {
                $rv = ([ordered] @{
                    RegistryKey = $RegistryKey
                    Name        = ''
                    Type        = ''
                    Value       = ''
                })
            } else {
                $rv = ([ordered] @{
                    Name        = ''
                    Type        = ''
                    Value       = ''
                })
            }

            $rv.Name = $name
            $rv.Type = $key.GetValueKind($name).ToString()
            if ($rv.Type -eq 'ExpandString') {
                $rv.Value = $key.GetValue($name, $null, [Microsoft.Win32.RegistryValueOptions]::DoNotExpandEnvironmentNames)
            } else {
                $rv.Value = $key.GetValue($name)
            }

            if (-not $rv.name) {
                $rv.name = '(Default)'
            }

            New-Object -TypeName 'psobject' -Property $rv

        }
    }

    end {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

}
