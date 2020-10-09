# Source: https://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e
# get-help about_ISE-Color-Theme-Cmdlets for more information

Function Get-ImportedISETheme {
<#
.SYNOPSIS
    Returns imported themes.

.DESCRIPTION
    Returns imported themes from the registry

.EXAMPLE
    PS C:\> $Themes = Get-ImportedISETheme

    Gets the imported ISE themes from the registry and assigns it to Themes

.NOTES
    Part of the ISEColorThemeCmdlets.ps1 Script by Jeff Pollock
    http://Lifeinpowerhsell.blogspot.com
    http://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e
#>

    #-Get theme values from registry
    $Themes = Get-Item -path HKCU:\Software\Microsoft\PowerShell\3\Hosts\PowerShellISE\ColorThemes | Select-Object -ExpandProperty Property

    #-Get name and xml content and return it as an object
    $Themes | ForEach-Object {
        $ThemeName = $_
        $Theme = Get-ItemProperty -path HKCU:\Software\Microsoft\PowerShell\3\Hosts\PowerShellISE\ColorThemes -Name $ThemeName
        $Theme | ForEach-Object {
            $xml = $_.$ThemeName
        }

        $hash = @{ ThemeName = $_; XML = $xml }
        $Object = New-Object -typename PSObject -Property $hash
        $Object

    }

} #end function Get-ImportedISETheme
