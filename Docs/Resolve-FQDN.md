---
external help file: MyFunctions-help.xml
Module Name: MyFunctions
online version:
schema: 2.0.0
---

# Resolve-FQDN

## SYNOPSIS
Resolves a hostname or IPv4 address to a fully qualified domain name

## SYNTAX

```
Resolve-FQDN [-Computer] <String> [<CommonParameters>]
```

## DESCRIPTION
Resolves a hostname or IPv4 address to a fully qualified domain name

## EXAMPLES

### EXAMPLE 1
```
Resolve-FQDN -Computer $env:computername
```

Display the FQDN of this computer

### EXAMPLE 2
```
Resolve-FQDN -Computer "10.28.99.101"
```

Display the FQDN of the computer whose IPv4 address is 10.28.99.101

### EXAMPLE 3
```
Resolve-FQDN .
```

Display the FQDN of this computer

### EXAMPLE 4
```
"10.28.99.101" | Resolve-FQDN
```

Display the FQDN of the computer whose IPv4 address is 10.28.99.101

### EXAMPLE 5
```
$DomainController = (($env:logonserver).Substring(2))
```

Resolve-FQDN $DomainController

Display the FQDN of the Active Directory Domain Controller that you authenticated against when you logged onto Windows.

### EXAMPLE 6
```
Resolve-FQDN -Computer "NonExistentPC"
```

The computer "NonExistentPC" does not have an entry in DNS so the function will return the value $False

## PARAMETERS

### -Computer
Either the hostname or IPv4 address of the computer you want resolved to FQDN

```yaml
Type: String
Parameter Sets: (All)
Aliases: host

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Attempting to resolve a FQDN for a system that does not have an entry in DNS will be slow, and will take 1-5 seconds to return a value of $False

## RELATED LINKS
