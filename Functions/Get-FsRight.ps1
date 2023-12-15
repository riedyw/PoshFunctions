function Get-FsRight {
<#
.SYNOPSIS
    To list all potential file system rights
.DESCRIPTION
    To list all potential file system rights
.EXAMPLE
    Get-FsRight

    Would return
    A listing of all of the explicit filesystemrights

    Name                         Type   Hex                    Dec
    ----                         ----   ---                    ---
    ReadData                     Single 0x00000001               1
    CreateFiles                  Single 0x00000002               2
    AppendData                   Single 0x00000004               4
    ReadExtendedAttributes       Single 0x00000008               8
    WriteExtendedAttributes      Single 0x00000010              16
    ExecuteFile                  Single 0x00000020              32
    DeleteSubdirectoriesAndFiles Single 0x00000040              64
    ReadAttributes               Single 0x00000080             128
    WriteAttributes              Single 0x00000100             256
    Write                        Combo  0x00000116             278
    Delete                       Single 0x00010000           65536
    ReadPermissions              Single 0x00020000          131072
    Read                         Combo  0x00020089          131209
    ReadAndExecute               Combo  0x000200A9          131241
    Modify                       Combo  0x000301BF          197055
    ChangePermissions            Single 0x00040000          262144
    TakeOwnership                Single 0x00080000          524288
    Synchronize                  Single 0x00100000         1048576
    Read                         Combo  0x00120089         1179785
    ReadAndExecute               Combo  0x001200A9         1179817
    Read,Write                   Combo  0x0012019F         1180063
    ReadAndExecute,Write         Combo  0x001201BF         1180095
    ReadAndExecute,Modify,Write  Combo  0x001301BF         1245631
    FullControl                  Combo  0x001F01FF         2032127
    AccessSystemSecurity         Single 0x01000000        16777216
    MaximumAllowed               Single 0x02000000        33554432
    GenericAll                   Single 0x10000000       268435456
    GenericExecute               Single 0x20000000       536870912
    GenericWrite                 Single 0x40000000      1073741824
    GenericRead                  Single 0x80000000      2147483648
    ReadAndExecuteExtended       Combo  0xFFA0000000 1097901015040
.OUTPUTS
    An array of objects containing the fields Name, Type, Dec, Hex
.NOTES
    Renamed to Get-FsRight, provided an alias as Show-FsRight
    Changed += to System.Collections.Arraylist
    Left justified Name by calling .ToString()
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact = 'None')]
    [Alias('Show-FsRight')]
    [OutputType('psobject')]
    Param()
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $ReturnVar = [System.Collections.ArrayList]::new()
    }

    process {
        #$returnVar = @()
        $prop = @{ Name = 'GenericRead' ; Dec = [uint64] '0x80000000'; Hex = '0x80000000'; Type = 'Single' }
        $object = New-Object -TypeName PSObject -Property $prop
        $null = $returnVar.Add($object)

        $prop = @{ Name = 'GenericWrite' ; Dec = [uint64] '0x40000000'; Hex = '0x40000000'; Type = 'Single' }
        $object = New-Object -TypeName PSObject -Property $prop
        $null = $returnVar.Add($object)

        $prop = @{ Name = 'GenericExecute' ; Dec = [uint64] '0x20000000'; Hex = '0x20000000'; Type = 'Single' }
        $object = New-Object -TypeName PSObject -Property $prop
        $null = $returnVar.Add($object)

        $prop = @{ Name = 'GenericAll' ; Dec = [uint64] '0x10000000'; Hex = '0x10000000'; Type = 'Single' }
        $object = New-Object -TypeName PSObject -Property $prop
        $null = $returnVar.Add($object)

        $prop = @{ Name = 'MaximumAllowed' ; Dec = [uint64] '0x02000000'; Hex = '0x02000000'; Type = 'Single' }
        $object = New-Object -TypeName PSObject -Property $prop
        $null = $returnVar.Add($object)

        $prop = @{ Name = 'AccessSystemSecurity' ; Dec = [uint64] '0x01000000'; Hex = '0x01000000'; Type = 'Single' }
        $object = New-Object -TypeName PSObject -Property $prop
        $null = $returnVar.Add($object)

        $prop = @{ Name = 'Read' ; Dec = [uint64] 1179785 ; Hex = '0x00120089'; Type = 'Combo' }
        $object = New-Object -TypeName PSObject -Property $prop
        $null = $returnVar.Add($object)

        $prop = @{ Name = 'Read,Write' ; Dec = [uint64] 1180063 ; Hex = '0x0012019F'; Type = 'Combo' }
        $object = New-Object -TypeName PSObject -Property $prop
        $null = $returnVar.Add($object)

        $prop = @{ Name = 'ReadAndExecute' ; Dec = [uint64] 1179817 ; Hex = '0x001200A9'; Type = 'Combo' }
        $object = New-Object -TypeName PSObject -Property $prop
        $null = $returnVar.Add($object)

        $prop = @{ Name = 'ReadAndExecuteExtended' ; Dec = [uint64] '0xFFA0000000'; Hex = '0xFFA0000000'; Type = 'Combo' }
        $object = New-Object -TypeName PSObject -Property $prop
        $null = $returnVar.Add($object)

        $prop = @{ Name = 'ReadAndExecute,Modify,Write' ; Dec = [uint64] 1245631 ; Hex = '0x001301BF'; Type = 'Combo' }
        $object = New-Object -TypeName PSObject -Property $prop
        $null = $returnVar.Add($object)

        $prop = @{ Name = 'ReadAndExecute,Write' ; Dec = [uint64] 1180095 ; Hex = '0x001201BF'; Type = 'Combo' }
        $object = New-Object -TypeName PSObject -Property $prop
        $null = $returnVar.Add($object)

        #$null = $returnVar.AddRange
        $ObjectRange = [System.Enum]::Getvalues([system.security.accesscontrol.filesystemrights]) |
            Select-Object -Property @{Name = 'Name'; Expression = { $_.ToString() } },
            @{Name = 'Dec'; Expression = { [int] $_ } },
            @{Name = 'Hex'; Expression = { '0x{0:X8}' -f [uint64] $_ } },
            @{Name = 'Type'; Expression = { if (('0x{0:X8}' -f [uint64] $_) -match '^0x0*\d0*$') { 'Single' } else { 'Combo' } } } |
            Select-Object -Property name, dec, hex, type -Unique
        $null = $ReturnVar.AddRange($ObjectRange)
        $returnVar = $returnVar | Sort-Object -Property Dec
        Write-Output -InputObject ($returnVar | Select-Object -Property Name, Type, Hex, Dec)
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
