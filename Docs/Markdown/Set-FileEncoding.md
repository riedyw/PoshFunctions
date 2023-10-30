---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Set-FileEncoding

## SYNOPSIS

Can change the file encoding of a file from say ASCII to Unicode

## SYNTAX

### __AllParameterSets

```
Set-FileEncoding [-Path] <String[]> [[-EncodingType <String>]] [-Quiet] [<CommonParameters>]
```

## DESCRIPTION

Can change the file encoding of a file from say ASCII to Unicode


## EXAMPLES

### Example 1: EXAMPLE 1

```
Set-FileEncoding -Path c:\temp\tempfile.txt -EncodingType Unicode
```

EncodingType Path
------------ ----
Unicode      C:\temp\tempfile.txt






## PARAMETERS

### -EncodingType

Selects the encoding type.
Validate set: 'ASCII', 'BigEndianUnicode', 'Unicode', 'UTF32', 'UTF7', 'UTF8'
Defaults to 'ASCII'

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 1
Default value: ASCII
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Path

The path to the file(s)

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Quiet

If specified there will be no output produced by the function

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


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES



## RELATED LINKS

Fill Related Links Here

