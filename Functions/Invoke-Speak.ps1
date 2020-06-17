Function Invoke-Speak {
<#
.DESCRIPTION
    Use the speech synthesizer in powershell
.PARAMETER Expression
    Type what you want the speech synthesizer to say
.PARAMETER Async
    Determines whether the speech is asynchronous. Normally the next statement in your script
    does not run until the speech process is done saying the whole expression.
.PARAMETER RandomVoice
    Will select one of the installed voices at random to speak the expression
.EXAMPLE
    Invoke-Speak -Expression 'Your computer is ON.'
.EXAMPLE
    Invoke-Speak "Your confirmation preference is $ConfirmPreference"
.EXAMPLE
    Invoke-Speak -Expression 'This is a really long line of text. I wonder how long it will take to speak' -Async
#>

    [CmdletBinding()]
    [Alias('Speak')]
    param(
        [Parameter (Mandatory, HelpMessage = 'Please enter an expression you wish to be spoken', ValueFromPipeline, Position = 0)]
        [string[]] $Expression,

        [switch] $Async,
        
        [switch] $RandomVoice
    )

    begin {
        $String = ''
    }

    process {
        foreach ($CurrentExpression in $Expression) {
            $String += ( $CurrentExpression + '')
        }
    }

<#
    # this block worked only in PS 5.1
    end {
        Add-Type -AssemblyName System.Speech
        $SpeechSynth = New-Object -TypeName System.Speech.Synthesis.SpeechSynthesizer
        if ($Async) {
            $null = $SpeechSynth.SpeakAsync($String)
        } else {
            $SpeechSynth.Speak($String)
        }
    }
 #>

    end {
        #Add-Type -AssemblyName System.Speech
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
    }

}
