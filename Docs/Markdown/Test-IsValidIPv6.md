---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Test-IsValidIPv6

## SYNOPSIS

Verifies if passed parameter is a valid IP v6 address

## SYNTAX

### __AllParameterSets

```
Test-IsValidIPv6 [[-IPAddress <String[]>]] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

Verifies if passed parameter is a valid IP v6 address.
Can take single string or array of strings.
Can also accept input from the pipeline.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Test-IsValidIPv6 '::1'
```

Would return
True





### Example 2: EXAMPLE 2

```
Test-IsValidIPv6 -IPAddress '::1' -Verbose
```

Would return
VERBOSE: Starting Test-IsValidIPv6
VERBOSE: The string being tested if a valid IPv6 address is [::1]
True
VERBOSE: Ending Test-IsValidIPv6





### Example 3: EXAMPLE 3

```
'::1','invalid' | Test-IsValidIPv6 -IncludeInput
```

Input   Result
-----   ------
::1       True
invalid  False






## PARAMETERS

### -IncludeInput

{{ Fill IncludeInput Description }}

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

### -IPAddress

{{ Fill IPAddress Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: IP
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: 
Accept pipeline input: True
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

