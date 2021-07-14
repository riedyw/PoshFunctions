---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version: https://social.msdn.microsoft.com/Forums/vstudio/en-US/0221d962-26e6-4a7e-be7a-72cd669a0dfc/why-systemmathround0251-2?forum=vbgeneral

Talks about Visual Basic but the same info applies to Powershell.
schema: 2.0.0
---

# Get-SID

## SYNOPSIS
To get the SID of a specified domain user passed as either an (email) or (domain,username)

## SYNTAX

### DomainUser (Default)
```
Get-SID [-Domain <String>] [-Username <String>] [-IncludeInput] [<CommonParameters>]
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

### EXAMPLE 1
```
Get-SID
```

S-1-5-21-1482476501-746137067-839522115-29321

### EXAMPLE 2
```
Get-SID -IncludeInput
```

Domain      UserName      SID
------      --------      ---
contosco    administrator S-1-5-21-1482476501-846137067-872522115-500

### EXAMPLE 3
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

Required: False
Position: Named
Default value: $env:USERDOMAIN
Accept pipeline input: False
Accept wildcard characters: False
```

### -Username
The user that you wish to query.
Not mandatory and will default to $env:USERNAME
Part of ParameterSetName DomainUser

```yaml
Type: String
Parameter Sets: DomainUser
Aliases:

Required: False
Position: Named
Default value: $env:USERNAME
Accept pipeline input: False
Accept wildcard characters: False
```

### -Email
The email that you wish to query.
Not mandatory
Part of ParameterSetName Email

```yaml
Type: String
Parameter Sets: Email
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeInput
Switch to enable the original input parameters to appear in the output.
Aliased to 'IncludeOriginal'
Is present in both ParameterSetName DomainUser and Email

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: IncludeOriginal

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

### string
## NOTES
Helpful if you don't have the ActiveDirectory module installed on your system.

## RELATED LINKS
