---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version: https://gist.github.com/Nora-Ballard/11240204
schema: 2.0.0
---

# Test-CSVFormat

## SYNOPSIS
Verifies the format of CSV file and that each row has the same number of fields as the header row

## SYNTAX

```
Test-CSVFormat [-Path] <String> [[-Delimiter] <String>] [<CommonParameters>]
```

## DESCRIPTION
Verifies the format of CSV file and that each row has the same number of fields as the header row

## EXAMPLES

### EXAMPLE 1
```
Test-IsAdmin
```

Would return the following if the prompt was elevated.
$True

### EXAMPLE 2
```
Test-IsAdmin -Verbose
```

Would return the following if the prompt was elevated.
VERBOSE: You have Administrator rights.
True

## PARAMETERS

### -Path
{{ Fill Path Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Delimiter
{{ Fill Delimiter Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: ,
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Boolean
## NOTES
#source https://blogs.technet.microsoft.com/heyscriptingguy/2015/07/29/use-function-to-determine-elevation-of-powershell-console/
# inspired by above, made some minor modifications like proving more output, making it an advanced function.

## RELATED LINKS
