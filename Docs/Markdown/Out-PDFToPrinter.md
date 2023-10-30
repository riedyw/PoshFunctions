---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Out-PDFToPrinter

## SYNOPSIS

To print a .PDF to the default printer

## SYNTAX

### __AllParameterSets

```
Out-PDFToPrinter [-Path] <String[]> [-KillProcess] [-PrintDelay <Int32>] [<CommonParameters>]
```

## DESCRIPTION

To print a .PDF to the default printer, will use default application to read .PDF files


## EXAMPLES

### Example 1: EXAMPLE 1

```
Out-PDFToPrinter -Path file1.pdf, file2.pdf
```

Will open file1.pdf in default PDF reader, print, wait default delay of 10 seconds, then open file2.pdf in default
PDF reader, print, wait default delay of 10 seconds and finish.





### Example 2: EXAMPLE 2

```
Out-PDFToPrinter -Path file1.pdf, file2.pdf -KillProcess -PrintDelay 15
```

Will open file1.pdf in default PDF reader, print, wait delay of 15 seconds, kill the default PDF reader process,
then open file2.pdf in default PDF reader, print, wait delay of 15 seconds, kill the default PDF reader process, and finish.





### Example 3: EXAMPLE 3

```
Attempt to print two PDF files that do not exist.
```

Out-PDFToPrinter -Path DNE1.pdf, DNE2.pdf -KillProcess -PrintDelay 15 -Verbose

VERBOSE: Starting [Out-PDFToPrinter]
VERBOSE: PrintDelay [15], KillProcess [True]
VERBOSE: Processing [DNE1.pdf]
Out-PDFToPrinter : ERROR: path [DNE1.pdf] does not exist, exit processing.
At line:1 char:1
+ Out-PDFToPrinter -Path DNE1.pdf, DNE2.pdf -KillProcess -PrintDelay 15 - ...
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : NotSpecified: (:) [Write-Error], WriteErrorException
    + FullyQualifiedErrorId : Microsoft.PowerShell.Commands.WriteErrorException,Out-PDFToPrinter

VERBOSE: Ending [Out-PDFToPrinter]






## PARAMETERS

### -KillProcess

Switch to kill the process of the default PDF reader that was started to print the file

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

### -Path

A string or string array of files to print.
Accepts paths from pipeline

```yaml
Type: String[]
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

### -PrintDelay

Integer representing the number of seconds to delay after issuing the command to print the file.
Valid range 10-120.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: 10
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES

Inspired by https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/printing-pdf-files-part-1

Changes
* allow for accepting the -Path from the pipeline
* test for existence of path, if does not exist throw an error
* resolve to list of to use to process the file(s) one at a time
* use get-item to determine if file extension is .pdf
* stops processing when the first error is encountered


## RELATED LINKS

Fill Related Links Here

