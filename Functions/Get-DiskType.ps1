function Get-DiskType {
    <#
.SYNOPSIS
    A quick function to determine what type of local disk a computer has
.DESCRIPTION
    A quick function to determine what type of local disk a computer has
.PARAMETER ComputerName
    A string (or string array) of computers that you want checked. Defaults to $env:COMPUTERNAME
.NOTES
    inspired by https://learn.microsoft.com/en-us/answers/questions/350272/detect-if-system-windows-drive-is-ssd-or-hdd.html
.EXAMPLE
    Get-DiskType
    Query the local machine's disk to determine its bus and media types
.EXAMPLE
    Get-DiskType -ComputerName server01

    Example output
    ComputerName DeviceId BusType MediaType
    ------------ -------- ------- ---------
    SERVER01     0        SAS     HDD
    SERVER01     1        SAS     HDD
#>

    [CmdletBinding()]
    [OutputType('PSCustomObject')]
    Param
    (
        # ComputerName
        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName, Position = 0)]
        [Alias('CN', 'Server')]
        [string[]] $ComputerName = $env:COMPUTERNAME
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $CimOption = New-CimSessionOption -EncodePortInServicePrincipalName
        $Query = 'select * from msft_physicaldisk'
        $NS = 'root\Microsoft\Windows\storage'
    }

    process {
        foreach ($Computer in $ComputerName) {
            Write-Verbose -Message "Checking $Computer"
            try {
                [array] $LocalDisk = Get-CimInstance -Namespace $NS -Query $Query -Comp $Computer
            } catch {
                try {
                    $CimSession = New-CimSession -ComputerName $Computer -SessionOption $CimOption
                    [array] $LocalDisk = Get-CimInstance -Namespace $NS -Query $Query  -CimSession $CimSession -ErrorAction Stop -Verbose:$false
                    $CimSession.Close()
                    $CimSession.Dispose()
                } catch {
                    Write-Error -Message "$Computer`: $($_.Exception.Message)"
                }
            }
            foreach ($curDisk in $LocalDisk) {
                if ($curDisk.MediaType -is [string]) {
                    $MediaType = $curDisk.MediaType
                } else {
                    switch ($curDisk.MediaType) {
                        0 { $MediaType = 'Unspecified' }
                        3 { $MediaType = 'HDD' }
                        4 { $MediaType = 'SSD' }
                        5 { $MediaType = 'SCM' }
                        Default { $MediaType = 'Not recognized' }
                    }
                }
                if ($curDisk.BusType -is [string]) {
                    $BusType = $curDisk.BusType
                } else {
                    switch ($curDisk.BusType) {
                        0 { $BusType = 'Unknown' }
                        1 { $BusType = 'SCSI' }
                        2 { $BusType = 'ATAPI' }
                        3 { $BusType = 'ATA' }
                        4 { $BusType = 'IEEE 1394' }
                        5 { $BusType = 'Fibre Channel' }
                        6 { $BusType = 'USB' }
                        7 { $BusType = 'RAID' }
                        9 { $BusType = 'iSCSI' }
                        10 { $BusType = 'SAS' }
                        11 { $BusType = 'SATA' }
                        12 { $BusType = 'SD' }
                        13 { $BusType = 'MMC' }
                        14 { $BusType = 'File-Backed Virtual' }
                        15 { $BusType = 'Storage Spaces' }
                        16 { $BusType = 'NVMe' }
                        17 { $BusType = 'Microsoft Reserved' }
                        Default { $BusType = 'Unrecognized' }
                    }
                }
                # Building DiskTypeInfo Object
                $DiskTypeInfo = New-Object -TypeName PSObject -Property ([ordered] @{
                        ComputerName = $curDisk.PSComputername.ToUpper()
                        DeviceId     = $curDisk.DeviceId
                        BusType      = $BusType
                        MediaType    = $MediaType
                    })
                Write-Output -InputObject $DiskTypeInfo
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
