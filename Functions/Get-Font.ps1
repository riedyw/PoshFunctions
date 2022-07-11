function Get-Font {
<#
.SYNOPSIS
    Gets the fonts currently loaded on the system
.DESCRIPTION
    Uses the type System.Windows.Media.Fonts static property SystemFontFamilies,
    to retrieve all of the fonts loaded by the system.  If the Fonts type is not found,
    the PresentationCore assembly will be automatically loaded
.PARAMETER Font
    A wildcard to search for font names
.EXAMPLE
    # Get All Fonts
    Get-Font
.EXAMPLE
    # Get All Lucida Fonts
    Get-Font *Lucida*
.NOTES
    Slight code fix in Where-Object logic. Previously it would return zero results
#>

    [CmdletBinding(ConfirmImpact = 'None')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter', '')]
    param(
        [string] $Font = ''
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        if (-not ('Windows.Media.Fonts' -as [Type])) {
            $null = Add-Type -AssemblyName 'PresentationCore'
        }
        $null = Add-Type -AssemblyName System.Drawing
        $FontList = (New-Object -TypeName System.Drawing.Text.InstalledFontCollection).Families.Name
        $FontList = $FontList | Sort-Object | Select-Object -Unique
        $FontList | Where-Object { $_ -like "*$Font*" }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
