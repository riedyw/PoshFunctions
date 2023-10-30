---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Resolve-FQDN

## SYNOPSIS

Resolves a hostname or IPv4 address to a fully qualified domain name

## SYNTAX

### __AllParameterSets

```
Resolve-FQDN [-ComputerName] <String[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

Resolves a hostname or IPv4 address to a fully qualified domain name


## EXAMPLES

### Example 1: EXAMPLE 1

```
Resolve-FQDN -ComputerName $env:computername
```

Display the FQDN of this computer





### Example 2: EXAMPLE 2

```
Resolve-FQDN -ComputerName '10.28.99.101'
```

Display the FQDN of the computer whose IPv4 address is 10.28.99.101





### Example 3: EXAMPLE 3

```
Resolve-FQDN .
```

Display the FQDN of this computer





### Example 4: EXAMPLE 4

```
'10.28.99.101' | Resolve-FQDN
```

Display the FQDN of the computer whose IPv4 address is 10.28.99.101





### Example 5: EXAMPLE 5

```
$DomainController = (($env:logonserver).Substring(2))
```

Resolve-FQDN $DomainController

Display the FQDN of the Active Directory Domain Controller that you authenticated against when you logged onto Windows.





### Example 6: EXAMPLE 6

```
Resolve-FQDN -ComputerName "NonExistentPC"
```

The computer "NonExistentPC" does not have an entry in DNS so the function will return the value $False






## PARAMETERS

### -ComputerName

Either the hostname or IPv4 address of the computer you want resolved to FQDN.
Aliased to 'CN', 'Host', 'Server'

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: Host,CN,Server
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -IncludeInput

Switch to include the input parameters in the output

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES

Attempting to resolve a FQDN for a system that does not have an entry in DNS will be slow, and will take 1-5 seconds to return a value of $False


## RELATED LINKS

Fill Related Links Here

