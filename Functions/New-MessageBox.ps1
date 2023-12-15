function New-MessageBox {
    <#
.SYNOPSIS
    New-Popup will display a message box. If a timeout is requested it uses Wscript.Shell PopUp method. If a default button is requested it uses the ::Show method from 'Windows.Forms.MessageBox'
.DESCRIPTION
    The New-Popup command uses the Wscript.Shell PopUp method to display a graphical message
    box. You can customize its appearance of icons and buttons. By default the user
    must click a button to dismiss but you can set a timeout value in seconds to
    automatically dismiss the popup.

    The command will write the return value of the clicked button to the pipeline:
    Timeout = -1
    OK      =  1
    Cancel  =  2
    Abort   =  3
    Retry   =  4
    Ignore  =  5
    Yes     =  6
    No      =  7

    If no button is clicked, the return value is -1.
.PARAMETER Message
    The message you want displayed
.PARAMETER Title
    The text to appear in title bar of dialog box
.PARAMETER Time
    The time to display the message. Defaults to 0 (zero) which will keep dialog open until a button is clicked
.PARAMETER  Buttons
    Valid values for -Buttons include:
    "OK"
    "OKCancel"
    "AbortRetryIgnore"
    "YesNo"
    "YesNoCancel"
    "RetryCancel"
.PARAMETER  Icon
    Valid values for -Icon include:
    "Stop"
    "Question"
    "Exclamation"
    "Information"
    "None"
.PARAMETER  ShowOnTop
    Switch which will force the popup window to appear on top of all other windows.
.PARAMETER  AsString
    Will return a human readable representation of which button was pressed as opposed to an integer value.
.EXAMPLE
    new-popup -message "The update script has completed" -title "Finished" -time 5

    This will display a popup message using the default OK button and default
    Information icon. The popup will automatically dismiss after 5 seconds.
.EXAMPLE
    $answer = new-popup -Message "Please pick" -Title "form" -buttons "OKCancel" -icon "information"

    If the user clicks "OK" the $answer variable will be equal to 1. If the user clicks "Cancel" the
    $answer variable will be equal to 2.
.EXAMPLE
    $answer = new-popup -Message "Please pick" -Title "form" -buttons "OKCancel" -icon "information" -AsString

    If the user clicks "OK" the $answer variable will be equal to 'OK'. If the user clicks "Cancel" the
    $answer variable will be 'Cancel'
.OUTPUTS
    An integer with the following value depending upon the button pushed.

    Timeout = -1    # Value when timer finishes countdown.
    OK      =  1
    Cancel  =  2
    Abort   =  3
    Retry   =  4
    Ignore  =  5
    Yes     =  6
    No      =  7
.LINK
    Wscript.Shell
.NOTES
    Fixed issue with -AsString and a timeout not reporting correctly.
#>

    #region Parameters
    [CmdletBinding(DefaultParameterSetName = 'Timeout')]
    [OutputType('int')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    Param (
        [Parameter(Mandatory, HelpMessage = 'Enter a message for the message box', ParameterSetName = 'DefaultButton')]
        [Parameter(Mandatory, HelpMessage = 'Enter a message for the message box', ParameterSetName = 'Timeout')]
        [ValidateNotNullorEmpty()]
        [string] $Message,

        [Parameter(Mandatory, HelpMessage = 'Enter a title for the message box', ParameterSetName = 'DefaultButton')]
        [Parameter(Mandatory, HelpMessage = 'Enter a title for the message box', ParameterSetName = 'Timeout')]
        [ValidateNotNullorEmpty()]
        [string] $Title,

        [Parameter(ParameterSetName = 'Timeout')]
        [ValidateScript({ $_ -ge 0 })]
        [int] $Time = 0,

        [Parameter(ParameterSetName = 'DefaultButton')]
        [Parameter(ParameterSetName = 'Timeout')]
        [ValidateNotNullorEmpty()]
        [ValidateSet('OK', 'OKCancel', 'AbortRetryIgnore', 'YesNo', 'YesNoCancel', 'RetryCancel')]
        [string] $Buttons = 'OK',

        [Parameter(ParameterSetName = 'DefaultButton')]
        [Parameter(ParameterSetName = 'Timeout')]
        [ValidateNotNullorEmpty()]
        [ValidateSet('None', 'Stop', 'Hand', 'Error', 'Question', 'Exclamation', 'Warning', 'Asterisk', 'Information')]
        [string] $Icon = 'None',

        [Parameter(ParameterSetName = 'Timeout')]
        [switch] $ShowOnTop,

        [Parameter(ParameterSetName = 'DefaultButton')]
        [ValidateSet('Button1', 'Button2', 'Button2')]
        [string] $DefaultButton = 'Button1',

        [Parameter(ParameterSetName = 'DefaultButton')]
        [Parameter(ParameterSetName = 'Timeout')]
        [switch] $AsString

    )
    #endregion Parameters

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "ParameterSetName [$($PsCmdlet.ParameterSetName)]"

        # set $ShowOnTopValue based on switch
        if ($ShowOnTop) {
            $ShowOnTopValue = 4096
        } else {
            $ShowOnTopValue = 0
        }

        #lookup key to convert buttons to their integer equivalents
        $ButtonsKey = ([ordered] @{
                'OK'               = 0
                'OKCancel'         = 1
                'AbortRetryIgnore' = 2
                'YesNo'            = 4
                'YesNoCancel'      = 3
                'RetryCancel'      = 5
            })

        #lookup key to convert icon to their integer equivalents
        $IconKey = ([ordered] @{
                'None'        = 0
                'Stop'        = 16
                'Hand'        = 16
                'Error'       = 16
                'Question'    = 32
                'Exclamation' = 48
                'Warning'     = 48
                'Asterisk'    = 64
                'Information' = 64
            })

        #lookup key to convert return value to human readable button press
        $ReturnKey = ([ordered] @{
                -1 = 'Timeout'
                1  = 'OK'
                2  = 'Cancel'
                3  = 'Abort'
                4  = 'Retry'
                5  = 'Ignore'
                6  = 'Yes'
                7  = 'No'
            })
    }

    process {
        switch ($PsCmdlet.ParameterSetName) {
            'Timeout' {
                try {
                    $wshell = New-Object -ComObject Wscript.Shell -ErrorAction Stop
                    #Button and icon type values are added together to create an integer value
                    $return = $wshell.Popup($Message, $Time, $Title, $ButtonsKey[$Buttons] + $Iconkey[$Icon] + $ShowOnTopValue)
                    if ($return -eq -1) {
                        Write-Verbose -Message "User timedout [$($returnkey[$return])] after [$time] seconds"
                    } else {
                        Write-Verbose -Message "User pressed [$($returnkey[$return])]"
                    }
                    if ($AsString) {
                        $ReturnKey.$return
                    } else {
                        $return
                    }
                } catch {
                    #You should never really run into an exception in normal usage
                    Write-Error -Message 'Failed to create Wscript.Shell COM object'
                    Write-Error -Message ($_.exception.message)
                }
            }

            'DefaultButton' {
                try {
                    $MessageBox = [Windows.Forms.MessageBox]
                    $Return = ($MessageBox::Show($Message, $Title, $ButtonsKey[$Buttons], $Iconkey[$Icon], $DefaultButton)).Value__
                    Write-Verbose -Message "User pressed [$($returnkey[$return])]"
                    if ($AsString) {
                        $ReturnKey.$return
                    } else {
                        $return
                    }
                } catch {
                    #You should never really run into an exception in normal usage
                    Write-Error -Message 'Failed to create MessageBox'
                    Write-Error -Message ($_.exception.message)
                }
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

} # EndFunction New-MessageBox
