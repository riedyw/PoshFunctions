---
external help file: MyFunctions-help.xml
Module Name: MyFunctions
online version:
schema: 2.0.0
---

# Copy-Object2

## SYNOPSIS
To copy the contents of one object into the pipeline

## SYNTAX

```
Copy-Object2 [-InputObject] <PSObject[]> [<CommonParameters>]
```

## DESCRIPTION
By default Powershell will copy values by reference and when you change the values of one you change the other

## EXAMPLES

### EXAMPLE 1
```
What is broken about setting one variable to the value of another:
```

$hash1 = @{'key1' = 'value1'}
$hash2 = $hash1
$hash1.Add('key2','value2')
$hash2 

Would return
Name Value
---- -----
key2 value2
key1 value1

Instead if we enter the following:
$hash1 = @{'key1' = 'value1'}
$hash2 = Copy-Object2 $hash1
$hash1.Add('key2','value2')
$hash2

Would return
Name Value
---- -----
key1 value1

Which is what we want.

## PARAMETERS

### -InputObject
A string or an array of strings which specify the ComputerName(s) for which you want the names parsed.

```yaml
Type: PSObject[]
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

### The same type of object that was passed to it.

## NOTES
Author:     Bill Riedy
Version:    2.0
Date:       2018/09/13
Comment:    Added logic to properly handle a hashtable.

## RELATED LINKS
