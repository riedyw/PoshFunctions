function Out-PDFToPrinter {
<#
.SYNOPSIS
    To print a .PDF to the default printer
.DESCRIPTION
    To print a .PDF to the default printer, will use default application to read .PDF files
.PARAMETER Path
    A string or string array of files to print. Accepts paths from pipeline
.PARAMETER PrintDelay
    Integer representing the number of seconds to delay after issuing the command to print the file. Valid range 10-120.
.PARAMETER KillProcess
    Switch to kill the process of the default PDF reader that was started to print the file
.EXAMPLE
    Out-PDFToPrinter -Path file1.pdf, file2.pdf

    Will open file1.pdf in default PDF reader, print, wait default delay of 10 seconds, then open file2.pdf in default
    PDF reader, print, wait default delay of 10 seconds and finish.
.EXAMPLE
    Out-PDFToPrinter -Path file1.pdf, file2.pdf -KillProcess -PrintDelay 15

    Will open file1.pdf in default PDF reader, print, wait delay of 15 seconds, kill the default PDF reader process,
    then open file2.pdf in default PDF reader, print, wait delay of 15 seconds, kill the default PDF reader process, and finish.
.EXAMPLE
    Attempt to print two PDF files that do not exist.
    Out-PDFToPrinter -Path DNE1.pdf, DNE2.pdf -KillProcess -PrintDelay 15 -Verbose

    VERBOSE: Starting [Out-PDFToPrinter]
    VERBOSE: PrintDelay [15], KillProcess [True]
    VERBOSE: Processing [DNE1.pdf]
    Out-PDFToPrinter : ERROR: path [DNE1.pdf] does not exist, exit processing.
    At line:1 char:1
    + Out-PDFToPrinter -Path DNE1.pdf, DNE2.pdf -KillProcess -PrintDelay 15 - ...
    + ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        + CategoryInfo          : NotSpecified: (:) [Write-Error], WriteErrorException
        + FullyQualifiedErrorId : Microsoft.PowerShell.Commands.WriteErrorException,Out-PDFToPrinter

    VERBOSE: Ending [Out-PDFToPrinter]
.NOTES
    Inspired by https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/printing-pdf-files-part-1

    Changes
    * allow for accepting the -Path from the pipeline
    * test for existence of path, if does not exist throw an error
    * resolve to list of to use to process the file(s) one at a time
    * use get-item to determine if file extension is .pdf
    * stops processing when the first error is encountered
#>

    [CmdletBinding(ConfirmImpact = 'Low')]
    param(
        [Parameter(Mandatory, HelpMessage='Enter path to PDF file', Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string[]] $Path,

        [ValidateRange(10,120)]
        [int] $PrintDelay = 10,

        [switch] $KillProcess
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "PrintDelay [$PrintDelay], KillProcess [$KillProcess]"
        $IsError = $false
    }

    process {
        foreach ($curPath in $Path) {
            if (-not $IsError) {
                Write-Verbose -Message "Processing [$curPath]"
                if (Test-Path -Path $curPath) {
                    $ResolveFile = Resolve-Path -Path $curPath
                    $ResolveFile | ForEach-Object {
                        if (-not $IsError) {
                            $Item = Get-Item -Path $_
                            if ($Item.Extension -eq '.pdf') {
                                Write-Verbose -Message "Processing [$($Item.Fullname)]"
                                if ($KillProcess) {
                                    Start-Process -FilePath $Item.Fullname -Verb Print -PassThru |
                                        ForEach-Object { Start-Sleep -Seconds $PrintDelay } |
                                        Stop-Process
                                } else {
                                    Start-Process -FilePath $Item.Fullname -Verb Print -PassThru |
                                    ForEach-Object { Start-Sleep -Seconds $PrintDelay }
                                }
                            } else {
                                Write-Error -Message "Extension [$($Item.Extension)] -ne [.pdf], exit processing."
                                $IsError = $true
                            }
                        }
                    }
                } else {
                    Write-Error -Message "ERROR: path [$curPath] does not exist, exit processing."
                    $IsError = $true
                }
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
