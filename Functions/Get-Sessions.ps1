function Get-Sessions {
    [CmdletBinding(ConfirmImpact='Low')]
    [OutputType([System.Object[]])]
    param(
        [Parameter(Position=0)]
        [Alias('Server','Host')]
        [string] $ComputerName = 'localhost',

        [Parameter(Position=1)]
        [ValidateSet(0,1,2,10,502)]
        [int32] $Level = 0,

        [Parameter(Position=2)]
        [string] $Client = $null,

        [Parameter(Position=3)]
        [string] $User = $null
    )

    switch ($Level)
    {
        0   { $Struct = New-Object NetApi32+SESSION_INFO_0 }
        1   { $Struct = New-Object NetApi32+SESSION_INFO_1 }
        2   { $Struct = New-Object NetApi32+SESSION_INFO_2 }
        10  { $Struct = New-Object NetApi32+SESSION_INFO_10 }
        502 { $Struct = New-Object NetApi32+SESSION_INFO_502 }

        default
        {
            $Level = 0
            $Struct = New-Object NetApi32+SESSION_INFO_0
        }
    }

    $Buffer = 0
    $Entries = 0
    $Total = 0
    $Handle = 0
    $Ret = [NetApi32]::NetSessionEnum(
        $ComputerName,
        $Client,
        $User,
        $Level,
        [ref] $Buffer,
        -1,
        [ref] $Entries,
        [ref] $Total,
        [ref] $Handle
    )

    $Sessions = @()
    if (-not $Ret) {
        $Offset = $Buffer.ToInt64()
        $Increment = [System.Runtime.Interopservices.Marshal]::SizeOf([System.Type]$Struct.GetType())

        for ($i = 0; $i -lt $Entries; $i++) {
            $Ptr = New-Object System.IntPtr -ArgumentList $Offset
            $Sessions += [System.Runtime.InteropServices.Marshal]::PtrToStructure($Ptr, [System.Type] $Struct.GetType())

            $Offset = $Ptr.ToInt64()
            $Offset += $Increment
        }

    } else {
        Write-Output ([ComponentModel.Win32Exception] [Int32] $Ret).Message

        if ($Ret -eq 1208) {
            # Error Code labeled 'Extended Error' requires the buffer to be freed
            [Void][NetApi32]::NetApiBufferFree($Buffer)
        }
    }
    $Sessions
}
