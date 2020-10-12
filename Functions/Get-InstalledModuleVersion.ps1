function Get-InstalledModuleVersion {
<#
.SYNOPSIS
    Get version information on installed modules and most recent version on PSGallery
.DESCRIPTION
    Get version information on installed modules and most recent version on PSGallery
.EXAMPLE
    $ModuleVersions = Get-InstalledModuleVersion
    
    $NeedToUpgrade = $ModuleVersions | Where-Object { $_.Version -ne $_.GalVersion }
    Write-Host 'The following modules need to be updated'
    $NeedToUpgrade
    
    # To update the modules remove comment from following line
    # $NeedToUpgrade | ForEach-Object { Update-Module -Name $_.Name }
.NOTES
    Inspired by https://tfl09.blogspot.com/2018/07/keeping-powershell-modules-up-to-date.html

    * Added comment help
    * Changed to use Get-InstalledModule for 2 reasons:
        1. Shows only installed modules
        2. Shows only most recent version of installed module on PSGallery
#>

    [CmdletBinding(ConfirmImpact='None')]
    Param()

    # Startup
    $Start = Get-Date
    Write-Verbose -Message 'Get-InstalledModuleVersion'
    Write-Verbose -Message "Started at: [$start]"

    # Get the modules on the local system
    $Modules = Get-InstalledModule -Verbose:$False
    Write-Verbose -Message ('{0} modules locally' -f $modules.count)

    # For each module, see if it exists on PSGallery
    # Create/emit an object for each module with the name,
    # and the version number of local and remote versions
    Foreach ($Module in $Modules) {
        Write-Verbose -Message "Processing $($module.name)"
        $UpdateHt         = [ordered] @{}    # create the hash table
        $UpdateHt.Name    = $Module.Name     # Add name
        $UpdateHt.Version = $Module.Version  # And local version

        try {
        #  Find module, and add gallery version number to hash table
            $GalMod = Find-Module -Name $Module.name -ErrorAction Stop
            $Updateht.GalVersion = $GalMod.Version
        }
        # here - find module could not find the module in the gallery
        catch {
            # If module isn't in the gallery
            $Updateht.GalVersion = [System.Version]::new(0,0)
        }

        # now emit the object
        New-Object -TypeName PSObject -Property $UpdateHt

    } # End foreach

    $End = Get-Date
    Write-Verbose -Message "Stopped at: [$End]"
    Write-Verbose -Message "Took $(($End-$Start).TotalSeconds) seconds"

} # End Function
