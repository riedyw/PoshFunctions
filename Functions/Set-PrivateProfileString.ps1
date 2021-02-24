function Set-PrivateProfileString {
<#
.SYNOPSIS
    To set data in an .ini file
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
    are enveloped in square brackets. []
.PARAMETER Key
    The key within the section that you want to pull data from.
.PARAMETER Value
    The value you want saved at that key.
.PARAMETER CreateFile
    A switch that will create the File if it does not automatically exist.
.EXAMPLE
    Set-PrivateProfileString -File test2.ini -Section Section3 -Key Key5 -value 'New Value' -CreateFile

    Would put the following data into test2.ini
    [Section3]
    Key5=Newer Value
.NOTES
    # inspired by: http://powershell-scripting.com/index.php?option=com_joomlaboard&Itemid=76&func=view&view=threaded&id=24376&catid=5
    # also sourced at: https://gallery.technet.microsoft.com/Edit-old-fashioned-INI-f8fbc067?redir=0

    Some modifications have been made:
    * Error checking around file
    * Ability to take relative path to file
    * CreateFile switch to create ini if it doesn't exist
.OUTPUTS
    $null
#>

    [CmdletBinding(ConfirmImpact='Low')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions','')]
    param(
        [string] $File,

        [string] $Section,

        [string] $Key,

        [string] $Value,

        [switch] $CreateFile
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message 'Trimming parameters.'
        $Section = $Section.Trim()
        $Key = $Key.Trim()
        $Value = $Value.Trim()
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
                Write-Verbose -Message "Using file [$ResolveFile] in section [$Section], using key [$Key] setting value to [$Value]"
                $return = [ProfileApi]::WritePrivateProfileString($Section, $Key, $Value, $Resolvefile)
                if ($return -eq $false) {
                    Write-Error -Message "Could not write to file [$ResolveFile], probably permissions not valid, or file is read-only."
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
