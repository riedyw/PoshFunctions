---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-TypeAccelerator

## SYNOPSIS

Gets type accelerators

## SYNTAX

### __AllParameterSets

```
Get-TypeAccelerator [[-MatchString <String>]] [<CommonParameters>]
```

## DESCRIPTION

Gets type accelerators [int32] [datetime] etc.
Function aliased to 'Show-TypeAccelerator'
for backward compatibility.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-TypeAccelerator -MatchString array
```

Name      FullName
----      --------
array     System.Array
arraylist System.Collections.ArrayList
bitarray  System.Collections.BitArray





### Example 2: EXAMPLE 2

```
Get-TypeAccelerator -MatchString 32
```

Name   FullName
----   --------
int    System.Int32
int32  System.Int32
uint32 System.UInt32






## PARAMETERS

### -MatchString

String to limit the display to those type accelerators that match the string specified

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


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES

This function contains a here string.
The contents of the here string to its closing token MUST, MUST, MUST be at column 0.
Autoformatting and indentation will break the here string.
Please do NOT autoformat this document.


## RELATED LINKS

Fill Related Links Here

