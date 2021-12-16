---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version: http://wonkysoftware.appspot.com
schema: 2.0.0
---

# Get-DisplayBrightness

## SYNOPSIS
To get the current brightness of the display

## SYNTAX

```
Get-DisplayBrightness [-Full] [<CommonParameters>]
```

## DESCRIPTION
To get the current brightness of the display

## EXAMPLES

### EXAMPLE 1
```
Get-DisplayBrightness
```

60

### EXAMPLE 2
```
Get-DisplayBrightness -Full
```

Namespace Class                CurrentBrightness
--------- -----                -----------------
root/WMI  WmiMonitorBrightness                60

### EXAMPLE 3
```
Set-Display -Brightness 100
```

Get-DisplayBrightness

100

## PARAMETERS

### -Full
Switch to display the full WMI path to the current value

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

### int
## NOTES
Inspired by: https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/check-monitor-brightness

## RELATED LINKS
