---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Format-MacAddress

## SYNOPSIS
Function to cleanup a MACAddress string

## SYNTAX

```
Format-MacAddress [-MacAddress] <String[]> [-Separator <String>] [-Case <String>] [-Split <Int32>]
 [-IncludeOriginal] [<CommonParameters>]
```

## DESCRIPTION
Function to clean up a MACAddress string and optionally format it with separators

## EXAMPLES

### EXAMPLE 1
```
Format-MacAddress -MacAddress 1234567890ab
```

12:34:56:78:90:ab

### EXAMPLE 2
```
Format-MacAddress -MacAddress '00:11:22:dD:ee:FF' -Case Upper
```

00:11:22:DD:EE:FF

### EXAMPLE 3
```
Format-MacAddress -MacAddress '00:11:22:dD:ee:FF' -Case Lowercase
```

001122ddeeff

### EXAMPLE 4
```
Format-MacAddress -MacAddress '00:11:22:dD:ee:FF' -Case Lowercase -Separator '-'
```

00-11-22-dd-ee-ff

### EXAMPLE 5
```
Format-MacAddress -MacAddress '00:11:22:dD:ee:FF' -Case Lowercase -Separator '.'
```

00.11.22.dd.ee.ff

### EXAMPLE 6
```
Format-MacAddress -Address '00:11:22:dD:ee:FF', '10005a123456' -case Uppercase -Delimiter '-'
```

00-11-22-DD-EE-FF
10-00-5A-12-34-56

Showing how function can take an array of MacAddress using the alias 'Address' and the alias 'Delimiter' for the 'Separator' parameter

### EXAMPLE 7
```
'00:11:22:dD:ee:FF', '10005a123456' | Format-MacAddress  -case Lowercase -Separator '.'
```

00.11.22.dd.ee.ff
10.00.5a.12.34.56

Showing how the values for MacAddress can be received from the pipeline

### EXAMPLE 8
```
Format-MacAddress '10005a123456' -case Lowercase -Separator ':'
```

10:00:5a:12:34:56

Showing how MacAddress can be unnamed positional parameter

### EXAMPLE 9
```
'00:11:22:dD:ee:FF' | Format-MacAddress  -Separator None -Case Ignore
```

001122dDeeFF

### EXAMPLE 10
```
'00:11:22:dD:ee:FF', '10005a123456' | Format-MacAddress  -case Lowercase -Separator '.' -Split 4
```

0011.22dd.eeff
1000.5a12.3456

### EXAMPLE 11
```
'00:11:22:dD:ee:FF', '10005a123456' | Format-MacAddress  -case Lowercase -Separator '.' -Split 4 -IncludeOriginal
```

OriginalMac       FormattedMac
-----------       ------------
00:11:22:dD:ee:FF 0011.22dd.eeff
10005a123456      1000.5a12.3456

### EXAMPLE 12
```
Format-MacAddress -MacAddress (Get-RandomMacAddress) -Separator '.'
```

95.4a.e6.39.05.aa

## PARAMETERS

### -MacAddress
Specifies the MacAddress.
Either a single string or an array of strings.
Aliased to 'Address'

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: Address

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Separator
Specifies the separator every X characters.
Aliased to 'Delimiter'.
Validated against set(':', 'None', '.', "-", ' ', 'Space', ';')

```yaml
Type: String
Parameter Sets: (All)
Aliases: Delimiter

Required: False
Position: Named
Default value: :
Accept pipeline input: False
Accept wildcard characters: False
```

### -Case
Specifies if the output is to be set in a particular case
Upper       Sets to upper case, 'a' becomes 'A'
Uppercase   Sets to upper case, 'a' becomes 'A'
Lower       Sets to lower case, 'A' becomes 'a'
Lowercase   Sets to lower case, 'A' becomes 'a'
Ignore      Does nothing to the case of the letters 'aB', so remains as 'aB'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Lower
Accept pipeline input: False
Accept wildcard characters: False
```

### -Split
Specifies how many characters to split the MacAddress on.
Valid values are 2,3,4,6

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 2
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeOriginal
{{ Fill IncludeOriginal Description }}

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

### System.String
## NOTES
# Inspired and based on Clean-MacAddress.ps1 by
# Francois-Xavier Cat
# www.lazywinadmin.com
# @lazywinadm

Modified:
1.
Changed MacAddress to allow for pipeline input
2.
Changed MacAddress to be a positional parameter
3.
Changed MacAddress to be aliased to 'Address'
4.
Changed MacAddress to accept an array of addresses if need be
5.
Changed Separator to be aliased to 'Delimiter'
6.
Added the space and semicolon to the set of valid separator values
7.
Changed the switches Upper and Lower to be a string parameter Case which accepts as valid input Upper, Uppercase, Lower, Lowercase, Ignore
8.
Added -Split parameter that can split the address every X characters.
Valid values are 2,3,4,6
9.
Added IncludeOriginal switch to be able to compare original with formatted.

## RELATED LINKS
