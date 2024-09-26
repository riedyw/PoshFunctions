---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-RelativePath

## SYNOPSIS

Get a relative path to a specified list of paths relative to a specified path

## SYNTAX

### __AllParameterSets

```
Get-RelativePath [-FullName] <String[]> [[-RelativeTo <String>]] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

Get a relative path to a specified list of paths relative to a specified path


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-RelativePath -FullName c:\temp\*.css -RelativeTo c:\temp -IncludeInput
```

The folder c:\temp has 2 *.css files in that folder, bluetable.css and stylesheet.css
The function would return:

Path                   RelativeTo  Relative
----                   ----------  --------
C:\temp\bluetable.css  C:\temp     .\bluetable.css
C:\temp\stylesheet.css C:\temp     .\stylesheet.css





### Example 2: EXAMPLE 2

```
Get-RelativePath -FullName c:\temp\*.css -RelativeTo c:\DNE
```

The path c:\DNE does not exist.
The function would return:

Get-RelativePath : RelativeTo [c:\DNE] does not seem to be a valid path
At line:1 char:1
+ Get-RelativePath -FullName c:\temp\*.css -RelativeTo c:\DNE
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : NotSpecified: (:) [Write-Error], WriteErrorException
    + FullyQualifiedErrorId : Microsoft.PowerShell.Commands.WriteErrorException,Get-RelativePath






## PARAMETERS

### -FullName

An array of fullname paths to files or folders.
Value can come by the pipeline either by value or by property name.
Aliased to 'Path'.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: Path
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -IncludeInput

Switch to include both a path to the original file(s) and their associated relative values

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

### -RelativeTo

The reference path that you want to compare FullName to

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 1
Default value: $pwd
Accept pipeline input: False
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

