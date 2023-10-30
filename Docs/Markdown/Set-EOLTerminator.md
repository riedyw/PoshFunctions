---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Set-EOLTerminator

## SYNOPSIS

Converts to EOL character(s) considered "normal" for various operating systems. For Unix it is "LF", for Mac it is "CR", and for Windows it is "CRLF"

## SYNTAX

### __AllParameterSets

```
Set-EOLTerminator [[-LineEnding <String>]] [-Path] <String[]> [-Quiet] [<CommonParameters>]
```

## DESCRIPTION

Converts to EOL character(s) considered "normal" for various operating systems.
For Unix it is "LF", for Mac it is "CR", and for Windows it is "CRLF"


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-FileEncoding -Path c:\temp\tempfile.txt
```

EncodingType Path
------------ ----
ASCII        C:\temp\tempfile.txt






## PARAMETERS

### -LineEnding

EOL format to be used.
Validate set 'Mac', 'Unix', 'Win'.
Defaults to 'Win'

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: Win
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Path

The path to the file(s)

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (All) False (None)
Position: 1
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Quiet

If specified there will be no output produced by the function

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


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES

Inspired by https://ss64.com/ps/syntax-set-eol.html.

Converted it into a function.
Added comment based help, begin/process/end code blocks, changing parameter $file to $Path to be more
inline with other PowerShell commands.
$Path can be an array of strings.
Relative paths are accepted.
Test for existence of $Path and that it is not a directory
Provides output by default, can be disabled with -Quiet parameter.
Function as originally written was doing the file write 2 or 3 times (depending on code branching),
and rereading the file which is not necessary as it stores the contents of the file in memory.


## RELATED LINKS

Fill Related Links Here

