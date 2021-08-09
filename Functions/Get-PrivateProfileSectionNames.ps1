function Get-PrivateProfileSectionNames {
<#
.SYNOPSIS
    To get the section names out of an .ini file
.DESCRIPTION
    To get the section names out of an .ini file. .ini files are plain text that is categorized
    in section names. Within a section there are key, value pairs. An example .ini
    file content is as follows:

    [Section1]
    Key1=Data1
.PARAMETER File
    The path to the .ini file. Can be a relative path.
.EXAMPLE
    Assuming you have a file test2.ini that has the following content
    [Section3]
    Key5=Newer Value
    [Section1]
    Key1=Some data

    Get-PrivateProfileSectionNames -File test2.ini

    Section3
    Section1
.NOTES
    # inspired by: http://powershell-scripting.com/index.php?option=com_joomlaboard&Itemid=76&func=view&view=threaded&id=24376&catid=5
    # also sourced at: https://gallery.technet.microsoft.com/Edit-old-fashioned-INI-f8fbc067?redir=0

    Some modifications have been made:
    * Error checking around file
    * Ability to take relative path to file
.OUTPUTS
    [$string[]]
#>

    [CmdletBinding()]
    [OutputType([string[]])]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns','')]
    param(
        [string] $File
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        if (Test-Path -Path $File) {
            $ResolveFile = Resolve-Path -Path $File
            if ($ResolveFile.count -gt 1) {
                Write-Error -Message "ERROR: File specification [$File] resolves to more than 1 file."
            } else {
                Write-Verbose -Message "Getting section names from .ini file [$ResolveFile]"
                $ReturnVal = [ProfileAPI]::GetSectionNames($ResolveFile)
                Write-Output -InputObject $ReturnVal
            }
        } else {
            Write-Error -Message "ERROR: File [$File] does not exist"
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
