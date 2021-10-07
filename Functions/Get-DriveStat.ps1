function Get-DriveStat {
<#
.SYNOPSIS
    To get statistics on drives on a particular server or servers.
.DESCRIPTION
    To get statistics on drives on a server including Size, FreeSpace, and FreePct. Command line
    parameter allows for capacity statistics in Bytes, KB, MB, and GB
.EXAMPLE
    Get-DriveStat

    ComputerName DeviceID VolumeName SizeGB FreeSpaceGB FreePct
    ------------ -------- ---------- ------ ----------- -------
    localhost    C:       Windows    237.14       19.56    8.25
.EXAMPLE
    Get-DriveStat -Capacity MB

    ComputerName DeviceID VolumeName    SizeMB FreeSpaceMB FreePct
    ------------ -------- ----------    ------ ----------- -------
    localhost    C:       Windows    242831.45    20026.65    8.25
.EXAMPLE
    Get-DriveStat -Verbose

    VERBOSE: Starting Get-DriveStat
    VERBOSE: Capacity will be expressed in [GB]
    VERBOSE: Processing MDA-102192

    ComputerName : localhost
    DeviceID     : C:
    VolumeName   : Windows
    SizeGB       : 237.14
    FreeSpaceGB  : 19.56
    FreePct      : 8.25

    VERBOSE: Ending Get-DriveStat
.NOTES
    Put in error checking around Get-CimInstance to handle Kerberos errors.
#>

    #region Parameters
    [CmdletBinding()]
    [OutputType('psobject')]
    Param (
        [Parameter(Position = 0)]
        [ValidateNotNullorEmpty()]
        [Alias('CN', 'Server', 'ServerName', 'PSComputerName', 'SystemName')]
        [string[]] $ComputerName = $env:COMPUTERNAME,

        [Parameter(Position = 1)]
        [ValidateSet('Bytes', 'KB', 'MB', 'GB')]
        [string] $Capacity = 'GB'

    )
    #endregion Parameters

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "Capacity will be expressed in [$Capacity]"
        $Query = "Select * from Win32_LogicalDisk where DriveType='3' and FileSystem='NTFS'"
        $CimOption = New-CimSessionOption -EncodePortInServicePrincipalName
    }

    process {
        foreach ($CurName in $ComputerName) {
            Write-Verbose -Message "Processing $CurName"
            try {
                $DriveStat = Get-CimInstance -Query $Query -ComputerName $CurName
            } catch {
                try {
                    $CimSession = New-CimSession -ComputerName $CurName -SessionOption $CimOption
                    $DriveStat = Get-CimInstance -Query $Query -CimSession -CimSession
                    $CimSession.Close()
                    $CimSession.Dispose()
                } catch {
                    Write-Error "Could not connect to [$CurName]"
                }
            }
            switch ($Capacity) {
                'Bytes' {
                    $DriveStat |
                    Select-Object -Property @{name = 'ComputerName'; expression = { $_.SystemName } },
                        DeviceID,
                        VolumeName,
                        Size,
                        FreeSpace,
                        @{name = 'FreePct'; expression = { [double] ('{0:f2}' -f ($_.FreeSpace / $_.Size * 100)) } }
                }

                'KB' {
                    $DriveStat |
                    Select-Object -Property @{name = 'ComputerName'; expression = { $_.SystemName } },
                        DeviceID,
                        VolumeName,
                        @{name = 'SizeKB'     ; expression = { [double] ('{0:f2}' -f ($_.Size / 1KB)) } },
                        @{name = 'FreeSpaceKB'; expression = { [double] ('{0:f2}' -f ($_.FreeSpace / 1KB)) } },
                        @{name = 'FreePct'    ; expression = { [double] ('{0:f2}' -f ($_.FreeSpace / $_.Size * 100)) } }
                }

                'MB' {
                    $DriveStat |
                    Select-Object -Property @{name = 'ComputerName'; expression = { $_.SystemName } },
                        DeviceID,
                        VolumeName,
                        @{name = 'SizeMB'     ; expression = { [double] ('{0:f2}' -f ($_.Size / 1MB)) } },
                        @{name = 'FreeSpaceMB'; expression = { [double] ('{0:f2}' -f ($_.FreeSpace / 1MB)) } },
                        @{name = 'FreePct'    ; expression = { [double] ('{0:f2}' -f ($_.FreeSpace / $_.Size * 100)) } }
                }

                'GB' {
                    $DriveStat |
                    Select-Object -Property @{name = 'ComputerName'; expression = { $_.SystemName } },
                        DeviceID,
                        VolumeName,
                        @{name = 'SizeGB'     ; expression = { [double] ('{0:f2}' -f ($_.Size / 1GB)) } },
                        @{name = 'FreeSpaceGB'; expression = { [double] ('{0:f2}' -f ($_.FreeSpace / 1GB)) } },
                        @{name = 'FreePct'    ; expression = { [double] ('{0:f2}' -f ($_.FreeSpace / $_.Size * 100)) } }
                }
            }
        }

    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
