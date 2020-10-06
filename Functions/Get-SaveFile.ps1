    # Source: https://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e
    # get-help about_ISE-Color-Theme-Cmdlets for more information

Function Get-SaveFile {
<#
.SYNOPSIS
    Gets a filename through the native SaveFileDialog.
.DESCRIPTION
    Gets a filename through the native SaveFileDialog. Can select a single file, or type a
    file name in the text entry field.
    If user clicks 'OK' an [array] is returned, otherwise returns a $null if the dialog is canceled.
.PARAMETER InitialDirectory
    The directory for the SaveFileDialog to start in. Defaults to $pwd.
    Aliased to 'Path'.
.PARAMETER OverwritePrompt
    Determines whether dialog box will warn if you select an already existing file. Defaults to $true.
    Aliased to 'Overwrite'.
.PARAMETER Filter
    A character string delimited with pipe '|' character. Each 'token' in the string follows the form
    'Description|FileSpec'. Multiple 'tokens' can be in the string and they too are separated
    by the pipe character. Defaults to 'All files|*.*'.
.EXAMPLE
    PS C:\> $File = Get-SaveFile
    Will present a savefile dialog box where only a single file can be selected and the savefile
    dialog box will start in the current directory. Assigns selected file to the 'File' variable.
.EXAMPLE
    PS C:\> $File = Get-SaveFile -Filter 'Powershell files|*.ps1|All files|*.*'
    Will present a savefile dialog box and will start in the current directory. There will be a drop down list box in lower right
    where the user can select 'Powershell files' or 'All files' and the files listed will change.
    Assigns selected file(s) to the 'File' variable.
.EXAMPLE
    PS C:\> $File = Get-SaveFile -InitialDirectory 'C:\Temp'
    Will present a savefile dialog box where a file can be selected and the savefile
    dialog box will start in the C:\Temp directory. Assigns selected file(s) to the 'File' variable.
.EXAMPLE
    PS C:\> Get-SaveFile | get-childitem
    Pipes selected filename to the get-childitem cmdlet.
.EXAMPLE
    PS C:\> $File = Get-SaveFile -OverwritePrompt:$false
    Will present a savefile dialog box where a file can be selected and the savefile
    dialog box will start in the current directory. If you select an existing file it
    not prompt that the file will be overwritten. Assigns selected file(s) to the 'File' variable.
.INPUTS
    None are required, but you can use parameters to control behavior.
.OUTPUTS
    [array]     If user selects a file, or enters a new filename in the text entry box
                and clicks 'OK'. Will return an array with a .Count property.
                Each element in the array will be the file selected or entered.
    $null       If the user clicks 'Cancel'.
.NOTES
    Inspiration: Part of the ISEColorThemeCmdlets.ps1 Script by Jeff Pollock
                 http://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e
    Changes:     Added parameter for OverwritePrompt for files selected. Forced function
                 to always return an array. Filter is now a parameter that can be specified
                 to control behavior. Changed InitialDirectory to default to $pwd and to give
                 an alias of 'Path' which is commonly used parameter name.
                 Also changed syntax to Add-Type -AssemblyName to conform with
                 Powershell 2+ and to be more "Powershelly".
#>

    #region parameter
    [CmdletBinding(ConfirmImpact='None')]
    Param(
        [parameter(Mandatory=$false)]
        [alias('Path')]
        [string] $InitialDirectory = "$pwd", #default

        [parameter(Mandatory=$false)]
        [alias('Overwrite')]
        [bool] $OverwritePrompt = $true, #default

        [parameter()]
        [string] $Filter = 'All files|*.*', #default

        [parameter()]
        [string] $Title,

        [parameter()]
        [switch] $AddExtension,

        [parameter()]
        [string] $DefaultExt

    )
    #endregion parameter

    begin {

    }

    process {
        Add-Type -AssemblyName System.Windows.Forms

        $SaveFileDialog = New-Object -typename System.Windows.Forms.SaveFileDialog
        $SaveFileDialog.InitialDirectory = $InitialDirectory
        $SaveFileDialog.Filter           = $Filter
        $SaveFileDialog.OverwritePrompt  = $OverwritePrompt
        if ($Title) { $SaveFileDialog.Title = $Title }
        if ($DefaultExt) { $SaveFileDialog.DefaultExt = $DefaultExt }
        if ($AddExtension) { $SaveFileDialog.AddExtension = $true }
        $Result = $SaveFileDialog.ShowDialog()

        # needed to play around to force PowerShell to return an array.
        if ($Result -eq 'OK') {
            [array] $ReturnArray = $SaveFileDialog.FileName
            write-output -inputobject (,$ReturnArray)
        } else {
            # nothing to return
        }
    }

    end {

    }

} #end function Get-SaveFile
