---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-PrivateProfileSectionNames

## SYNOPSIS

To get the section names out of an .ini file

## SYNTAX

### __AllParameterSets

```
Get-PrivateProfileSectionNames [[-File <String>]] [<CommonParameters>]
```

## DESCRIPTION

To get the section names out of an .ini file.
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
Assuming you have a file test2.ini that has the following content
```

[Section3]
Key5=Newer Value
[Section1]
Key1=Some data

Get-PrivateProfileSectionNames -File test2.ini

Section3
Section1






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


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### [$string[]]



## NOTES

# inspired by: http://powershell-scripting.com/index.php?option=com_joomlaboard&Itemid=76&func=view&view=threaded&id=24376&catid=5
# also sourced at: https://gallery.technet.microsoft.com/Edit-old-fashioned-INI-f8fbc067?redir=0

Some modifications have been made:
* Error checking around file
* Ability to take relative path to file


## RELATED LINKS

Fill Related Links Here

