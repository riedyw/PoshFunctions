---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Get-IniContent

## SYNOPSIS
Gets the content of an INI file

## SYNTAX

```
Get-IniContent [-FilePath] <String> [<CommonParameters>]
```

## DESCRIPTION
Gets the content of an INI file and returns it as a hashtable

## EXAMPLES

### EXAMPLE 1
```
$FileContent = Get-IniContent "C:\myinifile.ini"
```

-----------
Description
Saves the content of the c:\myinifile.ini in a hashtable called $FileContent

### EXAMPLE 2
```
$inifilepath | $FileContent = Get-IniContent
```

-----------
Description
Gets the content of the ini file passed through the pipe into a hashtable called $FileContent

### EXAMPLE 3
```
$FileContent = Get-IniContent "c:\settings.ini"
```

C:\PS\>$FileContent\["Section"\]\["Key"\]
-----------
Description
Returns the key "Key" of the section "Section" from the C:\settings.ini file

## PARAMETERS

### -FilePath
Specifies the path to the input file.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String
## OUTPUTS

### System.Collections.Hashtable
## NOTES
Author        : Oliver Lipkau \<oliver@lipkau.net\>
Blog        : http://oliver.lipkau.net/blog/
Source        : https://github.com/lipkau/PsIni
                http://gallery.technet.microsoft.com/scriptcenter/ea40c1ef-c856-434b-b8fb-ebd7a76e8d91
Version        : 1.0 - 2010/03/12 - Initial release
                1.1 - 2014/12/11 - Typo (Thx SLDR)
                                    Typo (Thx Dave Stiff)

#Requires -Version 2.0

## RELATED LINKS

[Out-IniFile]()

