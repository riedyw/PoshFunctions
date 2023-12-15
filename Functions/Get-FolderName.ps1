function Get-FolderName {
<#
.SYNOPSIS
    Gets a foldername through the native OpenFileDialog.
.DESCRIPTION
    Gets a foldername through the native OpenFileDialog. If user clicks 'OK' an [array] is returned, otherwise returns
    a $null if the dialog is canceled. Aliased function to 'Get-Folder' for backward compatibility
.PARAMETER Path
    String indicating the initial path selected in the dialog. Aliased to 'InitialDirectory', 'RootFolder'
.PARAMETER InitialDirectory
    The directory for the OpenFileDialog to start in. Defaults to $pwd.
    Aliased to 'Path'.
.PARAMETER NoNewFolder
    Switch which controls whether 'New folder' button appears in the dialog box.
.PARAMETER Title
    String indicating the Title of the dialog box. Defaults to 'Select a folder'
.EXAMPLE
    PS C:\> $Folder = Get-FolderName
    Will present a folderopen dialog box and save the selection to '$Folder'
.NOTES
    Inspiration: Part of the ISEColorThemeCmdlets.ps1 Script by Jeff Pollock
                http://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e
    # Source: https://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e
    # get-help about_ISE-Color-Theme-Cmdlets for more information
#>

    [CmdletBinding(ConfirmImpact = 'None')]
    [alias('Get-Folder')] #FunctionAlias
    [OutputType([string[]])]
    Param(
        [Alias('InitialDirectory', 'RootFolder')]
        [string] $Path = $pwd,

        [switch] $NoNewFolder,

        [Alias('Description')]
        [string] $Title = 'Select a folder'

    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        Add-Type -AssemblyName System.Windows.Forms

        $FolderBrowserDialog = New-Object -TypeName System.Windows.Forms.FolderBrowserDialog
        $FolderBrowserDialog.RootFolder = 'MyComputer'
        $FolderBrowserDialog.SelectedPath = $Path
        if ($NoNewFolder) { $FolderBrowserDialog.ShowNewFolderButton = $false }
        if ($Title) { $FolderBrowserDialog.Description = $Title }

        $Result = $FolderBrowserDialog.ShowDialog()

        # needed to play around to force PowerShell to return an array.
        if ($Result -eq 'OK') {
            [array] $ReturnArray = $FolderBrowserDialog.SelectedPath
            Write-Output -InputObject (, $ReturnArray)
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
