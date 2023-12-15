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

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $Result = [System.Collections.ArrayList]::new()
        $tmpOption = [System.Collections.ArrayList]::new()
    }

    process {
        foreach ($curOption in $Option) {
            $null = $tmpOption.Add($curOption)
        }
    }

    end {
        $null = $Result.Add("`$$VariableName = ''")
        $null = $Result.Add("while (`$$VariableName -ne 'q') {")
        $null = $Result.Add("    Write-Host '$title'")
        $null = $Result.Add("    Write-Host '$('='*$title.length)'")
        $null = $Result.Add("    Write-Host ' '")
        for ($i = 0; $i -lt $tmpOption.count; $i++) {
            $null = $Result.Add("    Write-Host '$($i+1) - $($tmpOption[$i])'")
        }
        $null = $Result.Add("    Write-Host 'Q - Quit'")
        $null = $Result.Add("    Write-Host ' '")
        $null = $Result.Add("    `$$VariableName = Read-Host 'Selection'")
        $null = $Result.Add("    switch (`$$VariableName) {")
        $null = $Result.Add("        q { 'Exit message and code' }")
        #$Result += "             break }"
        for ($i = 0; $i -lt $tmpOption.count; $i++) {
            $null = $Result.Add("        $($i+1) { 'Option $($i+1) code' }")
        }
        $null = $Result.Add("        default { Write-Host 'Please enter a valid selection' }")
        $null = $Result.Add('    }')
        $null = $Result.Add('}')
        if ($TestMenu) {
            $tempFilename = Join-Path -Path $env:TEMP -ChildPath 'TestMenu.ps1'
            $Result | Out-File -FilePath $tempFilename
            & $tempFilename
            Remove-Item -Path $tempFilename
        } else {
            Write-Output -InputObject $Result
        }
        if ($Clipboard) {
            $Result | clip.exe
            Write-Warning -Message 'Menu logic copied to clipboard'
        }
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
