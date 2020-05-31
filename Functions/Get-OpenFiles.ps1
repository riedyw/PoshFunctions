function Get-OpenFiles {
    [CmdletBinding(ConfirmImpact='Low')]
    [OutputType([System.Object[]])]

    param (
        [Parameter(Position=0)]
        [Alias('Server','Host')]
        [string] $ComputerName = 'localhost',

        [Parameter(Position=1)]
        [ValidateSet(2,3)]
        [int32] $Level = 3,

        [Parameter(Position=2)]
        [string] $User = $null,

        [Parameter(Position=3)]
        [string] $Path = $null
    )

    switch ($Level) {
        2   { $Struct = New-Object NetApi32+FILE_INFO_2 }
        3   { $Struct = New-Object NetApi32+FILE_INFO_3 }
        default {
            $Level = 3
            $Struct = New-Object NetApi32+FILE_INFO_3
        }
    }

    $Buffer = 0
    $Entries = 0
    $Total = 0
    $Handle = 0
    $Ret = [NetApi32]::NetFileEnum($ComputerName, $Path, $User, $Level,
                [ref] $Buffer, -1,
                [ref] $Entries, [ref] $Total,
                [ref] $Handle
            )

    $Files = @()
    if (-not $Ret) {
        $Offset = $Buffer.ToInt64()
        $Increment = [System.Runtime.Interopservices.Marshal]::SizeOf([System.Type] $Struct.GetType())

        for ($i = 0; $i -lt $Entries; $i++) {
            $Ptr = New-Object system.Intptr -ArgumentList $Offset
            $Files += [System.Runtime.InteropServices.Marshal]::PtrToStructure($Ptr, [System.Type] $Struct.GetType())

            $Offset = $Ptr.ToInt64()
            $Offset += $Increment
        }
    } else {
        Write-Output ([System.ComponentModel.Win32Exception][Int32] $Ret).Message

        if ($Ret -eq 1208)
        {
            # Error Code labeled 'Extended Error' requires the buffer to be freed
            [Void] [NetApi32]::NetApiBufferFree($Buffer)
        }
    }
    $Files
}
