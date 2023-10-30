---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# ConvertFrom-DateTime

## SYNOPSIS

Converts a datetime into a datetime represented in a different format.

## SYNTAX

### DMTF (Default)

```
ConvertFrom-DateTime [[-Date <DateTime[]>]] [-DMTF] [-IncludeInput] [-UTC] [<CommonParameters>]
```

### Excel

```
ConvertFrom-DateTime [[-Date <DateTime[]>]] [-Excel] [-IncludeInput] [-UTC] [<CommonParameters>]
```

### Format

```
ConvertFrom-DateTime [[-Date <DateTime[]>]] [-Format <String>] [-IncludeInput] [-UTC] [<CommonParameters>]
```

### ISO8601

```
ConvertFrom-DateTime [[-Date <DateTime[]>]] [-IncludeInput] [-ISO8601] [-UTC] [<CommonParameters>]
```

### ICSDateTime

```
ConvertFrom-DateTime [[-Date <DateTime[]>]] [-ICSDateTime] [-IncludeInput] [-UTC] [<CommonParameters>]
```

### FileTime

```
ConvertFrom-DateTime [[-Date <DateTime[]>]] [-FileTime] [-IncludeInput] [-UTC] [<CommonParameters>]
```

### Unix

```
ConvertFrom-DateTime [[-Date <DateTime[]>]] [-IncludeInput] [-Unix] [-UTC] [<CommonParameters>]
```

## DESCRIPTION

Converts a datetime into a datetime represented in a different format.
All datetime output is in local timezone.
If you wish the output to be in UTC timezone include the -UTC parameter.


## EXAMPLES

### Example 1: EXAMPLE 1

```
ConvertFrom-DateTime -DateTime '1/28/1986 11:39' -FileTime -IncludeInput
```

DateTime                        FileTime
--------                        --------
1/28/1986 11:39:00 AM 121517879400000000





### Example 2: EXAMPLE 2

```
ConvertFrom-DateTime -DateTime '1/25/2018 8:34:31 AM' -DMTF -IncludeInput
```

Assuming a timezone of 'Eastern Time' and a culture of 'en-US' this would return the string

20180125083431.000000-300





### Example 3: EXAMPLE 3

```
ConvertFrom-DateTime -DateTime '1/25/2018 8:34:31 AM' -DMTF -IncludeInput
```

Assuming your current timezone is EST then the output would be:
DateTime             DMTF
--------             ----
1/25/2018 8:34:31 AM 20180125083431.000000-300





### Example 4: EXAMPLE 4

```
ConvertFrom-DateTime -DateTime '1/25/2018 8:34:31 AM' -DMTF -UTC
```

Assuming your current timezone is EST then the output would be:
20180125133431.000000+000





### Example 5: EXAMPLE 5

```
'3/15/2018 12:00:00 PM' | ConvertFrom-DateTime -UTC
```

Assuming a timezone of 'Eastern Time' and a culture of 'en-US' this would return the string
20180315160000.000000+000






## PARAMETERS

### -Date

{{ Fill Date Description }}

```yaml
Type: DateTime[]
Parameter Sets: Excel, Format, ISO8601, ICSDateTime, FileTime, Unix, DMTF
Aliases: DateTime
Accepted values: 

Required: True (None) False (Excel, Format, ISO8601, ICSDateTime, FileTime, Unix, DMTF)
Position: 0
Default value: (Get-Date)
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -DMTF

A switch parameter to display in DMTF format.
Default parameter set.

DmtfDateTime is of the form 'yyyymmddHHMMSS.ffffff+UUU'

Where
yyyy    is the 4 digit year
mm      is the 2 digit month
dd      is the 2 digit day of the month
HH      is the 2 digit in 24 hour format (00-23, 1 pm = 13)
MM      is the 2 digit minute (00-59)
SS      is the 2 digit second (00-59)
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

Switch to convert a datetime to a large integer filetime [int64].
There is a special value that returns a value of 'Never'.
Returns a [datetime] in Universal Time (UTC)

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
This duplicates that capability.

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

Switch to convert a datetime to IcsDateTime format is of the form 'yyyymmddTHHMMSSZ'

Where
yyyy    is the 4 digit year
mm      is the 2 digit month
dd      is the 2 digit day of the month
HH      is the 2 digit in 24 hour format (00-23, 1 pm = 13)
MM      is the 2 digit minute (00-59)
SS      is the 2 digit second (00-59)
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

Switch to convert a datetime to a UnixEpoch which is the number of seconds since '1/1/1970 12:00:00 AM UTC'

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

Forces the output to be in the UTC timezone.
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

### string



## NOTES

Info:       For further information on DMTF time formats see https://docs.microsoft.com/en-us/windows/desktop/wmisdk/cim-datetime

Added Excel functionality


## RELATED LINKS

Fill Related Links Here

