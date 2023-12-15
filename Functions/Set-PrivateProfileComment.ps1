function Set-PrivateProfileComment {
<#
.SYNOPSIS
    To place comment(s) in an .ini file. Comments are lines that begin with a semicolon ';'.
.DESCRIPTION
    To set data in an .ini file. .ini files are plain text that is categorized
    in section names. Within a section there are key, value pairs. An example .ini
    file content is as follows:

    [Section1]
    Key1=Data1
.PARAMETER File
    The path to the .ini file. Can be a relative path.
.PARAMETER Section
    The name of the section within the .ini file. Section names within the file
    are enveloped in square brackets. '[]'
    If Section is blank '' then the comments are for the file and will be placed
    above all sections.
.PARAMETER Comment
    A string or array of strings that will be placed as comments into the .ini
    file. Comments are lines that begin with a semicolon ';' and then the comment.
.PARAMETER CreateFile
    A switch that will create the File if it does not automatically exist. If
    this switch is set the CreateSection will be set as $true as well.
.PARAMETER CreateSection
    A switch that will create the Section if it does not exist.
.EXAMPLE
    Set-PrivateProfileComment -File Test2.ini -Section '' -Comment 'This is a file comment'

    True

    Would add the following line at the top of the file
    ; This is a file comment
.EXAMPLE
    Set-PrivateProfileComment -File Test2.ini -Section 'Section5' -Comment 'This is a section comment' -CreateSection

    True

    Assuming that 'Section5' didn't exist in the .ini file it would add the following lines at the end of the file
    [Section5]
    ; This is a section comment
.NOTES
    I wanted to have an ability to write comments into an .ini file.
.OUTPUTS
    [bool] indicating success or failure of writing the comment.

    Error trapping on specific conditions.
#>

    # todo Change += to System.Collections.Arraylist
    # todo prevent success from returning a value of $true

    #region parameter
    [CmdletBinding(ConfirmImpact='Low')]
    [OutputType('null')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter','')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments','')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions','')]
    param(
        [string] $File,

        [string] $Section,

        [string[]] $Comment,

        [switch] $CreateFile,

        [switch] $CreateSection,

        [switch] $ReplaceComment
    )
    #endregion parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message 'Trimming parameters.'
        $Section = $Section.Trim()
        foreach ($CurrentComment in $Comment) {
            $CurrentComment = $CurrentComment.Trim()
        }
        if ($Section -eq '') {
            $InSection = $true
        }
        if ($CreateFile) {
            $CreateSection = $true
        }
    }

    process {
        if (-not (Test-Path -Path $File) -and $CreateFile) {
            Write-Verbose -Message "File [$File] does not exist, creating it."
            try {
                $null = New-Item -Path $File -ItemType File
            } catch {
                Write-Error -Message "Could not create file [$File], probably permissions not valid."
            }
        }
        if (Test-Path -Path $File) {
            $ResolveFile = Resolve-Path -Path $File
            if ($ResolveFile.count -gt 1) {
                Write-Error -Message "ERROR: File specification [$File] resolves to more than 1 file."
            } else {
                Write-Verbose -Message "Using file [$ResolveFile] in section [$Section], using comments [$($Comment -join ', ')]"
                $IniContent = Get-Content -Path $ResolveFile
                $NewIniContent = @()
                $Inserted = $false
                if ($Section -eq '') {
                    $InSection = $true
                    foreach ($CurrentComment in $Comment) {
                        if ($CurrentComment -ne '') {
                            $NewIniContent += "; $CurrentComment"
                        }
                    }
                    $Inserted = $true
                }

                $IniContent | ForEach-Object -Process {
                    if ($InSection) {
                        if ($_ -match '^(\s*\[\s*)([\S\s+\S|\S]+)(\s*\]).*$') {
                            Write-Verbose -Message "Match section regex ($_)"
                            $InSection = $false
                            $NewIniContent += $_
                        } elseif ($ReplaceComment -and $_ -match '^\s*;.*$') {
                            Write-Verbose -Message "Replace comment true and matches comment ($_)"
                        } else {
                            Write-Verbose -Message "Match key/value pair ($_)"
                            $NewIniContent += $_
                        }
                    } else {
                        if ($_ -match '^(\s*\[\s*)([\S\s+\S|\S]+)(\s*\]).*$') {
                            $MatchSection = $matches[2].Trim()
                            if ($MatchSection -eq $Section) {
                                $InSection = $true
                                $NewIniContent += $_
                                foreach ($CurrentComment in $Comment) {
                                    if ($CurrentComment -ne '') {
                                        $NewIniContent += "; $CurrentComment"
                                    }
                                }
                                $Inserted = $true
                            } else {
                                $NewIniContent += $_
                            }
                        } else {
                            $NewIniContent += $_
                        }
                    }
                }
                if (-not $Inserted -and $CreateSection) {
                    $NewIniContent += "[$Section]"
                    foreach ($CurrentComment in $Comment) {
                        $CurrentComment = $CurrentComment.Trim()
                        $NewIniContent += "; $CurrentComment"
                    }
                    $Inserted = $true
                }
                Write-Output -InputObject $Inserted
                if ($Inserted) {
                    $NewIniContent | Set-Content -Path $ResolveFile
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
