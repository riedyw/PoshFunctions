---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# New-QRCode

## SYNOPSIS

Creates a file containing a QR code based on the data and specifications provided

## SYNTAX

### __AllParameterSets

```
New-QRCode [-Data] <String> [[-Size <Int32>]] [[-ECC <String>]] [[-Margin <Int32>]] [[-Format <String>]] [[-Path <String>]] [-Force] [-Show] [<CommonParameters>]
```

## DESCRIPTION

Creates a file containing a QR code based on the data and specifications provided


## EXAMPLES

### Example 1: EXAMPLE 1

```
New-QRCode -Data 'https://cnn.com' -Show -Force
```

[INFORMATION] New QR code written to [C:\Users\USER\AppData\Local\Temp\tmpDEB9.png]

    Directory: C:\Users\USER\AppData\Local\Temp

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----         9/19/2024   1:50 PM            416 tmpDEB9.png

A new file will be created and the program associated with .png files will be launched.
If you attempt to photograph
the picture with a smart phone it will prompt if you want to open the URL specified in your default browser.






## PARAMETERS

### -Data

The data to be QR encoded.
Could be plain text, a URL, or the output of any of the New-*Uri functions in this module

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -ECC

Level of Error Correction Code where:
    L = low, ~7% destroyed data may be corrected
    M = middle, ~15% destroyed data may be corrected
    Q = quality, ~25% destroyed data may be corrected
    H = high, ~30% destroyed data may be corrected

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 2
Default value: M
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Force

To force overwriting the file specified in -Path

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

### -Format

Format of the file to be produced.
Options: 'png', 'jpg', 'gif', 'svg'.
Default 'png'

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 4
Default value: png
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Margin

Margin, in pixels before the actual QR code begins.
Range 0-10, default of 4

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 3
Default value: 4
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Path

The path to the file to be created.
Extension of the file with match the format name.
If not specified it will create a temporary file in $env:TEMP
If the file exists and you want it to be overwritten you must specify -Force

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 5
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Show

Calls Invoke-Item and the path of the file created to open it in the associated program

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

### -Size

Size of one of the edges of the picture, in pixels.
Range 50-750, default 200

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 1
Default value: 200
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### System.IO.FileInfo



## NOTES

Inspired by From <https://goqr.me/api/doc/create-qr-code/>

Writes to the information stream the name of the file that is created

This function was rewritten because Google shut down their QR code API web portal


## RELATED LINKS

Fill Related Links Here

