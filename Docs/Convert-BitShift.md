---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Convert-BitShift

## SYNOPSIS
Bit shifts an integer either LEFT or RIGHT.

## SYNTAX

### Left (Default)
```
Convert-BitShift [-Integer] <Int32[]> [-Left <Int32>] [-IncludeOriginal] [<CommonParameters>]
```

### Right
```
Convert-BitShift [-Integer] <Int32[]> [-Right <Int32>] [-IncludeOriginal] [<CommonParameters>]
```

## DESCRIPTION
Bit shifts an integer either LEFT or RIGHT.
Optionally can include original information.

## EXAMPLES

### EXAMPLE 1
```
Convert-BitShift -Integer 36 -Left 2
```

144

### EXAMPLE 2
```
Convert-BitShift -x 36 -Right 2
```

9

### EXAMPLE 3
```
1..10| Convert-bitshift -IncludeOriginal
```

Input Shift Pos Output
----- ----- --- ------
    1 Left    1      2
    2 Left    1      4
    3 Left    1      6
    4 Left    1      8
    5 Left    1     10
    6 Left    1     12
    7 Left    1     14
    8 Left    1     16
    9 Left    1     18
   10 Left    1     20

## PARAMETERS

### -Integer
An \[int\[\]\] integer, or array of integers to be manipulated.
Aliased to 'X'

```yaml
Type: Int32[]
Parameter Sets: (All)
Aliases: X

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Left
Shifts the bits to the left by \[int\] positions.
Will make Integer larger.

```yaml
Type: Int32
Parameter Sets: Left
Aliases:

Required: False
Position: Named
Default value: 1
Accept pipeline input: False
Accept wildcard characters: False
```

### -Right
Shifts the bits to the right by \[int\] positions.
Will make Integer smaller.

```yaml
Type: Int32
Parameter Sets: Right
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeOriginal
If this is specified the function returns an array of custom objects with the following properties
Input    - The original value
Shift    - Either 'Left' or 'Right'
Pos      - The number of positions to shift
Output   - The result

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: inc, original

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

### [int[]]
## NOTES
Only needed for PowerShell 2

## RELATED LINKS
