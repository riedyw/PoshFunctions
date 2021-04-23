function New-Inputbox {
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
.PARAMETER Prompt
    A string that is displayed before the text entry field in dialog box
.PARAMETER Title
    A string that appears as the title of the dialog box
.PARAMETER Default
    An optional parameter indicating the default value of the text entry field
.EXAMPLE
    $c = New-Inputbox -Prompt 'Enter the Netbios name of a domain computer' -Title "Enter a computername" -Default $env:computername
    Get-Service -ComputerName $c
.OUTPUTS
    [string]
#>

    [CmdletBinding(ConfirmImpact='None')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions','')]

    Param (
        [Parameter(Position=0)]
        [ValidateNotNullorEmpty()]
        [string] $Prompt = 'Please enter a value',

        [Parameter(Position=1)]
        [string] $Title = 'Input',

        [Parameter(Position=2)]
        [string] $Default = ''

    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "-Prompt is [$Prompt]"
        Write-Verbose -Message "-Title is [$Title]"
        Write-Verbose -Message "-Default is [$Default]"
    }

    process {
        try {
            Add-Type -AssemblyName 'microsoft.visualbasic' -ErrorAction Stop
            [Microsoft.VisualBasic.Interaction]::InputBox($Prompt,$Title,$Default)
        }
        catch {
            Write-Warning -Message 'There was a problem creating the inputbox'
            Write-Warning -Message $_.Exception.Message
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

} #end New-Inputbox
