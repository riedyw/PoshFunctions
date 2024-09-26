---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Copy-Object

## SYNOPSIS

To copy an object to standard output

## SYNTAX

### __AllParameterSets

```
Copy-Object [-InputObject] <PSObject[]> [<CommonParameters>]
```

## DESCRIPTION

To copy an object to standard output.
Any complex data structure (beyond int, datetime, double, etc)
that is assigned to another variable that second variable is actually a pointer to the dataset
already in memory.
What this allows you to do is to get a true copy where you can manipulate the
second variable without affecting the contents of the first variable


## EXAMPLES

### Example 1: EXAMPLE 1

```
# Example of what is WRONG with assigning a variable object to another variable
```

$A = New-Object -TypeName 'psobject' -Property ([ordered] @{ Name = 'server' ; Value = 12 })
$B = $A
$B.Value = 3
$A

Name   Value
----   -----
server     3

# Which is probably not what you want to do.





### Example 2: EXAMPLE 2

```
$A = New-Object -TypeName 'psobject' -Property ([ordered] @{ Name = 'server' ; Value = 12 })
```

$B = Copy-Object -InputObject $A
$B.Value = 3
$A

Name   Value
----   -----
server    12






## PARAMETERS

### -InputObject

The object that you want copied.

```yaml
Type: PSObject[]
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

## OUTPUTS

### psobject



## NOTES



## RELATED LINKS

Fill Related Links Here

