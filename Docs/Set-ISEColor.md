---
external help file: MyFunctions-help.xml
Module Name: MyFunctions
online version:
schema: 2.0.0
---

# Set-ISEColor

## SYNOPSIS
Changes ISE Theme colors according to switch

## SYNTAX

### Cooler
```
Set-ISEColor [-Cooler] [-Degree <Int32>] [<CommonParameters>]
```

### Warmer
```
Set-ISEColor [-Warmer] [-Degree <Int32>] [<CommonParameters>]
```

### Greener
```
Set-ISEColor [-Greener] [-Degree <Int32>] [<CommonParameters>]
```

### Darker
```
Set-ISEColor [-Darker] [-Degree <Int32>] [<CommonParameters>]
```

### Lighter
```
Set-ISEColor [-Lighter] [-Degree <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Changes ISE Theme colors according to switch.
It does this
by adding or subtracting values in the ARGB table

## EXAMPLES

### EXAMPLE 1
```
Set-ISEColor -Cooler
```

Deletes an ISE theme from the registry

## PARAMETERS

### -Cooler
Increases blue color values and decreases red by half

```yaml
Type: SwitchParameter
Parameter Sets: Cooler
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Warmer
Increases red color values and decreases blue by half

```yaml
Type: SwitchParameter
Parameter Sets: Warmer
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Greener
Increases green color values and decreases blue and red by a quarter

```yaml
Type: SwitchParameter
Parameter Sets: Greener
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Darker
Decreases all color values

```yaml
Type: SwitchParameter
Parameter Sets: Darker
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Lighter
Increases all color values

```yaml
Type: SwitchParameter
Parameter Sets: Lighter
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Degree
Amount to add or subtract.
Default value: 20

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 20
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Part of the ISEColorThemeCmdlets.ps1 Script by Jeff Pollock
http://Lifeinpowerhsell.blogspot.com
http://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e

## RELATED LINKS
