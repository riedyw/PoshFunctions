---
external help file: poshfunctions-help.xml
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
Test-PasswordComplexity [-IncludeInput] [-MinimumLength <Int32>] [-SecureString <SecureString>] [<CommonParameters>]
```

### Credential

```
Test-PasswordComplexity [-Credential <PSCredential>] [-IncludeInput] [-MinimumLength <Int32>] [<CommonParameters>]
```

### Password

```
Test-PasswordComplexity [-IncludeInput] [-MinimumLength <Int32>] [-Password <String[]>] [<CommonParameters>]
```

## DESCRIPTION

Tests a password for length and password complexity.
Complexity is at least 1 upper case character, 1 lower case character,
1 numeral, 1 special character.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Test-PasswordComplexity -Password 'Password1'
```

Would return $false as there is no special character





### Example 2: EXAMPLE 2

```
Test-PasswordComplexity -Password 'Password1' -IncludeInput
```

Would return the following as there is no special character
Password  MinLength Length MatchComplexity
--------  --------- ------ ---------------
*********         8      9           False





### Example 3: EXAMPLE 3

```
Test-PasswordComplexity -Password 'Ab(0' -IncludeInput
```

Although it matches all the character types the password is too short
Password MinLength Length MatchComplexity
-------- --------- ------ ---------------
****             8      4           False






## PARAMETERS

### -Credential

The password passed as part of a credential.
In parameter sets 'Credential'.

```yaml
Type: PSCredential
Parameter Sets: Credential
Aliases: 
Accepted values: 

Required: True (None) False (Credential)
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -IncludeInput

Switch whether to include input in the output.
Passwords are masked with a '*'.
In parameter sets 'SecureString', 'Credential', 'Password'

```yaml
Type: SwitchParameter
Parameter Sets: Password, Credential, SecureString
Aliases: 
Accepted values: 

Required: True (None) False (Password, Credential, SecureString)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -MinimumLength

Integer minimum number of characters in password.
Valid range 1-255.
Defaults to 8.
Aliased to 'MinLength'.
In parameter sets 'SecureString', 'Credential', 'Password'

```yaml
Type: Int32
Parameter Sets: Password, Credential, SecureString
Aliases: MinLength
Accepted values: 

Required: True (None) False (Password, Credential, SecureString)
Position: Named
Default value: 8
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Password

The password passed as plain text.
In parameter sets 'Password'.

```yaml
Type: String[]
Parameter Sets: Password
Aliases: 
Accepted values: 

Required: True (None) False (Password)
Position: Named
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -SecureString

The password passed as a secure string.
In parameter sets 'SecureString'.

```yaml
Type: SecureString
Parameter Sets: SecureString
Aliases: 
Accepted values: 

Required: True (None) False (SecureString)
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### bool



## NOTES

Changed logic on getting $*Regex values so there would not be a dependency on Get-PrintableAscii


## RELATED LINKS

Fill Related Links Here

