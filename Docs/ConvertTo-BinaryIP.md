---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# ConvertTo-BinaryIP

## SYNOPSIS
Converts a Decimal IP address into a binary format.

## SYNTAX

## DESCRIPTION
ConvertTo-BinaryIP uses System.Convert to switch between decimal and binary format.
The output from this function is dotted binary string.

## EXAMPLES

### EXAMPLE 1
```
ConvertTo-BinaryIPv4 -IPAddress 24.3.1.1
```

Would return
00011000.00000011.00000001.00000001

### EXAMPLE 2
```
ConvertTo-BinaryIPv4 -IPAddress 10.1.1.1,192.168.1.1  -verbose -IncludeOriginal
```

Would return
VERBOSE: IPv4Address entered \[10.1.1.1,192.168.1.1\]
VERBOSE: You selected to include original value in output
VERBOSE: Processing \[10.1.1.1\]
VERBOSE: Binary representation \[00001010.00000001.00000001.00000001\]

VERBOSE: Processing \[192.168.1.1\]
VERBOSE: Binary representation \[11000000.10101000.00000001.00000001\]
IPv4        Binary
----        ------
10.1.1.1    00001010.00000001.00000001.00000001
192.168.1.1 11000000.10101000.00000001.00000001

### EXAMPLE 3
```
"10.1.1.1","192.168.1.1" | ConvertTo-BinaryIPv4
```

Would return
00001010.00000001.00000001.00000001
11000000.10101000.00000001.00000001

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### An IPv4Address or array of IPV4Address'es
## OUTPUTS

### [pscustomboject]
### [string]
## NOTES

## RELATED LINKS

[[System.Net.IPAddress]]()

