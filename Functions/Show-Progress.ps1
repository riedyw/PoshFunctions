function Show-Progress {
<#
.SYNOPSIS
    Show progress as items pass through a section of the pipline
.DESCRIPTION
    This function allows you to show progress from the pipeline.
    It's intentionally written for efficiency/speed so some compromises on readability were made
.PARAMETER InputObject
    The items on the pipeline being processed. Can also accept this input from the pipeline, which is how this parameter
    is normally used.
.PARAMETER Activity
    A decription of the activity being measured.
.PARAMETER UpdatePercentage
    The percentage of time to update the progress bar. Write-Progress is a slow cmdlet so this is used for performance
    reasons with larger data sets. Defaults to 1.
.PARAMETER PassThru
    Controls whether data is passed along the pipeline. Normally this switch should be used.
.PARAMETER Id
    Allows you to have multiple progress bars running simultaneously. Defaults to 1.
.PARAMETER SecondsRemaining
    Switch that will control the display of estimated number of seconds remaining based upon current progress.
.EXAMPLE
    # This runs through the numbers 1 through 1000 and displays a progress bar based on how many have gone through the pipeline
    1..1000 | Show-Progress
.EXAMPLE
    # Showing progress with a specific activity message and only updating at 10%, 20% etc
    1..10000 | Show-Progress -Activity "doin stuff" -UpdatePercentage 10
.EXAMPLE
    # Showing progress displaying estimated seconds remaining.
    1..50 | show-progress  -PassThru -SecondsRemaining | foreach { start-sleep  -Milliseconds (get-random -min 100 -max 1000) }
.EXAMPLE
    1..1000 | show-progress -SecondsRemaining -PassThru -Activity 'Performing activity'  | foreach { start-sleep -mil (get-random -min 100 -max 1000)}

    Will display a progress bar at the top that will look similar to:

    Performing activity
        Working - 2%
        [ooo                                                                                                           ]
        00:09:20 remaining.
.NOTES
    # Inspired by: https://www.powershellgallery.com/packages/Show-Progress/0.0.1
    # Added [switch] parameter $PassThru to pass items through the pipeline
    # Added [switch] parameter $SecondsRemaining
    # Added [int] parameter $Id to enable multiple progress bars
#>

    # todo Change += to System.Collections.Arraylist

    [CmdletBinding(ConfirmImpact='None')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter','')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseProcessBlockForPipelineCommand','')]
    param (
        [Parameter(Mandatory, Position = 0, ValueFromPipeline)]
        [PSObject[]]
        $InputObject,

        [string] $Activity = 'Processing items',

        [ValidateRange(1, 100)]
        [int] $UpdatePercentage = 1,

        [Alias('PassThrough')]
        [switch] $PassThru,

        [int] $Id = 1,

        [switch] $SecondsRemaining
    )

    $count = 0
    [int] $totalItems = $Input.count
    write-verbose -Message "TotalItems in the pipeline: $TotalItems"
    $progressWritten = @()
    $StartTime = get-date

    # use a dot sourced scriptblock to loop despite its lower redability as its extremely fast
    $Input | . {
        process {
            # pass thru the input
            if ($PassThru) {
                $_
            }
            $count++
            [int] $percentComplete = ($Count / $totalItems * 100)
            $writeProgressSplat = @{
                Activity        = $Activity
                PercentComplete = $percentComplete
                Status          = "Working - $percentComplete%"
                Id              = $Id
            }
            if ($SecondsRemaining) {
                $SecondsElapsed = (get-date) - $StartTime
                $SecondsTogo = ($SecondsElapsed.TotalSeconds / $count) * ($totalItems - $count)
                $writeProgressSplat.SecondsRemaining = $SecondsTogo
            }
            if ($percentComplete -notin $progressWritten -and ($UpdatePercentage -eq 0 -or $percentComplete % $UpdatePercentage -eq 0)) {
                $progressWritten += $percentComplete
                Write-Progress @writeProgressSplat
            }
        }
    }

    # cleanup - if for some reason the function doesn't arrive at 100% percent completed. This will make the progress
    # bar disappear.
    $writeProgressSplat = @{
        Activity        = $Activity
        PercentComplete = 100
        Status          = 'Completed'
        Id              = $Id
        Completed       = $true
    }
    Write-Progress @writeProgressSplat

}
