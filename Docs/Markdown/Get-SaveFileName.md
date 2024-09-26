---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-SaveFileName

## SYNOPSIS

Gets a filename through the native SaveFileDialog.

## SYNTAX

### __AllParameterSets

```
Get-SaveFileName [[-Path <String>]] [[-OverwritePrompt <Boolean>]] [[-Filter <String>]] [[-Title <String>]] [[-DefaultExt <String>]] [-AddExtension] [<CommonParameters>]
```

## DESCRIPTION

Gets a filename through the native SaveFileDialog.
Can select a single file, or type a
file name in the text entry field.
If user clicks 'OK' an [array] is returned, otherwise returns a $null if the dialog is canceled.


## EXAMPLES

### Example 1: EXAMPLE 1

```
$File = Get-SaveFileName
```

Will present a savefile dialog box where only a single file can be selected and the savefile
dialog box will start in the current directory.
Assigns selected file to the 'File' variable.





### Example 2: EXAMPLE 2

```
$File = Get-SaveFileName -Filter 'Powershell files|*.ps1|All files|*.*'
```

Will present a savefile dialog box and will start in the current directory.
There will be a drop down list box in lower right
where the user can select 'Powershell files' or 'All files' and the files listed will change.
Assigns selected file(s) to the 'File' variable.





### Example 3: EXAMPLE 3

```
$File = Get-SaveFileName -Path 'C:\Temp'
```

Will present a savefile dialog box where a file can be selected and the savefile
dialog box will start in the C:\Temp directory.
Assigns selected file(s) to the 'File' variable.





### Example 4: EXAMPLE 4

```
Get-SaveFileName | get-childitem
```

Pipes selected filename to the get-childitem cmdlet.





### Example 5: EXAMPLE 5

```
$File = Get-SaveFileName -OverwritePrompt:$false
```

Will present a savefile dialog box where a file can be selected and the savefile
dialog box will start in the current directory.
If you select an existing file it
not prompt that the file will be overwritten.
Assigns selected file(s) to the 'File' variable.






## PARAMETERS

### -AddExtension

{{ Fill AddExtension Description }}

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

### -DefaultExt

{{ Fill DefaultExt Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 4
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Filter

A character string delimited with pipe '|' character.
Each 'token' in the string follows the form
'Description|FileSpec'.
Multiple 'tokens' can be in the string and they too are separated
by the pipe character.
Defaults to 'All files|*.*'.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 2
Default value: All files|*.*
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -OverwritePrompt

Determines whether dialog box will warn if you select an already existing file.
Defaults to $true.
Aliased to 'Overwrite'.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases: Overwrite
Accepted values: 

Required: True (None) False (All)
Position: 1
Default value: True
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Path

The directory for the SaveFileDialog to start in.
Defaults to $pwd.
Aliased to 'InitialDirectory'
Aliased to 'Path'.

```yaml
Type: String
Parameter Sets: (All)
Aliases: InitialDirectory
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: "$pwd"
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Title

default

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 3
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None are required, but you can use parameters to control behavior.



## OUTPUTS

### [array]     If user selects a file, or enters a new filename in the text entry box
            and clicks 'OK'. Will return an array with a .Count property.
            Each element in the array will be the file selected or entered.
$null       If the user clicks 'Cancel'.



## NOTES

Inspiration: Part of the ISEColorThemeCmdlets.ps1 Script by Jeff Pollock
             http://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e
Changes:     Added parameter for OverwritePrompt for files selected.
Forced function
             to always return an array.
Filter is now a parameter that can be specified
             to control behavior.
Changed Path to default to $pwd and to give
             an alias of 'Path' which is commonly used parameter name.
             Also changed syntax to Add-Type -AssemblyName to conform with
             Powershell 2+ and to be more "Powershelly".
# Source: https://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e
# get-help about_ISE-Color-Theme-Cmdlets for more information


## RELATED LINKS

Fill Related Links Here

