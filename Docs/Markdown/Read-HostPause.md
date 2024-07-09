---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Read-HostPause

## SYNOPSIS

To more closely mimic the behavior of PAUSE in cmd.exe where you only have to press a key

## SYNTAX

### __AllParameterSets

```
Read-HostPause [[-Prompt <String>]] [[-ForegroundColor <String>]] [<CommonParameters>]
```

## DESCRIPTION

To more closely mimic the behavior of PAUSE in cmd.exe where you only have to press a key


## EXAMPLES

### Example 1: EXAMPLE 1

```
Read-HostPause -ForegroundColor Cyan
```

Displays 'Press any key to continue...' in Cyan and waits until a key is pressed.






## PARAMETERS

### -ForegroundColor

String representing the foreground color.
Validates against the console color names in English.
Defaults to 'Gray'

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 1
Default value: Gray
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Prompt

The message to be displayed.
Defaults to 'Press any key to continue...'

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: Press any key to continue...
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES



## RELATED LINKS

Fill Related Links Here

