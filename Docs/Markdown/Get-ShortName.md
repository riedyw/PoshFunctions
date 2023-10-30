---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-ShortName

## SYNOPSIS

To get the shortname 8.3 of a file or folder

## SYNTAX

### Path

```
Get-ShortName [[-Path <String[]>]] [-IncludeInput] [<CommonParameters>]
```

### LiteralPath

```
Get-ShortName [-IncludeInput] [-LiteralPath <String[]>] [<CommonParameters>]
```

## DESCRIPTION

To get the shortname 8.3 of a file or folder.
If the path resolves to 2 or more objects the function will generate an error


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-ShortName -Path 'C:\temp\This is a really long filename.txt'
```

C:\temp\THISIS~1.TXT





### Example 2: EXAMPLE 2

```
Get-ShortName -Path c:\temp\th* -IncludeInput
```

LongName                                   ShortName            ItemType
--------                                   ---------            --------
C:\temp\This is a really long filename.txt C:\temp\THISIS~1.TXT File





### Example 3: EXAMPLE 3

```
Get-ShortName -Path c:\temp\Really-long-folder-name\
```

C:\temp\REALLY~1





### Example 4: EXAMPLE 4

```
Get-ShortName -Path c:\temp\Really-long-folder-name\ -IncludeInput
```

LongName                         ShortName        ItemType
--------                         ---------        --------
C:\temp\Really-long-folder-name\ C:\temp\REALLY~1 Folder






## PARAMETERS

### -IncludeInput

Switch to include the input parameters in the output

```yaml
Type: SwitchParameter
Parameter Sets: LiteralPath, Path
Aliases: 
Accepted values: 

Required: True (None) False (LiteralPath, Path)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -LiteralPath

{{ Fill LiteralPath Description }}

```yaml
Type: String[]
Parameter Sets: LiteralPath
Aliases: 
Accepted values: 

Required: True (None) False (LiteralPath)
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Path

A string or string array of files and folders

```yaml
Type: String[]
Parameter Sets: Path
Aliases: 
Accepted values: 

Required: True (None) False (Path)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

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

* updated function so Test-Path, Resolve-Path, Get-Item use -LiteralPath vs -Path


## RELATED LINKS

Fill Related Links Here

