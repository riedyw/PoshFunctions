function Get-RegExpandString {
<#
.SYNOPSIS
    Retrieves a null-terminated string that contains unexpanded references to environment variables (REG_EXPAND_SZ) from local or remote computers.
.DESCRIPTION
    Use Get-RegExpandString to retrieve a null-terminated string that contains unexpanded references to environment variables (REG_EXPAND_SZ) from local or remote computers.
.PARAMETER ComputerName
    An array of computer names. The default is the local computer.
.PARAMETER Hive
    The HKEY to open, from the RegistryHive enumeration. The default is 'LocalMachine'.
    Possible values:

    - ClassesRoot
    - CurrentUser
    - LocalMachine
    - Users
    - PerformanceData
    - CurrentConfig
    - DynData
 .PARAMETER Key
    The path of the registry key to open.
 .PARAMETER Value
    The name of the registry value.
 .PARAMETER ExpandEnvironmentNames
    Expands values containing references to environment variables using data from the local environment.
 .PARAMETER Ping
    Use ping to test if the machine is available before connecting to it.
    If the machine is not responding to the test a warning message is output.
 .EXAMPLE
    $Key = "SOFTWARE\Microsoft\Windows\CurrentVersion"
    Get-RegExpandString -Key $Key -Value ProgramFilesPath

    ComputerName Hive         Value            Key                                       Data                   Type
    ------------ ----         -----            ---                                       ----                   ----
    DemoLaptop   LocalMachine ProgramFilesPath SOFTWARE\Microsoft\Windows\CurrentVersion %ProgramFiles% ExpandString

    Description
    -----------
    The command gets the registry ProgramFilesPath ExpandString value from the local computer.
    The returned value contains unexpanded references to environment variables.

 .EXAMPLE
    Get-RegExpandString -Key $Key -Value ProgramFilesPath -ComputerName server1, server2 -ExpandEnvironmentNames -Ping

    ComputerName Hive         Value            Key                                       Data                     Type
    ------------ ----         -----            ---                                       ----                     ----
    server1      LocalMachine ProgramFilesPath SOFTWARE\Microsoft\Windows\CurrentVersion C:\Program Files ExpandString
    server2      LocalMachine ProgramFilesPath SOFTWARE\Microsoft\Windows\CurrentVersion C:\Program Files ExpandString

    Description
    -----------
    The command gets the registry ProgramFilesPath ExpandString value from three remote computers.
    When the ExpandEnvironmentNames Switch parameter is used, the data of the value is expnaded based on the environment variables data from the local environment.
    When the Switch parameter Ping is specified the command issues a ping test to each computer.
    If the computer is not responding to the ping request a warning message is written to the console and the computer is not processed.
 .OUTPUTS
    PSFanatic.Registry.RegistryValue (PSCustomObject)
 .NOTES
    Author: Shay Levy
    Blog : http://blogs.microsoft.co.il/blogs/ScriptFanatic/

    # source: https://www.powershellgallery.com/packages/RemoteRegistry/1.0.3/Content/Public%5CGet-RegExpandString.ps1

    * notes for remote servers you need administrative privileges to that remote computername
    * added write-verbose statements
    * corrected some spelling
    * commented out return for ping that fails
    * modified statement for new-object -typename psobject, changed -Property @{} to -Property ([ordered] @{}) so columns come out in order desired
    * updated examples
 .LINK
    http://code.msdn.microsoft.com/PSRemoteRegistry
 .LINK
    Set-RegExpandString
    Get-RegValue
    Remove-RegValue
    Test-RegValue
 #>

    [OutputType('PSFanatic.Registry.RegistryValue')]
    [CmdletBinding(DefaultParameterSetName = '__AllParameterSets')]

    param(
        [Parameter(Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [Alias('CN', 'Server', '__SERVER', 'IPAddress')]
        [string[]] $ComputerName = $env:COMPUTERNAME,

        [Parameter(Position = 1, ValueFromPipelineByPropertyName)]
        [ValidateSet('ClassesRoot', 'CurrentUser', 'LocalMachine', 'Users', 'PerformanceData', 'CurrentConfig', 'DynData')]
        [string] $Hive = 'LocalMachine',

        [Parameter(Mandatory, Position = 2, ValueFromPipelineByPropertyName, HelpMessage = 'The path of the subkey to open.')]
        [string] $Key,

        [Parameter(Mandatory, Position = 3, ValueFromPipelineByPropertyName, HelpMessage = 'The name of the value to get.')]
        [string] $Value,

        [switch] $ExpandEnvironmentNames,

        [switch] $Ping
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        Write-Verbose -Message 'Enter process block...'
        foreach ($c in $ComputerName) {
            try {
                if ($c -eq '') {
                    $c = $env:COMPUTERNAME
                    Write-Verbose -Message "Parameter [ComputerName] is not present, setting its value to local computer name: [$c]."
                }
                if ($Ping) {
                    Write-Verbose -Message 'Parameter [Ping] is present, initiating Ping test'

                    if ( -not (Test-Connection -ComputerName $c -Count 1 -Quiet)) {
                        Write-Warning -Message "[$c] doesn't respond to ping."
                        #return
                    }
                }
                Write-Verbose -Message "Starting remote registry connection against: [$c]."
                Write-Verbose -Message "Registry Hive is: [$Hive]."
                $reg = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey([Microsoft.Win32.RegistryHive] $Hive, $c)
                Write-Verbose -Message "Open remote subkey: [$Key]"
                $subKey = $reg.OpenSubKey($Key)
                if (!$subKey) {
                    throw "ERROR: Key [$Key] doesn't exist."
                }
                if ($ExpandEnvironmentNames) {
                    Write-Verbose -Message 'Parameter [ExpandEnvironmentNames] is present, expanding value of environment strings.'
                    Write-Verbose -Message "Get value name : [$Value]"
                    $rv = $subKey.GetValue($Value, -1)
                } else {
                    Write-Verbose -Message 'Parameter [ExpandEnvironmentNames] is not present, environment strings are not expanded.'
                    Write-Verbose -Message "Get value name : [$Value]"
                    $rv = $subKey.GetValue($Value, -1, [Microsoft.Win32.RegistryValueOptions]::DoNotExpandEnvironmentNames)
                }

                if ($rv -eq -1) {
                    Write-Error -Message "Cannot find value [$Value] because it does not exist."
                } else {
                    Write-Verbose -Message 'Create PSFanatic registry value custom object.'
                    $pso = New-Object -TypeName PSObject -Property ([ordered] @{
                        ComputerName = $c
                        Hive         = $Hive
                        Value        = $Value
                        Key          = $Key
                        Data         = $rv
                        Type         = $subKey.GetValueKind($Value)
                    })

                    Write-Verbose -Message 'Adding format type name to custom object.'
                    $pso.PSTypeNames.Clear()
                    $pso.PSTypeNames.Add('PSFanatic.Registry.RegistryValue')
                    $pso
                }

                Write-Verbose -Message "Closing remote registry connection on: [$c]."
                $subKey.close()
            } catch {
                Write-Error -Message $_
            }
        }
        Write-Verbose -Message 'Exit process block...'
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
