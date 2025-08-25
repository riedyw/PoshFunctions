---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version: https://gist.github.com/Nora-Ballard/11240204
schema: 2.0.0
---

# Test-MultipleBool

## SYNOPSIS
Takes multiple bool values and applies a boolean operator against them to get an answer

## SYNTAX

### And (Default)
```
Test-MultipleBool -Bool <Boolean[]> [-TestAnd] [-IncludeInput] [<CommonParameters>]
```

### Or
```
Test-MultipleBool -Bool <Boolean[]> [-TestOr] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Takes multiple bool values and applies a boolean operator against them to get an answer.
Default parameter set name 'And'

## EXAMPLES

### EXAMPLE 1
```
$true, $false | Test-MultipleBool -IncludeInput -TestAnd -Verbose
```

VERBOSE: Starting \[Test-MultipleBool\]
VERBOSE: ParameterSetName \[And\]
VERBOSE: TestOr \[False\] TestAnd \[True\] IncludeInput \[True\]

VERBOSE: Ending \[Test-MultipleBool\]
Values     Operator Result
------     -------- ------
True,False AND       False

### EXAMPLE 2
```
$true, $false | Test-MultipleBool -IncludeInput -TestOr
```

Values     Operator Result
------     -------- ------
True,False OR         True

### EXAMPLE 3
```
$true, $false, $true | Test-MultipleBool -IncludeInput -TestOr
```

Values          Operator Result
------          -------- ------
True,False,True OR         True

### EXAMPLE 4
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
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -TestAnd
Switch to perform boolean AND.
Parameter set name 'And'

```yaml
Type: SwitchParameter
Parameter Sets: And
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -TestOr
Switch to perform boolean OR.
Parameter set name 'Or'

```yaml
Type: SwitchParameter
Parameter Sets: Or
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeInput
Switch to include the input in the output.
Valid parameter set names 'And', 'Or'

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

### bool
## NOTES

## RELATED LINKS
