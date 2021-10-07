---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# ConvertFrom-FsRight

## SYNOPSIS
To convert a \[uint32\] FileSystemRight value into a human readable form

## SYNTAX

```
ConvertFrom-FsRight [[-Rights] <UInt64>] [<CommonParameters>]
```

## DESCRIPTION
To convert a \[uint32\] FileSystemRight value into a human readable form using normal text

## EXAMPLES

### EXAMPLE 1
```
ConvertFrom-FsRight -Rights "0x1F01FF"
```

Would return
FullControl

### EXAMPLE 2
```
ConvertFrom-FsRight -Rights "0x1301BF"
```

Would return
ReadAndExecute,Modify,Write

### EXAMPLE 3
```
ConvertFrom-FsRight -Rights 268435456
```

Would return
GenericAll

## PARAMETERS

### -Rights
The filesystemrights value determined by: get-acl -Path $Path | select-object -expand access | select-object FileSystemRights
Alternatively a \[uint32\] value could be passed from the command line.
Hex values need to be enclosed in quotes.

```yaml
Type: UInt64
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### A [string] of all the applicable rights in readable form
## NOTES

## RELATED LINKS

[Get-ACL]()

