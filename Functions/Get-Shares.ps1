function Get-Shares {
    [CmdletBinding(ConfirmImpact='Low')]
    [OutputType([System.Object[]])]
    param (
        [Parameter(Position=0)]
        [Alias('Server','Host')]
        [string] $ComputerName = 'localhost',

        [Parameter(Position=1)]
        [ValidateSet(0,1,2,502,503)]
        [int32] $Level = 1
    )
    switch ($Level)
    {
        0   { $Struct = New-Object NetApi32+SHARE_INFO_0 }
        1   { $Struct = New-Object NetApi32+SHARE_INFO_1 }
        2   { $Struct = New-Object NetApi32+SHARE_INFO_2 }
        502 { $Struct = New-Object NetApi32+SHARE_INFO_502 }
        503 { $Struct = New-Object NetApi32+SHARE_INFO_503 }

        default {
            $Level = 0
            $Struct = New-Object NetApi32+SHARE_INFO_0
        }
    }

    $Buffer = 0
    $Entries = 0
    $Total = 0
    $Handle = 0
    $Ret = [NetApi32]::NetShareEnum(
        $ComputerName,
        $Level,
        [ref] $Buffer,
        -1,
        [ref] $Entries,
        [ref] $Total,
        [ref] $Handle
    )

    $Shares = @()
    if (-not $Ret) {
        $Offset = $Buffer.ToInt64()
        $Increment = [System.Runtime.Interopservices.Marshal]::SizeOf([System.Type]$Struct.GetType())

        for ($i = 0; $i -lt $Entries; $i++) {
            $Ptr = New-Object System.Intptr -ArgumentList $Offset
            $Shares += [System.Runtime.Interopservices.Marshal]::PtrToStructure($Ptr, [System.Type] $Struct.GetType())

            $Offset = $Ptr.ToInt64()
            $Offset += $Increment
        }

    } else {
        Write-Output ([ComponentModel.Win32Exception][Int32]$Ret).Message

        if ($Ret -eq 1208) {
            # Error Code labeled 'Extended Error' requires the buffer to be freed
            [Void][NetApi32]::NetApiBufferFree($Buffer)
        }
    }
    $Shares
}
