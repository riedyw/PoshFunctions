function Show-NamedColor {
<#
.SYNOPSIS
    Shows all named colors
.DESCRIPTION
    Shows all named colors
.PARAMETER ColorName
    To show the attributes of a single named color. This parameter has a ValidateSet against it so you can tab through the options.
.PARAMETER ExcludeEmpty
    Will exclude the Empty and Transparent colors
#>

    # todo Change += to System.Collections.Arraylist

    #region Parameter
    [CmdletBinding(ConfirmImpact='None')]
    [OutputType('psobject')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments','')]

    Param(
        [Parameter(Position = 0, ValueFromPipeline) ]
        [ValidateSet('AliceBlue',
            'AntiqueWhite',
            'Aqua',
            'Aquamarine',
            'Azure',
            'Beige',
            'Bisque',
            'Black',
            'BlanchedAlmond',
            'Blue',
            'BlueViolet',
            'Brown',
            'BurlyWood',
            'CadetBlue',
            'Chartreuse',
            'Chocolate',
            'Coral',
            'CornflowerBlue',
            'Cornsilk',
            'Crimson',
            'Cyan',
            'DarkBlue',
            'DarkCyan',
            'DarkGoldenrod',
            'DarkGray',
            'DarkGreen',
            'DarkKhaki',
            'DarkMagenta',
            'DarkOliveGreen',
            'DarkOrange',
            'DarkOrchid',
            'DarkRed',
            'DarkSalmon',
            'DarkSeaGreen',
            'DarkSlateBlue',
            'DarkSlateGray',
            'DarkTurquoise',
            'DarkViolet',
            'DeepPink',
            'DeepSkyBlue',
            'DimGray',
            'DodgerBlue',
            'Empty',
            'Firebrick',
            'FloralWhite',
            'ForestGreen',
            'Fuchsia',
            'Gainsboro',
            'GhostWhite',
            'Gold',
            'Goldenrod',
            'Gray',
            'Green',
            'GreenYellow',
            'Honeydew',
            'HotPink',
            'IndianRed',
            'Indigo',
            'Ivory',
            'Khaki',
            'Lavender',
            'LavenderBlush',
            'LawnGreen',
            'LemonChiffon',
            'LightBlue',
            'LightCoral',
            'LightCyan',
            'LightGoldenrodYellow',
            'LightGray',
            'LightGreen',
            'LightPink',
            'LightSalmon',
            'LightSeaGreen',
            'LightSkyBlue',
            'LightSlateGray',
            'LightSteelBlue',
            'LightYellow',
            'Lime',
            'LimeGreen',
            'Linen',
            'Magenta',
            'Maroon',
            'MediumAquamarine',
            'MediumBlue',
            'MediumOrchid',
            'MediumPurple',
            'MediumSeaGreen',
            'MediumSlateBlue',
            'MediumSpringGreen',
            'MediumTurquoise',
            'MediumVioletRed',
            'MidnightBlue',
            'MintCream',
            'MistyRose',
            'Moccasin',
            'NavajoWhite',
            'Navy',
            'OldLace',
            'Olive',
            'OliveDrab',
            'Orange',
            'OrangeRed',
            'Orchid',
            'PaleGoldenrod',
            'PaleGreen',
            'PaleTurquoise',
            'PaleVioletRed',
            'PapayaWhip',
            'PeachPuff',
            'Peru',
            'Pink',
            'Plum',
            'PowderBlue',
            'Purple',
            'Red',
            'RosyBrown',
            'RoyalBlue',
            'SaddleBrown',
            'Salmon',
            'SandyBrown',
            'SeaGreen',
            'SeaShell',
            'Sienna',
            'Silver',
            'SkyBlue',
            'SlateBlue',
            'SlateGray',
            'Snow',
            'SpringGreen',
            'SteelBlue',
            'Tan',
            'Teal',
            'Thistle',
            'Tomato',
            'Transparent',
            'Turquoise',
            'Violet',
            'Wheat',
            'White',
            'WhiteSmoke',
            'Yellow',
            'YellowGreen'
        )]
        [string] $ColorName,

        [switch] $ExcludeEmpty
        )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        Write-Verbose -Message 'Determining names of colors'
        [System.Drawing.Color] | Get-Member -MemberType *property -Static | findstr.exe /i 'Property' |
            ForEach-Object -Begin {
                    $result1=@()
                } -Process {
                    $tmp = $_ -split '\s+'
                    $result1 += $tmp[0]
                } -End { }
        Write-Verbose -Message "There are $($result1.count) named system colors."
        if ($ExcludeEmpty) {
            Write-Verbose -Message 'Excluding empty and transparent'
            $result1 = $result1 | Where-Object {$_ -notin @('Empty', 'Transparent')}
        }

        if (-not $ColorName) {
            $ReturnVal = $result1 | ForEach-Object { [system.drawing.color]::$_ } |
                Select-Object -Property Name, IsKnownColor, IsNamedColor, IsSystemColor, IsEmpty, R, G, B, A
        }
        else {
            $result2 = @()
            $result2 += $result1 | where-object { $_ -eq "$ColorName" } | foreach-object { [system.drawing.color]::$_ }
            write-verbose -Message "There are $($result2.count) named system colors in the result set."
            $ReturnVal = $result2 | Select-Object -Property Name, IsKnownColor, IsNamedColor, IsSystemColor, IsEmpty, R, G, B, A
        }
        foreach ($R in $ReturnVal) { if ($R.Name -eq '0') { $R.Name = 'Empty' }}
        Write-Output -InputObject $ReturnVal
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
