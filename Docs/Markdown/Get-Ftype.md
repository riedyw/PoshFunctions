---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-Ftype

## SYNOPSIS

Displays file types used in file extension associations

## SYNTAX

### __AllParameterSets

```
Get-Ftype [-AsArray] [<CommonParameters>]
```

## DESCRIPTION

Displays file types used in file extension associations which can only gotten from cmd.exe


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-Ftype
```

Name                           Value
----                           -----
VLC.rec                        "C:\Program Files\VideoLAN\VLC\vlc.exe" --started-from-file "%1"
ChromeHTML                     "C:\Program Files\Google\Chrome\Application\chrome.exe" --single-argument %1

    ...
snip many lines ...

VLC.rmvb                       "C:\Program Files\VideoLAN\VLC\vlc.exe" --started-from-file "%1"





### Example 2: EXAMPLE 2

```
Get-Ftype -AsArray | Where-Object { $_.Name -match '^Word' }
```

Name                         Value
----                         -----
Word.AutoRecovery.8          "C:\Program Files (x86)\Microsoft Office\Root\Office16\WINWORD.EXE" /n "%1" /o "%u"
Word.Backup.8                "C:\Program Files (x86)\Microsoft Office\Root\Office16\WINWORD.EXE" /n "%1" /o "%u"
Word.Document.12             "C:\Program Files (x86)\Microsoft Office\Root\Office16\WINWORD.EXE" /n "%1" /o "%u"
Word.Document.8              "C:\Program Files (x86)\Microsoft Office\Root\Office16\WINWORD.EXE" /n "%1" /o "%u"
Word.DocumentMacroEnabled.12 "C:\Program Files (x86)\Microsoft Office\Root\Office16\WINWORD.EXE" /n "%1" /o "%u"
Word.OpenDocumentText.12     "C:\Program Files (x86)\Microsoft Office\Root\Office16\WINWORD.EXE" /n "%1"
Word.RTF.8                   "C:\Program Files (x86)\Microsoft Office\Root\Office16\WINWORD.EXE" /n "%1" /o "%u"
Word.Template.12             "C:\Program Files (x86)\Microsoft Office\Root\Office16\WINWORD.EXE" /n "%1" /o "%u"
Word.Template.8              "C:\Program Files (x86)\Microsoft Office\Root\Office16\WINWORD.EXE" /n "%1" /o "%u"
Word.TemplateMacroEnabled.12 "C:\Program Files (x86)\Microsoft Office\Root\Office16\WINWORD.EXE" /n "%1" /o "%u"
Word.UriLink.16              C:\Program Files (x86)\Microsoft Office\Root\Office16\protocolhandler.exe "%1"
wordhtmlfile                 "C:\Program Files (x86)\Microsoft Office\Root\Office16\WINWORD.EXE"
wordhtmltemplate             "C:\Program Files (x86)\Microsoft Office\Root\Office16\WINWORD.EXE"
Wordpad.Document.1           "%ProgramFiles%\Windows NT\Accessories\WORDPAD.EXE" "%1"






## PARAMETERS

### -AsArray

Switch to return result as an array of objects as opposed to an ordered dictionary

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


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES



## RELATED LINKS

Fill Related Links Here

