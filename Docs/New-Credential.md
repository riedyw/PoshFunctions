---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# New-Credential

## SYNOPSIS
Returns a \[PSCredential\] given a passed UserName, and either a string 'Password' or a securestring 'SecureString'

## SYNTAX

### SecureString (Default)
```
New-Credential [-UserName] <String> [-SecureString] <SecureString> [<CommonParameters>]
```

### Password
```
New-Credential [-UserName] <String> [-Password] <String> [<CommonParameters>]
```

## DESCRIPTION
Returns a \[PSCredential\] given a passed UserName, and either a string 'Password' or a securestring 'SecureString'.
Behavior is controlled by ParameterSetName

## EXAMPLES

### EXAMPLE 1
```
$Credential = New-Credential -UserName 'donaldduck' -Password 'Quack'
```

### EXAMPLE 2
```
$SecureString = Read-Host -Prompt 'Enter password' -AsSecureString
```

$Cred2 = New-Credential -UserName 'mickeymouse' -SecureString $SecureString

## PARAMETERS

### -UserName
A mandatory parameter of type \[string\] that represents a username that you are creating.
Can be of the form 'username', or 'domain\username', or 'username@company.com'.
In both parameter set names 'SecureString' and 'Password'

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

### -SecureString
A mandatory parameter of type \[securestring\] that represents a securestring password.
In parameter set name 'SecureString'

```yaml
Type: SecureString
Parameter Sets: SecureString
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Password
A mandatory parameter of type \[tring\] that represents a plaintext password.
In parameter set name 'Password'

```yaml
Type: String
Parameter Sets: Password
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### 'string', 'securestring'
### or
### 'string', 'string'
## OUTPUTS

### 'PSCredential'
## NOTES
Medium to High impact as this function will return the password, albeit hidden from default view

## RELATED LINKS
