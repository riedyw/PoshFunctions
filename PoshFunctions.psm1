# MyFunctions.psm1
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

<#
The MyFunctions module is saved twice. Once as the file MyFunctions.psm1 A symbolic link of
MyFunctions.ps1 that points to MyFunctions.psm1 So the next line is merely determining if
you are importing the module or if you dot sourced the MyFunctions.ps1 file.
#>

if ($MyInvocation.MyCommand.Name -Match "\.psm1") {
    Export-ModuleMember -Function $FunctionsToExport
    Export-ModuleMember -Alias    *
    Export-ModuleMember -Variable $VariablesToExport
}

# Creation of 'NetApi' class
# inspired by: https://balladelli.com/netapi-et-powershell/
# broke up into separate file for each function
# Renamed public class 'Netapi' to 'NetApi32' to more accurately reflect its link back to DLL.

<#
.SYNOPSIS
    Defines all the functions in NetApi32.dll so they can be used within Powershell.
.DESCRIPTION
    Supported functions:
        Get-Shares
            server can be $null to point to localhost
            level can be 0 1 2 502 503
            Remark: Uses NetShareEnum

        Get-NetStatistics
            type can be SERVER or WORKSTATION
            Remark: Uses NetStatisticsGet

        Get-Sessions
            level can be 0 1 2 10 502
            Remark: Uses NetConnectionEnum

        Get-OpenFiles
            level can be 2 3
            Remark: Uses NetFileEnum

.EXAMPLE
    Get-NetStatistics localhost SERVER
    Get-Shares localhost 503
    Get-Sessions localhost 502
    Get-OpenFiles localhost 3
.NOTES
    Filename    : Netapi.ps1
    Author      : Micky Balladelli micky@balladelli.com
.LINK
    https://balladelli.com/netapi-et-powershell/
#>

$NetApi32Code = @'
using System;
using System.Runtime.InteropServices;

