---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# New-PopUp

## SYNOPSIS
New-Popup will display a popup message

## SYNTAX

```
New-PopUp [-Message] <String> [-Title] <String> [[-Time] <Int32>] [[-Buttons] <String>] [[-Icon] <String>]
 [-ShowOnTop] [-AsString] [<CommonParameters>]
```

## DESCRIPTION
The New-Popup command uses the Wscript.Shell PopUp method to display a graphical message
box.
You can customize its appearance of icons and buttons.
By default the user
must click a button to dismiss but you can set a timeout value in seconds to
automatically dismiss the popup.

The command will write the return value of the clicked button to the pipeline:
OK     = 1
Cancel = 2
Abort  = 3
Retry  = 4
Ignore = 5
Yes    = 6
No     = 7

If no button is clicked, the return value is -1.

## EXAMPLES

### EXAMPLE 1
```
new-popup -message "The update script has completed" -title "Finished" -time 5
```

This will display a popup message using the default OK button and default
Information icon.
The popup will automatically dismiss after 5 seconds.

### EXAMPLE 2
```
$answer = new-popup -Message "Please pick" -Title "form" -buttons "OKCancel" -icon "information"
```

If the user clicks "OK" the $answer variable will be equal to 1.
If the user clicks "Cancel" the
$answer variable will be equal to 2.

## PARAMETERS

### -Message
The message you want displayed

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Title
The text to appear in title bar of dialog box

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Time
The time to display the message.
Defaults to 0 (zero) which will keep dialog open until a button is clicked

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Buttons
Valid values for -Buttons include:
"OK"
"OKCancel"
"AbortRetryIgnore"
"YesNo"
"YesNoCancel"
"RetryCancel"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: OK
Accept pipeline input: False
Accept wildcard characters: False
```

### -Icon
Valid values for -Icon include:
"Stop"
"Question"
"Exclamation"
"Information"
"None"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ShowOnTop
Switch which will force the popup window to appear on top of all other windows.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -AsString
Will return a human readable representation of which button was pressed as opposed to an integer value.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
## OUTPUTS

### An integer with the following value depending upon the button pushed.
### Timeout = -1    # Value when timer finishes countdown.
### OK      =  1
### Cancel  =  2
### Abort   =  3
### Retry   =  4
### Ignore  =  5
### Yes     =  6
### No      =  7
## NOTES
Last Updated: 6/17/2018

## RELATED LINKS

[Wscript.Shell]()

