Function Get-Font {
<#
.SYNOPSIS
    Gets the fonts currently loaded on the system
.DESCRIPTION
    Uses the type System.Windows.Media.Fonts static property SystemFontFamilies,
    to retrieve all of the fonts loaded by the system.  If the Fonts type is not found,
    the PresentationCore assembly will be automatically loaded
.PARAMETER font
    A wildcard to search for font names
.EXAMPLE
    # Get All Fonts
    Get-Font
.EXAMPLE
    # Get All Lucida Fonts
    Get-Font *Lucida*
#>

    # fixme invalid behavior in pwsh

    [CmdletBinding(ConfirmImpact='None')]
    param(
        [string] $font = ''
    )

    if (-not ('Windows.Media.Fonts' -as [Type])) {
        Add-Type -AssemblyName 'PresentationCore'
    }
    #[Windows.Media.Fonts]::SystemFontFamilies |
    #    Where-Object { $_.Source -like "$font" }
    # $FontList1 = [Windows.Media.Fonts]::SystemFontFamilies.Source
    $null =  [System.Reflection.Assembly]::LoadWithPartialName('System.Drawing')
    $FontList2 = (New-Object -typename System.Drawing.Text.InstalledFontCollection).Families.Name
#    $FontList = $FontList1 + $FontList2 | sort-object | select-object -unique
# The first method of getting fonts returns values that can NOT be picked from drop down list box of Word.
    $FontList = $FontList2 | sort-object | select-object -unique
    $FontList | where-object { $_ -match "$font" }
} #EndFunction Get-Font
