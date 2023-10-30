---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Start-RecordSession

## SYNOPSIS

Creates a transcript of current Powershell session

## SYNTAX

### __AllParameterSets

```
Start-RecordSession [<CommonParameters>]
```

## DESCRIPTION

Creates a transcript of current Powershell session


## EXAMPLES


## PARAMETERS


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES

# Inspired by post https://groups.google.com/forum/#!topic/microsoft.public.exchange.admin/0z7249mOuzA
# create a uniqely named transcript file for this session.
It will have format of:
# PS-date-pid.LOG
# where
# date is in YYYYMMDD format
# pid is the process id of the currently running powershell console.
# creates it in the LOGS directory under persons userprofile directory.
# sets global and environment variables so Stop-RecordSession can know the name of the transcript file


## RELATED LINKS

Fill Related Links Here

