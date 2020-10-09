function Get-PrivateProfileSection {
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
.PARAMETER AsString
    A switch that will output a string array as opposed to a hash table
.EXAMPLE
    Get-PrivateProfileSection -File test.ini -Section 'Section2' -Verbose

    Assuming .\test.ini has the following section within it:
    [Section2]
    Key3=Value3
    Key4 = Value4

    The function would return:
    VERBOSE: Starting Get-PrivateProfileSection
    VERBOSE: Getting value from file [C:\Program Files\WindowsPowerShell\Modules\MyFunctions\Functions\test.ini]
    VERBOSE: Getting value from section [section2]

    Name                           Value
    ----                           -----
    Key3                           Value3
    Key4                           Value4
    VERBOSE: Ending Get-PrivateProfileSection
.EXAMPLE
    Get-PrivateProfileSection -File test.ini -Section 'Section2' -AsString

    Assuming .\test.ini has the following section within it:
    [Section2]
    Key3=Value3
    Key4 = Value4

    The function would return:
    Key3=Value3
    Key4=Value4
.NOTES
    # inspired by: http://powershell-scripting.com/index.php?option=com_joomlaboard&Itemid=76&func=view&view=threaded&id=24376&catid=5
    # also sourced at: https://gallery.technet.microsoft.com/Edit-old-fashioned-INI-f8fbc067?redir=0

    Some modifications have been made:
    * Error checking around file
    * Ability to take relative path to file
    * Normally produce output as [hashtable], but -AsString switch will return a string array
.OUTPUTS
    [hashtable] normally

    [string[]] with -AsString switch
#>

    [CmdletBinding()]
    param(
        [string] $File,
        [string] $Section,
        [switch] $AsString
    )

    begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
        Write-Verbose -Message "Trimming parameters."
        $Section = $Section.Trim()
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
                # Write-Verbose -Message "Getting value from key [$Key]"

                If ($AsString) {
                    [ProfileAPI]::GetSection($ResolveFile, $Section)
                } else {
                    [ProfileAPI]::GetSection($ResolveFile, $Section) | ConvertFrom-StringData
                }

            }

        } else {
            Write-Error -Message "ERROR: File [$file] does not exist"
        }

    }

    end {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

} #EndFunction Get-PrivateProfileSection
