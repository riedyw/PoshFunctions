---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Write-TextMenu

## SYNOPSIS
Creates the logic for a new simple text based menu.
Originally published as script New-TextMenu in the PowerShellGallery

## SYNTAX

```
Write-TextMenu [-Option] <String[]> [[-Title] <String>] [[-VariableName] <String>] [-TestMenu] [-Clipboard]
 [<CommonParameters>]
```

## DESCRIPTION
Creates the logic for a new simple text based menu.
Originally published as script New-TextMenu in the PowerShellGallery

## EXAMPLES

### EXAMPLE 1
```
Write-TextMenu -Title 'Menu Title' -Option 'One', 'Two', 'Three'
```

Creates a 3 option menu.

### EXAMPLE 2
```
Write-TextMenu -Title 'My Menu' -Option 'One' -VariableName 'Choice2'
```

Creates a 1 option menu that looks like:

$Choice2 = ''
while ($Choice2 -ne 'q') {
Write-Host 'My Menu'
Write-Host '======='
Write-Host ' '
Write-Host ' 1 - One'
Write-Host ' Q - Quit'
Write-Host ' '
$Choice2 = Read-Host 'Selection'
switch ($Choice2) {
    q { 'Exit message and code' }
    1 { 'Option 1 code' }
    default { Write-Host 'Please enter a valid selection' }
}
}

### EXAMPLE 3
```
Write-TextMenu -Option 'Uno'
```

Creates a 1 option menu that looks like:

$Choice = ''
while ($Choice -ne 'q') {
Write-Host 'Menu Title'
Write-Host '=========='
Write-Host ' '
Write-Host ' 1 - Uno'
Write-Host ' Q - Quit'
Write-Host ' '
$Choice = Read-Host 'Selection'
switch ($Choice) {
    q { 'Exit message and code' }
    1 { 'Option 1 code' }
    default { Write-Host 'Please enter a valid selection' }
}
}

## PARAMETERS

### -Option
An array of \[string\] indicating the menu options.
If you need to create a menu with a single option enclose the option in @().

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Title
The title of the menu.
Defaults to 'Menu Title'.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: Menu Title
Accept pipeline input: False
Accept wildcard characters: False
```

### -VariableName
The name of the choice variable.
Defaults to 'Choice'.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: Choice
Accept pipeline input: False
Accept wildcard characters: False
```

### -TestMenu
If this switch is enabled then the menu is saved to a temporary file and run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Clipboard
If this switch is enabled then the menu logic is copied to the clipboard.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### [string[]]
## NOTES
* The resulting output is a relatively small string array so the shorthand way of adding
  to an array ( += ) is used.
* Removed extraneous temporary file.
* Cleaned up formatting.
* Only set of parameters so removing ParameterSetName and DefaultParameterSetName

## RELATED LINKS

[about_while
Write-Host
Read-Host
about_switch]()

