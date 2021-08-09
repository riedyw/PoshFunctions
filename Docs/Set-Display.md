---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# Set-Display

## SYNOPSIS
Set-Display turns the display on or off via energy saver api

## SYNTAX

### On (Default)
```
Set-Display [-On] [<CommonParameters>]
```

### Off
```
Set-Display [-Off] [<CommonParameters>]
```

## DESCRIPTION
Set-Display turns the display on or off via energy saver api

## EXAMPLES

### EXAMPLE 1
```
Set-Display -Off ; Start-Sleep -Seconds 5 ; Set-Display -On
```

## PARAMETERS

### -On
{{ Fill On Description }}

```yaml
Type: SwitchParameter
Parameter Sets: On
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Off
{{ Fill Off Description }}

```yaml
Type: SwitchParameter
Parameter Sets: Off
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

## NOTES
Inspired by
# Turning off display http://community.idera.com/database-tools/powershell/powertips/b/tips/posts/turning-display-off-immediately
# Turning on display  https://www.codeproject.com/Articles/11099/Turn-on-off-monitor

## RELATED LINKS
