---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# Get-Power

## SYNOPSIS
Provides exponentian

## SYNTAX

```
Get-Power [-Base] <Double[]> [[-Power] <Double>] [-IncludeOriginal] [<CommonParameters>]
```

## DESCRIPTION
Provides exponentian, also called power as in "2 to the power 3" equals 8

## EXAMPLES

### EXAMPLE 1
```
Get-Power -Base 2 -Power 3
```

Returns 8

### EXAMPLE 2
```
Get-Power -Base 2 -Power 10
```

Returns 1024

### EXAMPLE 3
```
Get-Power -Base 4 -Power 0.5
```

Returns 2

### EXAMPLE 4
```
Get-Power -Base 2 -Power 5 -IncludeOriginal
```

Base Power Result
---- ----- ------
2     5     32

### EXAMPLE 5
```
Get-Power -Base 27 -Power (1/3) -IncludeOriginal
```

Base             Power Result
----             ----- ------
27 0.333333333333333      3

## PARAMETERS

### -Base
The base number that will be raised to a power

```yaml
Type: Double[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Power
To what level the exponentian will go.
Defaults to 1.

```yaml
Type: Double
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 1
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeOriginal
A switch to determine if you want the input parameters to be included in the output

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

### [double]
## NOTES
To do square or cube roots invert the power.
    square root, -Power (1/2)
    cube root, -Power (1/3)
and so on.

## RELATED LINKS
