---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version: https://www.Google.com
schema: 2.0.0
---

# Get-WordList

## SYNOPSIS
Returns a list of over 38,000 words.

## SYNTAX

```
Get-WordList [<CommonParameters>]
```

## DESCRIPTION
Returns a list of over 38,000 words.

## EXAMPLES

### EXAMPLE 1
```
# Desire to get a list the First 2 palindromes
```

Get-WordList | Where-Object { $_ -eq (format-reversestring $_)} | Select-Object -First 2 | Tee-Object -Variable Palindrome

Would return
bib
bob

### EXAMPLE 2
```
# Desire to get the longest word in the wordlist
```

Get-WordList | Select-Object @{Name='Word';Expr={$_}}, @{Name='WordLength';Expr={$_.Length}} | Sort WordLength -Descending | Select-Object -First 1

Word                         WordLength
----                         ----------
antidisestablishmentarianism         28

### EXAMPLE 3
```
# Desire to get a count of words by length
```

Get-WordList | Select-Object @{Name='Word';Expr={$_}}, @{Name='Len';Expr={$_.Length}} | Group-Object Len |
    Select-Object Name, Count | Select-Object @{Name='WordLength';Expr={(\[int\] $_.Name)}}, Count | Sort-Object WordLength

WordLength Count
---------- -----
         2    39
         3   437
         4  1785
         5  3264
         6  4962
         7  6126
         8  6020
         9  5287
        10  4115
        11  2826
        12  1759
        13  1070
        14   507
        15   251
        16    88
        17    53
        18    21
        19     3
        20     2
        21     1
        22     1
        28     1

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### [string[]]
## NOTES
Originally taken from a Linux distribution and original file name was linuxwords
Over 38,000 words appear in the file WordList.txt found in the installation folder of this module.

## RELATED LINKS
