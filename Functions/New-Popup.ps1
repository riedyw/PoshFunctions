function New-PopUp {
<#
.SYNOPSIS
    New-Popup will display a popup message
.DESCRIPTION
    The New-Popup command uses the Wscript.Shell PopUp method to display a graphical message
    box. You can customize its appearance of icons and buttons. By default the user
    must click a button to dismiss but you can set a timeout value in seconds to
    automatically dismiss the popup.

    The command will write the return value of the clicked button to the pipeline:
    OK     = 1
    Cancel = 2
    Abort  = 3
    Retry  = 4
    Ignore = 5
    Yes    = 6
    No     = 7

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
#>

    #region Parameters
    [CmdletBinding()]
    [OutputType('int')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions','')]
    Param (
        [Parameter(Position=0,Mandatory,HelpMessage='Enter a message for the popup')]
        [ValidateNotNullorEmpty()]
        [string] $Message,

        [Parameter(Position=1,Mandatory,HelpMessage='Enter a title for the popup')]
        [ValidateNotNullorEmpty()]
        [string] $Title,

        [Parameter(Position=2)]
        [ValidateScript({$_ -ge 0})]
        [int] $Time=0,

        [Parameter(Position=3)]
        [ValidateNotNullorEmpty()]
        [ValidateSet('OK','OKCancel','AbortRetryIgnore','YesNo','YesNoCancel','RetryCancel')]
        [string] $Buttons='OK',

        [Parameter(Position=4)]
        [ValidateNotNullorEmpty()]
        [ValidateSet('Stop','Question','Exclamation','Information','None' )]
        [string] $Icon='None',

        [Parameter(Position=5)]
        [switch] $ShowOnTop,

        [Parameter(Position=6)]
        [switch] $AsString

    )
    #endregion Parameters

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        # set $ShowOnTopValue based on switch
        if ($ShowOnTop) {
            $ShowOnTopValue = 4096
        } else {
            $ShowOnTopValue = 0
        }

        #lookup key to convert buttons to their integer equivalents
        $ButtonsKey = @{
            'OK'               = 0
            'OKCancel'         = 1
            'AbortRetryIgnore' = 2
            'YesNo'            = 4
            'YesNoCancel'      = 3
            'RetryCancel'      = 5
        }

        #lookup key to convert icon to their integer equivalents
        $IconKey = @{
            'Stop'        = 16
            'Question'    = 32
            'Exclamation' = 48
            'Information' = 64
            'None'        =  0
        }

        #lookup key to convert return value to human readable button press
        $ReturnKey =   @{
            -1 = 'Timeout'
             1 = 'OK'
             2 = 'Cancel'
             3 = 'Abort'
             4 = 'Retry'
             5 = 'Ignore'
             6 = 'Yes'
             7 = 'No'
        }

        #create the COM Object
        try {
            $wshell = New-Object -ComObject Wscript.Shell -ErrorAction Stop
            #Button and icon type values are added together to create an integer value
            $return = $wshell.Popup($Message,$Time,$Title,$ButtonsKey[$Buttons] + $Iconkey[$Icon] + $ShowOnTopValue)
            if ($return -eq -1) {
                Write-Verbose -Message "User timedout [$($returnkey[$return])] after [$time] seconds"
            } else {
                Write-Verbose -Message "User pressed [$($returnkey[$return])]"
            }
            if ($AsString) {
                $ReturnKey[$return]
            }
            else {
                $return
            }
        }
        catch {
            #You should never really run into an exception in normal usage
            Write-Warning -Message 'Failed to create Wscript.Shell COM object'
            Write-Warning -Message ($_.exception.message)
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

} # EndFunction New-PopUp
