function Invoke-Speak {
<#
.SYNOPSIS
    Use the speech synthesizer in Powershell. Can be synchronous or asynchronous. Option for random voice.
.DESCRIPTION
    Use the speech synthesizer in Powershell. Can be synchronous or asynchronous. Option for random voice.
.PARAMETER Expression
    Type what you want the speech synthesizer to say
.PARAMETER Async
    Switch to make the text-to-speak asynchronous. Normally the next statement in your script
    does not run until the speech process is done saying the whole expression.
.PARAMETER RandomVoice
    Will select one of the installed voices at random to speak the expression.
.EXAMPLE
    Invoke-Speak -Expression 'Your computer is ON.'
.EXAMPLE
    Invoke-Speak "Your confirmation preference is $ConfirmPreference"
.EXAMPLE
    Invoke-Speak -Expression 'This is a really long line of text. I wonder how long it will take to speak' -Async
#>

    # todo Change += to System.Collections.Arraylist

    [CmdletBinding()]
    [Alias('Speak')] #FunctionAlias
    param(
        [Parameter (Mandatory, HelpMessage = 'Please enter an expression you wish to be spoken', ValueFromPipeline, Position = 0)]
        [Alias('Text')]
        [string[]] $Expression,

        [switch] $Async,

        [switch] $RandomVoice
    )

    begin {
        $String = ''
        Write-Verbose -Message "Starting [$($MyInvocation.MyCommand)]"
    }

    process {
        foreach ($CurrentExpression in $Expression) {
            $String += ( $CurrentExpression + ' ')
        }
    }

    end {
        $SpeechSynth = New-Object -ComObject SAPI.SpVoice
        if ($RandomVoice) {
            $Voices = $SpeechSynth.getvoices()
            $SpeechSynth.Voice = $Voices | Get-Random
        }
        if ($Async) {
            $null = $SpeechSynth.Speak($String,1)
        } else {
            $null = $SpeechSynth.Speak($String)
        }
        Write-Verbose -Message "Ending [$($MyInvocation.MyCommand)]"
    }

}
