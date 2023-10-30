function Get-AppEventSound {
    <#
.SYNOPSIS
    Determines the sounds that are configured to play after certain events are triggered
.DESCRIPTION
    Determines the sounds that are configured to play after certain events are triggered
.PARAMETER Name
    A string that will perform -like search of keys found in the Registry
.EXAMPLE
    Get-AppEventSound -Name "Notification.Looping.Alarm" -Verbose

    VERBOSE: Starting [Get-AppEventsSound]
    VERBOSE: Searching for AppEvents matching [Notification.Looping.Alarm]

    VERBOSE: Ending [Get-AppEventsSound]
    AppEvent                   UnExpanded                     Expanded
    --------                   ----------                     --------
    Notification.Looping.Alarm %SystemRoot%\media\Alarm01.wav C:\WINDOWS\media\Alarm01.wav
#>

    [CmdletBinding(ConfirmImpact = 'Low')]
    param (
        [string] $Name = '*'
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "Searching for AppEvents matching [$Name]"
        $Path = 'HKCU:\AppEvents\Schemes\Apps\.Default\*\.Current'
    }

    process {
        $Key = Get-ChildItem -Path $Path
        $Key | ForEach-Object {
            $Item = $_
            $AppEvent = Split-Path -Path $Item.PsParentPath -Leaf
            if ($AppEvent -like $Name) {
                $Expanded = $Item.GetValue($null, $null)
                $UnExpanded = $Item.GetValue($null, $null, [Microsoft.Win32.RegistryValueOptions]::DoNotExpandEnvironmentNames)
                New-Object -TypeName psobject -Property ([ordered] @{
                        AppEvent   = $AppEvent
                        UnExpanded = $UnExpanded
                        Expanded   = $Expanded
                })
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
