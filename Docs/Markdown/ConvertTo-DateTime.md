---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# ConvertTo-DateTime

## SYNOPSIS

Converts a formatted date string back into a datetime datatype.

## SYNTAX

### DMTF (Default)

```
ConvertTo-DateTime [-DateString] <String[]> [-DMTF] [-IncludeInput] [-UTC] [<CommonParameters>]
```

### Excel

```
ConvertTo-DateTime [-DateString] <String[]> [-Excel] [-IncludeInput] [-UTC] [<CommonParameters>]
```

### Format

```
ConvertTo-DateTime [-DateString] <String[]> [-Format <String>] [-IncludeInput] [-UTC] [<CommonParameters>]
```

### ISO8601

```
ConvertTo-DateTime [-DateString] <String[]> [-IncludeInput] [-ISO8601] [-UTC] [<CommonParameters>]
```

### ICSDateTime

```
ConvertTo-DateTime [-DateString] <String[]> [-ICSDateTime] [-IncludeInput] [-UTC] [<CommonParameters>]
```

### FileTime

```
ConvertTo-DateTime [-DateString] <String[]> [-FileTime] [-IncludeInput] [-UTC] [<CommonParameters>]
```

### Unix

```
ConvertTo-DateTime [-DateString] <String[]> [-IncludeInput] [-Unix] [-UTC] [<CommonParameters>]
```

## DESCRIPTION

Converts a formatted date string back into a datetime datatype.


## EXAMPLES

### Example 1: EXAMPLE 1

```
ConvertTo-DateTime '20161124225058.082190+060'
```

If you were in the EST timezone this would return the datetime

Thursday, November 24, 2016 4:50:58 PM





### Example 2: EXAMPLE 2

```
ConvertTo-DateTime -DateString 946684799 -Unix -UTC
```

Would return
Friday, December 31, 1999 11:59:59 PM





### Example 3: EXAMPLE 3

```
ConvertTo-DateTime '20161124T225058Z' -ICSDateTime
```

If in the EST timezone this would return
Thursday, November 24, 2016 5:50:58 PM





### Example 4: EXAMPLE 4

```
ConvertTo-DateTime 131619940792563529 -FileTime -UTC
```

Would return
Thursday, February 1, 2018 9:27:59 PM





### Example 5: EXAMPLE 5

```
ConvertTo-DateTime '20-04-01' -Format 'yy-MM-dd'
```

Would return
Wednesday, April 1, 2020 12:00:00 AM





### Example 6: EXAMPLE 6

```
ConvertTo-DateTime -DateString 946684799 -Unix -Verbose
```

Would return
VERBOSE: Starting [ConvertTo-DateTime]
VERBOSE: ParameterSetName [Unix]
VERBOSE: Your local timezone is '(UTC-05:00) Eastern Time (US & Canada)'
VERBOSE: The date '12/31/1999 18:59:59' is 946684799 seconds in the future of '01/01/1970 00:00:00' UTC

Friday, December 31, 1999 6:59:59 PM
VERBOSE: Ending ConvertTo-DateTime





### Example 7: EXAMPLE 7

```
ConvertTo-DateTime -ISO8601 2022.02.01T05:00:00z -IncludeInput
```

ISO8601              DateTime
-------              --------
2022.02.01T05:00:00z 2/1/2022 12:00:00 AM






## PARAMETERS

### -DateString

The date string that you wish to convert back to a datetime.
Alias 'Date'.
 Can be input from the pipeline.

