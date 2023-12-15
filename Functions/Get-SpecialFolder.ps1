function Get-SpecialFolder {
<#
.SYNOPSIS
    Gets special folder name location
.DESCRIPTION
    Gets special folder name location. Function aliased to 'Show-SpecialFolder' for
    backward compatibility.
.PARAMETER Name
    The name of the special folder
.PARAMETER IncludeInput
    Switch to include the input in the output
.EXAMPLE
    Get-SpecialFolder -Name CommonDocuments -IncludeInput

    Would return
    SpecialFolder   Path
    -------------   ----
    CommonDocuments C:\Users\Public\Documents
.EXAMPLE
    Get-SpecialFolder -Name MyDocuments -IncludeInput

    Would return the following if logged in as 'SampleUser'
    SpecialFolder Path
    ------------- ----
    MyDocuments   C:\Users\SampleUser\Documents
#>

    [CmdletBinding(ConfirmImpact = 'None')]
    [alias('Show-SpecialFolder')] #FunctionAlias
    Param (
        [ValidateSet( 'AdminTools', 'ApplicationData', 'CDBurning',
            'CommonAdminTools', 'CommonApplicationData', 'CommonDesktopDirectory',
            'CommonDocuments', 'CommonMusic', 'CommonOemLinks', 'CommonPictures',
            'CommonProgramFiles', 'CommonProgramFilesX86', 'CommonPrograms',
            'CommonStartMenu', 'CommonStartup', 'CommonTemplates', 'CommonVideos',
            'Cookies', 'Desktop', 'DesktopDirectory', 'Favorites', 'Fonts', 'History',
            'InternetCache', 'LocalApplicationData', 'LocalizedResources', 'MyComputer',
            'MyDocuments', 'MyMusic', 'MyPictures', 'MyVideos', 'NetworkShortcuts',
            'Personal', 'PrinterShortcuts', 'ProgramFiles', 'ProgramFilesX86', 'Programs',
            'Recent', 'Resources', 'SendTo', 'StartMenu', 'Startup', 'System', 'SystemX86',
            'Templates', 'UserProfile', 'Windows' )]
        [string] $Name,

        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        if ($Name) {
            $SpecialFolders = [System.Enum]::GetNames([System.Environment+SpecialFolder]) | Where-Object {$_ -eq $Name}
        } else {
            $SpecialFolders = [System.Enum]::GetNames([System.Environment+SpecialFolder]) | Sort-Object
        }
        foreach ($curSpecial in $SpecialFolders) {
            if (-not $IncludeInput) {
                Write-Output -InputObject ([Environment]::GetFolderPath($curSpecial))
            } else {
                New-Object -TypeName psobject -Property ([ordered] @{
                    SpecialFolder = $curSpecial
                    Path = [Environment]::GetFolderPath($curSpecial)
                })
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
