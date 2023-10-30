---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# Test-PasswordComplexity

## SYNOPSIS
Tests a password for length and password complexity

## SYNTAX

### SecureString (Default)
```
Test-PasswordComplexity [-SecureString <SecureString>] [-MinimumLength <Int32>] [-IncludeInput]
 [<CommonParameters>]
```

### Credential
```
Test-PasswordComplexity [-Credential <PSCredential>] [-MinimumLength <Int32>] [-IncludeInput]
 [<CommonParameters>]
```

### Password
```
Test-PasswordComplexity [-Password <String[]>] [-MinimumLength <Int32>] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Tests a password for length and password complexity.
Complexity is at least 1 upper case character, 1 lower case character,
1 numeral, 1 special character.

## EXAMPLES

### EXAMPLE 1
```
Test-PasswordComplexity -Password 'Password1'
```

Would return $false as there is no special character

### EXAMPLE 2
```
Test-PasswordComplexity -Password 'Password1' -IncludeInput
```

Would return the following as there is no special character
Password  MinLength Length MatchComplexity
--------  --------- ------ ---------------
*********         8      9           False

### EXAMPLE 3
```
Test-PasswordComplexity -Password 'Ab(0' -IncludeInput
```

Although it matches all the character types the password is too short
Password MinLength Length MatchComplexity
-------- --------- ------ ---------------
****             8      4           False

## PARAMETERS

### -SecureString
The password passed as a secure string.
In parameter sets 'SecureString'.

```yaml
Type: SecureString
Parameter Sets: SecureString
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Credential
The password passed as part of a credential.
In parameter sets 'Credential'.

```yaml
Type: PSCredential
Parameter Sets: Credential
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Password
The password passed as plain text.
In parameter sets 'Password'.

```yaml
Type: String[]
Parameter Sets: Password
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -MinimumLength
Integer minimum number of characters in password.
Valid range 1-255.
Defaults to 8.
Aliased to 'MinLength'.
In parameter sets 'SecureString', 'Credential', 'Password'

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: MinLength

Required: False
Position: Named
Default value: 8
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeInput
Switch whether to include input in the output.
Passwords are masked with a '*'.
In parameter sets 'SecureString', 'Credential', 'Password'

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
Changed logic on getting $*Regex values so there would not be a dependency on Get-PrintableAscii

## RELATED LINKS
