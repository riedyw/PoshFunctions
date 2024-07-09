---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Set-AutoRun.inf

## SYNOPSIS

Creates an AutoRun.inf for a drive. Can set icon, label. Either an icon or label must be specified

## SYNTAX

### __AllParameterSets

```
Set-AutoRun.inf [[-Path <String>]] [[-Label <String>]] [[-Icon <String>]] [<CommonParameters>]
```

## DESCRIPTION

Creates an AutoRun.inf for a drive.
Can set icon, label.
Either an icon or label must be specified


## EXAMPLES


## PARAMETERS

### -Icon

A path to an icon file (.ico).
File must exist and it is copied to the root of the Path specified

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 2
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Label

A string up to 32 characters that will represent the label for the drive

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 1
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Path

The path to the drive.
Must begin with a drive letter followed by a colon ':'.
Defaults to $pwd

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: $pwd
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES



## RELATED LINKS

Fill Related Links Here