public class NetApi32 {
    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Unicode)]
    public struct SHARE_INFO_0 {
        [MarshalAs(UnmanagedType.LPWStr)] public String Name;
    }

    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Unicode)]
    public struct SHARE_INFO_1 {
        [MarshalAs(UnmanagedType.LPWStr)] public string Name;
        public uint Type;
        [MarshalAs(UnmanagedType.LPWStr)] public string Remark;
    }

    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Unicode)]
    public struct SHARE_INFO_2 {
        [MarshalAs(UnmanagedType.LPWStr)] public string Name;
        public uint Type;
        [MarshalAs(UnmanagedType.LPWStr)] public string Remark;
        public uint Permissions;
        public uint MaxUses;
        public uint CurrentUses;
        [MarshalAs(UnmanagedType.LPWStr)] public string Path;
        [MarshalAs(UnmanagedType.LPWStr)] public string Password;
   }

    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Unicode)]
    public struct SHARE_INFO_502 {
        [MarshalAs(UnmanagedType.LPWStr)] public string Name;
        public uint Type;
        [MarshalAs(UnmanagedType.LPWStr)] public string Remark;
        public uint Permissions;
        public uint MaxUses;
        public uint CurrentUses;
        [MarshalAs(UnmanagedType.LPWStr)] public string Path;
        [MarshalAs(UnmanagedType.LPWStr)] public string Password;
        public uint Reserved;
        public IntPtr SecurityDescriptor;
    }
    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Unicode)]
    public struct SHARE_INFO_503 {
        [MarshalAs(UnmanagedType.LPWStr)] public string Name;
        public uint Type;
        [MarshalAs(UnmanagedType.LPWStr)] public string Remark;
        public uint Permissions;
        public uint MaxUses;
        public uint CurrentUses;
        [MarshalAs(UnmanagedType.LPWStr)] public string Path;
        [MarshalAs(UnmanagedType.LPWStr)] public string Password;
        [MarshalAs(UnmanagedType.LPWStr)] public string ServerName;
        public uint Reserved;
        public IntPtr SecurityDescriptor;
    }

    [DllImport("NetApi32.dll",CharSet=CharSet.Unicode)]
    public static extern uint NetShareEnum(
        [In,MarshalAs(UnmanagedType.LPWStr)] string server,
        int level,
        out IntPtr bufptr,
        int prefmaxlen,
        ref Int32 entriesread,
        ref Int32 totalentries,
        ref Int32 resume_handle
    );

    [DllImport("NetApi32.dll",CharSet=CharSet.Unicode)]
    public static extern int NetApiBufferFree(IntPtr buffer);

    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Unicode)]
    public struct STAT_SERVER_0 {
        public uint Start;
        public uint FOpens;
        public uint DevOpens;
        public uint JobsQueued;
        public uint SOpens;
        public uint STimedOut;
        public uint SerrorOut;
        public uint PWerrors;
        public uint PermErrors;
        public uint SysRrrors;
        public uint bytesSent_low;
        public uint bytesSent_high;
        public uint bytesRcvd_low;
        public uint BytesRcvd_high;
        public uint AvResponse;
        public uint ReqNufNeed;
        public uint BigBufNeed;
    }

    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Unicode)]
    public struct STAT_WORKSTATION_0 {
        public long StatisticsStartTime;
        public long BytesReceived;
        public long SmbsReceived;
        public long PagingReadBytesRequested;
        public long NonPagingReadBytesRequested;
        public long CacheReadBytesRequested;
        public long NetworkReadBytesRequested;
        public long BytesTransmitted;
        public long SmbsTransmitted;
        public long PagingWriteBytesRequested;
        public long NonPagingWriteBytesRequested;
        public long CacheWriteBytesRequested;
        public long NetworkWriteBytesRequested;
        public uint InitiallyFailedOperations;
        public uint FailedCompletionOperations;
        public uint ReadOperations;
        public uint RandomReadOperations;
        public uint ReadSmbs;
        public uint LargeReadSmbs;
        public uint SmallReadSmbs;
        public uint WriteOperations;
        public uint RandomWriteOperations;
        public uint WriteSmbs;
        public uint LargeWriteSmbs;
        public uint SmallWriteSmbs;
        public uint RawReadsDenied;
        public uint RawWritesDenied;
        public uint NetworkErrors;
        public uint Sessions;
        public uint FailedSessions;
        public uint Reconnects;
        public uint CoreConnects;
        public uint Lanman20Connects;
        public uint Lanman21Connects;
        public uint LanmanNtConnects;
        public uint ServerDisconnects;
        public uint HungSessions;
        public uint UseCount;
        public uint FailedUseCount;
        public uint CurrentCommands;
    }

    [DllImport("NetApi32.dll",CharSet=CharSet.Unicode)]
    public static extern uint NetStatisticsGet(
        [In,MarshalAs(UnmanagedType.LPWStr)] string server,
        [In,MarshalAs(UnmanagedType.LPWStr)] string service,
        int level,
        int options,
        out IntPtr bufptr
    );

    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Unicode)]
    public struct SESSION_INFO_0 {
        [MarshalAs(UnmanagedType.LPWStr)] public string Name;
    }

    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Unicode)]
    public struct SESSION_INFO_1 {
        [MarshalAs(UnmanagedType.LPWStr)] public string Name;
        [MarshalAs(UnmanagedType.LPWStr)] public string Username;
        public uint NumOpens;
        public uint Time;
        public uint IdleTime;
        public uint UserFlags;
    }

    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Unicode)]
    public struct SESSION_INFO_2 {
        [MarshalAs(UnmanagedType.LPWStr)] public string Name;
        [MarshalAs(UnmanagedType.LPWStr)] public string Username;
        public uint NumOpens;
        public uint Time;
        public uint IdleTime;
        public uint UserFlags;
        [MarshalAs(UnmanagedType.LPWStr)] public string ConnectionType;
    }

    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Unicode)]
    public struct SESSION_INFO_10 {
        [MarshalAs(UnmanagedType.LPWStr)] public string Name;
        [MarshalAs(UnmanagedType.LPWStr)] public string Username;
        public uint Time;
        public uint IdleTime;
    }

    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Unicode)]
    public struct SESSION_INFO_502 {
        [MarshalAs(UnmanagedType.LPWStr)] public string Name;
        [MarshalAs(UnmanagedType.LPWStr)] public string Username;
        public uint NumOpens;
        public uint Time;
        public uint IdleTime;
        public uint UserFlags;
        [MarshalAs(UnmanagedType.LPWStr)] public string ConnectionType;
        [MarshalAs(UnmanagedType.LPWStr)] public string Transport;
    }

    [DllImport("NetApi32.dll",CharSet=CharSet.Unicode)]
    public static extern uint NetSessionEnum(
        [In,MarshalAs(UnmanagedType.LPWStr)] string server,
        [In,MarshalAs(UnmanagedType.LPWStr)] string client,
        [In,MarshalAs(UnmanagedType.LPWStr)] string user,
        int level,
        out IntPtr bufptr,
        int prefmaxlen,
        ref Int32 entriesread,
        ref Int32 totalentries,
        ref Int32 resume_handle
    );

    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Unicode)]
    public struct FILE_INFO_2 {
        public uint FileID;
    }

    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Unicode)]
    public struct FILE_INFO_3 {
        public uint FileID;
        public uint Permissions;
        public uint NumLocks;
        [MarshalAs(UnmanagedType.LPWStr)] public string Path;
        [MarshalAs(UnmanagedType.LPWStr)] public string User;
    }

    [DllImport("NetApi32.dll",CharSet=CharSet.Unicode)]
    public static extern uint NetFileEnum(
        [In,MarshalAs(UnmanagedType.LPWStr)] string server,
        [In,MarshalAs(UnmanagedType.LPWStr)] string path,
        [In,MarshalAs(UnmanagedType.LPWStr)] string user,
        int level,
        out IntPtr bufptr,
        int prefmaxlen,
        ref Int32 entriesread,
        ref Int32 totalentries,
        ref Int32 resume_handle
    );
}
'@

