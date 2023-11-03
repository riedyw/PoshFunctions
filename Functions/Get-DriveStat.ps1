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
    Changed Select-Object statements to New-Object statements and specified hidden property PSTypeName
    to define typename (which can be used for formatting purposes)
#>

    # todo - add Credential

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
                    Write-Error -Message "Could not connect to [$CurName]"
                }
            }
            switch ($Capacity) {
                'Bytes' {
                    $DriveStat | ForEach-Object {
                        New-Object -Typename psobject -Property ([ordered] @{
                            PSTypeName = 'PFDriveStatBytes'
                            ComputerName = $_.SystemName
                            DeviceID = $_.DeviceID
                            VolumeName = $_.VolumeName
                            Size = $_.Size
                            FreeSpace = $_.FreeSpace
                            FreePct = [double] ('{0:f2}' -f ($_.FreeSpace / $_.Size * 100))
                        })
                    }
                }
                'KB' {
                    $DriveStat | ForEach-Object {
                        New-Object -Typename psobject -Property ([ordered] @{
                            PSTypeName = 'PFDriveStatKB'
                            ComputerName = $_.SystemName
                            DeviceID = $_.DeviceID
                            VolumeName = $_.VolumeName
                            SizeKB     = [double] ('{0:f2}' -f ($_.Size / 1KB))
                            FreeSpaceKB =  [double] ('{0:f2}' -f ($_.FreeSpace / 1KB))
                            FreePct = [double] ('{0:f2}' -f ($_.FreeSpace / $_.Size * 100))
                        })
                    }
                }
                'MB' {
                    $DriveStat | ForEach-Object {
                        New-Object -Typename psobject -Property ([ordered] @{
                            PSTypeName = 'PFDriveStatMB'
                            ComputerName = $_.SystemName
                            DeviceID = $_.DeviceID
                            VolumeName = $_.VolumeName
                            SizeMB     = [double] ('{0:f2}' -f ($_.Size / 1MB))
                            FreeSpaceMB =  [double] ('{0:f2}' -f ($_.FreeSpace / 1MB))
                            FreePct = [double] ('{0:f2}' -f ($_.FreeSpace / $_.Size * 100))
                        })
                    }
                }
                'GB' {
                    $DriveStat | ForEach-Object {
                        New-Object -Typename psobject -Property ([ordered] @{
                            PSTypeName = 'PFDriveStatGB'
                            ComputerName = $_.SystemName
                            DeviceID = $_.DeviceID
                            VolumeName = $_.VolumeName
                            SizeGB     = [double] ('{0:f2}' -f ($_.Size / 1GB))
                            FreeSpaceGB =  [double] ('{0:f2}' -f ($_.FreeSpace / 1GB))
                            FreePct = [double] ('{0:f2}' -f ($_.FreeSpace / $_.Size * 100))
                        })
                    }
                }
            }
        }

    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
