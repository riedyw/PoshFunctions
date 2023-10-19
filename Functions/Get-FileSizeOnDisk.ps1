function Get-FileSizeOnDisk {
    <#
.SYNOPSIS
    Powershell script to get file size and size on disk of all files in a directory.
.DESCRIPTION
    This PowerShell script gets file size and size on disk in bytes of all files in a directory.
.PARAMETER Path
    Directory path of the files to check. If this parameter is not specified the default value is current directory.
.PARAMETER Full
    Switch to return all attributes of Get-Item on the file plus the attribute SizeOnDisk
.NOTES
    Inspired by: https://www.opentechguides.com/how-to/article/powershell/133/size-on-disk-ps.html

    Changes:
    * CmdletBinding
    * write-verbose
    * more help
    * added -Full switch to get full attributes of a file including SizeOnDisk
    * added ability to accept input from the pipeline
.LINK
    www.opentechguides.com
.EXAMPLE
    Get-FileSizeOnDisk c:\myfolder
.EXAMPLE
    Get-FileSizeOnDisk -Path *.psd1

    Name               Length SizeOnDisk FullName
    ----               ------ ---------- --------
    PoshFunctions.psd1  21190      12288 C:\Git\PoshFunctions\PoshFunctions.psd1
.EXAMPLE
Get-FileSizeOnDisk -Path *.psd1 -Full | Select-Object Name, Length, SizeOnDisk, LastWriteTime
Name               Length SizeOnDisk LastWriteTime
----               ------ ---------- -------------
PoshFunctions.psd1  21190      12288 11/22/2022 1:35:42 PM
#>

    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter', '')]
    [CmdletBinding()]
    [OutputType([psobject[]])]
    param (
        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string[]] $Path = '.',

        [switch] $Full
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $source = @'
using System;
using System.Runtime.InteropServices;
using System.ComponentModel;
using System.IO;

namespace Win32
    {

    public class Disk {

    [DllImport("kernel32.dll")]
    static extern uint GetCompressedFileSizeW([In, MarshalAs(UnmanagedType.LPWStr)] string lpFileName,
    [Out, MarshalAs(UnmanagedType.U4)] out uint lpFileSizeHigh);

    public static ulong GetSizeOnDisk(string filename)
    {
        uint HighOrderSize;
        uint LowOrderSize;
        ulong size;

        FileInfo file = new FileInfo(filename);
        LowOrderSize = GetCompressedFileSizeW(file.FullName, out HighOrderSize);

        if (HighOrderSize == 0 && LowOrderSize == 0xffffffff)
        {
    throw new Win32Exception(Marshal.GetLastWin32Error());
        }
        else {
    size = ((ulong)HighOrderSize << 32) + LowOrderSize;
    return size;
        }
    }
    }
}
'@

        Add-Type -TypeDefinition $source

    }

    process {
        foreach ($CurPath in $Path) {
            Get-ChildItem -Path $CurPath | Where-Object { -not $_.PSIsContainer } | ForEach-Object {
                $Item = $_
                [int64] $size = [Win32.Disk]::GetSizeOnDisk($item.FullName)
                $Item | Add-Member -MemberType NoteProperty -Name SizeOnDisk -Value $size
                if ($Full) {
                    $Item
                } else {
                    New-Object -TypeName psobject -Property ([ordered] @{
                            Name       = $item.Name
                            Length     = $item.Length
                            SizeOnDisk = $item.SizeOnDisk
                            FullName   = $item.FullName
                        })
                }
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }


}
