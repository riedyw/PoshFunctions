function Get-PrivateProfileSectionNames {
<#
.SYNOPSIS
    To get the section names out of an .ini file
.DESCRIPTION
    To get the section names out of an .ini file. .ini files are plain text that is categorized
    in section names. Within a section there are key, value pairs. An example .ini
    file content is as follows:

    [Section1]
    Key1=Data1
.PARAMETER File
    The path to the .ini file. Can be a relative path.
.EXAMPLE
    Assuming you have a file test2.ini that has the following content
    [Section3]
    Key5=Newer Value
    [Section1]
    Key1=Some data

    Get-PrivateProfileSectionNames -File test2.ini

    Section3
    Section1
.NOTES
    # inspired by: http://powershell-scripting.com/index.php?option=com_joomlaboard&Itemid=76&func=view&view=threaded&id=24376&catid=5
    # also sourced at: https://gallery.technet.microsoft.com/Edit-old-fashioned-INI-f8fbc067?redir=0

    Some modifications have been made:
    * Error checking around file
    * Ability to take relative path to file
.OUTPUTS
    [$string[]]
#>

    [CmdletBinding()]
    param(
        [string] $File
    )

    begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
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
    }

    process {
        if (Test-Path $File) {
            $ResolveFile = Resolve-Path -Path $File
            if ($ResolveFile.count -gt 1) {
                Write-Error -Message "ERROR: File specification [$File] resolves to more than 1 file."
            } else {
                Write-Verbose -Message "Getting section names from .ini file [$ResolveFile]"
                [ProfileAPI]::GetSectionNames($ResolveFile)
            }
        } else {
            Write-Error -Message "ERROR: File [$File] does not exist"
        }
    }

    end {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

} #EndFunction Get-PrivateProfileSectionNames
