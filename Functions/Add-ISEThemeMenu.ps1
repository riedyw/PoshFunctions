# Source: https://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e
# get-help about_ISE-Color-Theme-Cmdlets for more information

Function Add-ISEThemeMenu {
<#
.SYNOPSIS
    Adds a theme to the ISE Theme menu
.DESCRIPTION
    Adds a theme to the ISE Theme menu
.PARAMETER MenuName
    The name as you want it to appear in the theme menu
.PARAMETER ShortcutDirectory
    Where you want it placed.
.EXAMPLE
    PS C:\> Add-ISEThemeMenu

    Blah
.INPUTS
    None are required, but you can use parameters to control behavior.
.OUTPUTS
    None.
.NOTES
    Author:      Bill Riedy
    Inspiration: Part of the ISEColorThemeCmdlets.ps1 Script by Jeff Pollock
                http://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e
    Changes:     Added parameter for MultiSelect of files. Forced function to always return an array. Filter is
                now a parameter that can be specified to control behavior. Changed InitialDirectory to default
                to $pwd and to give an alias of 'Path' which is commonly used parameter name.
                Also changed syntax to Add-Type -AssemblyName to conform with
                Powershell 2+ and to be more "Powershelly".
#>
    [CmdletBinding(ConfirmImpact='Low')]
    Param (
       [Parameter()] [ValidateNotNullOrEmpty()]
       [string] $MenuName,

       [Parameter()] [ValidateNotNullOrEmpty()]
       [string] $ShortcutDirectory
    )

    Process {
        $parentAdded = $psISE.CurrentPowerShellTab.AddOnsMenu.SubMenus.Add('ISE Color Themes',$null,$null)

        $Functions = @()

        $OutputObj  = New-Object -TypeName PSObject
        $OutputObj | Add-Member -MemberType NoteProperty -Name 'FunctionName' -Value 'Theme Selector'
        $OutputObj | Add-Member -MemberType NoteProperty -Name 'Scriptblock'  -Value 'Select-ISETheme' #ShortcutKey "ALT+SHIFT+W"
        $OutputObj | Add-Member -MemberType NoteProperty -Name 'ShortcutKey'  -Value 'CTRL+ALT+SHIFT+T'
        $Functions += $OutputObj

        $Options = 'darker|lighter|warmer|cooler|greener'
        $OptionArray = $Options.Split('|')

        $ShortcutKey = 0

        $optionArray | ForEach-Object {
            $OutputObj  = New-Object -TypeName PSObject
            $OutputObj | Add-Member -MemberType NoteProperty -Name 'FunctionName' -Value "Set $_"
            $OutputObj | Add-Member -MemberType NoteProperty -Name 'Scriptblock'  -Value "Set-ISEColor -$_" #ShortcutKey "ALT+SHIFT+W"
            $OutputObj | Add-Member -MemberType NoteProperty -Name 'ShortcutKey'  -Value "ALT+SHIFT+$ShortcutKey"
            $Functions += $OutputObj

            $ShortcutKey += 1
        }

        $Functions | foreach-object {
            $global:functionname = $_.FunctionName.ToString()
            $sb=$executioncontext.InvokeCommand.NewScriptBlock($_.Scriptblock)
            $parentAdded.Submenus.Add($functionname,$sb,$_.ShortcutKey) | out-null
        }

        If (!(Test-Path -Path 'HKCU:\Software\Microsoft\PowerShell\3\Hosts\PowerShellISE\ColorThemes')) {
            New-Item -Path 'HKCU:\Software\Microsoft\PowerShell\3\Hosts\PowerShellISE' -Name ColorThemes -Force | out-null
        }

        $ThemeMenu = $ParentAdded.SubMenus.Add('Imported Themes',$null,$null)
        $Themes = @()
        $ImportedThemes = Get-ImportedISETheme

        $ImportedThemes | ForEach-Object {
            $OutputObj  = New-Object -TypeName PSObject
            $OutputObj | Add-Member -MemberType NoteProperty -Name 'FunctionName' -Value $_.ThemeName
            $OutputObj | Add-Member -MemberType NoteProperty -Name 'Scriptblock' -Value "Set-ISETheme -ThemeName $($_.ThemeName)"
            $Themes += $OutputObj
        }

        $OutputObj  = New-Object -TypeName PSObject
        $OutputObj | Add-Member -MemberType NoteProperty -Name 'FunctionName' -Value 'Import CSE Themes'
        $OutputObj | Add-Member -MemberType NoteProperty -Name 'Scriptblock' -Value 'Import-GroupISETheme'
        $Themes += $OutputObj

        $Themes | foreach-object {
            $global:functionname = $_.FunctionName.ToString()
            $sb=$executioncontext.InvokeCommand.NewScriptBlock($_.Scriptblock)
            $ThemeMenu.Submenus.Add($functionname,$sb,$null) | out-null
        }
    }
} #EndFunction Add-ISEThemeMenu
