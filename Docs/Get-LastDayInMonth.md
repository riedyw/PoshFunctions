---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# Get-LastDayInMonth

## SYNOPSIS
Get the last day of the month given the year as an integer, and the month as an integer

## SYNTAX

```
Get-LastDayInMonth [-Year] <Int32> [-Month] <Int32> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Get the last day of the month given the year as an integer, and the month as an integer

## EXAMPLES

### EXAMPLE 1
```
Get-LastDayInMonth -Year 2020 -Month 2
```

29

### EXAMPLE 2
```
Get-LastDayInMonth -Year 2019 -Month 2
```

28

### EXAMPLE 3
```
Get-LastDayInMonth -Year 2019 -Month 2 -IncludeInput
```

Year Month Days
---- ----- ----
2019     2   28

### EXAMPLE 4
```
new-object psobject -property @{Year=2000;Month=2} | Get-LastDayInMonth
```

29

### EXAMPLE 5
```
new-object psobject -property @{Y=2019;M=2} | Get-LastDayInMonth -IncludeInput
```

Year Month Days
---- ----- ----
2019     2   28

## PARAMETERS

### -Year
Integer in the range 1-9999, mandatory, accept value from pipeline by propertyname, aliased to 'Y'

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: Y

Required: True
Position: 1
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Month
Integer in the range 1-12, mandatory, accept value from pipeline by propertyname, aliased to 'M'

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: M

Required: True
Position: 2
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -IncludeInput
Switch to include the input in the output

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
Inspired by: https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/calculating-first-and-last-day-of-month

## RELATED LINKS
