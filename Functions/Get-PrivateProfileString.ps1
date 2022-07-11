function Get-PrivateProfileString {
<#
.SYNOPSIS
    To get data out of an .ini file
.DESCRIPTION
    To get data out of an .ini file. .ini files are plain text that is categorized
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
.PARAMETER IncluddeInput
    A switch that will display all the original input. Aliased to 'IncluddeOriginal' for backward compatibility
.EXAMPLE
    Get-PrivateProfileString -File .\Test.ini -Section 'Section1' -Key 'Key1'

    Data1
.EXAMPLE
    Get-PrivateProfileString -File .\NonexistentFile.ini -Section 'Section1' -Key 'Key1'

    Get-PrivateProfileString : ERROR: File [.\NonexistentFile.ini] does not exist
.EXAMPLE
    Get-PrivateProfileString -File c:\Temp\Test.ini -Section 'Section1' -Key 'Key1' -IncludeInput

    FileName         Section  Key  Value
    --------         -------  ---  -----
    C:\Temp\Test.ini Section1 Key1 Data1
.NOTES
    # inspired by: http://powershell-scripting.com/index.php?option=com_joomlaboard&Itemid=76&func=view&view=threaded&id=24376&catid=5
    # also sourced at: https://gallery.technet.microsoft.com/Edit-old-fashioned-INI-f8fbc067?redir=0

    Some modifications have been made:
    * Error checking around file
    * Ability to take relative path to file
#>

    [CmdletBinding()]
    param(
        [string] $File,

        [string] $Section,

        [string] $Key,

        [alias('IncludeOriginal')]
        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message 'Trimming parameters.'
        $Section = $Section.Trim()
        $Key = $Key.Trim()
    }

    process {
        if (Test-Path -Path $File) {
            $ResolveFile = Resolve-Path -Path $File
            if ($ResolveFile.count -gt 1) {
                Write-Error -Message "ERROR: File specification [$File] resolves to more than 1 file."
            } else {
                Write-Verbose -Message "Getting value from file [$ResolveFile]"
                Write-Verbose -Message "Getting value from section [$Section]"
                Write-Verbose -Message "Getting value from key [$Key]"

                $sb = New-Object -TypeName System.Text.StringBuilder -ArgumentList (256)
                $null = [ProfileApi]::GetPrivateProfileString($Section, $Key, $null, $sb, $sb.Capacity, $ResolveFile)

                if ($IncludeInput) {
                    New-Object -TypeName 'psobject' -Property ([ordered] @{
                        FileName = $ResolveFile
                        Section  = $Section
                        Key      = $Key
                        Value    = $sb.ToString()
                    })
                } else {
                    Write-Output -InputObject $sb.ToString()
                }
            }

        } else {
            Write-Error -Message "ERROR: File [$file] does not exist"
        }

    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
