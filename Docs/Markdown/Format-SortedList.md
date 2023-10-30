---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Format-SortedList

## SYNOPSIS

Creates a formatted list with properties sorted alphabetically

## SYNTAX

### __AllParameterSets

```
Format-SortedList [[-InputObject <Object>]] [-Descending] [<CommonParameters>]
```

## DESCRIPTION

Creates a formatted list with properties sorted alphabetically


## EXAMPLES

### Example 1: EXAMPLE 1

```
# Assuming I have one instance of notepad.exe running
```

Get-Process notepad | Format-SortedList

                __NounName : Process
              BasePriority : 8
                   Company : Microsoft Corporation
                 Container :
                       CPU : 0.484375
               Description : Notepad
       EnableRaisingEvents : False
                  ExitCode :
                  ExitTime :
               FileVersion : 10.0.19041.1 (WinBuild.160101.0800)
                    Handle : 73004
               HandleCount : 288
                   Handles : 288
                 HasExited : False
                        Id : 43400
               MachineName : .
                MainModule : System.Diagnostics.ProcessModule (notepad.exe)
          MainWindowHandle : 855828
           MainWindowTitle : Untitled - Notepad
             MaxWorkingSet : 1413120
             MinWorkingSet : 204800
                   Modules : System.Diagnostics.ProcessModuleCollection
                      Name : notepad
  NonpagedSystemMemorySize : 16088
NonpagedSystemMemorySize64 : 16088
                       NPM : 16088
           PagedMemorySize : 5496832
         PagedMemorySize64 : 5496832
     PagedSystemMemorySize : 519096
   PagedSystemMemorySize64 : 519096
                      Path : C:\WINDOWS\system32\notepad.exe
       PeakPagedMemorySize : 5804032
     PeakPagedMemorySize64 : 5804032
     PeakVirtualMemorySize : 185970688
   PeakVirtualMemorySize64 : 2203504193536
            PeakWorkingSet : 17125376
          PeakWorkingSet64 : 17125376
                        PM : 5496832
      PriorityBoostEnabled : True
             PriorityClass : Normal
         PrivateMemorySize : 5496832
       PrivateMemorySize64 : 5496832
   PrivilegedProcessorTime : 00:00:00.3750000
               ProcessName : notepad
         ProcessorAffinity : 255
                   Product : Microsoft(r) Windows(r) Operating System
            ProductVersion : 10.0.19041.1
                Responding : True
                SafeHandle : Microsoft.Win32.SafeHandles.SafeProcessHandle
                 SessionId : 2
                        SI : 2
                      Site :
             StandardError :
             StandardInput :
            StandardOutput :
                 StartInfo : System.Diagnostics.ProcessStartInfo
                 StartTime : 10/9/2020 8:42:37 PM
       SynchronizingObject :
                   Threads : System.Diagnostics.ProcessThreadCollection
        TotalProcessorTime : 00:00:00.4843750
         UserProcessorTime : 00:00:00.1093750
         VirtualMemorySize : 168009728
       VirtualMemorySize64 : 2203486232576
                        VM : 2203486232576
                WorkingSet : 17121280
              WorkingSet64 : 17121280
                        WS : 17121280






## PARAMETERS

### -Descending

Switch to sort the properties in reverse alphabetical order

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

### -InputObject

The object that needs to be output.
Can be specified as a parameter, or accepted via the pipeline

```yaml
Type: Object
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES

Inspired by: https://stackoverflow.com/questions/3281999/format-list-sort-properties-by-name

Modifications:
* changed logic slightly to handle properties that are currently set to $null
* added [cmdletbinding()] and write-verbose statements
* changed write-host statements to write-output
* performed calculations of $logestvalue as a positive number then multiplied by -1 in -f statement so that the property name is right justified
* sorted properties by name as one object could have multiple property types (property, noteproperty, etc) and the resulting set of all properties would not be alphabetical


## RELATED LINKS

Fill Related Links Here

