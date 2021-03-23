---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version: http://wonkysoftware.appspot.com
schema: 2.0.0
---

# Get-BinaryType

## SYNOPSIS
Gets the binary executable type for a given set of files

## SYNTAX

```
Get-BinaryType [-Path] <String[]> [-PassThrough] [<CommonParameters>]
```

## DESCRIPTION
PowerShell wrapper around the GetBinaryType Windows API that inspects file headers
and reports the binary file type (e.g., 32-bit Windows app, 64-bit Windows app,
16-bit DOS/Windows app, etc.)

## EXAMPLES

### EXAMPLE 1
```
#Reports the file type of C:\Windows\Explorer.exe:
```

Get-BinaryType C:\Windows\Explorer.exe

### EXAMPLE 2
```
#Attempts to get the binary type of all files in the current directory
```

Get-ChildItem | where { !$_.PsIsContainer } | Get-BinaryType

### EXAMPLE 3
```
#Attempts to get the binary type of all exe files in the windows directory,
```

#ignoring any non-terminating errors
Get-ChildItem $env:windir -filter *.exe | Get-BinaryType -ErrorAction SilentlyContinue

### EXAMPLE 4
```
#From a 32bit process on a 64 bit Windows install, attempts to get the binary type of all exe files
```

#in the windows system32 directory by bypassing filesystem redirection using "sysnative",
#ignoring any non-terminating errors, and finally showing the file name and binary type
Get-ChildItem $env:windir\sysnative -filter *.exe | Get-BinaryType -ErrorAction SilentlyContinue -passthrough | select Name,BinaryType

## PARAMETERS

### -Path
File path(s) to inspect

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

### -PassThrough
{{ Fill PassThrough Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: PassThru

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
Author:      Battleship, Aaron Margosis
Inspiration: http://pinvoke.net/default.aspx/kernel32/GetBinaryType.html

## RELATED LINKS

[http://wonkysoftware.appspot.com](http://wonkysoftware.appspot.com)

