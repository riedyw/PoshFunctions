Function Union-Object ([String[]]$Property = @()) {
    # https://powersnippets.com/union-object/
    # Version 02.00.01, by iRon
    # minor formatting changes for indentation
    $Objects = $Input | ForEach {$_}
    If (!$Property) {
        ForEach ($Object in $Objects) {
            $Property += $Object.PSObject.Properties | Select -Expand Name
        }
    }
    $Objects | Select ([String[]]($Property | Select -Unique))
}

Set-Alias Union Union-Object
