---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Set-Display

## SYNOPSIS

Set-Display turns the display on or off via energy saver api. Can also set display brightness

## SYNTAX

### On (Default)

```
Set-Display [-On] [<CommonParameters>]
```

### Off

```
Set-Display [-Off] [<CommonParameters>]
```

### Brightness

```
Set-Display [-Brightness <Int32>] [<CommonParameters>]
```

## DESCRIPTION

Set-Display turns the display on or off via energy saver api.
Can also set display brightness


## EXAMPLES

### Example 1: EXAMPLE 1

```
Set-Display -Off ; Start-Sleep -Seconds 5 ; Set-Display -On
```







### Example 2: EXAMPLE 2

```
Set-Display -Brightness 75
```








## PARAMETERS

### -Brightness

[int] representing the brightness.
Valid range 1-100

```yaml
Type: Int32
Parameter Sets: Brightness
Aliases: 
Accepted values: 

Required: True (None) False (Brightness)
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Off

Switch to turn the display off

```yaml
Type: SwitchParameter
Parameter Sets: Off
Aliases: 
Accepted values: 

Required: True (None) False (Off)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -On

Switch to turn the display on

```yaml
Type: SwitchParameter
Parameter Sets: On
Aliases: 
Accepted values: 

Required: True (None) False (On)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### 



## NOTES

Inspired by
# Turning off display http://community.idera.com/database-tools/powershell/powertips/b/tips/posts/turning-display-off-immediately
# Turning on display  https://www.codeproject.com/Articles/11099/Turn-on-off-monitor
# Brightness https://winaero.com/change-screen-brightness-windows-10/


## RELATED LINKS

Fill Related Links Here

