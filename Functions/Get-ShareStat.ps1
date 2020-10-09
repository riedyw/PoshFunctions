function Get-ShareStat {
<#
.SYNOPSIS
    To get statistics on a share
.DESCRIPTION
    To get statistics on a share including Size, FreeSpace, and FreePct. Command line
    parameter allows for capacity statistics in Bytes, KB, MB, and GB
.EXAMPLE
    Get-ShareStat -ShareName \\mda-102192\testnuget -Capacity MB


    ShareName                 SizeMB FreeSpaceMB FreePct
    ---------                 ------ ----------- -------
    \\mda-102192\testnuget 242831.45     20098.5    8.28
.EXAMPLE
    Get-ShareStat -ShareName \\mda-102192\testnuget


    ShareName              SizeGB FreeSpaceGB FreePct
    ---------              ------ ----------- -------
    \\mda-102192\testnuget 237.14       19.63    8.28
.EXAMPLE
    Get-ShareStat -ShareName \\mda-102192\testnuget -Verbose

    VERBOSE: Starting Get-ShareStat
    VERBOSE: Using temporary drive letter [B:]
    VERBOSE: Capacity will be expressed in [GB]
    VERBOSE: Perform operation 'Query CimInstances' with following parameters, ''queryExpression' = SELECT * FROM Win32_LogicalDisk WHERE DeviceID = 'B:','queryDialect' = WQL,'namespaceName' = root\cimv2'.
    VERBOSE: Operation 'Query CimInstances' complete.
    VERBOSE: Processing \\mda-102192\testnuget
    VERBOSE: Mapping drive [B:] to [\\mda-102192\testnuget]
    VERBOSE: Perform operation 'Query CimInstances' with following parameters, ''queryExpression' = SELECT * FROM win32_logicaldisk WHERE DeviceID = 'B:','queryDialect' = WQL,'namespaceName' = root\cimv2'.

    VERBOSE: Operation 'Query CimInstances' complete.
    VERBOSE: Unmapping drive [B:]
    VERBOSE: Ending Get-ShareStat

    ShareName              SizeGB FreeSpaceGB FreePct
    ---------              ------ ----------- -------
    \\mda-102192\testnuget 237.14       19.62    8.28
#>

    #region Parameters
    [CmdletBinding()]
    [OutputType('psobject')]
    Param (
        [Parameter(Position=0,HelpMessage='Add help message for user',Mandatory)]
        [ValidateNotNullorEmpty()]
        [string[]] $ShareName,

        [Parameter(Position=1)]
        [ValidatePattern('[A-Z]:')]
        [string] $TempDrive = 'B:',

        [Parameter(Position=2)]
        [ValidateSet('Bytes','KB','MB','GB')]
        [string] $Capacity = 'GB'

    )
    #endregion Parameters

    begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
        Write-Verbose -Message "Using temporary drive letter [$TempDrive]"
        Write-Verbose -Message "Capacity will be expressed in [$Capacity]"
        if (Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DeviceID = '$TempDrive'") {
            write-error -Message "Drive [$TempDrive] already being used. Select another."
            break
        }
        #$Wscript = New-object -comobject WScript.Network
    }

    process {
        foreach ($S in $ShareName) {
            write-verbose -Message "Processing $s"
            #$Wscript.MapNetworkDrive($TempDrive,$S,$true)
            Write-Verbose -Message "Mapping drive [$TempDrive] to [$S]"
            net.exe use $TempDrive "$S" 2>&1 | out-null
            switch ($Capacity) {
            'Bytes' {
                Get-CimInstance -ClassName win32_logicaldisk -Filter "DeviceID = '$TempDrive'" |
                    Select-Object -Property @{name='ShareName';expression={$S}},
                        Size,
                        FreeSpace,
                        @{name='FreePct'    ;expression={[double] ('{0:f2}' -f ($_.FreeSpace / $_.Size * 100))}}
            }

            'KB' {
                Get-CimInstance -ClassName win32_logicaldisk -Filter "DeviceID = '$TempDrive'" |
                    Select-Object -Property @{name='ShareName';expression={$S}},
                        @{name='SizeKB'     ;expression={[double] ('{0:f2}' -f ($_.Size/1KB))}},
                        @{name='FreeSpaceKB';expression={[double] ('{0:f2}' -f ($_.FreeSpace/1KB))}},
                        @{name='FreePct'    ;expression={[double] ('{0:f2}' -f ($_.FreeSpace / $_.Size * 100))}}
            }

            'MB' {
                Get-CimInstance -ClassName win32_logicaldisk -Filter "DeviceID = '$TempDrive'" |
                    Select-Object -Property @{name='ShareName';expression={$S}},
                        @{name='SizeMB'     ;expression={[double] ('{0:f2}' -f ($_.Size/1MB))}},
                        @{name='FreeSpaceMB';expression={[double] ('{0:f2}' -f ($_.FreeSpace/1MB))}},
                        @{name='FreePct'    ;expression={[double] ('{0:f2}' -f ($_.FreeSpace / $_.Size * 100))}}
            }

            'GB' {
                Get-CimInstance -ClassName win32_logicaldisk -Filter "DeviceID = '$TempDrive'" |
                    Select-Object -Property @{name='ShareName';expression={$S}},
                        @{name='SizeGB'     ;expression={[double]('{0:f2}' -f ($_.Size/1GB))}},
                        @{name='FreeSpaceGB';expression={[double]('{0:f2}' -f ($_.FreeSpace/1GB))}},
                        @{name='FreePct'    ;expression={[double] ('{0:f2}' -f ($_.FreeSpace / $_.Size * 100))}}
            }
            }
            #$WScript.RemoveNetworkDrive($TempDrive,$true)
            Write-Verbose -Message "Unmapping drive [$TempDrive]"
            net.exe use $TempDrive /del 2>&1 | out-null
        }

    }

    end {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

}
