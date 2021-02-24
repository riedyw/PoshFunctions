function Format-SortedList {
<#
.SYNOPSIS
    Creates a formatted list with properties sorted alphabetically
.DESCRIPTION
    Creates a formatted list with properties sorted alphabetically
.PARAMETER InputObject
    The object that needs to be output. Can be specified as a parameter, or accepted via the pipeline
.PARAMETER Descending
    Switch to sort the properties in reverse alphabetical order
.NOTES
    Inspired by: https://stackoverflow.com/questions/3281999/format-list-sort-properties-by-name

    Modifications:
    * changed logic slightly to handle properties that are currently set to $null
    * added [cmdletbinding()] and write-verbose statements
    * changed write-host statements to write-output
    * performed calculations of $logestvalue as a positive number then multiplied by -1 in -f statement so that the property name is right justified
    * sorted properties by name as one object could have multiple property types (property, noteproperty, etc) and the resulting set of all properties would not be alphabetical
.EXAMPLE
    # Assuming I have one instance of notepad.exe running

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
#>

    [cmdletbinding()]
    param (
        [Parameter(ValueFromPipeline)]
        [Object] $InputObject,

        [Switch] $Descending
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        $properties = $InputObject | Get-Member -MemberType Properties | Sort-Object -Property Name
        Write-Verbose -Message "Properties are [$($properties.name -join ', ')]"

        if ($Descending) {
            $properties = $properties | Sort-Object -Property Name -Descending
        }

        $longestName = 0
        $longestValue = 0

        $properties | ForEach-Object {
            Write-Verbose -Message "Working on [$($_.tostring())]"
            if ($_.Name.Length -gt $longestName) {
                $longestName = $_.Name.Length
            }

            if (($InputObject."$($_.Name)".Length) -gt $longestValue) {
                $longestValue = $InputObject."$($_.Name)".Length
            }
        }
        Write-Verbose -Message "Longest name is [$LongestName], Longest value is [$longestValue]"

        $properties | ForEach-Object {
            if ( ($null -eq $InputObject."$($_.Name)") -or ('' -eq $InputObject."$($_.Name)")  ) {
                Write-Output -InputObject ("{0,$longestName} : {1,$($longestValue*-1)}" -f $_.Name, '')
            } else {
                Write-Output -InputObject ("{0,$longestName} : {1,$($longestValue*-1)}" -f $_.Name, $InputObject."$($_.Name)".ToString())
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
