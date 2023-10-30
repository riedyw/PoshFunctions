---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-DisplayBrightness

## SYNOPSIS

To get the current brightness of the display

## SYNTAX

### __AllParameterSets

```
Get-DisplayBrightness [-Full] [<CommonParameters>]
```

## DESCRIPTION

To get the current brightness of the display


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-DisplayBrightness
```

60





### Example 2: EXAMPLE 2

```
Get-DisplayBrightness -Full
```

Namespace Class                CurrentBrightness
--------- -----                -----------------
root/WMI  WmiMonitorBrightness                60





### Example 3: EXAMPLE 3

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

## OUTPUTS

### int



## NOTES

Inspired by: https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/check-monitor-brightness


## RELATED LINKS

Fill Related Links Here

