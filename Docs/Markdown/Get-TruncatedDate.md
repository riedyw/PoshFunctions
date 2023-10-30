---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-TruncatedDate

## SYNOPSIS

To truncate a date at a given level

## SYNTAX

### __AllParameterSets

```
Get-TruncatedDate [[-Date <DateTime[]>]] [-IncludeInput] [-WhereToTruncate <String>] [<CommonParameters>]
```

## DESCRIPTION

To truncate a date at a given level


## EXAMPLES

### Example 1: EXAMPLE 1

```
All of the following examples will be looking to truncate $testdate. Here is how $testdate
```

is originally set.

$prop = ([ordered] @{
    Year = 2020
    Month = 3
    Day = 15
    Hour = 11
    Minute = 39
    Second = 43
    Millisecond = 780
})
$testdate = get-date @prop





### Example 2: EXAMPLE 2

```
Example of truncating at Millisecond and including original date in output
```

Get-TruncatedDate -Date $testdate -WhereToTruncate Millisecond -IncludeInput

Original                Where       Truncated
--------                -----       ---------
2020/03/15 11:39:43.780 MilliSecond 2020/03/15 11:39:43.000





### Example 3: EXAMPLE 3

```
Example of truncating at Second
```

Get-TruncatedDate -Date $testdate -WhereToTruncate Second

Sunday, March 15, 2020 11:39:00 AM





### Example 4: EXAMPLE 4

```
Example of truncating at Minute
```

Get-TruncatedDate -Date $testdate -WhereToTruncate Minute

Sunday, March 15, 2020 11:00:00 AM





### Example 5: EXAMPLE 5

```
Example of truncating at Hour
```

Get-TruncatedDate -Date $testdate -WhereToTruncate Hour

Sunday, March 15, 2020 12:00:00 AM





### Example 6: EXAMPLE 6

```
Example of truncating at Day
```

Get-TruncatedDate -Date $testdate -WhereToTruncate Day

Sunday, March 1, 2020 12:00:00 AM





### Example 7: EXAMPLE 7

```
Example of truncating at Month
```

Get-TruncatedDate -Date $testdate -WhereToTruncate Month

Wednesday, January 1, 2020 12:00:00 AM






## PARAMETERS

### -Date

The date that you wish to truncate.

```yaml
Type: DateTime[]
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: $(Get-Date)
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -IncludeInput

A switch determining if you wish to see the original date in the output, aliased to 'IncludeOriginal'

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: IncludeOriginal
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -WhereToTruncate

A string containing where in the date you wish to truncate.
Has a ValidateSet
against it of: 'Millisecond', 'Second', 'Minute', 'Hour', 'Day', 'Month'

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: Hour
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES

# source   # https://www.reddit.com/r/usefulscripts/comments/9ghdzo/powershell_setdatetruncate_is_that_dumb_function/


## RELATED LINKS

Fill Related Links Here

