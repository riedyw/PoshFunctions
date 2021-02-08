Function Compare-PSGalleryObject {
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
.EXAMPLE
    Compare-PSGalleryObject -Name *Functions

    Would only return those modules that end with the string 'Functions'
.EXAMPLE
    Compare-PSGalleryObject -Name New-TextMenu -Script

    Would return the state of the installed script 'New-TextMenu'
.NOTES
    Inspired by Get-ModuleVersionInformation at: https://tfl09.blogspot.com/2018/07/keeping-powershell-modules-up-to-date.html

    Changes:
    * renamed function to Compare-PSGalleryObject
    * switches to search for either Module or Script object types
    * switch to display only those objects needing to be upgraded
    * comment based help
    * write-verbose statements
#>

    #region parameter
    [CmdletBinding(DefaultParameterSetName = 'Module',ConfirmImpact='None')]
    [OutputType('psobject')]
    Param
    (

        [Parameter(ParameterSetName = 'Module')]
        [Parameter(ParameterSetName = 'Script')]
        [string] $Name = '*',

        [Parameter(ParameterSetName = 'Module')]
        [switch] $Module,

        [Parameter(ParameterSetName = 'Script')]
        [switch] $Script,

        [Parameter(ParameterSetName = 'Module')]
        [Parameter(ParameterSetName = 'Script')]
        [switch] $NeedUpgrade

    )
    #endregion parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "ParameterSetName [$($PsCmdlet.ParameterSetName)]"
        switch ($PsCmdlet.ParameterSetName) {
            'Module' { 
                Write-Verbose "Searching for object type MODULE"
            }
            'Script' { 
                Write-Verbose "Searching for object type SCRIPT"
            }
        }

        Write-Verbose -Message "Finding installed objects that match name [$Name]. A '*' within the brackets indicates all objects."
        Write-Verbose -Message "Searching for just those objects that need an upgrade [$NeedUpgrade]"
    }

    process {
        switch ($PsCmdlet.ParameterSetName) {
            'Module' {
                $Objects  = Get-InstalledModule -Verbose:$False | Where-Object { $_.Name -like $Name }
                Write-Verbose -Message ('{0} modules locally that match [{1}]' -f $Objects.count, $Name)
                Foreach ($Object in $Objects) {
                    Write-Verbose -Message "Processing $($Object.name)"
                    
                    $UpdateObject         = [ordered] @{}    # create the hash table
                    $UpdateObject.ObjectType = 'Module'
                    $UpdateObject.Name    = $Object.Name     # Add name
                    $UpdateObject.InstalledVersion = $Object.Version  # And local version

                    try {
                    #  Find module, and add gallery version number to hash table
                        $GalObj = Find-Module -Name $Object.name -ErrorAction Stop
                        $UpdateObject.PSGalleryVersion = $GalObj.Version | Sort-Object -Descending | Select-Object -First 1
                    }
                    # here - find module could not find the module in the gallery
                    Catch {
                        # If module isn't in the gallery
                        $UpdateObject.PSGalleryVersion = [System.Version]::new(0,0)
                    }

                    # now emit the object
                    if ($NeedUpgrade) {
                        New-Object -TypeName PSObject -Property $UpdateObject | where-object { $_.InstalledVersion -ne $_.PSGalleryVersion }
                    } else {
                        New-Object -TypeName PSObject -Property $UpdateObject
                    }
                }
            }

            'Script' {
                $Objects  = Get-InstalledScript -Verbose:$False | Where-Object { $_.Name -like $Name }
                Write-Verbose -Message ('{0} scripts locally that match [{1}]' -f $Objects.count, $Name)
                Foreach ($Object in $Objects) {
                    Write-Verbose -Message "Processing $($Object.name)"
                    
                    $UpdateObject         = [ordered] @{}    # create the hash table
                    $UpdateObject.ObjectType = 'Script'
                    $UpdateObject.Name    = $Object.Name     # Add name
                    $UpdateObject.InstalledVersion = $Object.Version  # And local version

                    try {
                    #  Find module, and add gallery version number to hash table
                        $GalObj = Find-Script -Name $Object.name -ErrorAction Stop
                        $UpdateObject.PSGalleryVersion = $GalObj.Version | Sort-Object -Descending | Select-Object -First 1
                    }
                    # here - find module could not find the module in the gallery
                    Catch {
                        # If module isn't in the gallery
                        $UpdateObject.PSGalleryVersion = [System.Version]::new(0,0)
                    }

                    # now emit the object
                    if ($NeedUpgrade) {
                        New-Object -TypeName PSObject -Property $UpdateObject | where-object { $_.InstalledVersion -ne $_.PSGalleryVersion }
                    } else {
                        New-Object -TypeName PSObject -Property $UpdateObject
                    }
                }
            }
        }
    }

    end {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }
    
}
