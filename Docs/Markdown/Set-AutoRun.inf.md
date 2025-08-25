---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Set-AutoRun.inf

## SYNOPSIS
Creates an AutoRun.inf for a drive.
Can set icon, label.
Either an icon or label must be specified

## SYNTAX

```
Set-AutoRun.inf [[-Path] <String>] [[-Label] <String>] [[-Icon] <String>] [<CommonParameters>]
```

## DESCRIPTION
Creates an AutoRun.inf for a drive.
Can set icon, label.
Either an icon or label must be specified

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Path
The path to the drive.
Must begin with a drive letter followed by a colon ':'.
Defaults to $pwd

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: $pwd
Accept pipeline input: False
Accept wildcard characters: False
```

### -Label
A string up to 32 characters that will represent the label for the drive

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

### -Icon
A path to an icon file (.ico).
File must exist and it is copied to the root of the Path specified

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
