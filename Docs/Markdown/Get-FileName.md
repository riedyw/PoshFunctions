---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-FileName

## SYNOPSIS

Gets a filename through the native OpenFileDialog. Can select a single file or multiple files.

## SYNTAX

### __AllParameterSets

```
Get-FileName [[-Path <String>]] [[-Filter <String>]] [[-Title <String>]] [[-DefaultExt <String>]] [-AddExtension] [-MultiSelect] [<CommonParameters>]
```

## DESCRIPTION

Gets a filename through the native OpenFileDialog.
Can select a single file
or multiple files.
If user clicks 'OK' an [array] is returned, otherwise returns
a $null if the dialog is canceled.


## EXAMPLES

### Example 1: EXAMPLE 1

```
$File = Get-FileName
```

Will present a fileopen dialog box where only a single file can be selected and the fileopen
dialog box will start in the current directory.
Assigns selected file to the 'File' variable.





### Example 2: EXAMPLE 2

```
$File = Get-FileName -MultiSelect -Filter 'Powershell files|*.ps1|All files|*.*'
```

Will present a fileopen dialog box where multiple files can be selected and the fileopen
dialog box will start in the current directory.
There will be a drop down list box in lower right
where the user can select 'Powershell files' or 'All files' and the files listed will change.
Assigns selected file(s) to the 'File' variable.





### Example 3: EXAMPLE 3

```
$File = Get-FileName -MultiSelect -InitialDirectory 'C:\Temp'
```

Will present a fileopen dialog box where multiple files can be selected and the fileopen
dialog box will start in the C:\Temp directory.
Assigns selected file(s) to the 'File' variable.





### Example 4: EXAMPLE 4

```
Get-FileName | get-childitem
```

Pipes selected filename to the get-childitem cmdlet.






## PARAMETERS

### -AddExtension

Switch forcing the adding of an extension

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
Position: 3
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
Position: 1
Default value: All files (*.*)|*.*
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -MultiSelect

Determines if you can select one or multiple files.
Defaults to $false.
Aliased to 'Multi'.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: Multi
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Path

The directory for the OpenFileDialog to start in.
Defaults to $pwd.
Aliased to 'InitialDirectory'.

```yaml
Type: String
Parameter Sets: (All)
Aliases: InitialDirectory
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: $pwd
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Title

String indicating the Title of the dialog box.
Defaults to 'Select a file'

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 2
Default value: Select a file
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None are required, but you can use parameters to control behavior.



## OUTPUTS

### [array]     If user selects file(s) and clicks 'OK'. Will return an array with a .Count
            and each element in the array will be the file(s) selected
$null       If the user clicks 'Cancel'.



## NOTES

Inspiration: Part of the ISEColorThemeCmdlets.ps1 Script by Jeff Pollock
             http://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e
Changes:     Added parameter for MultiSelect of files.
Forced function to always return an array.
Filter is
             now a parameter that can be specified to control behavior.
Changed InitialDirectory to default
             to $pwd and to give an alias of 'Path' which is commonly used parameter name.
             Also changed syntax to Add-Type -AssemblyName to conform with
             Powershell 2+ and to be more "Powershelly".

# Source: https://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e
# get-help about_ISE-Color-Theme-Cmdlets for more information


## RELATED LINKS

Fill Related Links Here

