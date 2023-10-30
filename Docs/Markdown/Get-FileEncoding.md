---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-FileEncoding

## SYNOPSIS

To get the file encoding of a file

## SYNTAX

### __AllParameterSets

```
Get-FileEncoding [-Path] <String[]> [<CommonParameters>]
```

## DESCRIPTION

To get the file encoding of a file


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-FileEncoding -Path .\UTF16-BigEndian.txt
```

Unicode UTF-16 Big-Endian





### Example 2: EXAMPLE 2

```
Get-FileEncoding -Path .\UTF16-LittleEndian.txt
```

Unicode UTF-16 Little-Endian






## PARAMETERS

### -Path

The file that you want to check its encoding.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES

# source: https://gist.github.com/jpoehls/2406504


## RELATED LINKS

Fill Related Links Here

