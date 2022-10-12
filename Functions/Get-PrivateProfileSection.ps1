function Get-PrivateProfileSection {
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
.PARAMETER AsString
    A switch that will output a string array as opposed to a hash table
.EXAMPLE
    Get-PrivateProfileSection -File test.ini -Section 'Section2' -Verbose

    Assuming .\test.ini has the following section within it:
    [Section2]
    Key3=Value3
    Key4 = Value4

    The function would return:
    VERBOSE: Starting Get-PrivateProfileSection
    VERBOSE: Getting value from file [C:\Program Files\WindowsPowerShell\Modules\MyFunctions\Functions\test.ini]
    VERBOSE: Getting value from section [section2]

    Name                           Value
    ----                           -----
    Key3                           Value3
    Key4                           Value4
    VERBOSE: Ending Get-PrivateProfileSection
.EXAMPLE
    Get-PrivateProfileSection -File test.ini -Section 'Section2' -AsString

    Assuming .\test.ini has the following section within it:
    [Section2]
    Key3=Value3
    Key4 = Value4

    The function would return:
    Key3=Value3
    Key4=Value4
.NOTES
    # inspired by: http://powershell-scripting.com/index.php?option=com_joomlaboard&Itemid=76&func=view&view=threaded&id=24376&catid=5
    # also sourced at: https://gallery.technet.microsoft.com/Edit-old-fashioned-INI-f8fbc067?redir=0

    Some modifications have been made:
    * Error checking around file
    * Ability to take relative path to file
    * Normally produce output as [hashtable], but -AsString switch will return a string array
    * Corrected logic to search for '\' and replace with '\\' if performing ConvertFrom-StringData
.OUTPUTS
    [hashtable] normally

    [string[]] with -AsString switch
#>

    [CmdletBinding()]
    param(
        [string] $File,
        [string] $Section,
        [switch] $AsString
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message 'Trimming parameters.'
        $Section = $Section.Trim()
    }

    process {
        if (Test-Path -Path $File) {
            $ResolveFile = Resolve-Path -Path $File
            if ($ResolveFile.count -gt 1) {
                Write-Error -Message "ERROR: File specification [$File] resolves to more than 1 file."
            } else {
                Write-Verbose -Message "Getting value from file [$ResolveFile]"
                Write-Verbose -Message "Getting value from section [$Section]"
                # Write-Verbose -Message "Getting value from key [$Key]"

                If ($AsString) {
                    $ReturnVal = [ProfileAPI]::GetSection($ResolveFile, $Section)
                } else {
                    $ReturnVal = [ProfileAPI]::GetSection($ResolveFile, $Section) -replace '\\', '\\' | ConvertFrom-StringData
                }

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
