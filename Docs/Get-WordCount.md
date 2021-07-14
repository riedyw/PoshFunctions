---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version: https://www.Google.com
schema: 2.0.0
---

# Get-WordCount

## SYNOPSIS
Gets summary statistics of all the words and how many of each there are

## SYNTAX

```
Get-WordCount [-Path] <String> [[-Exclude] <String>] [<CommonParameters>]
```

## DESCRIPTION
Gets summary statistics of all the words and how many of each there are

## EXAMPLES

### EXAMPLE 1
```
For all the examples assume you have a file called Sample.txt that contains the following:
```

unicorn unicorn unicorn unicorn
cat cat cat
dog dog
fish

Assume further you have another file called Exclude.txt that contains the following:
unicorn

### EXAMPLE 2
```
Get-WordCount -Path .\Sample.txt
```

Name                           Value
----                           -----
unicorn                        4
cat                            3
dog                            2
fish                           1

### EXAMPLE 3
```
Get-WordCount -Path .\sample.txt -Exclude .\Exclude.txt
```

Name                           Value
----                           -----
cat                            3
dog                            2
fish                           1

## PARAMETERS

### -Path
The path of the file

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Exclude
The path to a file containing strings you want excluded from the count

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

## NOTES

## RELATED LINKS
