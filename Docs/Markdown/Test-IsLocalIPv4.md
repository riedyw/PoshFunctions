---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# Test-IsLocalIPv4

## SYNOPSIS
Tests to determine if a specified IPv4 address is LOCAL or REMOTE (must be sent to default gateway).
Aliased to 'Test-IsLocalIP'

## SYNTAX

```
Test-IsLocalIPv4 [-Target] <IPAddress[]> [-Source] <IPAddress> [-SubnetMask] <IPAddress> [-IncludeInput]
 [<CommonParameters>]
```

## DESCRIPTION
Tests to determine if a specified IPv4 address is LOCAL or REMOTE (must be sent to default gateway)

## EXAMPLES

### EXAMPLE 1
```
Test-IsLocalIPv4 -Source 10.100.10.20 -SubnetMask 255.255.255.0 -Target 10.100.10.30, 10.100.20.40 -IncludeInput
```

Source       Target       SubnetMask    Local
------       ------       ----------    -----
10.100.10.20 10.100.10.30 255.255.255.0  True
10.100.10.20 10.100.20.40 255.255.255.0 False

### EXAMPLE 2
```
Test-IsLocalIPv4 -Source 10.100.10.20 -SubnetMask 255.255.255.0 -Target 10.100.10.30
```

True

### EXAMPLE 3
```
[pscustomobject] @{ Source='10.100.10.20'; Target='10.100.20.30'; SubnetMask='255.255.255.0'} | Test-IsLocalIPv4 -IncludeInput
```

Source       Target       SubnetMask    Local
------       ------       ----------    -----
10.100.10.20 10.100.20.30 255.255.255.0 False

### EXAMPLE 4
```
Test-IsLocalIPv4 -Source 10.100.10.1 -SubnetMask 255.255.0.0 -Target 10.100.20.1,10.101.10.2 -Verbose -IncludeInput
```

VERBOSE: Starting \[Test-IsLocalIPv4\]
VERBOSE: Source = \[10.100.10.1\] SubnetMask = \[255.255.0.0\] SourceNetwork = \[10.100.0.0\]
VERBOSE: Target = \[10.100.20.1\] SubnetMask = \[255.255.0.0\] TargetNetwork = \[10.100.0.0\]

VERBOSE: Target = \[10.101.10.2\] SubnetMask = \[255.255.0.0\] TargetNetwork = \[10.101.0.0\]
VERBOSE: Ending \[Test-IsLocalIPv4\]
Source      Target      SubnetMask  Local
------      ------      ----------  -----
10.100.10.1 10.100.20.1 255.255.0.0  True
10.100.10.1 10.101.10.2 255.255.0.0 False

## PARAMETERS

### -Target
The target IPv4 address(es) \[ipaddress\[\]\].
Can take values from the pipeline.
Can take property values by name from the pipeline.

```yaml
Type: IPAddress[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Source
The source IPv4 address \[ipaddress\].
Can take property values by name from the pipeline.

```yaml
Type: IPAddress
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -SubnetMask
The subnet mask in IPv4 address format \[ipaddress\].
Can take property values by name from the pipeline.

```yaml
Type: IPAddress
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -IncludeInput
{{ Fill IncludeInput Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

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

## NOTES

## RELATED LINKS
