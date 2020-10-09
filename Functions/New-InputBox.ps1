Function New-Inputbox {

<#
.SYNOPSIS
    Display a Visual Basic style inputbox.
.DESCRIPTION
    This function will display a graphical Inputbox, like the one from VisualBasic
    and VBScript. You must specify a message prompt. You can specify a title, the
    default is "Input". You can also specify a default value. The inputbox will write
    whatever is entered into it to the pipeline. If you click Cancel the inputbox
    will still write a string to the pipeline with a length of 0. It is recommended
    that you validate input.
.EXAMPLE
    $c = New-Inputbox -prompt "Enter the Netbios name of a domain computer." -title "Enter a computername" -default $env:computername
    get-service -computer $c
.OUTPUTS
    [string]
#>

    [CmdletBinding(ConfirmImpact='None')]

    Param (
        [Parameter(Position=0,Mandatory,HelpMessage='Enter a message prompt')]
        [ValidateNotNullorEmpty()]
        [string] $Prompt,

        [Parameter(Position=1)]
        [string] $Title='Input',

        [Parameter(Position=2)]
        [string] $Default=''

    )

    Begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    process {
        Try {
            Add-Type -AssemblyName 'microsoft.visualbasic' -ErrorAction Stop
            [Microsoft.VisualBasic.Interaction]::InputBox($Prompt,$Title,$Default)
        }
        Catch {
            Write-Warning -Message 'There was a problem creating the inputbox'
            Write-Warning -Message $_.Exception.Message
        }
    }

    End {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

} #end New-Inputbox
