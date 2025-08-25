---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# New-MailToUri

## SYNOPSIS
Creates appropriately formatted text for a MailTo URI that can be embedded in a QR code

## SYNTAX

```
New-MailToUri [-To] <String[]> [-Subject <String>] [-Body <String[]>] [-CC <String[]>] [-BCC <String[]>]
 [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Creates appropriately formatted text for a MailTo URI that can be embedded in a QR code.
If a QR code is created
a mail message will be composed with the appropriate information, but it will NOT be sent

## EXAMPLES

### EXAMPLE 1
```
New-MailToUri -To webmaster@google.com -Subject 'Bad search' -Body 'My search did not return desired results'
```

MAILTO:webmaster@google.com?subject=Bad%20search&body=My%20search%20did%20not%20return%20desired%20results&

### EXAMPLE 2
```
New-MailToUri -To webmaster@google.com -Subject 'Hello'
```

MAILTO:webmaster@google.com?subject=Hello&&

### EXAMPLE 3
```
New-MailToUri -To webmaster@google.com -Subject 'Hello' -IncludeInput
```

To      : webmaster@google.com
Subject : Hello
Body    :
CC      :
BCC     :
URI     : MAILTO:webmaster@google.com?subject=Hello&&

## PARAMETERS

### -To
Mandatory recipient of the email

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

### -Subject
The subject of the mail.
This value will be HTML encoded in the output.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Body
The body of the mail, can be a string or an array of strings.
This value will be HTML encoded in the output.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CC
The person(s) copied on the mail

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BCC
The person(s) blind copied on the mail

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeInput
{{ Fill IncludeInput Description }}

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

## NOTES
Inspired by https://stackoverflow.com/questions/16822371/generating-an-email-with-a-qr-code

## RELATED LINKS

[New-QRCode]()

