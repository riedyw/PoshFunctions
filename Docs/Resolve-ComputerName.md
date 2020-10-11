---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Resolve-ComputerName

## SYNOPSIS
To parse from a given computername and split it into the pieces that make it up

## SYNTAX

```
Resolve-ComputerName [-ComputerName] <String[]> [[-Case] <String>] [<CommonParameters>]
```

## DESCRIPTION
To parse from a given computername the pieces that make it up into the properties ComputerName, Valid, Hull, PIT, HostName, ParsedCN

## EXAMPLES

### EXAMPLE 1
```
Resolve-ComputerName -ComputerName 'LCS10CINDC01'
```

Would return
ComputerName Valid Hull  PIT HostName ParsedCN
------------ ----- ----  --- -------- --------
LCS10CINDC01  True LCS10 CIN DC01     LCS10CINDC01

### EXAMPLE 2
```
Resolve-ComputerName -ComputerName 'badname'
```

Would return
ComputerName Valid Hull PIT HostName ParsedCN
------------ ----- ---- --- -------- --------
badname      False          badname

### EXAMPLE 3
```
Resolve-ComputerName -ComputerName 'LCS10CINDC01' -Case Lower
```

Would return
ComputerName Valid Hull  PIT HostName ParsedCN
------------ ----- ----  --- -------- --------
LCS10CINDC01  True lcs10 cin dc01     lcs10cindc01

### EXAMPLE 4
```
"lcs2cindc01","itt2auinhvm01","badname" | Resolve-ComputerName  -case upper
```

Would return
ComputerName  Valid Hull  PIT HostName ParsedCN
------------  ----- ----  --- -------- --------
lcs2cindc01    True LCS2  CIN DC01     LCS2CINDC01
itt2auinhvm01  True ITT2A UIN HVM01    ITT2AUINHVM01
badname       False           BADNAME

### EXAMPLE 5
```
Resolve-ComputerName -Computername 'LCS18cindc01' -case Upper -verbose
```

Would return
VERBOSE: $ValidPlatform=\[((LCS\d\d)|(LCS\d)|ITT2A|ITT2B|ITT2C|ITT2|(LDE\d))\]
VERBOSE: $ValidPit=\[(CIN|UIN|CWS|HME|CNS|CCS)\]
VERBOSE: Computers specified are \[LCS18cindc01\]
VERBOSE: $curComputerName=\[LCS18cindc01\]
VERBOSE: $FullRegEx=\[^((LCS\d\d)|(LCS\d)|ITT2A|ITT2B|ITT2C|ITT2|(LDE\d))(CIN|UIN|CWS|HME|CNS|CCS)((\[0-9\]|\[A-Z\])+)$\]
VERBOSE: Converting fields to uppercase

ComputerName Valid Hull  PIT HostName ParsedCN
------------ ----- ----  --- -------- --------
LCS18cindc01  True LCS18 CIN DC01     LCS18CINDC01

## PARAMETERS

### -ComputerName
A string or an array of strings which specify the ComputerName(s) for which you want the names parsed.

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

### -Case
An optional parameter.
'Upper' will convert calculated fields to uppercase.
'Lower' will convert calculated fields to lowercase.
The original specified computername is not altered.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### [psobject]
### A custom object containing the following properties:
### ComputerName - The name of the computer as originally specified
### Valid        - A boolean indicating if it is a valid computername given this script
### Hull         - A string being 'LCS' followed by 1 or 2 digits, or 'ITT2', 'ITT2A', 'ITT2B', 'ITT2C', 'LDE' followed by 1 digit, or blank if computername is invalid
### PIT          - A string from the set (CIN, UIN, CWS, HME, CNS, CCS) or '' if undetermined
### HostName     - The remaining portion of the string after Hull and PIT
### ParsedCN     - The computername with the case rules applied to it or a blank
## NOTES

## RELATED LINKS
