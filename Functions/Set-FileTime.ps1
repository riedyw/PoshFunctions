function Set-FileTime {
    [CmdletBinding(DefaultParameterSetName = 'ByPipeline')]
    param (
        # [Parameter(Mandatory, Position = 0, ParameterSetName = 'ByName')]
        # [string]$FullName,

        [Parameter(Mandatory, ValueFromPipeline = $true, ParameterSetName = 'ByPipeline')]
        [string[]] $Path,

        [Parameter()]
        [datetime]$CreationTime,

        [Parameter()]
        [datetime]$LastAccessTime,

        [Parameter()]
        [datetime]$LastWriteTime
    )

    process {
        foreach ($item in $path) {
            $file = Get-Item -Path $item
            if (-not ($file -is [System.IO.FileInfo])) {
                Write-Error "Invalid input: Must be a file."
                return
            }
            if ($null -ne $CreationTime) {
                (Get-Item -LiteralPath $item).CreationTime = $CreationTime
            }
            if ($null -ne $LastAccessTime) {
                (Get-Item -LiteralPath $item).LastAccessTime = $LastAccessTime
            }
            if ($null -ne $LastWriteTime) {
                (Get-Item -LiteralPath $item).LastWriteTime = $LastWriteTime
            }
        }
    }

}
