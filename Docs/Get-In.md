---
external help file: MyFunctions-help.xml
Module Name: MyFunctions
online version: http://wonkysoftware.appspot.com
schema: 2.0.0
---

# Get-In

## SYNOPSIS
To mimic the behavior of -in and -notin which are not present in Powershell version 2

## SYNTAX

```
Get-In [-ItemToFind] <String> [-ListToSearch] <String[]> [[-In] <Boolean>] [<CommonParameters>]
```

## DESCRIPTION
To mimic the behavior of -in and -notin which are not present in Powershell version 2

## EXAMPLES

### EXAMPLE 1
```
Get-In -ItemToFind "Hello" -ListToSearch @("Hello","Goodbye")
```

Would return:
Hello

### EXAMPLE 2
```
Get-In -ItemToFind "Hello" -ListToSearch @("Hello","Goodbye") -in:$FALSE
```

Would return:
$null

### EXAMPLE 3
```
Get-In -ItemToFind "Hello" -ListToSearch @("Hello","Goodbye") -Verbose
```

Would return:
VERBOSE: Testing if \[Hello\] is found IN the list \[Hello,Goodbye\]
Hello

### EXAMPLE 4
```
#
```

Assuming you have an array $shares which lists all of the shares on the current computer.
You have another array $ignoreshares that lists all of the drive letter shares (c$, d$, etc)
Using a simple check determining the version of Powershell, and if Version 2 run a command.
If version 3 or higher save the command string to a variable $command and then issue invoke-expression $command

if ($PsVersionTable.psversion.major -eq 2) {
    $shares = $shares | where { get-in -ItemToFind ($_.ShareName) -ListToSearch $ignoreshares -in:$false }
} else {
    $Command = '$shares | Where-Object { $_.ShareName -notin $ignoreShares }'
    invoke-expression $Command
}

# Would return the same list whether running on Powershell Version 2 or higher

## PARAMETERS

### -ItemToFind
The string that you are looking for in the list

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

### -ListToSearch
The single string, or array of strings that you are comparing to

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -In
A boolean to indicate whether -in ($true) or -notin ($false)

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: True
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### A [string] if successful, $null if not

## NOTES
Author:     Bill Riedy
Version:    1.0
Date:       2018/03/15
Notes:      None at this time

## RELATED LINKS
