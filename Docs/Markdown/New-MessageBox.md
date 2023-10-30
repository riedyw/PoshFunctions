---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# New-MessageBox

## SYNOPSIS

New-Popup will display a message box. If a timeout is requested it uses Wscript.Shell PopUp method. If a default button is requested it uses the ::Show method from 'Windows.Forms.MessageBox'

## SYNTAX

### Timeout (Default)

```
New-MessageBox -Message <String> -Title <String> [-AsString] [-Buttons <String>] [-Icon <String>] [-ShowOnTop] [-Time <Int32>] [<CommonParameters>]
```

### DefaultButton

```
New-MessageBox -Message <String> -Title <String> [-AsString] [-Buttons <String>] [-DefaultButton <String>] [-Icon <String>] [<CommonParameters>]
```

## DESCRIPTION

The New-Popup command uses the Wscript.Shell PopUp method to display a graphical message
box.
You can customize its appearance of icons and buttons.
By default the user
must click a button to dismiss but you can set a timeout value in seconds to
automatically dismiss the popup.

The command will write the return value of the clicked button to the pipeline:
Timeout = -1
OK      =  1
Cancel  =  2
Abort   =  3
Retry   =  4
Ignore  =  5
Yes     =  6
No      =  7

If no button is clicked, the return value is -1.


## EXAMPLES

### Example 1: EXAMPLE 1

```
new-popup -message "The update script has completed" -title "Finished" -time 5
```

This will display a popup message using the default OK button and default
Information icon.
The popup will automatically dismiss after 5 seconds.





### Example 2: EXAMPLE 2

```
$answer = new-popup -Message "Please pick" -Title "form" -buttons "OKCancel" -icon "information"
```

If the user clicks "OK" the $answer variable will be equal to 1.
If the user clicks "Cancel" the
$answer variable will be equal to 2.





### Example 3: EXAMPLE 3

```
$answer = new-popup -Message "Please pick" -Title "form" -buttons "OKCancel" -icon "information" -AsString
```

If the user clicks "OK" the $answer variable will be equal to 'OK'.
If the user clicks "Cancel" the
$answer variable will be 'Cancel'






## PARAMETERS

### -AsString

Will return a human readable representation of which button was pressed as opposed to an integer value.

```yaml
Type: SwitchParameter
Parameter Sets: Timeout, DefaultButton
Aliases: 
Accepted values: 

Required: True (None) False (Timeout, DefaultButton)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
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
Parameter Sets: Timeout, DefaultButton
Aliases: 
Accepted values: 

Required: True (None) False (Timeout, DefaultButton)
Position: Named
Default value: OK
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -DefaultButton

{{ Fill DefaultButton Description }}

```yaml
Type: String
Parameter Sets: DefaultButton
Aliases: 
Accepted values: 

Required: True (None) False (DefaultButton)
Position: Named
Default value: Button1
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
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
Parameter Sets: Timeout, DefaultButton
Aliases: 
Accepted values: 

Required: True (None) False (Timeout, DefaultButton)
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Message

The message you want displayed

```yaml
Type: String
Parameter Sets: Timeout, DefaultButton
Aliases: 
Accepted values: 

Required: True (Timeout, DefaultButton) False (None)
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -ShowOnTop

Switch which will force the popup window to appear on top of all other windows.

```yaml
Type: SwitchParameter
Parameter Sets: Timeout
Aliases: 
Accepted values: 

Required: True (None) False (Timeout)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Time

The time to display the message.
Defaults to 0 (zero) which will keep dialog open until a button is clicked

```yaml
Type: Int32
Parameter Sets: Timeout
Aliases: 
Accepted values: 

Required: True (None) False (Timeout)
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Title

The text to appear in title bar of dialog box

```yaml
Type: String
Parameter Sets: Timeout, DefaultButton
Aliases: 
Accepted values: 

Required: True (Timeout, DefaultButton) False (None)
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### An integer with the following value depending upon the button pushed.

Timeout = -1    # Value when timer finishes countdown.
OK      =  1
Cancel  =  2
Abort   =  3
Retry   =  4
Ignore  =  5
Yes     =  6
No      =  7



## NOTES



## RELATED LINKS

[Wscript.Shell] ()

