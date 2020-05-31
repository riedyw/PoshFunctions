---
external help file: MyFunctions-help.xml
Module Name: MyFunctions
online version:
schema: 2.0.0
---

# ConvertTo-UTC

## SYNOPSIS
Converts a datetime from local time to UTC

## SYNTAX

```
ConvertTo-UTC [-DateTime] <DateTime> [<CommonParameters>]
```

## DESCRIPTION
Converts a datetime from local time to UTC

## EXAMPLES

### EXAMPLE 1
```
ConvertTo-UTC -DateTime "1/25/2018 8:34:31 AM"
```

Assuming that your local time zone is EST, and your region/culture is EN-US this would return the string

Thursday, January 25, 2018 1:34:31 PM

### EXAMPLE 2
```
ConvertTo-UTC '2/1/2018 4:27:59 PM'
```

Assuming that your local time zone is EST, and your region/culture is EN-US this would return the string

Thursday, February 01, 2018 9:27:59 PM

### EXAMPLE 3
```
"3/15/2018 12:00:00 PM" | ConvertTo-UTC
```

Assuming that your local time zone is EST, and your region/culture is EN-US this would return the string

Thursday, March 15, 2018 4:00:00 PM

## PARAMETERS

### -DateTime
{{Fill DateTime Description}}

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.DateTime

## NOTES

## RELATED LINKS
