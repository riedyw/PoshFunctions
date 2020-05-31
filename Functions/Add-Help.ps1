Function Add-Help {
    <#
.SYNOPSIS
    Adds a template comment based block into the editor in the Powershell ISE.
.DESCRIPTION
    Adds a template comment based block into the editor in the Powershell ISE.
.NOTES
    Author:     Bill Riedy
.EXAMPLE
    Add-Help
.OUTPUTS
    [string]
#>

    [CmdletBinding(ConfirmImpact='None')]
    [OutputType('string')]
    Param(
    )

    $helpText = @"
<#
.SYNOPSIS
    One liner description
.DESCRIPTION
    A longer description of the function
.PARAMETER parameterNoLeading$
    Explanation of parameter
.EXAMPLE
    PS C:\> FunctionName -Argument

    Returns the string

    blah
.EXAMPLE
    PS C:\> FunctionName -Argument -verbose

    Returns the following:

    VERBOSE: Text that was created with Write-Verbose
    blah
.EXAMPLE
    Another example
.NOTES
    NAME: FunctionName
    AUTHOR: $env:username
    LASTEDIT: $(Get-Date)
    VERSION: VersionNumber
    KEYWORDS: key1,key2
.INPUTS
    blah
.OUTPUTS
    [pscustomboject]
    [string]
.LINK
    http://www.ibm.com
.LINK
    http://www.google.com
#>
"@

    #Requires -Version 2.0

    $psise.CurrentFile.Editor.InsertText($helpText)
} #EndFunction add-help
