function Write-TextMenu {
<#
.SYNOPSIS
    Creates the logic for a new simple text based menu. Originally published as script New-TextMenu in the PowerShellGallery
.DESCRIPTION
    Creates the logic for a new simple text based menu. Originally published as script New-TextMenu in the PowerShellGallery
.PARAMETER Option
    An array of [string] indicating the menu options. If you need to create a menu with a single option enclose the option in @().
.PARAMETER Title
    The title of the menu. Defaults to 'Menu Title'.
.PARAMETER VariableName
    The name of the choice variable. Defaults to 'Choice'.
.PARAMETER TestMenu
    If this switch is enabled then the menu is saved to a temporary file and run.
.PARAMETER Clipboard
    If this switch is enabled then the menu logic is copied to the clipboard.
.NOTES
    * The resulting output is a relatively small string array so the shorthand way of adding
      to an array ( += ) is used.
    * Removed extraneous temporary file.
    * Cleaned up formatting.
    * Only set of parameters so removing ParameterSetName and DefaultParameterSetName
.EXAMPLE
    Write-TextMenu -Title 'Menu Title' -Option 'One', 'Two', 'Three'
    Creates a 3 option menu.
.EXAMPLE
    Write-TextMenu -Title 'My Menu' -Option 'One' -VariableName 'Choice2'

    Creates a 1 option menu that looks like:

$Choice2 = ''
while ($Choice2 -ne 'q') {
    Write-Host 'My Menu'
    Write-Host '======='
    Write-Host ' '
    Write-Host '1 - One'
    Write-Host 'Q - Quit'
    Write-Host ' '
    $Choice2 = Read-Host 'Selection'
    switch ($Choice2) {
        q { 'Exit message and code' }
        1 { 'Option 1 code' }
        default { Write-Host 'Please enter a valid selection' }
    }
}
.EXAMPLE
    Write-TextMenu -Option 'Uno'

    Creates a 1 option menu that looks like:

$Choice = ''
while ($Choice -ne 'q') {
    Write-Host 'Menu Title'
    Write-Host '=========='
    Write-Host ' '
    Write-Host '1 - Uno'
    Write-Host 'Q - Quit'
    Write-Host ' '
    $Choice = Read-Host 'Selection'
    switch ($Choice) {
        q { 'Exit message and code' }
        1 { 'Option 1 code' }
        default { Write-Host 'Please enter a valid selection' }
    }
}
.OUTPUTS
    [string[]]
.LINK
    about_while
    Write-Host
    Read-Host
    about_switch
#>

    #region Parameter
    [cmdletbinding(ConfirmImpact = 'Low')]
    [OutputType([string[]])]
    Param(
        [Parameter(Mandatory, HelpMessage = 'Enter the text of the menu option.', Position = 0, ValueFromPipeline = $True)]
            [string[]] $Option,
        [Parameter(Position = 1)]
            [string] $Title = 'Menu Title',
        [Parameter(Position = 2)]
            [string] $VariableName = 'Choice',
        [Parameter()]
            [switch] $TestMenu,
        [Parameter()]
            [switch] $Clipboard
        )
    #endregion Parameter

    $result = [string[]] @()
    $result += "`$$VariableName = ''"
    $result += "while (`$$VariableName -ne 'q') {"
    $result += "    Write-Host '$title'"
    $result += "    Write-Host '$('='*$title.length)'"
    $result += "    Write-Host ' '"
    for ($i = 0; $i -lt $option.count; $i++) {
        $result += "    Write-Host '$($i+1) - $($option[$i])'"
    }
    $result += "    Write-Host 'Q - Quit'"
    $result += "    Write-Host ' '"
    $result += "    `$$VariableName = Read-Host 'Selection'"
    $result += "    switch (`$$VariableName) {"
    $result += "        q { 'Exit message and code' }"
    #$result += "             break }"
    for ($i = 0; $i -lt $option.count; $i++) { $result += "        $($i+1) { 'Option $($i+1) code' }" }
    $result += "        default { Write-Host 'Please enter a valid selection' }"
    $result += '    }'
    $result += '}'

    if ($TestMenu) {
        $tempFilename = New-TemporaryFile
        Remove-Item $tempFilename
        $tempFilename = $tempFilename.Directory.ToString() + '\' + $tempFilename.BaseName + ''
        $result > $tempFilename
        & $tempFilename
        Remove-Item $tempFilename
    }
    else {
        $result
    }
    if ($Clipboard) {
        $result | clip.exe
        Write-Host 'Menu logic copied to clipboard' -Foreground cyan
    }
}
# EOF Write-TextMenu
