---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# New-VirtualHardDisk

## SYNOPSIS

Creates a new virtual hard disk (*.vhd) and several other operations

## SYNTAX

### __AllParameterSets

```
New-VirtualHardDisk [[-Path <String>]] [[-PartitionType <String>]] [[-VhdType <String>]] [[-FileSystem <Object>]] [[-Size <Int64>]] [[-VolumeLabel <String>]] [[-AutoRunIcon <String>]] [[-AutoRunLabel <String>]] [<CommonParameters>]
```

## DESCRIPTION

Creates a new virtual hard disk (*.vhd), mounts it, initializes it, formats it and optionally sets the volume label and
optionally creates an AutoRun.inf in the root of the new drive


## EXAMPLES

### Example 1: EXAMPLE 1

```
New-VirtualHardDisk -Path c:\temp\512.vhd -Size 512MB -VhdType Expandable -FileSystem NTFS -VolumeLabel 'Temp Volume' -AutoRunLabel 'This is my temporary volume' -AutoRunIcon C:\temp\TemporaryFolder.ico
```

Path          : C:\temp\512.vhd
MaxSizeMB     : 512
VhdType       : Expandable
PartitionType : MBR
FileSystem    : NTFS
VolumeLabel   : Temp Volume
AutoRunLabel  : This is my temporary volume
AutoRunIcon   : C:\temp\TemporaryFolder.ico






## PARAMETERS

### -AutoRunIcon

Optional icon that will be copied onto root of the virtual disk and AutoRun.inf setting pointing to it

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 6
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -AutoRunLabel

Optional label that will be displayed in Windows Explorer and AutoRun.inf setting for it

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 7
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -FileSystem

The filesystem that will be formatted onto the new virtual disk.
Validate set: 'FAT', 'FAT32', 'ExFAT', 'NTFS'.
Default: 'FAT'

```yaml
Type: Object
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 3
Default value: FAT
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -PartitionType

The partition type.
Validate set: 'MBR', 'GPT'.
Default: 'MBR'

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 1
Default value: MBR
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Path

The explicit path to the new VHD file

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Size

The size of the disk in bytes.
Default: 1GB

```yaml
Type: Int64
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 4
Default value: 1073741824
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -VhdType

How the Vhd is allocated.
Validate set: 'Expandable', 'Fixed'.
Default: 'Expandable'

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 2
Default value: Expandable
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -VolumeLabel

Optional string for label on the filesystem

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 5
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES

Must be run from an elevated prompt.


## RELATED LINKS

Fill Related Links Here

