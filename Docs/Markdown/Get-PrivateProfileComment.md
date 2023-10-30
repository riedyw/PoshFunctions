---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-PrivateProfileComment

## SYNOPSIS

To get comments from an .ini file

## SYNTAX

### __AllParameterSets

```
Get-PrivateProfileComment [[-File <String>]] [[-Section <String>]] [<CommonParameters>]
```

## DESCRIPTION

To get comments from an .ini file.
Comments are lines that begin with a
semicolon ';'.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-PrivateProfileComment -File Test2.ini -Section ''
```

Assuming that the file Test2.ini had a line at the top above all sections
that contained a string '; file comment 1' then the function would return

; file comment 1





### Example 2: EXAMPLE 2

```
Get-PrivateProfileComment -File Test2.ini -Section 'Section2'
```

; new section comment






## PARAMETERS

### -File

The path to the .ini file.
Can be a relative path.

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

### -Section

The name of the section within the .ini file.
Section names within the file
are enveloped in square brackets.
'[]'
If Section is blank '' then the comments are for the file and will be placed
above all sections.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 1
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### [string[]]



## NOTES

I wanted to have an ability to get comments from an .ini file.


## RELATED LINKS

Fill Related Links Here

