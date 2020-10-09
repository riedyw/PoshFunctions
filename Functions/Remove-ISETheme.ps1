# Source: https://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e
# get-help about_ISE-Color-Theme-Cmdlets for more information

Function Remove-ISETheme {
<#
.SYNOPSIS
    Deletes an ISE theme from the ISE.

.DESCRIPTION
    Deletes an ISE theme from the ISE.

.PARAMETER ThemeName
    An ISE theme name

.EXAMPLE
    PS C:\> Remove-ISETheme "Monokai"

    Deletes an ISE theme from the ISE

.NOTES
    Part of the ISEColorThemeCmdlets.ps1 Script by Jeff Pollock
    http://Lifeinpowerhsell.blogspot.com
    http://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e
#>

[CmdletBinding(ConfirmImpact='Low')]
    Param(
        [Parameter(ValueFromPipeline,ValueFromPipelinebyPropertyName)]
        [string] $ThemeName
    )

    Begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    Process {
        Remove-ItemProperty -Path HKCU:\Software\Microsoft\PowerShell\3\Hosts\PowerShellISE\ColorThemes -Name $ThemeName
    }

    End {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

} #end function Remove-ISETheme
