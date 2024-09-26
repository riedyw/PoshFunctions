---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# ConvertFrom-FsRight

## SYNOPSIS

To convert a [uint32] FileSystemRight value into a human readable form

## SYNTAX

### __AllParameterSets

```
ConvertFrom-FsRight [[-Rights <UInt64[]>]] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

To convert a [uint32] FileSystemRight value into a human readable form using normal text


## EXAMPLES

### Example 1: EXAMPLE 1

```
ConvertFrom-FsRight -Rights "0x1F01FF"
```

Would return
FullControl





### Example 2: EXAMPLE 2

```
ConvertFrom-FsRight -Rights "0x1301BF"
```

Would return
ReadAndExecute,Modify,Write





### Example 3: EXAMPLE 3

```
ConvertFrom-FsRight -Rights 268435456
```

Would return
GenericAll






## PARAMETERS

### -IncludeInput

Switch to include input values in the output

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Rights

The filesystemrights value determined by: get-acl -Path $Path | select-object -expand access | select-object FileSystemRights
Alternatively a [uint32] value could be passed from the command line.
Hex values need to be enclosed in quotes.

```yaml
Type: UInt64[]
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### A [string] of all the applicable rights in readable form



## NOTES



## RELATED LINKS

[Get-ACL] ()

