function Format-RandomCase {
    [CmdletBinding()]
    param (
        [parameter(ValueFromPipeline)]
        [string[]] $String
    )

    begin {

    }

    process {
        foreach ($CurrentString in $String) {
            $tmp = [char[]] $CurrentString
            $tmp | ForEach-Object -Begin { $returnVal = '' } -Process {
                $random = 0,1 | Get-Random
                if ($random -eq 0) {
                    $returnVal += ([string] $_).ToLower()
                } else {
                    $returnVal += ([string] $_).ToUpper()
                }
            }
            Write-Output $returnVal
        }

    }

    end {

    }
}
