function Get-Fortune {
<#
.SYNOPSIS
    Display a short quote
.DESCRIPTION
    Display a short quote from a file which defaults to: 'c:\scripts\wisdom.txt') but can be changed with parameter -Path.
.NOTES
    # Sample wisdom.txt file with 3 entries.  Each 'fortune' is delimited by a line consisting of just the pct sign
    # The last fortune in the file should NOT be terminated with a pct sign
    %
    This too will pass.
       - Attar
    %
    Don't think, just do.
       - Horace
    %
    Time is money.
       - Benjamin Franklin
.OUTPUTS
    [string]
.PARAMETER Path
    A path to a filename containing the fortunes. Defaults to: ((Split-Path -path $profile)+'\wisdom.txt')
    Aliased to 'FileName' and 'Fortune'
.PARAMETER Delimiter
    Indicates delimiter between the individual fortunes. Defaults to "`n%`n" (newline percent newline)
.LINK
    Get-Content
    Get-Random
    Split-Path
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact='None')]
    [alias('Fortune')] #FunctionAlias
    [OutputType('string')]
    Param(
        [Alias('FileName', 'Fortune')]
        [string] $Path = $script:FortuneFile,

        [string] $Delimiter = "`n%`n",

        [switch] $Speak
    )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "Using fortune file [$Path]"
    }

    process {
        if (Test-Path -Path $Path) {
            Write-Verbose -Message "Using [$Path] for fortune file"
            Write-Verbose -Message "Delimiter [$Delimiter]"
            $Fortune = (Get-Content -Raw -Path $Path -ReadCount 0) -replace "`r`n", "`n" -split $Delimiter | Get-Random
            if ($Speak) {
                $Fortune
                $Fortune | Invoke-Speak
            } else {
                $Fortune
            }
        } else {
            Write-Error -Message "ERROR: File [$Path] does not exist."
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
