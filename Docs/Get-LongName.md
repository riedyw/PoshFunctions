---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Get-LongName

## SYNOPSIS
To get the longname of a provided shortname (8.3) of a file or folder

## SYNTAX

```
Get-LongName [-Path] <String[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
To get the longname of a provided shortname (8.3) of a file or folder.
If the path resolves to 2 or more objects the function will generate an error

## EXAMPLES

### EXAMPLE 1
```
Get-LongName -Path C:\temp\THISIS~1.TXT
```

C:\temp\This is a really long filename.txt

### EXAMPLE 2
```
Get-LongName -Path C:\temp\THISIS~1.TXT -IncludeInput
```

ShortName            LongName                                   ItemType
---------            --------                                   --------
C:\temp\THISIS~1.TXT C:\temp\This is a really long filename.txt File

### EXAMPLE 3
```
Get-LongName -Path C:\temp\REALLY~1
```

C:\temp\Really-long-folder-name

### EXAMPLE 4
```
Get-LongName -Path C:\temp\REALLY~1 -IncludeInput
```

ShortName        LongName                        ItemType
---------        --------                        --------
C:\temp\REALLY~1 C:\temp\Really-long-folder-name Folder

## PARAMETERS

### -Path
A string or string array of files and folders

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -IncludeInput
Switch to include the input parameters in the output

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

### [string[]]
## NOTES
Inspired by https://devblogs.microsoft.com/scripting/use-powershell-to-display-short-file-and-folder-names/

Changes
* allow for accepting the -Path from the pipeline
* test for existence of path, if does not exist throw an error
* resolve to list of paths and if it resolves to more than one throw an error
* use get-item to determine if folder or file
* use Scripting.FileSystemObject comobject to get the shortname of the item
* if switch -IncludeInput output an object with the LongName, ShortName and ItemType (File or Folder)

## RELATED LINKS
