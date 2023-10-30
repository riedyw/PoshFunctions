---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Resolve-HostName

## SYNOPSIS

Resolves a hostname to an IPv4 address.

## SYNTAX

### __AllParameterSets

```
Resolve-HostName [-Hostname] <String[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

Specify a hostname as a parameter or pipelined in and it will resolve to an IPv4 address.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Resolve-HostName -Hostname $env:computername
```

# Display the IPv4 address of this computer





### Example 2: EXAMPLE 2

```
Resolve-HostName -Hostname .
```

# Display the IPv4 address of this computer using '.' shorthand.





### Example 3: EXAMPLE 3

```
Resolve-HostName -Hostname "server1"
```

# Display the IPv4 address of "server1"





### Example 4: EXAMPLE 4

```
$DomainController = (($env:logonserver).Substring(2))
```

Resolve-HostName -Hostname $DomainController
# Display the IPv4 address of the Active Directory Domain Controller that
# you authenticated against when you logged onto Windows.





### Example 5: EXAMPLE 5

```
"server2" | Resolve-HostName
```

# Display the IPv4 address of "server2" using the pipeline.





### Example 6: EXAMPLE 6

```
Resolve-HostName -Hostname server1, DOESNOTEXIST -IncludeInput
```

Sample return
Hostname     IPv4
--------     ----
server1      10.100.10.20
doesnotexist False






## PARAMETERS

### -Hostname

The hostname(s) that you want resolved

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: host,ComputerName
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -IncludeInput

Switch that includes the input parameters in the output

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



## RELATED LINKS

Fill Related Links Here

