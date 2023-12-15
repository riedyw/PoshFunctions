function Get-ExecutableForFile {
    <#
.SYNOPSIS
    Given a file, determine what program is associated with file.
.DESCRIPTION
    Given a file, determine what program is associated with file.
.PARAMETER Path
    The path to a file
.PARAMETER IncludeInput
    Include the specified file as part of the output
.EXAMPLE
    Get-ExecutableForFile -Path .\sample.docx

    C:\Program Files (x86)\Microsoft Office\Root\Office16\WINWORD.EXE
.NOTES
    Inspired by http://community.idera.com/powershell/powertips/b/tips/posts/finding-executable-for-file
    Added logic to resolve relative path to file
    Added logic to test if item is a file and not a folder
    Added -IncludeInput as an option.
#>

    [CmdletBinding(ConfirmImpact = 'None')]
    param
    (
        [Parameter(Mandatory, HelpMessage = 'Please enter a filename', Position = 0)]
        [string] $Path,

        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        $Source = @'
using System;
using System.Text;
using System.Runtime.InteropServices;
public class PFWin32API
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
            [array] $ResolveFile = Get-Item -Path $Path
            if ($ResolveFile.count -gt 1) {
                Write-Error -Message "ERROR: File specification [$Path] resolves to more than 1 file."
            } else {
                #$ResolveFile = $ResolveFile[0]
                if ($ResolveFile[0] -is [System.IO.FileInfo]) {
                    Add-Type -TypeDefinition $Source -ErrorAction SilentlyContinue
                    $Result = [PFWin32API]::FindExecutable($ResolveFile)
                    if ($IncludeInput) {
                        New-Object -TypeName psobject -Property ([ordered] @{
                            Path       = $ResolveFile[0].FullName
                            Executable = $Result
                        })
                    } else {
                        $Result
                    }
                } else {
                    Write-Error -Message "ERROR: File specification [$Path] is a folder and not a file."
                }
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