```yaml
Type: String[]
Parameter Sets: Excel, Format, ISO8601, ICSDateTime, FileTime, Unix, DMTF
Aliases: Date
Accepted values: 

Required: True (Excel, Format, ISO8601, ICSDateTime, FileTime, Unix, DMTF) False (None)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -DMTF

A switch parameter to display in DMTF format.
Default parameter set.

DmtfDateTime is of the form 'yyyyMMddHHmmss.ffffff+UUU'

Where
yyyy    is the 4 digit year
MM      is the 2 digit month
dd      is the 2 digit day of the month
HH      is the 2 digit in 24 hour format (00-23, 1 pm = 13)
mm      is the 2 digit minute (00-59)
ss      is the 2 digit second (00-59)
ffffff  is the 6 digit microsecond
+       is a plus or minus to indicate offset from UTC
UUU     is the 3 digit number of minutes offset from UTC (000-720)

```yaml
Type: SwitchParameter
Parameter Sets: DMTF
Aliases: 
Accepted values: 

Required: True (None) False (DMTF)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Excel

Switch to indicate that the datestring is in Excel format which represents dates as the number of days since (get-date 1/1/1900)

```yaml
Type: SwitchParameter
Parameter Sets: Excel
Aliases: 
Accepted values: 

Required: True (None) False (Excel)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -FileTime

Converts a large integer filetime [int64] into a datetime string.
There is a special value that returns a value of 'Never'.

Filetimes are expressed in Ticks.
Ticks can range from 0 - 2650467743999999999.
Translating these into dates you get
            0 = Monday, January 01, 1601 12:00:00.00000 AM
2650467743999999999 = Friday, December 31, 9999 11:59:59.99999 PM

```yaml
Type: SwitchParameter
Parameter Sets: FileTime
Aliases: 
Accepted values: 

Required: True (None) False (FileTime)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Format

See help for Get-Date and the -Format parameter.
This will parse the datestring using the Format as a template.

```yaml
Type: String
Parameter Sets: Format
Aliases: 
Accepted values: 

Required: True (None) False (Format)
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -ICSDateTime

IcsDateTime is of the form 'yyyyMMddTHHmmssZ'

Where
yyyy    is the 4 digit year
MM      is the 2 digit month
dd      is the 2 digit day of the month
HH      is the 2 digit in 24 hour format (00-23, 1 pm = 13)
mm      is the 2 digit minute (00-59)
ss      is the 2 digit second (00-59)
T       is the letter T
Z       is an optional suffix indicating UTC or Zulu time

If the final character is NOT a Z then the time is local time.

```yaml
Type: SwitchParameter
Parameter Sets: ICSDateTime
Aliases: 
Accepted values: 

Required: True (None) False (ICSDateTime)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -IncludeInput

Switch to enable the original datetime to appear in the output.
Aliased to 'IncludeOriginal'

```yaml
Type: SwitchParameter
Parameter Sets: Excel, Format, ISO8601, ICSDateTime, FileTime, Unix, DMTF
Aliases: IncludeOriginal
Accepted values: 

Required: True (None) False (Excel, Format, ISO8601, ICSDateTime, FileTime, Unix, DMTF)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -ISO8601

Switch to convert a datetime to ISO-8601 format: 'yyyy.MM.ddTHH:mm:ss'

```yaml
Type: SwitchParameter
Parameter Sets: ISO8601
Aliases: 
Accepted values: 

Required: True (None) False (ISO8601)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Unix

A switch parameter to convert from a UnixEpoch which is the number of seconds since '1/1/1970 12:00:00 AM UTC'.

```yaml
Type: SwitchParameter
Parameter Sets: Unix
Aliases: 
Accepted values: 

Required: True (None) False (Unix)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -UTC

Switch to force the output to be in the UTC timezone.
Alias of this parameter is 'Zulu'

```yaml
Type: SwitchParameter
Parameter Sets: Excel, Format, ISO8601, ICSDateTime, FileTime, Unix, DMTF
Aliases: Zulu
Accepted values: 

Required: True (None) False (Excel, Format, ISO8601, ICSDateTime, FileTime, Unix, DMTF)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### datetime



## NOTES

Info:       For further information on DMTF time formats see https://docs.microsoft.com/en-us/windows/desktop/wmisdk/cim-datetime

Added Excel functionality


## RELATED LINKS

Fill Related Links Here

