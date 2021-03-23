---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version: https://www.Google.com
schema: 2.0.0
---

# Get-TypeAccelerator

## SYNOPSIS
Gets type accelerators

## SYNTAX

```
Get-TypeAccelerator [[-MatchString] <String>] [<CommonParameters>]
```

## DESCRIPTION
Gets type accelerators \[int32\] \[datetime\] etc.

## EXAMPLES

### EXAMPLE 1
```
Get-TypeAccelerator -MatchString array
```

Name      FullName
----      --------
array     System.Array
arraylist System.Collections.ArrayList
bitarray  System.Collections.BitArray

### EXAMPLE 2
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

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
This function contains a here string.
The contents of the here string to its closing token MUST, MUST, MUST be at column 0.
Autoformatting and indentation will break the here string.
Please do NOT autoformat this document.

## RELATED LINKS
