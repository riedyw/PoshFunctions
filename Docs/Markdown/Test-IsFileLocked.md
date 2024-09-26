---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Test-IsFileLocked

## SYNOPSIS

Determine if a file is locked.

## SYNTAX

### __AllParameterSets

```
Test-IsFileLocked [-Path] <String[]> [<CommonParameters>]
```

## DESCRIPTION

Determine if a file is locked.
Wildcards are acceptable in the path and are
resolved to all files that match the pattern.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Test-IsFileLocked -Path c:\temp\*.csv
```

File                      IsLocked
----                      --------
C:\temp\Encoding Time.csv    False
C:\temp\Test.csv             False





### Example 2: EXAMPLE 2

```
Test-IsFileLocked -Path .
```

Test-IsFileLocked : ERROR: Path [.] is a folder





### Example 3: EXAMPLE 3

```
Test-IsFileLocked -Path .\FileDoesNotExist
```

Test-IsFileLocked : ERROR: Path [.\FileDoesNotExist] does not exist






## PARAMETERS

### -Path

A string or array of strings representing a path to a file.
Can accept from the pipeline.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: FullName,PSPath
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### System.Management.Automation.PSObject[]



## NOTES

# inspired by https://mcpmag.com/articles/2018/07/10/check-for-locked-file-using-powershell.aspx
# changed logic for testing if file exists


## RELATED LINKS

Fill Related Links Here

