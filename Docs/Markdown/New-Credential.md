---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# New-Credential

## SYNOPSIS

Returns a [PSCredential] given a passed UserName, and either a string 'Password' or a securestring 'SecureString'

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

Returns a [PSCredential] given a passed UserName, and either a string 'Password' or a securestring 'SecureString'.
Behavior is controlled by ParameterSetName


## EXAMPLES

### Example 1: EXAMPLE 1

```
$Credential = New-Credential -UserName 'donaldduck' -Password 'Quack'
```







### Example 2: EXAMPLE 2

```
$SecureString = Read-Host -Prompt 'Enter password' -AsSecureString
```

$Cred2 = New-Credential -UserName 'mickeymouse' -SecureString $SecureString






## PARAMETERS

### -Password

A mandatory parameter of type [tring] that represents a plaintext password.
In parameter set name 'Password'

```yaml
Type: String
Parameter Sets: Password
Aliases: 
Accepted values: 

Required: True (Password) False (None)
Position: 1
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -SecureString

A mandatory parameter of type [securestring] that represents a securestring password.
In parameter set name 'SecureString'

```yaml
Type: SecureString
Parameter Sets: SecureString
Aliases: 
Accepted values: 

Required: True (SecureString) False (None)
Position: 1
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -UserName

A mandatory parameter of type [string] that represents a username that you are creating.
Can be of the form 'username', or 'domain\username', or 'username@company.com'.
In both parameter set names 'SecureString' and 'Password'

```yaml
Type: String
Parameter Sets: Password, SecureString
Aliases: 
Accepted values: 

Required: True (Password, SecureString) False (None)
Position: 0
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### 'string', 'securestring'

or

'string', 'string'



## OUTPUTS

### 'PSCredential'



## NOTES

Medium to High impact as this function will return the password, albeit hidden from default view


## RELATED LINKS

Fill Related Links Here

