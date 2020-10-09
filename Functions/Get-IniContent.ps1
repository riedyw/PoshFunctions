Function Get-IniContent {
<#
.SYNOPSIS
    Gets the content of an INI file

.DESCRIPTION
    Gets the content of an INI file and returns it as a hashtable

.NOTES
    Author        : Oliver Lipkau <oliver@lipkau.net>
    Blog        : http://oliver.lipkau.net/blog/
    Source        : https://github.com/lipkau/PsIni
                    http://gallery.technet.microsoft.com/scriptcenter/ea40c1ef-c856-434b-b8fb-ebd7a76e8d91
    Version        : 1.0 - 2010/03/12 - Initial release
                    1.1 - 2014/12/11 - Typo (Thx SLDR)
                                        Typo (Thx Dave Stiff)

    #Requires -Version 2.0

.INPUTS
    System.String

.OUTPUTS
    System.Collections.Hashtable

.PARAMETER FilePath
    Specifies the path to the input file.

.EXAMPLE
    $FileContent = Get-IniContent "C:\myinifile.ini"
    -----------
    Description
    Saves the content of the c:\myinifile.ini in a hashtable called $FileContent

.EXAMPLE
    $inifilepath | $FileContent = Get-IniContent
    -----------
    Description
    Gets the content of the ini file passed through the pipe into a hashtable called $FileContent

.EXAMPLE
    C:\PS>$FileContent = Get-IniContent "c:\settings.ini"
    C:\PS>$FileContent["Section"]["Key"]
    -----------
    Description
    Returns the key "Key" of the section "Section" from the C:\settings.ini file

.LINK
    Out-IniFile
#>

    [CmdletBinding()]
    Param(
        [ValidateNotNullOrEmpty()]
        [ValidateScript( {(Test-Path -Path $_) -and ((Get-Item -Path $_).Extension -eq '.ini')})]
        [Parameter(Mandatory,HelpMessage='Add help message for user')]
        [string] $FilePath
    )

    begin {
        Write-Verbose -Message "$($MyInvocation.MyCommand.Name):: Function started"
        $ini = [ordered] @{}
    }

    process {
        Write-Verbose -Message "$($MyInvocation.MyCommand.Name):: Processing file: $Filepath"

        $filecontent = get-content -Path $FilePath
        $filecontent | foreach-object {
            $curLine = $_
            if ($curLine -match '^\s*\[(.+)\]\s*$') { # Section
                $section = $matches[1].Trim()
                $ini[$section] = [ordered] @{}
                $CommentCount = 0
            }
            if ($curLine -match '^\s*(;.*)$') { # Comment
                write-verbose -Message "there is a comment and section is [$($section)]"
                if (!($section)) {
                    write-verbose -Message 'no section so creating one'
                    $section = 'NoSection'
                    $ini[$section] = [ordered] @{}
                    $CommentCount = 0
                }
                $value = $matches[1]
                $CommentCount = $CommentCount + 1
                $name = 'Comment' + $CommentCount
                $ini[$section][$name] = $value
            }
            if ($curLine -match '(.+?)\s*=\s*(.*)') { # Key
                if (!($section)) {
                    $section = 'NoSection'
                    $ini[$section] = [ordered] @{}
                    $CommentCount = 0
                }
                $name = $matches[1].Trim()
                $value = $matches[2].Trim()
                $ini[$section][$name] = $value
            }
        }

        <#
        switch -regex -file $FilePath
        {
            "^\s*\[(.+)\]\s*$" # Section
            {
                $section = $matches[1].Trim()
                $ini[$section] = @{}
                $CommentCount = 0
            }
            "^\s*(;.*)$" # Comment
            {
                write-verbose "there is a comment and section is [$($section)]"
                if (!($section))
                {
                    write-verbose 'no section so creating one'
                    $section = "NoSection"
                    $ini[$section] = @{}
                    $CommentCount = 0
                }
                $value = $matches[1]
                $CommentCount = $CommentCount + 1
                $name = "Comment" + $CommentCount
                $ini[$section][$name] = $value
            }
            "(.+?)\s*=\s*(.*)" # Key
            {
                if (!($section))
                {
                    $section = "NoSection"
                    $ini[$section] = @{}
                    $CommentCount = 0
                }
                $name = $matches[1].Trim()
                $value = $matches[2].Trim()
                $ini[$section][$name] = $value
            }
        }

 #>

        Write-Verbose -Message "$($MyInvocation.MyCommand.Name):: Finished Processing file: $FilePath"

    }

    End {
        Write-Verbose -Message "$($MyInvocation.MyCommand.Name):: Function ended"
        write-output -InputObject $ini
    }
}
