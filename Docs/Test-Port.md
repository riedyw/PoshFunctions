---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# Test-Port

## SYNOPSIS
Tests a Port or a range of ports on a specific ComputerName(s).

## SYNTAX

```
Test-Port [-ComputerName] <String[]> [-Port] <UInt16[]> [-Timeout <Int32>] [-TCP] [-UDP] [<CommonParameters>]
```

## DESCRIPTION
Tests a Port or a range of ports on a specific ComputerName(s).
Creates a custom object with the properties: ComputerName, Protocol, Port, Open, Notes.

## EXAMPLES

### EXAMPLE 1
```
Test-Port -ComputerName 'server' -port 80
```

Checks port 80 on server 'server' to see if it is listening

### EXAMPLE 2
```
'server' | Test-Port -Port 80
```

Checks port 80 on server 'server' to see if it is listening

### EXAMPLE 3
```
Test-Port -ComputerName @("server1","server2") -Port 80
```

Checks port 80 on server1 and server2 to see if it is listening

### EXAMPLE 4
```
@("server1","server2") | Test-Port -Port 80
```

Checks port 80 on server1 and server2 to see if it is listening

### EXAMPLE 5
```
(Get-Content hosts.txt) | Test-Port -Port 80
```

Checks port 80 on servers in host file to see if it is listening

### EXAMPLE 6
```
Test-Port -ComputerName (Get-Content hosts.txt) -Port 80
```

Checks port 80 on servers in host file to see if it is listening

### EXAMPLE 7
```
Test-Port -ComputerName (Get-Content hosts.txt) -Port @(1..59)
```

Checks a range of ports from 1-59 on all servers in the hosts.txt file

## PARAMETERS

### -ComputerName
A single ComputerName or array of ComputerName to test the port connection on.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Port
Port number to test (\[int16\] 0 - 65535), an array can also be passed

```yaml
Type: UInt16[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Timeout
Sets a timeout for TCP or UDP port query.
(In milliseconds, Default is 1000)

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 1000
Accept pipeline input: False
Accept wildcard characters: False
```

### -TCP
Use TCP as the transport protocol

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

### -UDP
Use UDP as the transport protocol

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

### [psobject]
### An array of objects containing the fields:
### ComputerName    A string containing the computer name or ip address that was passed to the function
### Protocol        A string being either 'TCP' or 'UDP'
### Port            An integer in the range 1 - 65535
### Open            A boolean
### Notes           Any notes when attempting to make a connection
## NOTES
# inspired by https://gallery.technet.microsoft.com/scriptcenter/97119ed6-6fb2-446d-98d8-32d823867131

## RELATED LINKS

[about_Properties]()

