---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# New-Inputbox

## SYNOPSIS

Display a Visual Basic style inputbox.

## SYNTAX

### __AllParameterSets

```
New-Inputbox [[-Prompt <String>]] [[-Title <String>]] [[-Default <String>]] [<CommonParameters>]
```

## DESCRIPTION

This function will display a graphical Inputbox, like the one from VisualBasic
and VBScript.
You must specify a message prompt.
You can specify a title, the
default is "Input".
You can also specify a default value.
The inputbox will write
whatever is entered into it to the pipeline.
If you click Cancel the inputbox
will still write a string to the pipeline with a length of 0.
It is recommended
that you validate input.


## EXAMPLES

### Example 1: EXAMPLE 1

```
$c = New-Inputbox -Prompt 'Enter the Netbios name of a domain computer' -Title "Enter a computername" -Default $env:computername
```

Get-Service -ComputerName $c






## PARAMETERS

### -Default

An optional parameter indicating the default value of the text entry field

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 2
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Prompt

A string that is displayed before the text entry field in dialog box

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: Please enter a value
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Title

A string that appears as the title of the dialog box

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 1
Default value: Input
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### [string]



## NOTES



## RELATED LINKS

Fill Related Links Here

