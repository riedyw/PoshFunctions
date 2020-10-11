---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Get-PrivateProfileString

## SYNOPSIS
To get data out of an .ini file

## SYNTAX

```
Get-PrivateProfileString [[-File] <String>] [[-Section] <String>] [[-Key] <String>] [-IncludeOriginal]
 [<CommonParameters>]
```

## DESCRIPTION
To get data out of an .ini file.
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
Get-PrivateProfileString -File .\Test.ini -Section 'Section1' -Key 'Key1'
```

Data1

### EXAMPLE 2
```
Get-PrivateProfileString -File .\NonexistentFile.ini -Section 'Section1' -Key 'Key1'
```

Get-PrivateProfileString : ERROR: File \[.\NonexistentFile.ini\] does not exist

### EXAMPLE 3
```
Get-PrivateProfileString -File c:\Temp\Test.ini -Section 'Section1' -Key 'Key1' -IncludeOriginal
```

FileName         Section  Key  Value
--------         -------  ---  -----
C:\Temp\Test.ini Section1 Key1 Data1

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

### -Section
The name of the section within the .ini file.
Section names within the file
are enveloped in square brackets.
\[\]

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Key
The key within the section that you want to pull data from.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeOriginal
{{ Fill IncludeOriginal Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
# inspired by: http://powershell-scripting.com/index.php?option=com_joomlaboard&Itemid=76&func=view&view=threaded&id=24376&catid=5
# also sourced at: https://gallery.technet.microsoft.com/Edit-old-fashioned-INI-f8fbc067?redir=0

Some modifications have been made:
* Error checking around file
* Ability to take relative path to file

## RELATED LINKS
