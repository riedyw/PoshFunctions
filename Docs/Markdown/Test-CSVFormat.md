---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Test-CSVFormat

## SYNOPSIS

Verifies the format of CSV file and that each row has the same number of fields as the header row

## SYNTAX

### __AllParameterSets

```
Test-CSVFormat [-Path] <String> [[-Delimiter <String>]] [<CommonParameters>]
```

## DESCRIPTION

Verifies the format of CSV file and that each row has the same number of fields as the header row


## EXAMPLES

### Example 1: EXAMPLE 1

```
Test-IsAdmin
```

Would return the following if the prompt was elevated.
$True





### Example 2: EXAMPLE 2

```
Test-IsAdmin -Verbose
```

Would return the following if the prompt was elevated.
VERBOSE: You have Administrator rights.
True






## PARAMETERS

### -Delimiter

{{ Fill Delimiter Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 1
Default value: ,
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Path

{{ Fill Path Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### System.Boolean



## NOTES

#source https://blogs.technet.microsoft.com/heyscriptingguy/2015/07/29/use-function-to-determine-elevation-of-powershell-console/
# inspired by above, made some minor modifications like proving more output, making it an advanced function.


## RELATED LINKS

Fill Related Links Here

