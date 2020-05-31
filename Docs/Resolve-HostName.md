---
external help file: MyFunctions-help.xml
Module Name: MyFunctions
online version:
schema: 2.0.0
---

# Resolve-HostName

## SYNOPSIS
Resolves a hostname to an IPv4 address.

## SYNTAX

```
Resolve-HostName [-Hostname] <String> [<CommonParameters>]
```

## DESCRIPTION
Specify a hostname as a parameter or pipelined in and it will resolve to an IPv4 address.

## EXAMPLES

### EXAMPLE 1
```
Resolve-HostName -Hostname $env:computername
```

# Display the IPv4 address of this computer

### EXAMPLE 2
```
Resolve-HostName -Hostname .
```

# Display the IPv4 address of this computer using '.' shorthand.

### EXAMPLE 3
```
Resolve-HostName -Hostname "server1"
```

# Display the IPv4 address of "server1"

### EXAMPLE 4
```
$DomainController = (($env:logonserver).Substring(2))
```

Resolve-HostName -Hostname $DomainController
# Display the IPv4 address of the Active Directory Domain Controller that
# you authenticated against when you logged onto Windows.

### EXAMPLE 5
```
"server2" | Resolve-HostName
```

# Display the IPv4 address of "server2" using the pipeline.

## PARAMETERS

### -Hostname
The hostname that you want resolved

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

## RELATED LINKS
