function Get-NetStatistics {
    [CmdletBinding(ConfirmImpact='Low')]
    [OutputType([System.Object[]])]
    param(
        [Parameter(Position=0)]
        [Alias('Server','Host')]
        [string] $ComputerName = 'localhost',

        [Parameter(Position=1)]
        [ValidateSet('Workstation','Server')]
        [string] $Type = 'Workstation'
    )

    if ($Type -eq 'Server') {
        $Struct = New-Object NetApi32+STAT_SERVER_0
        $Service = 'LanmanServer'
    } else {
        $Struct = New-Object NetApi32+STAT_WORKSTATION_0
        $Service = 'LanmanWorkstation'
    }

    $Buffer = 0
    $Ret = [NetApi32]::NetStatisticsGet($ComputerName,
        $Service,
        0, # only level 0 is supported for now
        0, #must be 0
        [ref] $Buffer
    )

    if (-not $Ret) {
        $Ret = [System.Runtime.InteropServices.Marshal]::PtrToStructure($Buffer, [System.Type] $Struct.GetType())
        $Ret
    } else {
        Write-Output ([ComponentModel.Win32Exception] [Int32] $Ret).Message
    }

}
