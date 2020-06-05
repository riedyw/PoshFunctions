---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version: https://gallery.technet.microsoft.com/scriptcenter/Get-MachineType-VM-or-ff43f3a9
schema: 2.0.0
---

# Get-PrivateProfileSectionNames

## SYNOPSIS
To get the section names out of an .ini file

## SYNTAX

```
Get-PrivateProfileSectionNames [[-File] <String>] [<CommonParameters>]
```

## DESCRIPTION
To get the section names out of an .ini file.
.ini files are plain text that is categorized
in section names.
Within a section there are key, value pairs.
An example .ini
file content is as follows:

\[Section1\]
Key1=Data1

## EXAMPLES

### EXAMPLE 1
```
Assuming you have a file test2.ini that has the following content
```

\[Section3\]
Key5=Newer Value
\[Section1\]
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

### [$string[]]
## NOTES
# inspired by: http://powershell-scripting.com/index.php?option=com_joomlaboard&Itemid=76&func=view&view=threaded&id=24376&catid=5
# also sourced at: https://gallery.technet.microsoft.com/Edit-old-fashioned-INI-f8fbc067?redir=0

See modudule *.psm1 file for creation of class 'IniFileApi'
Some modifications have been made:
* Error checking around file
* Ability to take relative path to file

## RELATED LINKS
