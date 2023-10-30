---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-WordCount

## SYNOPSIS

Gets summary statistics of all the words and how many of each there are

## SYNTAX

### __AllParameterSets

```
Get-WordCount [-Path] <String> [[-Exclude <String>]] [<CommonParameters>]
```

## DESCRIPTION

Gets summary statistics of all the words and how many of each there are


## EXAMPLES

### Example 1: EXAMPLE 1

```
For all the examples assume you have a file called Sample.txt that contains the following:
```

unicorn unicorn unicorn unicorn
cat cat cat
dog dog
fish

Assume further you have another file called Exclude.txt that contains the following:
unicorn





### Example 2: EXAMPLE 2

```
Get-WordCount -Path .\Sample.txt
```

Name                           Value
----                           -----
unicorn                        4
cat                            3
dog                            2
fish                           1





### Example 3: EXAMPLE 3

```
Get-WordCount -Path .\sample.txt -Exclude .\Exclude.txt
```

Name                           Value
----                           -----
cat                            3
dog                            2
fish                           1






## PARAMETERS

### -Exclude

The path to a file containing strings you want excluded from the count

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 1
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Path

The path of the file

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES

Updated logic around keys to the working hash.
If any of the words in the file match PowerShell keywords you'll
get a bunch of error messages.
Workaround stores hash in slightly different manner.


## RELATED LINKS

Fill Related Links Here

