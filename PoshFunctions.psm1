# PoshFunctions.psm1
# Author: Bill Riedy

Add-Type -AssemblyName Microsoft.VisualBasic
Add-Type -AssemblyName System.Web

$AliasesToExport = @()
$VariablesToExport = @()
$FunctionsToExport = @()

$ModulePath = split-path -Parent -Path $MyInvocation.MyCommand.Path

$FunctionsPath = join-path -Path $ModulePath -ChildPath 'Functions'
$Functions = get-childitem -Path $FunctionsPath -Filter *.ps1
$Functions | foreach-object { . $_.FullName }

$FunctionsToExport = $Functions | select-object -ExpandProperty Basename

$Script:WordList = Get-Content -Path $PSScriptRoot\Words.txt

<#
The PoshFunctions module is saved twice. Once as the file PoshFunctions.psm1
#>

if ($MyInvocation.MyCommand.Name -Match "\.psm1") {
    Export-ModuleMember -Function $FunctionsToExport
    Export-ModuleMember -Alias    *
    Export-ModuleMember -Variable $VariablesToExport
}

# inspired by: http://powershell-scripting.com/index.php?option=com_joomlaboard&Itemid=76&func=view&view=threaded&id=24376&catid=5
# also sourced at: https://gallery.technet.microsoft.com/Edit-old-fashioned-INI-f8fbc067?redir=0

$IniCode=@'
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

Add-Type $IniCode

# EOF: PoshFunctions.psm1 / PoshFunctions.ps1
