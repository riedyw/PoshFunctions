---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Set-PrivateProfileComment

## SYNOPSIS

To place comment(s) in an .ini file. Comments are lines that begin with a semicolon ';'.

## SYNTAX

### __AllParameterSets

```
Set-PrivateProfileComment [[-File <String>]] [[-Section <String>]] [[-Comment <String[]>]] [-CreateFile] [-CreateSection] [-ReplaceComment] [<CommonParameters>]
```

## DESCRIPTION

To set data in an .ini file.
.ini files are plain text that is categorized
in section names.
Within a section there are key, value pairs.
An example .ini
file content is as follows:

[Section1]
Key1=Data1


## EXAMPLES

### Example 1: EXAMPLE 1

```
Set-PrivateProfileComment -File Test2.ini -Section '' -Comment 'This is a file comment'
```

True

Would add the following line at the top of the file
; This is a file comment





### Example 2: EXAMPLE 2

```
Set-PrivateProfileComment -File Test2.ini -Section 'Section5' -Comment 'This is a section comment' -CreateSection
```

True

Assuming that 'Section5' didn't exist in the .ini file it would add the following lines at the end of the file
[Section5]
; This is a section comment






## PARAMETERS

### -Comment

A string or array of strings that will be placed as comments into the .ini
file.
Comments are lines that begin with a semicolon ';' and then the comment.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 2
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -CreateFile

A switch that will create the File if it does not automatically exist.
If
this switch is set the CreateSection will be set as $true as well.

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

### -CreateSection

A switch that will create the Section if it does not exist.

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

### -ReplaceComment

{{ Fill ReplaceComment Description }}

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

### [bool] indicating success or failure of writing the comment.

Error trapping on specific conditions.



## NOTES

I wanted to have an ability to write comments into an .ini file.


## RELATED LINKS

Fill Related Links Here

