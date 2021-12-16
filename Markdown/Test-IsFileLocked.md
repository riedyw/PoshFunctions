---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# Test-IsFileLocked

## SYNOPSIS
Determine if a file is locked.

## SYNTAX

```
Test-IsFileLocked [-Path] <String[]> [<CommonParameters>]
```

## DESCRIPTION
Determine if a file is locked.
Wildcards are acceptable in the path and are
resolved to all files that match the pattern.

## EXAMPLES

### EXAMPLE 1
```
Test-IsFileLocked -Path c:\temp\*.csv
```

File                      IsLocked
----                      --------
C:\temp\Encoding Time.csv    False
C:\temp\Test.csv             False

### EXAMPLE 2
```
Test-IsFileLocked -Path .
```

Test-IsFileLocked : ERROR: Path \[.\] is a folder

### EXAMPLE 3
```
Test-IsFileLocked -Path .\FileDoesNotExist
```

Test-IsFileLocked : ERROR: Path \[.\FileDoesNotExist\] does not exist

## PARAMETERS

### -Path
A string or array of strings representing a path to a file.
Can accept from the pipeline.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: FullName, PSPath

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Management.Automation.PSObject[]
## NOTES
# inspired by https://mcpmag.com/articles/2018/07/10/check-for-locked-file-using-powershell.aspx
# changed logic for testing if file exists

## RELATED LINKS
