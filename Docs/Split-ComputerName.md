---
external help file: MyFunctions-help.xml
Module Name: MyFunctions
online version:
schema: 2.0.0
---

# Split-ComputerName

## SYNOPSIS
To parse from a given computername and split it into the pieces that make it up

## SYNTAX

```
Split-ComputerName [-ComputerName] <String[]> [[-Case] <String>] [<CommonParameters>]
```

## DESCRIPTION
To parse from a given computername the pieces that make it up into the properties ComputerName, Valid, Platform, Location, PIT, HostName

## EXAMPLES

### EXAMPLE 1
```
Split-ComputerName -ComputerName 'LCS10CINDC01'
```

Would return
ComputerName Valid Platform Location PIT HostName
------------ ----- -------- -------- --- --------
LCS10CINDC01  True LCS      10       CIN DC01

### EXAMPLE 2
```
Split-ComputerName -ComputerName 'badname'
```

Would return
ComputerName Valid Platform Location PIT HostName
------------ ----- -------- -------- --- --------
badname      False                       badname

### EXAMPLE 3
```
Split-ComputerName -ComputerName 'LCS10CINDC01' -Case Lower
```

Would return
ComputerName Valid Platform Location PIT HostName
------------ ----- -------- -------- --- --------
LCS10CINDC01  True lcs      10       cin dc01

### EXAMPLE 4
```
"lcs2cindc01","itt2auinhvm01","badname" | Split-ComputerName  -case upper
```

Would return
ComputerName  Valid Platform Location PIT HostName
------------  ----- -------- -------- --- --------
lcs2cindc01    True LCS      2        CIN DC01
itt2auinhvm01  True ITT2     A        UIN HVM01
badname       False                       BADNAME

### EXAMPLE 5
```
Split-ComputerName -Computername 'LCS18cindc01' -case Upper -verbose
```

Would return
VERBOSE: $ValidPlatform=\[((LCS\d\d)|(LCS\d)|(ITT2\[A|B|C\]))\]
VERBOSE: $ValidPlatformName=\[(LCS|ITT2)\]
VERBOSE: $ValidPlatformNumber=\[(\d\d|\d|A|B|C)\]
VERBOSE: $ValidPit=\[(CIN|UIN|CWS|HME|CNS|CCS)\]
VERBOSE: Computers specified are \[LCS18cindc01\]
VERBOSE: $curComputerName=\[LCS18cindc01\]
VERBOSE: $FullRegEx=\[^(LCS|ITT2)(\d\d|\d|A|B|C)(CIN|UIN|CWS|HME|CNS|CCS)\w+$\]
VERBOSE: $HullName=\[LCS\]
VERBOSE: $PlatformNumber=\[18\]
VERBOSE: $PIT=\[cin\]
VERBOSE: $HostName=\[dc01\]
VERBOSE: Converting fields to uppercase

ComputerName Valid Platform Location PIT HostName
------------ ----- -------- -------- --- --------
LCS18cindc01  True LCS      18       CIN DC01

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
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### [psobject]
A custom object containing the following properties:
ComputerName - The name of the computer as originally specified
Valid        - A boolean indicating if it is a valid computername given this script
Platform     - A string being 'LCS', or 'ITT2', or blank if computername is invalid
Location     - A string of numbers if PlatformName = 'LCS', or 'A','B','C' if PlatformName = 'ITT2', or blank if computername invalid
PIT          - A string from the set (CIN, UIN, CWS, HME, CNS, CCS) or '' if undetermined
HostName     - The remaining portion of the string after $PlatformName $PlatformNumber, $PIT

region Parameter

## NOTES
Author:     Bill Riedy
Version:    2.0
Date:       2018/07/06
Comment:    Added field for complete computername after it has been parsed
Version:    1.1
Date:       2018/04/30
Comment:    Changed regular expression to address entry of hostname beginning with mix of LCS and IIT nomenclature (e.g.
'LCS2A' or 'ITT214')
To Do:

## RELATED LINKS
