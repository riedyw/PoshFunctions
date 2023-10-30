---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Format-MacAddress

## SYNOPSIS

Function to cleanup a MACAddress string

## SYNTAX

### __AllParameterSets

```
Format-MacAddress [-MacAddress] <String[]> [-Case <String>] [-IncludeOriginal] [-Separator <String>] [-Split <Int32>] [<CommonParameters>]
```

## DESCRIPTION

Function to clean up a MACAddress string and optionally format it with separators


## EXAMPLES

### Example 1: EXAMPLE 1

```
Format-MacAddress -MacAddress 1234567890ab
```

12:34:56:78:90:ab





### Example 2: EXAMPLE 2

```
Format-MacAddress -MacAddress '00:11:22:dD:ee:FF' -Case Upper
```

00:11:22:DD:EE:FF





### Example 3: EXAMPLE 3

```
Format-MacAddress -MacAddress '00:11:22:dD:ee:FF' -Case Lowercase
```

001122ddeeff





### Example 4: EXAMPLE 4

```
Format-MacAddress -MacAddress '00:11:22:dD:ee:FF' -Case Lowercase -Separator '-'
```

00-11-22-dd-ee-ff





### Example 5: EXAMPLE 5

```
Format-MacAddress -MacAddress '00:11:22:dD:ee:FF' -Case Lowercase -Separator '.'
```

00.11.22.dd.ee.ff





### Example 6: EXAMPLE 6

```
Format-MacAddress -Address '00:11:22:dD:ee:FF', '10005a123456' -case Uppercase -Delimiter '-'
```

00-11-22-DD-EE-FF
10-00-5A-12-34-56

Showing how function can take an array of MacAddress using the alias 'Address' and the alias 'Delimiter' for the 'Separator' parameter





### Example 7: EXAMPLE 7

```
'00:11:22:dD:ee:FF', '10005a123456' | Format-MacAddress  -case Lowercase -Separator '.'
```

00.11.22.dd.ee.ff
10.00.5a.12.34.56

Showing how the values for MacAddress can be received from the pipeline





### Example 8: EXAMPLE 8

```
Format-MacAddress '10005a123456' -case Lowercase -Separator ':'
```

10:00:5a:12:34:56

Showing how MacAddress can be unnamed positional parameter





### Example 9: EXAMPLE 9

```
'00:11:22:dD:ee:FF' | Format-MacAddress  -Separator None -Case Ignore
```

001122dDeeFF





### Example 10: EXAMPLE 10

```
'00:11:22:dD:ee:FF', '10005a123456' | Format-MacAddress  -case Lowercase -Separator '.' -Split 4
```

0011.22dd.eeff
1000.5a12.3456





### Example 11: EXAMPLE 11

```
'00:11:22:dD:ee:FF', '10005a123456' | Format-MacAddress  -case Lowercase -Separator '.' -Split 4 -IncludeOriginal
```

OriginalMac       FormattedMac
-----------       ------------
00:11:22:dD:ee:FF 0011.22dd.eeff
10005a123456      1000.5a12.3456





### Example 12: EXAMPLE 12

```
Format-MacAddress -MacAddress (Get-RandomMacAddress) -Separator '.'
```

95.4a.e6.39.05.aa






## PARAMETERS

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
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: Lower
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -IncludeOriginal

{{ Fill IncludeOriginal Description }}

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

### -MacAddress

Specifies the MacAddress.
Either a single string or an array of strings.
Aliased to 'Address'

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: Address
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -Separator

Specifies the separator every X characters.
Aliased to 'Delimiter'.
Validated against set(':', 'None', '.', "-", ' ', 'Space', ';')

```yaml
Type: String
Parameter Sets: (All)
Aliases: Delimiter
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: :
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Split

Specifies how many characters to split the MacAddress on.
Valid values are 2,3,4,6

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: 2
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

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

Fill Related Links Here

