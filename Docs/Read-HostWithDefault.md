---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# Read-HostWithDefault

## SYNOPSIS
A wrapper for Read-Host that includes a default value.
Optionally can provide a prompt.

## SYNTAX

```
Read-HostWithDefault [-Default] <String> [[-Prompt] <String>] [<CommonParameters>]
```

## DESCRIPTION
A wrapper for Read-Host that includes a default value.
Optionally can provide a prompt.

## EXAMPLES

### EXAMPLE 1
```
$password = Read-HostWithDefault -Default 'SuperSecretPassword'
```

Would prompt the user with: 'Enter a password value or accept default of \[SuperSecretPassword\]:' and store the result in $password

### EXAMPLE 2
```
$username = Read-HostWithDefault -Default 'sa' -Prompt 'Enter a SQL user login or accept default of'
```

Would prompt the user with: 'Enter a SQL user login or accept default of \[sa\]:' and store the result in $username

## PARAMETERS

### -Default
A required parameter indicating what the default return value will be if the user just hits \[Enter\]

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Prompt
A string template for the prompt string.
Defaults to 'Enter a password value or accept default of'.
Resulting prompt with this template would be "Enter a password value or accept default of \[$Default\]"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: Enter a password value or accept default of
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### [string]
## NOTES

## RELATED LINKS

[Read-Host]()

