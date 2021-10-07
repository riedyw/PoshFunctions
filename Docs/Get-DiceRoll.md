---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version: http://wonkysoftware.appspot.com
schema: 2.0.0
---

# Get-DiceRoll

## SYNOPSIS
Simulates rolling gaming dice

## SYNTAX

```
Get-DiceRoll [-Dice] <String[]> [-ShowRoll] [<CommonParameters>]
```

## DESCRIPTION
Simulates rolling gaming dice.
You can specify the number and type of a particular die.

## EXAMPLES

### EXAMPLE 1
```
# Rolling 3 standard six sided dice and showing the result of each die. The total would be between 3 and 18
```

Get-DiceRoll -Dice 3d6 -ShowRoll

Example return
DiceType Roll
-------- ----
D6       6, 3, 3
TOTAL    12

### EXAMPLE 2
```
Get-DiceRoll -Dice 3d4
```

Would return a value between 3 and 12

### EXAMPLE 3
```
Get-DiceRoll -Dice d%,d10 -ShowRoll
```

Sample return
DiceType Roll
-------- ----
D10      5
D%       30
TOTAL    35

### EXAMPLE 4
```
'd12','d4' | Get-DiceRoll -ShowRoll
```

Sample return
DiceType Roll
-------- ----
D12      3
D4       1
TOTAL    4

## PARAMETERS

### -Dice
A \[string\] array that you use to specify the type of and number of that type of dice that you want to roll.
Takes the form of \[#\]D\[Type\] where # is blank or 1-9, and Type is 4, 6, 8, 10, %, 12, 20

TYPE    DESCRIPTION
4       4 sided die with face values of 1-4
6       6 sided die with face values of 1-6
8       8 sided die with face values of 1-8
10      10 sided die with face values of 0-9
%       10 sided die with face values of 0,10,20,30,40,50,60,70,80,90
12      12 sided die with face values of 1-12
20      20 sided die with face values of 1-20

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -ShowRoll
A switch to show the results of each individual dice roll

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

### 'int'
### or
### 'psobject'
## NOTES
If you need to specify 10 or more of a particular type of dice use several entries of that dice type that add up to the value you want.

You want to know results of rolling ten 6-sided dice

Get-DiceRoll -Dice 2d6,8d6

## RELATED LINKS
