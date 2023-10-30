---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Test-Password

## SYNOPSIS

To validate credentials and return a boolean

## SYNTAX

### Credential (Default)

```
Test-Password -Credential <PSCredential> -Domain <String> [<CommonParameters>]
```

### SecureString

```
Test-Password -Domain <String> -Password <SecureString> -UserName <String> [<CommonParameters>]
```

## DESCRIPTION

To validate credentials and return a boolean.
Can specify either a credential or username and securestring.
Default ParameterSetName 'Credential'


## EXAMPLES

### Example 1: EXAMPLE 1

```
Test-Password -Domain contosco.com -Credential $GoodCredential
```

$true





### Example 2: EXAMPLE 2

```
Test-Password -Domain contosco.com -Credential $BadCredential
```

$false





### Example 3: EXAMPLE 3

```
Test-Password -UserName $username -Password $goodpassword -Domain contosco
```

True





### Example 4: EXAMPLE 4

```
Test-Password -UserName $username -Password $badpassword -Domain contosco
```

False





### Example 5: EXAMPLE 5

```
Test-Password -Credential $LocalCred -Domain '.'
```

True





### Example 6: EXAMPLE 6

```
Test-Password -UserName $localuser -Password $localpassword -Domain '.'
```

True






## PARAMETERS

### -Credential

Credential ParameterSetName 'Credential'

```yaml
Type: PSCredential
Parameter Sets: Credential
Aliases: 
Accepted values: 

Required: True (Credential) False (None)
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Domain

Where the credential is being checked against.
Either ('.' or $env:computername) or (domainname with or without .com)

```yaml
Type: String
Parameter Sets: Credential, SecureString
Aliases: 
Accepted values: 

Required: True (Credential, SecureString) False (None)
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Password

The password passed as a securestring.
ParameterSetName 'SecureString'

```yaml
Type: SecureString
Parameter Sets: SecureString
Aliases: 
Accepted values: 

Required: True (SecureString) False (None)
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -UserName

The username to check.
ParameterSetName 'SecureString'

```yaml
Type: String
Parameter Sets: SecureString
Aliases: 
Accepted values: 

Required: True (SecureString) False (None)
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

# inspired by https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/validating-user-account-passwords-part-2
# extra code to fix .ValidateCredentials error https://stackoverflow.com/questions/46170531/exception-in-validatecredentials-the-server-cannot-handle-directory-requests#comment95679386_46172068

* added code to allow domain to be specified as '.' aka the local machine
* added parameter set names to allow for either a credential to be passed or a combination username / password (as a securestring)


## RELATED LINKS

Fill Related Links Here

