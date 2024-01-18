function New-VirtualHardDisk {
<#
.SYNOPSIS
    Creates a new virtual hard disk (*.vhd), mounts it, initializes it, formats it and optionally sets the volume label and
    optionally creates an AutoRun.inf in the root of the new drive
.DESCRIPTION
    Creates a new virtual hard disk (*.vhd), mounts it, initializes it, formats it and optionally sets the volume label and
    optionally creates an AutoRun.inf in the root of the new drive
.PARAMETER Path
    The explicit path to the new VHD file
.PARAMETER PartitionType
    The partition type. Validate set: 'MBR', 'GPT'. Default: 'MBR'
.PARAMETER VhdType
    How the Vhd is allocated. Validate set: 'Expandable', 'Fixed'. Default: 'Expandable'
.PARAMETER FileSystem
    The filesystem that will be formatted onto the new virtual disk. Validate set: 'FAT', 'FAT32', 'ExFAT', 'NTFS'. Default: 'FAT'
.PARAMETER Size
    The size of the disk in bytes. Default: 1GB
.PARAMETER VolumeLabel
    Optional string for label on the filesystem
.PARAMETER AutoRunIcon
    Optional icon that will be copied onto root of the virtual disk and AutoRun.inf setting pointing to it
.PARAMETER AutoRunLabel
    Optional label that will be displayed in Windows Explorer and AutoRun.inf setting for it
.EXAMPLE
New-VirtualHardDisk -Path c:\temp\512.vhd -Size 512MB -VhdType Expandable -FileSystem NTFS -VolumeLabel 'Temp Volume' -AutoRunLabel 'This is my temporary volume' -AutoRunIcon C:\temp\TemporaryFolder.ico

Path          : C:\temp\512.vhd
MaxSizeMB     : 512
VhdType       : Expandable
PartitionType : MBR
FileSystem    : NTFS
VolumeLabel   : Temp Volume
AutoRunLabel  : This is my temporary volume
AutoRunIcon   : C:\temp\TemporaryFolder.ico

#>

# todo Max volumelabel length is 32 if NTFS, 11 if others
# todo Remount disk doesn't seem to work look into it

    [CmdletBinding()]
    param(
        [ValidateScript({
            if (Test-Path -Path $_) {
                throw "ERROR: Path [$_] already exists. This will not overwrite the file."
                $false
            } else {
                $true
            }
        })]
        [string] $Path,

        [ValidateSet('MBR', 'GPT')]
        [string] $PartitionType = 'MBR',

        [ValidateSet('Expandable', 'Fixed')]
        [string] $VhdType = 'Expandable',


        [ValidateSet('FAT', 'FAT32', 'ExFAT', 'NTFS')]
        $FileSystem = 'FAT',

        [int64] $Size = 1GB,

        [string] $VolumeLabel,

        [ValidateScript({
            if ((Test-Path $_) -and ($_ -match '\.ico$')) {
                $true
            } else {
                if (-not (Test-Path $_)) {
                    throw "ERROR: Icon specified [$_] does not exist."
                } else {
                    throw 'ERROR: Icon must have .ico extension.'
                }
                $false
            }
        })]
        [string] $AutoRunIcon,

        [ValidateScript({
            if ($_.Length -gt 32) {
                throw 'Maximum label length is 32 characters'
                $false
            } else {
                $true
            }
        })]
        [string] $AutoRunLabel
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        if (-not (Test-IsAdmin)) {
            Write-Error 'This function must be run from an elevated prompt.'
            break
        }

        $Path = Resolve-PathForce -Path $Path
        if (-not (Test-Path -Path (Split-Path -Path $Path))) {
            Write-Error "The parent folder to [$Path] does not exist."
            break
        }
        $Messages = ([ordered] @{
                FAT   = New-Object -TypeName psobject -Property ([ordered] @{ MinSizeMB = 8 ; MaxSizeMB = 2048 ; MaxVolumeLabel = 11 })
                FAT32 = New-Object -TypeName psobject -Property ([ordered] @{ MinSizeMB = 256 ; MaxSizeMB = 32768 ; MaxVolumeLabel = 11 })
                exFAT = New-Object -TypeName psobject -Property ([ordered] @{ MinSizeMB = 2048 ; MaxSizeMB = 102400 ; MaxVolumeLabel = 11 })
                NTFS  = New-Object -TypeName psobject -Property ([ordered] @{ MinSizeMB = 8 ; MaxSizeMB = 102400 ; MaxVolumeLabel = 32 })
            })

        $VolumeBefore = Get-Volume
        $SizeMB = [math]::Floor($Size / 1MB)
        if ($SizeMB -lt $Messages.$FileSystem.MinSizeMB) {
            Write-Error "Minimum size for [$FileSystem] is [$($Messages.$FileSystem.MinSizeMB)] MB and you wanted [$SizeMB]"
            break
        }
        if ($VolumeLabel.Length -gt $Messages.$FileSystem.MaxVolumeLabel) {
            Write-Error "Maximum length for the volume label is [$($Messages.$FileSystem.MaxVolumeLabel)] for filesystem [$FileSystem] and yours was [$($VolumeLabel.Length)] long"
            break
        }
        $DiskPartScript = Join-Path -Path $env:TEMP -ChildPath 'DiskPart.script'
        Set-Content -Path $DiskPartScript -Value "create vdisk file=""$Path"" maximum=$SizeMB type=$VhdType"
        Add-Content -Path $DiskPartScript -Value "exit"

        #write-output "[$DiskPartScript]"
    }

    process {
        $null = diskpart.exe /s "$DiskPartScript"

        $MountInfo = Mount-DiskImage -ImagePath "$Path"

        $FormatInfo = Get-Disk |
        Where-Object { $_.Partitionstyle -eq 'Raw' } |
        Initialize-Disk -PartitionStyle $PartitionType -PassThru |
        New-Partition -AssignDriveLetter -UseMaximumSize | Tee-Object -Variable NewDrive |
        Format-Volume -FileSystem $FileSystem -NewFileSystemLabel "$VolumeLabel" -Confirm:$false | Tee-Object -Variable Format
        #Write-host -ForegroundColor Cyan 'before blah'
        $VolumeAfter = Get-Volume
        $NewVolume = "$($VolumeAfter.DriveLetter | Where-Object { $_ -notin $VolumeBefore.DriveLetter}):"

        if ($AutoRunIcon) {
            Set-AutoRun.inf -Path $NewVolume -Icon "$AutoRunIcon"
        }

        if ($AutoRunLabel) {
            Set-AutoRun.inf -Path $NewVolume -Label "$AutoRunLabel"
        }

        $null = Dismount-DiskImage -ImagePath "$Path"
        $null = Mount-DiskImage -ImagePath "$Path"

        New-Object -TypeName psobject -Property ([ordered] @{
                Path          = $Path
                MaxSizeMB     = $SizeMB
                VhdType       = $VhdType
                PartitionType = $PartitionType
                FileSystem    = $FileSystem
                VolumeLabel   = $VolumeLabel
                AutoRunLabel  = $AutoRunLabel
                AutoRunIcon   = $AutoRunIcon
            })
    }

    end {
        Remove-Item -Path $DiskPartScript
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
