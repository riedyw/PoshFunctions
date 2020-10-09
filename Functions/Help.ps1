Function Help {
<#
.SYNOPSIS
    Describe purpose of "Help" in 1-2 sentences.

.DESCRIPTION
    Add a more complete description of what the function does.

.PARAMETER Name
    Describe parameter -Name.

.PARAMETER Path
    Describe parameter -Path.

.PARAMETER Category
    Describe parameter -Category.

.PARAMETER Component
    Describe parameter -Component.

.PARAMETER Functionality
    Describe parameter -Functionality.

.PARAMETER Role
    Describe parameter -Role.

.PARAMETER Detailed
    Describe parameter -Detailed.

.PARAMETER Full
    Describe parameter -Full.

.PARAMETER Examples
    Describe parameter -Examples.

.PARAMETER Parameter
    Describe parameter -Parameter.

.PARAMETER Online
    Describe parameter -Online.

.PARAMETER ShowWindow
    Describe parameter -ShowWindow.

.EXAMPLE
    Help -Name Value -Path Value -Category Value -Component Value -Functionality Value -Role Value
    Describe what this call does

.EXAMPLE
    Help -Detailed
    Describe what this call does

.EXAMPLE
    Help -Full
    Describe what this call does

.EXAMPLE
    Help -Examples
    Describe what this call does

.EXAMPLE
    Help -Parameter Value
    Describe what this call does

.EXAMPLE
    Help -Online
    Describe what this call does

.EXAMPLE
    Help -ShowWindow
    Describe what this call does

.NOTES
    Place additional notes here.

.LINK
    URLs to related sites
    The first link is opened by Get-Help -Online Help

.INPUTS
    List of input types that are accepted by this function.

.OUTPUTS
    List of output types produced by this function.
#>


<#
.FORWARDHELPTARGETNAME Get-Help
.FORWARDHELPCATEGORY Cmdlet
#>
    [CmdletBinding(DefaultParameterSetName='AllUsersView',
    HelpUri='http://go.microsoft.com/fwlink/?LinkID=113316')]
    param(
        [Parameter(Position=0, ValueFromPipelineByPropertyName)]
        [string]
        ${Name},

        [string]
        ${Path},

        [ValidateSet('Alias','Cmdlet','Provider','General','FAQ','Glossary','HelpFile','ScriptCommand','Function', 'Filter','ExternalScript','All','DefaultHelp','Workflow')]
        [string[]]
        ${Category},

        [string[]]
        ${Component},

        [string[]]
        ${Functionality},

        [string[]]
        ${Role},

        [Parameter(ParameterSetName='DetailedView',HelpMessage='Add help message for user', Mandatory)]
        [switch]
        ${Detailed},

        [Parameter(ParameterSetName='AllUsersView')]
        [switch]
        ${Full},

        [Parameter(ParameterSetName='Examples',HelpMessage='Add help message for user', Mandatory)]
        [switch]
        ${Examples},

        [Parameter(ParameterSetName='Parameters',HelpMessage='Add help message for user', Mandatory)]
        [string]
        ${Parameter},

        [Parameter(ParameterSetName='Online',HelpMessage='Add help message for user', Mandatory)]
        [switch]
        ${Online},

        [Parameter(ParameterSetName='ShowWindow',HelpMessage='Add help message for user', Mandatory)]
        [switch]
        ${ShowWindow})

      #Set the outputencoding to Console::OutputEncoding. More.com doesn't work well with Unicode.
      $outputEncoding=[System.Console]::OutputEncoding

      Get-Help @PSBoundParameters | less.exe
} #EndFunction Help
