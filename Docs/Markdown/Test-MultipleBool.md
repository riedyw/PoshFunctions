---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Test-MultipleBool

## SYNOPSIS

Takes multiple bool values and applies a boolean operator against them to get an answer

## SYNTAX

### And (Default)

```
Test-MultipleBool -Bool <Boolean[]> [-IncludeInput] [-TestAnd] [<CommonParameters>]
```

### Or

```
Test-MultipleBool -Bool <Boolean[]> [-IncludeInput] [-TestOr] [<CommonParameters>]
```

## DESCRIPTION

Takes multiple bool values and applies a boolean operator against them to get an answer.
Default parameter set name 'And'


## EXAMPLES

### Example 1: EXAMPLE 1

```
$true, $false | Test-MultipleBool -IncludeInput -TestAnd -Verbose
```

VERBOSE: Starting [Test-MultipleBool]
VERBOSE: ParameterSetName [And]
VERBOSE: TestOr [False] TestAnd [True] IncludeInput [True]

VERBOSE: Ending [Test-MultipleBool]
Values     Operator Result
------     -------- ------
True,False AND       False





### Example 2: EXAMPLE 2

```
$true, $false | Test-MultipleBool -IncludeInput -TestOr
```

Values     Operator Result
------     -------- ------
True,False OR         True





### Example 3: EXAMPLE 3

```
$true, $false, $true | Test-MultipleBool -IncludeInput -TestOr
```

Values          Operator Result
------          -------- ------
True,False,True OR         True





### Example 4: EXAMPLE 4

```
$true, $false, $true | Test-MultipleBool -IncludeInput -TestAnd
```

Values          Operator Result
------          -------- ------
True,False,True AND       False






## PARAMETERS

### -Bool

An array of boolean values.
Accepts values from the pipeline.
Valid parameter set names 'And', 'Or'

```yaml
Type: Boolean[]
Parameter Sets: Or, And
Aliases: 
Accepted values: 

Required: True (Or, And) False (None)
Position: Named
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -IncludeInput

Switch to include the input in the output.
Valid parameter set names 'And', 'Or'

```yaml
Type: SwitchParameter
Parameter Sets: Or, And
Aliases: 
Accepted values: 

Required: True (None) False (Or, And)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -TestAnd

Switch to perform boolean AND.
Parameter set name 'And'

```yaml
Type: SwitchParameter
Parameter Sets: And
Aliases: 
Accepted values: 

Required: True (None) False (And)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -TestOr

Switch to perform boolean OR.
Parameter set name 'Or'

```yaml
Type: SwitchParameter
Parameter Sets: Or
Aliases: 
Accepted values: 

Required: True (None) False (Or)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### bool



## NOTES



## RELATED LINKS

Fill Related Links Here

