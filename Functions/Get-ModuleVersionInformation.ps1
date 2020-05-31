#source: https://tfl09.blogspot.com/2018/07/keeping-powershell-modules-up-to-date.html

Function Get-ModuleVersionInformation {

    [CmdletBinding(ConfirmImpact='None')]
    Param()

    # Startup
    $Start = Get-Date
    Write-Verbose -Message 'Get-ModuleVersionInformation'
    Write-Verbose -Message "Started at: [$start]"

    # Get the modules on the local system
    $Modules = Get-Module -ListAvailable -Verbose:$False
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
    Catch {
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

# $modver = Get-ModuleVersionInformation
# $modver | where { $_.version -lt $_.galversion }

<#
$zero = [System.Version]::new(0,0)
foreach ($mod in $mods) {
  If ($mod.galversion -eq $zero) {
  $msg = "Module [$($mod.name)] does not exist in PSGallery"
  $msg
  continue
  }
  If ($mod.galversion -gt $mod.version){
  $msg = "Module [$($mod.name)] should be updated from v$($mod.version) to v$($mod.galversion)"
  }
  Else {
  $msg = "Module [$($mod.name)] does not need to be updated - current version $($mod.version)"
  }

$msg
} # End foreach

 #>
