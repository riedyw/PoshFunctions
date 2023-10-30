---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Expand-Tab

## SYNOPSIS

To expand tab characters to spaces

## SYNTAX

### __AllParameterSets

```
Expand-Tab [[-TabWidth <UInt32>]] [-InputString <String[]>] [<CommonParameters>]
```

## DESCRIPTION

To expand tab characters to spaces.
Default TabWidth is 8


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-Content t1.ps1 | Expand-Tab | Out-File t2.ps1
```

This command will get the contents of the t1.ps1 file, expand each tab to eight
spaces, and save the "de-tabbed" contents in a file named t2.ps1.
If the default
tab width of eight spaces is too wide, you can specify a different tab width.





### Example 2: EXAMPLE 2

```
Get-Content t1.txt | Expand-Tab 2 | Out-File t2.txt
```

To expand tabs at a width of 2 characters.





### Example 3: EXAMPLE 3

```
Expand-Tab -InputString "Hello`tWorld!"
```

Would return
Hello   World!






## PARAMETERS

### -InputString

{{ Fill InputString Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -TabWidth

{{ Fill TabWidth Description }}

```yaml
Type: UInt32
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: 8
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES

Inspired by: https://www.itprotoday.com/powershell/expanding-tabs-spaces-powershell

Changes:
* cleaned up formatting
* added parameter flags
* added cmdletbinding to make advanced function
* added begin and end blocks
* added foreach in process block
* added write-verbose statements

From the blog post:

The tab character has a long history in computing.
 Tabs were introduced in
typewriters, where typists could specify one or more tab stops on the page.
Pressing the Tab key would advance the carriage to the next tab stop.
 In ASCII
code on computers, character 9 is designated as the tab.
 When displaying a tab
character in a teletype-like display (e.g., UNIX terminal, Windows console
program), the computer will advance the cursor to the next column that's a
multiple of eight, where the count starts at column 0.
For example, if the
cursor is in any column from column 0 through column 7, a tab will advance the
cursor to column 8 (which is really the ninth column because the computer is
counting from column 0).

Tab characters are also used in other ways in computers.
 For example, various
database and spreadsheet tools let you output data in tab-separated values (TSV)
format, where tab characters separate the data items in each row.
 In addition,
scripters and programmers have long debated amongst themselves about whether
they should indent code using tabs or spaces.
 Both techniques have their
advantages, but one thing is for sure:  You can't tell whether a file contains
spaces or tab characters using the Cmd.exe Type command, the Windows PowerShell
Get-Content cmdlet, or Notepad because the tabs will appear as spaces.

To prevent confusion, it's often helpful to "de-tab" the contents of a file-that
is, expand the tabs to the correct number of spaces.
 I like to do this for text
files in which the tab characters are used for indenting, such as scripts, XML
files, and HTML files.
 Although the More.com program in Windows can expand tabs
to spaces, I created a native PowerShell function named Expand-Tab to perform
this task so that I could take better advantage of PowerShell's pipeline.

For each line of input it receives, the function uses a regular expression to
output the line with the tab characters replaced by the appropriate number of
spaces.
 You can even specify the number of spaces you want to use for each
indent (8 by default) or 0 if you want to remove the tab characters altogether.
Let's take a look at how this works.

The Expand-Tab function uses a process script block to do something to each line
of input it receives.
 First, the function assigns the variable $line to each
input line (i.e., $_).
 Then, it uses a while loop that repeats until the input
line doesn't contain any tab characters.
 The $i variable contains the position
in the string where the tab character occurs.
 If $i is -1 (i.e., no tab
character), the function uses the break statement to exit from the while loop.

Next, the function checks whether $TabWidth is greater than 0.
If it is, the
function creates a string, $pad, that contains the needed number of spaces using
PowerShell's * operator.
 In PowerShell, string * n means "output string
concatenated n times," so $pad will contain $TabWidth - ($i % $TabWidth) spaces.
If $TabWidth is 0, $pad is set to "" (i.e., an empty string).

Finally, the function uses the -replace operator, which uses a regular
expression to output a copy of $line with the tab characters replaced by $pad
(i.e., the calculated number of spaces).
 Table 1 explains the components of the
regular expression.

Pattern        Meaning

^              Find beginning of string

([^\t]{$i})    Not a tab character, $i times; ( ) = first group (i.e., $1 in the
            replacement string)

\t             A tab character

(.*)           Any character, 0 or more times; ( ) = second group (i.e., $2 in the
            replacement string)

$              Find end of string

`$1            Replace with first group*

$pad           Replace with calculated number of spaces

`$2            Replace with second group*

* The backtick (`) character is needed in the replacement expression to prevent
PowerShell from interpreting $1 or $2 as a variable name.


## RELATED LINKS

Fill Related Links Here

