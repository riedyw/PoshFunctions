# Source: https://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e
# get-help about_ISE-Color-Theme-Cmdlets for more information

Function Import-ISEThemeFile {
<#
.SYNOPSIS
    Imports an ISE theme XML file into the registry.

.DESCRIPTION
    Imports an ISE theme xml file into the registry and applies it
    to the current session if ApplyTheme is passed

.PARAMETER File
    An ISE theme xml filename

.PARAMETER ApplyTheme
    Switch for applying the theme after importing it.

.EXAMPLE
    PS C:\> Import-ISEThemeFile "C:\ISEthemes\.StorableColorTheme.ps1xml"

    Imports ISE theme to the registry

.EXAMPLE
    PS C:\> Get-FileName | Import-ISEThemeFile -ApplyTheme

    Imports piped in ISE theme to the registry and applies the theme to the current session

.NOTES
    Part of the ISEColorThemeCmdlets.ps1 Script by Jeff Pollock
    http://Lifeinpowerhsell.blogspot.com
    http://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e
#>

[CmdletBinding(ConfirmImpact='None')]
    Param(
        [Parameter(Mandatory,HelpMessage='Add help message for user',ValueFromPipeline,ValueFromPipelinebyPropertyName)]
        [object] $FileName,

        [Parameter()]
        [switch] $ApplyTheme
    )

    Begin{}

    Process {
        # Get fullname if gci object passed
        If ($FileName.FullName) {
            [string] $FileName = $FileName.FullName
        }

        #-Create xml variable from file name
        [xml] $xml = get-content -Path $FileName
        #Create xml string variable from file name
        [string] $xmlString = get-content -Path $FileName

        #-Get theme name for registry value name
        $ThemeName = $xml.StorableColorTheme.Name

        #-Set value data to the xml string
        Set-ItemProperty -Path 'HKCU:\Software\Microsoft\PowerShell\3\Hosts\PowerShellISE\ColorThemes' -Name $ThemeName -Value $xmlString -Type String

        #-Apply theme to current session if called
        If ($ApplyTheme) {
            Set-ISETheme -ThemeName $ThemeName
        }
    }

    End{}

} #end function Import-ISEThemeFile
