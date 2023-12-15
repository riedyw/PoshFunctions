# PoshFunctions.psm1
# Author: Bill Riedy

Add-Type -AssemblyName Microsoft.VisualBasic
Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Web

$Script:ModulePath = Split-Path -Parent -Path $MyInvocation.MyCommand.Path

$Script:FunctionsPath = Join-Path -Path $Script:ModulePath -ChildPath 'Functions'
$Functions = Get-ChildItem -Path $Script:FunctionsPath -Filter *.ps1
$Functions | ForEach-Object { . $_.FullName }

$Script:WordList = Get-Content -Path $PSScriptRoot\Resources\WordList.txt -ReadCount 0
$Script:WordListFull = Get-Content -Path $PSScriptRoot\Resources\words_alpha.txt -ReadCount 0
$Script:FortuneFile = Join-Path -Path $ModulePath -ChildPath 'Resources\Wisdom.txt'
$Script:Stopwatch = [System.Diagnostics.Stopwatch]::New()

# inspired by: http://powershell-scripting.com/index.php?option=com_joomlaboard&Itemid=76&func=view&view=threaded&id=24376&catid=5
# also sourced at: https://gallery.technet.microsoft.com/Edit-old-fashioned-INI-f8fbc067?redir=0

$IniCode = @'
/* ======================================================================

C# Source File -- Created with SAPIEN Technologies PrimalScript 2011

NAME:

AUTHOR: James Vierra, DSS
DATE  : 8/30/2012

COMMENT:

Examples:
add-type -Path profileapi.cs

$sb = New-Object System.Text.StringBuilder(256)
[profileapi]::GetPrivateProfileString('section1', 'test1', 'dummy', $sb, $sb.Capacity, "$pwd\test.ini")
Write-Host ('Returned value is {0}.' -f $sb.ToString()) -ForegroundColor green

[profileapi]::WritePrivateProfileString('section2', 'test5', 'Some new value', "$pwd\test.ini")

[profileapi]::GetPrivateProfileString('section2', 'test5', 'dummy', $sb, $sb.Capacity, "$pwd\test.ini")
Write-Host ('Returned value is {0}.' -f $sb.ToString()) -ForegroundColor green

====================================================================== */
using System;
using System.Collections.Generic;
using System.Text;
using System.Runtime.InteropServices;
public class ProfileAPI{

    [DllImport("kernel32.dll")]
    public static extern bool WriteProfileSection(
    string lpAppName,
            string lpString);

    [DllImport("kernel32.dll")]
    public static extern bool WriteProfileString(
    string lpAppName,
            string lpKeyName,
            string lpString);

