---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# Test-IsDate

## SYNOPSIS
Tests to see if the specified string is a valid \[datetime\] string

## SYNTAX

```
Test-IsDate [[-DateString] <String[]>] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Tests to see if the specified string is a valid \[datetime\] string.
Can accept a string or an array of strings.
Can also accept pipeline input.

## EXAMPLES

### EXAMPLE 1
```
Test-IsDate
```

Would return $null

### EXAMPLE 2
```
Test-IsDate 1/1/19 -Verbose
```

Would return:
VERBOSE: The string you entered is \[1/1/19\]
True

### EXAMPLE 3
```
Test-IsDate @('1/1/1965','2/1/19','dne', '3 Feb 2019 17:00') -IncludeInput
```

Would return
Input            Result DateTime
-----            ------ --------
1/1/1965           True 1/1/1965 12:00:00 AM
2/1/19             True 2/1/2019 12:00:00 AM
dne               False
3 Feb 2019 17:00   True 2/3/2019 5:00:00 PM

## PARAMETERS

### -DateString
{{ Fill DateString Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: date

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -IncludeInput
{{ Fill IncludeInput Description }}

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
