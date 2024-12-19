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
$Script:IconFile = Join-Path -Path $ModulePath -ChildPath 'Resources\PoshFunctions.ico'

# inspired by: http://powershell-scripting.com/index.php?option=com_joomlaboard&Itemid=76&func=view&view=threaded&id=24376&catid=5
# also sourced at: https://gallery.technet.microsoft.com/Edit-old-fashioned-INI-f8fbc067?redir=0
# most recently found at: https://web.archive.org/web/*/https://gallery.technet.microsoft.com/Edit-old-fashioned-INI-f8fbc067/file/148760/1/IniFileManager.ps1

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

# source: https://stackoverflow.com/questions/255419/how-can-i-mute-unmute-my-sound-from-powershell
# changed public class from 'Audio' to 'PFAudio'

Add-Type -TypeDefinition @'
using System.Runtime.InteropServices;

[Guid("5CDF2C82-841E-4546-9722-0CF74078229A"), InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
interface IAudioEndpointVolume {
    // f(), g(), ... are unused COM method slots. Define these if you care
    int f(); int g(); int h(); int i();
    int SetMasterVolumeLevelScalar(float fLevel, System.Guid pguidEventContext);
    int j();
    int GetMasterVolumeLevelScalar(out float pfLevel);
    int k(); int l(); int m(); int n();
    int SetMute([MarshalAs(UnmanagedType.Bool)] bool bMute, System.Guid pguidEventContext);
    int GetMute(out bool pbMute);
}
[Guid("D666063F-1587-4E43-81F1-B948E807363F"), InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
interface IMMDevice {
    int Activate(ref System.Guid id, int clsCtx, int activationParams, out IAudioEndpointVolume aev);
}
[Guid("A95664D2-9614-4F35-A746-DE8DB63617E6"), InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
interface IMMDeviceEnumerator {
    int f(); // Unused
    int GetDefaultAudioEndpoint(int dataFlow, int role, out IMMDevice endpoint);
}
[ComImport, Guid("BCDE0395-E52F-467C-8E3D-C4579291692E")] class MMDeviceEnumeratorComObject { }

public class PFAudio {
    static IAudioEndpointVolume Vol() {
        var enumerator = new MMDeviceEnumeratorComObject() as IMMDeviceEnumerator;
        IMMDevice dev = null;
        Marshal.ThrowExceptionForHR(enumerator.GetDefaultAudioEndpoint(/*eRender*/ 0, /*eMultimedia*/ 1, out dev));
        IAudioEndpointVolume epv = null;
        var epvid = typeof(IAudioEndpointVolume).GUID;
        Marshal.ThrowExceptionForHR(dev.Activate(ref epvid, /*CLSCTX_ALL*/ 23, 0, out epv));
        return epv;
  }
  public static float Volume {
    get {float v = -1; Marshal.ThrowExceptionForHR(Vol().GetMasterVolumeLevelScalar(out v)); return v;}
    set {Marshal.ThrowExceptionForHR(Vol().SetMasterVolumeLevelScalar(value, System.Guid.Empty));}
  }
  public static bool Mute {
    get { bool mute; Marshal.ThrowExceptionForHR(Vol().GetMute(out mute)); return mute; }
    set { Marshal.ThrowExceptionForHR(Vol().SetMute(value, System.Guid.Empty)); }
  }
}
'@


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

[Flags()]
enum PFUserAccountControl {
    SCRIPT = 0x1
    ACCOUNTDISABLE = 0x2
    HOMEDIR_REQUIRED = 0x8
    LOCKOUT = 0x10
    PASSWD_NOTREQD = 0x20
    PASSWD_CANT_CHANGE = 0x40
    ENCRYPTED_TEXT_PASSWORD_ALLOWED = 0x80
    TEMP_DUPLICATE_ACCOUNT = 0x100
    NORMAL_ACCOUNT = 0x200
    INTERDOMAIN_TRUST_ACCOUNT = 0x800
    WORKSTATION_TRUST_ACCOUNT = 0x1000
    SERVER_TRUST_ACCOUNT = 0x2000
    DONT_EXPIRE_PASSWD = 0x10000
    MNS_LOGON_ACCOUNT = 0x20000
    SMARTCARD_REQUIRED = 0x40000
    TRUSTED_FOR_DELEGATION = 0x80000
    NOT_DELEGATED = 0x100000
    USE_DES_KEY_ONLY = 0x200000
    DONT_REQUIRE_PREAUTH = 0x400000
    PASSWORD_EXPIRED = 0x800000
    TRUSTED_TO_AUTHENTICATE_FOR_DELEGATION = 0x1000000
    ADS_UF_PARTIAL_SECRETS_ACCOUNT = 0x04000000
}

# EOF: PoshFunctions.psm1
