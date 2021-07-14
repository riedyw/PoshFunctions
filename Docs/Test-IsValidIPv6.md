---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Test-IsValidIPv6

## SYNOPSIS
Verifies if passed parameter is a valid IP v6 address

## SYNTAX

```
Test-IsValidIPv6 [[-IPAddress] <String[]>] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Verifies if passed parameter is a valid IP v6 address.
Can take single string or array of strings.
Can also accept input from the pipeline.

## EXAMPLES

### EXAMPLE 1
```
Test-IsValidIPv6 '::1'
```

Would return
True

### EXAMPLE 2
```
Test-IsValidIPv6 -IPAddress '::1' -Verbose
```

Would return
VERBOSE: Starting Test-IsValidIPv6
VERBOSE: The string being tested if a valid IPv6 address is \[::1\]
True
VERBOSE: Ending Test-IsValidIPv6

### EXAMPLE 3
```
'::1','invalid' | Test-IsValidIPv6 -IncludeInput
```

Input   Result
-----   ------
::1       True
invalid  False

## PARAMETERS

### -IPAddress
{{ Fill IPAddress Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: IP

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
