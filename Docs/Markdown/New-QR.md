---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# New-QR

## SYNOPSIS

Create New Quick Response Code

## SYNTAX

### __AllParameterSets

```
New-QR [-Message] <String> [[-Path <String>]] [-CHS <String>] [-Confirm] [-ECL <String>] [-Enc <String>] [-Margin <Int32>] [-Size <String>] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION

Create New Quick Response Code

Function uses Google API so script requires internet access.
Script will compose QR request and then download generated image.

New-QR returns the properties of the new QR code created.


## EXAMPLES

### Example 1: EXAMPLE 1

```
New-QR http://painterinfo.com
```

Description
-----------
Creates a new QR code (URL)
Path to QR code image is returned by script





### Example 2: EXAMPLE 2

```
New-QR -Message "This is a test" -Size C -CHS 200x200
```

Description
-----------
Creates a new QR code (TEXT)
Custom image size 200x200 is created.
Path to QR code is returned by script





### Example 3: EXAMPLE 3

```
ii (New-QR -message TEL:0754419999 -Size L -ECL H).fullname
```

Description
-----------
Creates a new QR code (Phone Number) and is opened with default image viewer.
-Size L (image size is 300x300 pixels)
-ECL H (30% of image is redundant)





### Example 4: EXAMPLE 4

```
Import-Csv "C:\QR\users.csv" | New-QR -S L
```

Description
-----------
Using the following CSV, multiple 300x300 QR Codes are generated.

"Message","FileName"
"TEL:0416123456","C:\QR\Matt.png"
"TEL:0417123456","C:\QR\John.png"
"TEL:0418123456","C:\QR\Ruth.png"
"TEL:0419123456","C:\QR\Fred.png"






## PARAMETERS

### -CHS

This is the custom size of the image in pixels e.g.
150x150
This parameter is only read when -Size C parameter is specified.
(Otherwise ignored)
Min = 50x50 [approximate] Large QR codes may need to be physically larger to fit the data.
Max = 547x547

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: 150x150
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Confirm

{{ Fill Confirm Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -ECL

Error Correction Level

L - [Default] Allows recovery of up to 7% data loss
M - Allows recovery of up to 15% data loss
Q - Allows recovery of up to 25% data loss
H - Allows recovery of up to 30% data loss

Use L for maximum storage capacity in QR code
Use H if you think the QR code might get damaged or if you want to embed plain text or logo after.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: L
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Enc

Allowed encoding types are:
UTF-8, Shift_JIS, ISO-8859-1
UTF-8 is default and recommended type

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: UTF-8
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Margin

Defaults to 4 and it is recommended to leave it at that.
A white space margin of 4 is required for reliable QR code reading.
Valid Values are 1..4

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: 4
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Message

Message to be encoded in QR code.
Script will check the message length to ensure it does not exceed the max allowed size
Purely numeric content allows for a larger storage capacity in code.

Message Examples
"TEL:0416123456" (Will call my cell phone)
"SMSTO:0416123456:Hi Matt,`nI am at your desk." (An SMS to me.
Note the new line character)
"http://painterinfo.com" (Open this website)
"This is the Pishkin Building" (A plain text message encoded in the QR Code)

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -Path

File name of QR code to be created.
Aliased to 'FileName' for backward compatibility.
Can specify fullpath, please use .PNG file extension.
If specifying fullpath ensure directory structure exists.

```yaml
Type: String
Parameter Sets: (All)
Aliases: FileName
Accepted values: 

Required: True (None) False (All)
Position: 1
Default value: "$env:temp\QR.png"
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -Size

The QR code's physical size in pixels, not to be confused with the data storage size.
Function caters for several pre-set sizes and a custom size option
S - 75x75
M - 150x150 [default]
L - 300x300
X - 547x547 - This appears to be the maximum size that the API can produce.
C - Custom size to be used - Warning too small will result QR code generation failure.
    If too large a value is specified then the 150x150 default will be generated instead.
    Use -CHS parameter in conjunction with -Size C or Custom size will default to 150x150

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: M
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -WhatIf

{{ Fill WhatIf Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### psObject
(FileName,Message)



## OUTPUTS

### psObject
(FullName,ErrorCorrrection,Margin,Dimensions,DataSize)



## NOTES

NAME:      New-QR
PURPOSE:   Generate QR codes with PowerShell
VERSION:   1.0
AUTHOR:    Matthew Painter
LASTEDIT:  06/August/2011

# Source https://gallery.technet.microsoft.com/scriptcenter/f615d7e8-ed15-498d-b7cc-078377f523bf

Changes
* renamed FileName to Path to be more in line with other Powershell commands.
Aliased to 'FileName' for backward compatibility
* reordered parameters by position, also reordered .PARAMETER entries in comment help to match order in parameter section


## RELATED LINKS

[] (http://code.google.com/apis/chart/infographics/docs/qr_codes.html)

