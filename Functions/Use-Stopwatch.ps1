function Use-Stopwatch {
<#
.SYNOPSIS
    Uses a stopwatch datatype found in module. Can get stopwatch status, start, stop, reset, or restart.
.DESCRIPTION
    Uses a stopwatch datatype found in module. Can get stopwatch status, start, stop, reset, or restart.
.PARAMETER Status
    Switch to just display the current status of the stopwatch. Default.
.PARAMETER Start
    Switch to start the stopwatch.
.PARAMETER Stop
    Switch to stop the stopwatch.
.PARAMETER Restart
    Switch to reset the counter to 0 and restart the stopwatch.
.PARAMETER Reset
    Switch to stop the stopwatch and reset the counter to 0.
.PARAMETER IncludeStatus
    Switch to include the status when you specify -Start, -Stop, -Reset, -Restart
.EXAMPLE
    Use-Stopwatch -Verbose

    When you first run this command the stopwatch will exist but has not been started. The function would return:
    VERBOSE: Starting [Use-Stopwatch]
    VERBOSE: ParameterSetName [Status]
    VERBOSE: IncludeStatus [False]

    VERBOSE: Ending [Use-Stopwatch]
    IsRunning Elapsed  ElapsedMilliseconds ElapsedTicks
    --------- -------  ------------------- ------------
        False 00:00:00                   0            0
.EXAMPLE
    Use-Stopwatch -Start -IncludeStatus

    Would start the stopwatch and display the stopwatch and would return something similar to the following:
    IsRunning Elapsed          ElapsedMilliseconds ElapsedTicks
    --------- -------          ------------------- ------------
         True 00:00:00.0011733                   1        11933
.EXAMPLE
    Use-Stopwatch -Stop -IncludeStatus

    Would stop the stopwatch and display the stopwatch and return something similar to the following:
    IsRunning Elapsed          ElapsedMilliseconds ElapsedTicks
    --------- -------          ------------------- ------------
        False 00:01:21.2577089               81257    812577089
.EXAMPLE
    Use-Stopwatch -Reset -IncludeStatus

    IsRunning Elapsed  ElapsedMilliseconds ElapsedTicks
    --------- -------  ------------------- ------------
        False 00:00:00                   0            0
.NOTES
    Inspired by: https://mcpmag.com/articles/2017/10/19/using-a-stopwatch-in-powershell.aspx

    The module manifest contains the following line that this function relies on:

    $Script:Stopwatch =  [System.Diagnostics.Stopwatch]::New()
#>

    #region parameter
    [CmdletBinding(DefaultParameterSetName = 'Status',ConfirmImpact='None')]
    [OutputType('System.Diagnostics.Stopwatch')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter','')]
    Param
    (
        [Parameter(ParameterSetName = 'Status')]
        [switch] $Status,

        [Parameter(ParameterSetName = 'Reset')]
        [switch] $Reset,

        [Parameter(ParameterSetName = 'Restart')]
        [switch] $Restart,

        [Parameter(ParameterSetName = 'Start')]
        [switch] $Start,

        [Parameter(ParameterSetName = 'Stop')]
        [switch] $Stop,

        [Parameter(ParameterSetName = 'Reset')]
        [Parameter(ParameterSetName = 'Restart')]
        [Parameter(ParameterSetName = 'Start')]
        [Parameter(ParameterSetName = 'Stop')]
        [switch] $IncludeStatus
    )
    #endregion parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "ParameterSetName [$($PsCmdlet.ParameterSetName)]"
        Write-Verbose -Message "IncludeStatus [$IncludeStatus]"
    }

    process {
        switch ($PsCmdlet.ParameterSetName) {
            'Status' {
                $Script:Stopwatch
            }
            'Reset' {
                $Script:Stopwatch.Reset()
                if ($IncludeStatus) { $Script:Stopwatch }
            }
            'Restart' {
                $Script:Stopwatch.Restart()
                if ($IncludeStatus) { $Script:Stopwatch }
            }
            'Start' {
                $Script:Stopwatch.Start()
                if ($IncludeStatus) { $Script:Stopwatch }
            }
            'Stop' {
                $Script:Stopwatch.Stop()
                if ($IncludeStatus) { $Script:Stopwatch }
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

} #EndFunction Use-Stopwatch
