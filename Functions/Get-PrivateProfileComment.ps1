function Get-PrivateProfileComment {
<#
.SYNOPSIS
    To get comments from an .ini file
.DESCRIPTION
    To get comments from an .ini file. Comments are lines that begin with a
    semicolon ';'.
.PARAMETER File
    The path to the .ini file. Can be a relative path.
.PARAMETER Section
    The name of the section within the .ini file. Section names within the file
    are enveloped in square brackets. '[]'
    If Section is blank '' then the comments are for the file and will be placed
    above all sections.
.EXAMPLE
    Get-PrivateProfileComment -File Test2.ini -Section ''

    Assuming that the file Test2.ini had a line at the top above all sections
    that contained a string '; file comment 1' then the function would return

    ; file comment 1
.EXAMPLE
    Get-PrivateProfileComment -File Test2.ini -Section 'Section2'

    ; new section comment
.NOTES
    I wanted to have an ability to get comments from an .ini file.
.OUTPUTS
    [string[]]
#>

    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [string] $File,

        [string] $Section
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message 'Trimming parameters.'
        $Section = $Section.Trim()
        $InSection = $false
    }

    process {
        if (Test-Path -Path $File) {
            $ResolveFile = Resolve-Path -Path $File
            if ($ResolveFile.count -gt 1) {
                Write-Error -Message "ERROR: File specification [$File] resolves to more than 1 file."
            } else {
                Write-Verbose -Message "Using file [$ResolveFile] in section [$Section], getting comments"
                $IniContent = Get-Content -Path $ResolveFile
                if ($Section -eq '') {
                    $InSection = $true
                }
                $IniContent | ForEach-Object -Process {
                    if ($InSection) {
                        if ($_ -match '^\s*;.*$') {
                            $_
                        } elseif ($_ -match '^(\s*\[\s*)([\S\s+\S|\S]+)(\s*\]).*$') {
                            break
                        }
                    }
                    if ($_ -match '^(\s*\[\s*)([\S\s+\S|\S]+)(\s*\]).*$') {
                        $MatchSection = $matches[2].Trim()
                        if ($MatchSection -eq $Section) {
                            $InSection = $true
                        }
                    }
                }
            }
        } else {
            Write-Error -Message "ERROR: File [$File] does not exist"
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
