function Show-FileAttribute {
<#
.SYNOPSIS
    Shows the available file attributes
.DESCRIPTION
    Shows the available file attributes
.EXAMPLE
    Show-FileAttribute

    Would return
    ReadOnly
    Hidden
    System
    Directory
    Archive
    Device
    Normal
    Temporary
    SparseFile
    ReparsePoint
    Compressed
    Offline
    NotContentIndexed
    Encrypted
    IntegrityStream
    NoScrubData
.EXAMPLE
    Show-FileAttribute

    Would return
    Name                 Dec Hex
    ----                 --- ---
    ReadOnly               1 0x1
    Hidden                 2 0x2
    System                 4 0x4
    Directory             16 0x10
    Archive               32 0x20
    Device                64 0x40
    Normal               128 0x80
    Temporary            256 0x100
    SparseFile           512 0x200
    ReparsePoint        1024 0x400
    Compressed          2048 0x800
    Offline             4096 0x1000
    NotContentIndexed   8192 0x2000
    Encrypted          16384 0x4000
    IntegrityStream    32768 0x8000
    NoScrubData       131072 0x20000
.OUTPUTS
    [string[]]
#>

# todo rename to Get-FileAttribute, function alias, update readme

    [CmdletBinding(ConfirmImpact='None')]
    [OutputType([string[]])]
    Param (
    [switch] $IncludeValue
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        $datatype = 'System.IO.FileAttributes'
        if (-not $IncludeValue) {
            [enum]::GetNames($datatype)
        }
        else {
            [enum]::Getvalues($datatype) |
            ForEach-Object {
                New-Object -TypeName psobject -Property ([ordered] @{
                    Name = $_.toString()
                    Dec = $_.value__
                    Hex = '0x{0:x}' -f ($_.value__)
                })
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
