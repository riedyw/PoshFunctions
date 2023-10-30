# inspired by https://ss64.com/ps/syntax-set-eol.html
function Set-EOLTerminator {
    <#
    .SYNOPSIS
    Converts to EOL character(s) considered "normal" for various operating systems. For Unix it is "LF", for Mac it is "CR", and for Windows it is "CRLF"
    .DESCRIPTION
    Converts to EOL character(s) considered "normal" for various operating systems. For Unix it is "LF", for Mac it is "CR", and for Windows it is "CRLF"
    .PARAMETER LineEnding
    EOL format to be used. Validate set 'Mac', 'Unix', 'Win'. Defaults to 'Win'
    .PARAMETER Path
    The path to the file(s)
    .PARAMETER Quiet
    If specified there will be no output produced by the function
    .EXAMPLE
    Get-FileEncoding -Path c:\temp\tempfile.txt

    EncodingType Path
    ------------ ----
    ASCII        C:\temp\tempfile.txt
    .NOTES
    Inspired by https://ss64.com/ps/syntax-set-eol.html.

    Converted it into a function.
    Added comment based help, begin/process/end code blocks, changing parameter $file to $Path to be more
    inline with other PowerShell commands. $Path can be an array of strings. Relative paths are accepted.
    Test for existence of $Path and that it is not a directory
    Provides output by default, can be disabled with -Quiet parameter.
    Function as originally written was doing the file write 2 or 3 times (depending on code branching),
    and rereading the file which is not necessary as it stores the contents of the file in memory.
  #>


    [CmdletBinding(ConfirmImpact = 'High')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    Param(
        [ValidateSet('Mac', 'Unix', 'Win')]
        [string] $LineEnding = 'Win',

        [Parameter(Mandatory)]
        [string[]] $Path,

        [switch] $Quiet
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "LineEnding specified as [$LineEnding]"
        $CR = "`r"
        $LF = "`n"
        $CRLF = "$CR$LF"
        switch ($LineEnding) {
            'Mac' { $EOL = $CR }
            'Unix' { $EOL = $LF }
            'Win' { $EOL = $CRLF }
        }
    }

    process {
        foreach ($CurPath in $Path) {
            if (Test-Path -Path $CurPath) {
                $ResolveFile = Resolve-Path -Path $CurPath
                foreach ($CurrentResolve in $ResolveFile) {
                    if (-not (Get-Item -Path $CurrentResolve.Path).PSIsContainer) {
                        if (-not $Quiet) {
                            New-Object -TypeName psobject -Property ([ordered] @{
                                    LineEnding = $LineEnding
                                    Path       = $CurrentResolve.Path
                                })
                        }
                        $text = [IO.File]::ReadAllText($CurrentResolve.Path)
                        # Replace CR+LF with LF
                        $Text = $Text -replace $CRLF, $LF
                        # Replace CR with LF
                        $Text = $Text -replace $CR, $LF
                        #  At this point all line-endings should be LF.
                        # Replace LF with intended EOL char
                        if ($EOL -ne $LF) {
                            $Text = $Text -replace $LF, $EOL
                        }
                        [IO.File]::WriteAllText($CurrentResolve.Path, $Text)
                    } else {
                        Write-Error -Message "ERROR: File [$CurrentResolve] is a directory. Skipping..."
                    }
                }

            } else {
                Write-Error -Message "ERROR: Path [$CurPath] does not exist"
            }
        }

    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
