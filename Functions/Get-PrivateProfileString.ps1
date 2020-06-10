function Get-PrivateProfileString {
<#
.SYNOPSIS
    To get data out of an .ini file
.DESCRIPTION
    To get data out of an .ini file. .ini files are plain text that is categorized
    in section names. Within a section there are key, value pairs. An example .ini
    file content is as follows:

    [Section1]
    Key1=Data1
.PARAMETER File
    The path to the .ini file. Can be a relative path.
.PARAMETER Section
    The name of the section within the .ini file. Section names within the file
    are enveloped in square brackets. []
.PARAMETER Key
    The key within the section that you want to pull data from.
.PARAMETER IncluddeOriginal
    A switch that will display all the original input.
.EXAMPLE
    Get-PrivateProfileString -File .\Test.ini -Section 'Section1' -Key 'Key1'

    Data1
.EXAMPLE
    Get-PrivateProfileString -File .\NonexistentFile.ini -Section 'Section1' -Key 'Key1'

    Get-PrivateProfileString : ERROR: File [.\NonexistentFile.ini] does not exist
.EXAMPLE
    Get-PrivateProfileString -File c:\Temp\Test.ini -Section 'Section1' -Key 'Key1' -IncludeOriginal

    FileName         Section  Key  Value
    --------         -------  ---  -----
    C:\Temp\Test.ini Section1 Key1 Data1
.NOTES
    # inspired by: http://powershell-scripting.com/index.php?option=com_joomlaboard&Itemid=76&func=view&view=threaded&id=24376&catid=5
    # also sourced at: https://gallery.technet.microsoft.com/Edit-old-fashioned-INI-f8fbc067?redir=0

    Some modifications have been made:
    * Error checking around file
    * Ability to take relative path to file
#>

    [CmdletBinding()]
    param(
        [string] $File,
        [string] $Section,
        [string] $Key,
        [switch] $IncludeOriginal
    )

    begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
        Write-Verbose -Message "Trimming parameters."
        $Section = $Section.Trim()
        $Key = $Key.Trim()
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
                Write-Verbose -Message "Getting value from file [$ResolveFile]"
                Write-Verbose -Message "Getting value from section [$Section]"
                Write-Verbose -Message "Getting value from key [$Key]"

                $sb = New-Object System.Text.StringBuilder(256)
                [profileapi]::GetPrivateProfileString($Section, $Key, $null, $sb, $sb.Capacity, $ResolveFile) | Out-Null

                if ($IncludeOriginal) {
                    New-Object -TypeName 'psobject' -Property ([ordered] @{
                        FileName = $ResolveFile
                        Section  = $Section
                        Key      = $Key
                        Value    = $sb.ToString()
                    })
                } else {
                    Write-Output -InputObject $sb.ToString()
                }
            }

        } else {
            Write-Error -Message "ERROR: File [$file] does not exist"
        }

    }

    end {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

} #EndFunction Get-PrivateProfileString
