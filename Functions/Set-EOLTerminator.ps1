# inspired by https://ss64.com/ps/syntax-set-eol.html
function Set-EOLTerminator {
    [CmdletBinding()]
    Param(
        [Parameter()]
        [ValidateSet("Mac", "Unix", "Win")]
        [string] $LineEnding = "Win",

        [Parameter(Mandatory)]
        [string[]] $Path
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $CR = "`r"
        $LF = "`n"
        $CRLF = "$CR$LF"
        switch ($LineEnding) {
            "Mac" { $EOL = $CR }
            "Unix" { $EOL = $LF }
            "Win" { $EOL = $CRLF }
        }
    }

    process {
        foreach ($CurPath in $Path) {
            if (Test-Path -Path $CurPath) {
                $ResolveFile = Resolve-Path -Path $CurPath
                foreach ($CurrentResolve in $ResolveFile) {
                    if (-not (Get-Item -Path $CurrentResolve.Path).PSIsContainer) {
                        New-Object -TypeName psobject -Property ([ordered] @{
                            LineEnding = $LineEnding
                            Path = $CurrentResolve.Path
                        })
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