    [DllImport("kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool WritePrivateProfileString(
    string lpAppName,
            string lpKeyName,
            string lpString,
            string lpFileName);

    [DllImport("kernel32.dll", CharSet = CharSet.Ansi, SetLastError = true)]
    public static extern uint GetPrivateProfileSectionNames(
    IntPtr lpReturnedString,
            uint nSize,
            string lpFileName);

    [DllImport("kernel32.dll", CharSet = CharSet.Ansi, SetLastError = true)]
    static extern uint GetPrivateProfileSection(string lpAppName, IntPtr lpReturnedString, uint nSize, string lpFileName);

    [DllImport("kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
    public static extern uint GetPrivateProfileString(
    string lpAppName,
            string lpKeyName,
            string lpDefault,
            StringBuilder lpReturnedString,
            uint nSize,
            string lpFileName);
    public static string[] GetSectionNames(string iniFile) {
        uint MAX_BUFFER = 32767;
        IntPtr pReturnedString = Marshal.AllocCoTaskMem((int)MAX_BUFFER);
        uint bytesReturned = GetPrivateProfileSectionNames(pReturnedString, MAX_BUFFER, iniFile);
        if (bytesReturned == 0) {
            Marshal.FreeCoTaskMem(pReturnedString);
            return null;
        }
        string local = Marshal.PtrToStringAnsi(pReturnedString, (int)bytesReturned).ToString();
        char[] c = new char[1];
        c[0] = '\x0';
        return local.Split(c, System.StringSplitOptions.RemoveEmptyEntries);
        //Marshal.FreeCoTaskMem(pReturnedString);
        //use of Substring below removes terminating null for split
        //char[] c = local.ToCharArray();
        //return MultistringToStringArray(ref c);
        //return c;
        //return local; //.Substring(0, local.Length - 1).Split('\0');
    }

    public static string[] GetSection(string iniFilePath, string sectionName) {
        uint MAX_BUFFER = 32767;
        IntPtr pReturnedString = Marshal.AllocCoTaskMem((int)MAX_BUFFER);
        uint bytesReturned = GetPrivateProfileSection(sectionName, pReturnedString, MAX_BUFFER, iniFilePath);
        if (bytesReturned == 0) {
            Marshal.FreeCoTaskMem(pReturnedString);
            return null;
        }
        string local = Marshal.PtrToStringAnsi(pReturnedString, (int)bytesReturned).ToString();
        char[] c = new char[1] { '\x0' };
        return local.Split(c, System.StringSplitOptions.RemoveEmptyEntries);
    }

}
'@

Add-Type -TypeDefinition $IniCode

<#
A note on the properties of PFDateFormat:
    DMTF is a [string] representing [datetime] in the form 'yyyymmddHHMMSS.ffffff+UUU'
    Unix is Unix epoch format [double] which is the number of seconds since '1/1/1970 12:00:00 AM UTC'
    FileTime is an [int64] which represents a [datetime] expressed in Ticks. A Tick represents 1/100,000 of a second. Ticks can range from 0 - 2650467743999999999. Translating these into dates you get
                          0 = Monday, January 01, 1601 12:00:00.00000 AM
        2650467743999999999 = Friday, December 31, 9999 11:59:59.99999 PM
    ICSDateTime is a [datetime] formatted is of the form 'yyyymmddTHHMMSSZ'
    Excel is a [double] which represents dates as the number of days since (Get-Date 1/1/1900)
#>

# console output formatted according to PFDateFormat entry in .\PoshFunctions.ps1xml
class PFDateFormat {
    [datetime] $Date = $(Get-Date)
    [string] $DMTF
    [double] $Unix
    [int64] $FileTime
    [string] $ICSDateTime
    [string] $ISO8601
    [double] $Excel

    # add parameterless default constructor
    PFDateFormat() {
        $this.Date = $(Get-Date)
        $this.DMTF = $(ConvertFrom-DateTime -Date $this.Date -DMTF -Verbose:$false)
        $this.Unix = $(ConvertFrom-DateTime -Date $this.Date -Unix -Verbose:$false)
        $this.FileTime = $(ConvertFrom-DateTime -Date $this.Date -FileTime -Verbose:$false)
        $this.ICSDateTime = $(ConvertFrom-DateTime -Date $this.Date -ICSDateTime -Verbose:$false)
        $this.ISO8601 = $(ConvertFrom-DateTime -Date $this.Date -ISO8601 -Verbose:$false)
        $this.Excel = $(ConvertFrom-DateTime -Date $this.Date -Excel -Verbose:$false)
    }

    # add custom constructor that takes parameters
    PFDateFormat([datetime] $Date) {
        $this.Date = $Date
        $this.DMTF = $(ConvertFrom-DateTime -Date $Date -DMTF -Verbose:$false)
        $this.Unix = $(ConvertFrom-DateTime -Date $Date -Unix -Verbose:$false)
        $this.FileTime = $(ConvertFrom-DateTime -Date $Date -FileTime -Verbose:$false)
        $this.ICSDateTime = $(ConvertFrom-DateTime -Date $Date -ICSDateTime -Verbose:$false)
        $this.ISO8601 = $(ConvertFrom-DateTime -Date $Date -ISO8601 -Verbose:$false)
        $this.Excel = $(ConvertFrom-DateTime -Date $Date -Excel -Verbose:$false)
    }
}

# EOF: PoshFunctions.psm1
