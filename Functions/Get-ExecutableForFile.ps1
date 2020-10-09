# source http://community.idera.com/powershell/powertips/b/tips/posts/finding-executable-for-file
# requires explicit path NOT relative

function Get-ExecutableForFile {
<#
.SYNOPSIS
    Given a file, determine what program is associated with file.
.DESCRIPTION
    Given a file, determine what program is associated with file.
.PARAMETER Path
    The path to a file
.EXAMPLE
    Get-ExecutableForFile -Path .\sample.docx

    C:\Program Files (x86)\Microsoft Office\Root\Office16\WINWORD.EXE
#>

    [CmdletBinding(ConfirmImpact='None')]
    param
    (
        [Parameter(Mandatory,HelpMessage='Please enter a filename',Position=0)]
        [string] $Path
    )

    $Source = @'

using System;
using System.Text;
using System.Runtime.InteropServices;
public class Win32API
    {
        [DllImport("shell32.dll", EntryPoint="FindExecutable")]

        public static extern long FindExecutableA(string lpFile, string lpDirectory, StringBuilder lpResult);

        public static string FindExecutable(string pv_strFilename)
        {
            StringBuilder objResultBuffer = new StringBuilder(1024);
            long lngResult = 0;

            lngResult = FindExecutableA(pv_strFilename, string.Empty, objResultBuffer);

            if(lngResult >= 32)
            {
                return objResultBuffer.ToString();
            }

            return string.Format("Error: ({0})", lngResult);
        }
    }
'@

    if (-not (Test-Path -Path $Path)) {
        Write-Error -Message "File specified [$Path] does not exist."
    } else {
        Add-Type -TypeDefinition $Source -ErrorAction SilentlyContinue
        [Win32API]::FindExecutable($Path)
    }

}
