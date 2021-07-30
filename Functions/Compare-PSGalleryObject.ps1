function Compare-PSGalleryObject {
<#
.SYNOPSIS
    Compares the installed module(s) or script(s) that have been installed from PowerShellGallery.com
.DESCRIPTION
    Compares the installed module(s) or script(s) that have been installed from PowerShellGallery.com. You can enter an object name with wildcards. Optionally you can choose to only see those objects that need to be upgraded. Defaults to searching for modules.
.PARAMETER Name
    An optional parameter indicating the name of the object you are looking for. Wildcards are acceptable.
.PARAMETER Module
    A switch indicating the function should just return modules. This is the default behavior.
.PARAMETER Script
    A switch indicating the function should just return scripts.
.PARAMETER NeedUpgrade
    A switch indicating the function should only return those objects that need to be upgraded
.PARAMETER AllowPrerelease
    A switch that will search PSGallery for prerelease versions
.EXAMPLE
    Compare-PSGalleryObject -Name *Functions

    Would only return those modules that end with the string 'Functions'
.EXAMPLE
    Compare-PSGalleryObject -Name New-TextMenu -Script

    Would return the state of the installed script 'New-TextMenu'
.NOTES
    Does NOT appear to work properly in pwsh

    Inspired by Get-ModuleVersionInformation at: https://tfl09.blogspot.com/2018/07/keeping-powershell-modules-up-to-date.html

    Changes:
    * renamed function to Compare-PSGalleryObject
    * switches to search for either Module or Script object types, -Module or -Script
    * switch to display only those objects needing to be upgraded, -NeedUpgrade
    * comment based help
    * write-verbose statements
    * added -AllowPrerelease to Find-Module / Find-Script statements
#>

    #region parameter
    [CmdletBinding(DefaultParameterSetName = 'Module', ConfirmImpact = 'None')]
    [OutputType('psobject')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter', '')]
    Param (

        [Parameter(ParameterSetName = 'Module')]
        [Parameter(ParameterSetName = 'Script')]
        [string] $Name = '*',

        [Parameter(ParameterSetName = 'Module')]
        [switch] $Module,

        [Parameter(ParameterSetName = 'Script')]
        [switch] $Script,

        [Parameter(ParameterSetName = 'Module')]
        [Parameter(ParameterSetName = 'Script')]
        [switch] $NeedUpgrade,

        [Parameter(ParameterSetName = 'Module')]
        [Parameter(ParameterSetName = 'Script')]
        [switch] $AllowPrerelease

    )
    #endregion parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "ParameterSetName [$($PsCmdlet.ParameterSetName)]"
        switch ($PsCmdlet.ParameterSetName) {
            'Module' {
                Write-Verbose -Message 'Searching for object type MODULE'
            }
            'Script' {
                Write-Verbose -Message 'Searching for object type SCRIPT'
            }
        }
        Write-Verbose -Message "Finding installed objects that match name [$Name]. A '*' within the brackets indicates all objects."
        Write-Verbose -Message "Searching for just those objects that need an upgrade [$NeedUpgrade]"
    }

    process {
        switch ($PsCmdlet.ParameterSetName) {
            'Module' {
                Write-Verbose -Message 'Getting modules installed from PSGallery'
                $Objects = Get-InstalledModule -Name $Name -Verbose:$False | Where-Object { $_.Repository -eq 'PSGallery' }
                Write-Verbose -Message ('{0} modules locally that match [{1}]' -f $Objects.count, $Name)
                foreach ($Object in $Objects) {
                    Write-Verbose -Message "Processing $($Object.name)"
                    $UpdateObject = [ordered] @{}
                    $UpdateObject.ObjectType = 'Module'
                    $UpdateObject.Name = $Object.Name
                    $UpdateObject.InstalledVersion = $Object.Version
                    try {
                        #  Find module, and add gallery version number to hash table
                        if ($AllowPrerelease) {
                            $GalObj = Find-Module -Name $Object.name -Repository PSGallery -ErrorAction Stop -AllowPrerelease
                        } else {
                            $GalObj = Find-Module -Name $Object.name -Repository PSGallery -ErrorAction Stop
                        }

                        $UpdateObject.PSGalleryVersion = $GalObj.Version | Sort-Object -Descending | Select-Object -First 1
                    }
                    # here - find module could not find the module in the gallery
                    catch {
                        # If module isn't in the gallery
                        $UpdateObject.PSGalleryVersion = [version]::new(0, 0)
                    }
                    # now emit the object
                    if ($NeedUpgrade) {
                        New-Object -TypeName PSObject -Property $UpdateObject | Where-Object { $_.InstalledVersion -ne $_.PSGalleryVersion }
                    } else {
                        New-Object -TypeName PSObject -Property $UpdateObject
                    }
                }
            }
            'Script' {
                Write-Verbose -Message 'Getting scripts installed from PSGallery'
                $Objects = Get-InstalledScript -Name $Name -Verbose:$False | Where-Object { $_.Repository -eq 'PSGallery' }
                Write-Verbose -Message ('{0} scripts locally that match [{1}]' -f $Objects.count, $Name)
                Foreach ($Object in $Objects) {
                    Write-Verbose -Message "Processing $($Object.name)"
                    $UpdateObject = [ordered] @{}
                    $UpdateObject.ObjectType = 'Script'
                    $UpdateObject.Name = $Object.Name
                    $UpdateObject.InstalledVersion = $Object.Version
                    try {
                        #  Find module, and add gallery version number to hash table
                        if ($AllowPrerelease) {
                            $GalObj = Find-Script -Name $Object.name -Repository PSGallery -ErrorAction Stop -AllowPrerelease
                        } else {
                            $GalObj = Find-Script -Name $Object.name -Repository PSGallery -ErrorAction Stop
                        }
                        $UpdateObject.PSGalleryVersion = $GalObj.Version | Sort-Object -Descending | Select-Object -First 1
                    }
                    # here - find module could not find the module in the gallery
                    catch {
                        # If module isn't in the gallery
                        $UpdateObject.PSGalleryVersion = [version]::new(0, 0)
                    }
                    # now emit the object
                    if ($NeedUpgrade) {
                        New-Object -TypeName PSObject -Property $UpdateObject | Where-Object { $_.InstalledVersion -ne $_.PSGalleryVersion }
                    } else {
                        New-Object -TypeName PSObject -Property $UpdateObject
                    }
                }
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
