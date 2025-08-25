---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Read-HostPause

## SYNOPSIS
To more closely mimic the behavior of PAUSE in cmd.exe where you only have to press a key

## SYNTAX

```
Read-HostPause [[-Prompt] <String>] [[-ForegroundColor] <String>] [<CommonParameters>]
```

## DESCRIPTION
To more closely mimic the behavior of PAUSE in cmd.exe where you only have to press a key

## EXAMPLES

### EXAMPLE 1
```
Read-HostPause -ForegroundColor Cyan
```

Displays 'Press any key to continue...' in Cyan and waits until a key is pressed.

## PARAMETERS

### -Prompt
The message to be displayed.
Defaults to 'Press any key to continue...'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: Press any key to continue...
Accept pipeline input: False
Accept wildcard characters: False
```

### -ForegroundColor
String representing the foreground color.
Validates against the console color names in English.
Defaults to 'Gray'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: Gray
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
