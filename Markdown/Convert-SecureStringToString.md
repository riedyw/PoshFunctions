---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version: https://en.wikipedia.org/wiki/ROT13
schema: 2.0.0
---

# Convert-SecureStringToString

## SYNOPSIS
Converts a SecureString value back to a plaintext string

## SYNTAX

```
Convert-SecureStringToString [-SecureString] <SecureString> [<CommonParameters>]
```

## DESCRIPTION
Converts a SecureString value back to a plaintext string

## EXAMPLES

### EXAMPLE 1
```
$SecureString = Read-Host -Prompt 'Enter a string' -AsSecureString
```

#Let's say you entered the string 'Password' without quotes

Convert-SecureStringToString -SecureString $SecureString

Password

## PARAMETERS

### -SecureString
The SecureString that you want to get back to being plaintext

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### string
## NOTES

## RELATED LINKS
