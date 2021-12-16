---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version: https://github.com/iRon7/Join-Object
schema: 2.0.0
---

# New-Inputbox

## SYNOPSIS
Display a Visual Basic style inputbox.

## SYNTAX

```
New-Inputbox [[-Prompt] <String>] [[-Title] <String>] [[-Default] <String>] [<CommonParameters>]
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

### EXAMPLE 1
```
$c = New-Inputbox -Prompt 'Enter the Netbios name of a domain computer' -Title "Enter a computername" -Default $env:computername
```

Get-Service -ComputerName $c

## PARAMETERS

### -Prompt
A string that is displayed before the text entry field in dialog box

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: Please enter a value
Accept pipeline input: False
Accept wildcard characters: False
```

### -Title
A string that appears as the title of the dialog box

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: Input
Accept pipeline input: False
Accept wildcard characters: False
```

### -Default
An optional parameter indicating the default value of the text entry field

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### [string]
## NOTES

## RELATED LINKS
