function Get-PoshFunctionsPrivateData {
<#
.SYNOPSIS
    Returns the private data as defined by the module manifest
.DESCRIPTION
    Returns the private data as defined by the module manifest
.OUTPUTS
    [psobject]
#>
    $MyInvocation.MyCommand.Module
}