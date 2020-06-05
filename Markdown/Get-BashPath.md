---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Get-BashPath

## SYNOPSIS
To take a normal Windows path and convert it to a bash path for things like git bash.

## SYNTAX

```
Get-BashPath [-Path] <String[]> [-IncludeOriginal] [<CommonParameters>]
```

## DESCRIPTION
To take a normal Windows path and convert it to a bash path for things like git bash.

## EXAMPLES

### EXAMPLE 1
```
Get-BashPath -Path 'c:\temp\*.csv'
```

/C/temp/Encoding\ Time.csv

### EXAMPLE 2
```
Get-BashPath -Path 'c:\temp\*.csv' -IncludeOriginal
```

Posh                      bash
----                      ----
C:\temp\Encoding Time.csv /C/temp/Encoding\ Time.csv

## PARAMETERS

### -Path
A path to a file or files.
Can include wildcards and the wildcards will be resolved to underlying
files.
Can be a single path, an array of paths, or from the pipeline.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -IncludeOriginal
Describe parameter -IncludeOriginal.

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

### psobject
## NOTES
The file(s) must exist for this function to work

## RELATED LINKS
