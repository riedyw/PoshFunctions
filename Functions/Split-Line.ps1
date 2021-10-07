Function Split-Line {
<#
.SYNOPSIS
    To split a string line by line and return a string array
.DESCRIPTION
    To split a string line by line and force it to return a string array. Here strings, script EOL character sequence, and system
    default NewLine character can muck up parsing a string into lines. This is an attempt to address this.
.PARAMETER String
    The string that you want split line by line
.EXAMPLE
    $HereString = @'
Server1
Server2
Server3
'@

    $Object = Split-Line -String $HereString
    $Object.Count

    3
.EXAMPLE
    (Split-Line -String 'SimpleString').GetType()

    IsPublic IsSerial Name                                     BaseType
    -------- -------- ----                                     --------
    True     True     Object[]                                 System.Array
#>

    [CmdletBinding(ConfirmImpact='None')]
    [OutputType('string[]')]
    param(
        [Parameter(Mandatory, HelpMessage='Enter a string composed of tokens',Position=0,ValueFromPipeline)]
        [string] $String
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        if ($String -notmatch "`n") {
            Write-Output -InputObject (,([array] $String))
        } else {
            $ReturnValue = $String -split "`r`n"
            if ($ReturnValue.Count -eq 1) {
                $ReturnValue = $String -split "`n"
            }
            Write-Output -InputObject $ReturnValue
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}

