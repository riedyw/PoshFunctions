---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Set-PrivateProfileString

## SYNOPSIS

To set data in an .ini file

## SYNTAX

### __AllParameterSets

```
Set-PrivateProfileString [[-File <String>]] [[-Section <String>]] [[-Key <String>]] [[-Value <String>]] [-CreateFile] [<CommonParameters>]
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
Set-PrivateProfileString -File test2.ini -Section Section3 -Key Key5 -value 'New Value' -CreateFile
```

Would put the following data into test2.ini
[Section3]
Key5=Newer Value






## PARAMETERS

### -CreateFile

A switch that will create the File if it does not automatically exist.

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

### -Key

The key within the section that you want to pull data from.

```yaml
Type: String
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

### -Section

The name of the section within the .ini file.
Section names within the file
are enveloped in square brackets.
[]

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

### -Value

The value you want saved at that key.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 3
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### $null



## NOTES

# inspired by: http://powershell-scripting.com/index.php?option=com_joomlaboard&Itemid=76&func=view&view=threaded&id=24376&catid=5
# also sourced at: https://gallery.technet.microsoft.com/Edit-old-fashioned-INI-f8fbc067?redir=0

Some modifications have been made:
* Error checking around file
* Ability to take relative path to file
* CreateFile switch to create ini if it doesn't exist


## RELATED LINKS

Fill Related Links Here