Add-Type -TypeDefinition $NetApi32Code

# Creation of of 'IniFileApi'
# inspired by: http://powershell-scripting.com/index.php?option=com_joomlaboard&Itemid=76&func=view&view=threaded&id=24376&catid=5
# also sourced at: https://gallery.technet.microsoft.com/Edit-old-fashioned-INI-f8fbc067?redir=0
# changed class name from 'ProfileApi' to 'IniFileApi'
# slightly changed formatting of code to make it more readable

$IniFileApiCode=@'
/* ======================================================================

C# Source File -- Created with SAPIEN Technologies PrimalScript 2011

NAME:

AUTHOR: James Vierra, DSS
DATE  : 8/30/2012

COMMENT:

Examples:
add-type -Path IniFileApi.cs

$sb = New-Object System.Text.StringBuilder(256)
[IniFileApi]::GetPrivateProfileString('section1', 'test1', 'dummy', $sb, $sb.Capacity, "$pwd\test.ini")
Write-Host ('Returned value is {0}.' -f $sb.ToString()) -ForegroundColor green

[IniFileApi]::WritePrivateProfileString('section2', 'test5', 'Some new value', "$pwd\test.ini")

[IniFileApi]::GetPrivateProfileString('section2', 'test5', 'dummy', $sb, $sb.Capacity, "$pwd\test.ini")
Write-Host ('Returned value is {0}.' -f $sb.ToString()) -ForegroundColor green

====================================================================== */
using System;
using System.Collections.Generic;
using System.Text;
using System.Runtime.InteropServices;
public class IniFileApi{

    [DllImport("Kernel32.dll")]
    public static extern bool WriteProfileSection(
        string lpAppName,
        string lpString
    );

    [DllImport("Kernel32.dll")]
    public static extern bool WriteProfileString(
        string lpAppName,
        string lpKeyName,
        string lpString
    );

    [DllImport("Kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool WritePrivateProfileString(
        string lpAppName,
        string lpKeyName,
        string lpString,
        string lpFileName
    );

    [DllImport("Kernel32.dll", CharSet = CharSet.Ansi, SetLastError = true)]
    public static extern uint GetPrivateProfileSectionNames(
        IntPtr lpReturnedString,
        uint nSize,
        string lpFileName
    );

    [DllImport("Kernel32.dll", CharSet = CharSet.Ansi, SetLastError = true)]
    static extern uint GetPrivateProfileSection(
        string lpAppName,
        IntPtr lpReturnedString,
        uint nSize,
        string lpFileName
    );

    [DllImport("Kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
    public static extern uint GetPrivateProfileString(
        string lpAppName,
        string lpKeyName,
        string lpDefault,
        StringBuilder lpReturnedString,
        uint nSize,
        string lpFileName
    );

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

Add-Type $IniFileApiCode

# EOF: MyFunctions.psm1 / MyFunctions.ps1
