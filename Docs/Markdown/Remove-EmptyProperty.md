---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Remove-EmptyProperty

## SYNOPSIS

To take an object and return only non-empty properties

## SYNTAX

### __AllParameterSets

```
Remove-EmptyProperty [-InputObject] <Object> [-AsHashTable] [<CommonParameters>]
```

## DESCRIPTION

To take an object and return only non-empty properties


## EXAMPLES

### Example 1: EXAMPLE 1

```
$A = New-Object -TypeName 'psobject' -Property ([Ordered] @{
```

Name          = 'test'
EmptyProperty = $null
})
$A

Name EmptyProperty
---- -------------
test

Remove-EmptyProperty -InputObject $A

Name
----
test





### Example 2: EXAMPLE 2

```
Remove-EmptyProperty -InputObject $A -AsHashTable
```

Name                           Value
----                           -----
Name                           test






## PARAMETERS

### -AsHashTable

To return a hashtable as opposed to another object

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

### -InputObject

The object that you want empty properties to be removed.
Value from pipeline.

```yaml
Type: Object
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

# from: http://community.idera.com/powershell/powertips/b/tips/posts/listing-properties-with-values-part-3


## RELATED LINKS

Fill Related Links Here

