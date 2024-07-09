---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Resolve-PathForce

## SYNOPSIS

Resolves a path to a single file/folder, even if it does not exist

## SYNTAX

### __AllParameterSets

```
Resolve-PathForce [[-Path <String>]] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

Resolves a path to a single file/folder, even if it does not exist


## EXAMPLES

### Example 1: EXAMPLE 1

```
Resolve-PathForce \dne\dne.txt -IncludeInput -Verbose
```

VERBOSE: Starting [Resolve-PathForce]
VERBOSE: Path specified [\dne\dne.txt]
VERBOSE: Path [\dne\dne.txt] does not exist

VERBOSE: Ending [Resolve-PathForce]
Path         Exists Type    ResolvedPath
----         ------ ----    ------------
\dne\dne.txt  False Unknown C:\dne\dne.txt





### Example 2: EXAMPLE 2

```
Resolve-PathForce \temp -IncludeInput
```

Path  Exists Type   ResolvedPath
----  ------ ----   ------------
\temp   True Folder C:\temp





### Example 3: EXAMPLE 3

```
Resolve-PathForce \temp
```

C:\temp






## PARAMETERS

### -IncludeInput

Switch to include the input as part of the output

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

### -Path

String path to file/folder.
Can be relative path.
Must not contain wildcards or invalid characters

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

## NOTES

Inspired by post: https://stackoverflow.com/questions/3038337/powershell-resolve-path-that-might-not-exist


## RELATED LINKS

Fill Related Links Here

