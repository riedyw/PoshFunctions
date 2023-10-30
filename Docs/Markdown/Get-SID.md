---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-SID

## SYNOPSIS

To get the SID of a specified domain user passed as either an (email) or (domain,username)

## SYNTAX

### DomainUser (Default)

```
Get-SID [-Domain <String>] [-IncludeInput] [-Username <String>] [<CommonParameters>]
```

### Email

```
Get-SID [-Email <String>] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

To get the SID of a specified domain user passed as either an (email) or (domain,username)
If no parameters are specified it gets the SID of the user running the cmdlet
Default ParameterSetName DomainUser


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-SID
```

S-1-5-21-1482476501-746137067-839522115-29321





### Example 2: EXAMPLE 2

```
Get-SID -IncludeInput
```

Domain      UserName      SID
------      --------      ---
contosco    administrator S-1-5-21-1482476501-846137067-872522115-500





### Example 3: EXAMPLE 3

```
Get-SID -Email Administrator@Contosco.com -IncludeInput
```

Email                      SID
-----                      ---
administrator@contosco.com S-1-5-21-1482476501-846137067-872522115-500






## PARAMETERS

### -Domain

The domain that you wish to query.
Not mandatory and will default to $env:USERDOMAIN
Part of ParameterSetName DomainUser

```yaml
Type: String
Parameter Sets: DomainUser
Aliases: 
Accepted values: 

Required: True (None) False (DomainUser)
Position: Named
Default value: $env:USERDOMAIN
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Email

The email that you wish to query.
Not mandatory
Part of ParameterSetName Email

```yaml
Type: String
Parameter Sets: Email
Aliases: 
Accepted values: 

Required: True (None) False (Email)
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -IncludeInput

Switch to enable the original input parameters to appear in the output.
Aliased to 'IncludeOriginal'
Is present in both ParameterSetName DomainUser and Email

```yaml
Type: SwitchParameter
Parameter Sets: Email, DomainUser
Aliases: IncludeOriginal
Accepted values: 

Required: True (None) False (Email, DomainUser)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Username

The user that you wish to query.
Not mandatory and will default to $env:USERNAME
Part of ParameterSetName DomainUser

```yaml
Type: String
Parameter Sets: DomainUser
Aliases: 
Accepted values: 

Required: True (None) False (DomainUser)
Position: Named
Default value: $env:USERNAME
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### string



## NOTES

Helpful if you don't have the ActiveDirectory module installed on your system.


## RELATED LINKS

Fill Related Links Here

