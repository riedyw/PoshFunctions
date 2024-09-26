---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-PrivateProfileSection

## SYNOPSIS

To get data out of an .ini file

## SYNTAX

### __AllParameterSets

```
Get-PrivateProfileSection [[-File <String>]] [[-Section <String>]] [-AsString] [<CommonParameters>]
```

## DESCRIPTION

To get data out of an .ini file.
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
Get-PrivateProfileSection -File test.ini -Section 'Section2' -Verbose
```

Assuming .\test.ini has the following section within it:
[Section2]
Key3=Value3
Key4 = Value4

The function would return:
VERBOSE: Starting Get-PrivateProfileSection
VERBOSE: Getting value from file [C:\Program Files\WindowsPowerShell\Modules\MyFunctions\Functions\test.ini]
VERBOSE: Getting value from section [section2]

Name                           Value
----                           -----
Key3                           Value3
Key4                           Value4
VERBOSE: Ending Get-PrivateProfileSection





### Example 2: EXAMPLE 2

```
Get-PrivateProfileSection -File test.ini -Section 'Section2' -AsString
```

Assuming .\test.ini has the following section within it:
[Section2]
Key3=Value3
Key4 = Value4

The function would return:
Key3=Value3
Key4=Value4






## PARAMETERS

### -AsString

A switch that will output a string array as opposed to a hash table

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


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### [hashtable] normally

[string[]] with -AsString switch



## NOTES

# inspired by: http://powershell-scripting.com/index.php?option=com_joomlaboard&Itemid=76&func=view&view=threaded&id=24376&catid=5
# also sourced at: https://gallery.technet.microsoft.com/Edit-old-fashioned-INI-f8fbc067?redir=0

Some modifications have been made:
* Error checking around file
* Ability to take relative path to file
* Normally produce output as [hashtable], but -AsString switch will return a string array
* Corrected logic to search for '\' and replace with '\\' if performing ConvertFrom-StringData


## RELATED LINKS

Fill Related Links Here

