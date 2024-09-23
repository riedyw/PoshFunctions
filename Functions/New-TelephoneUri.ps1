function New-TelephoneUri {
  <#
      .SYNOPSIS
      A short one-line action-based description, e.g. 'Tests if a function is valid'
      .DESCRIPTION
      A longer description of the function, its purpose, common use cases, etc.
      .NOTES
      Information or caveats about the function e.g. 'This function is not supported in Linux'
      .LINK
      Specify a URI to a help page, this will show when Get-Help -Online is used.
      .EXAMPLE
      Test-MyTestFunction -Verbose
      Explanation of the function or its result. You can include multiple examples with additional .EXAMPLE lines
  #>


    # todo update comment help
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, HelpMessage='Enter the Telephone number', Position=0, ValueFromPipeline)]
        [string] $Telephone
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        $ReturnVal = 'TEL:' + $Telephone
        Write-Output -InputObject $ReturnVal
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
