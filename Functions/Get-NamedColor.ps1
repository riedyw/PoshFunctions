function Get-NamedColor {
    <#
.SYNOPSIS
    Gets information on all named colors
.DESCRIPTION
    Gets information on all named colors
.PARAMETER ColorName
    To show the attributes of a single named color. This parameter has a ValidateSet against it so you can tab through the options.
.PARAMETER ExcludeEmpty
    Will exclude the Empty and Transparent colors
.PARAMETER Full
    Switch to indicate if all fields are to be returned
.NOTES
    Added PSTypeName hidden property in object to control formatting of output
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact = 'None')]
    [alias('Show-NamedColor')] #FunctionAlias
    [OutputType('psobject')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter', '')]

    Param(
        [Parameter(Position = 0, ValueFromPipeline) ]
        [ValidateSet('AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure',
            'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown',
            'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue',
            'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenrod',
            'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen',
            'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen',
            'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink',
            'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'Empty', 'Firebrick', 'FloralWhite',
            'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'Goldenrod',
            'Gray', 'Green', 'GreenYellow', 'Honeydew', 'HotPink', 'IndianRed', 'Indigo',
            'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon',
            'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenrodYellow', 'LightGray',
            'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue',
            'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen',
            'Linen', 'Magenta', 'Maroon', 'MediumAquamarine', 'MediumBlue', 'MediumOrchid',
            'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen',
            'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose',
            'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange',
            'OrangeRed', 'Orchid', 'PaleGoldenrod', 'PaleGreen', 'PaleTurquoise',
            'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum',
            'PowderBlue', 'Purple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown',
            'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue',
            'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal',
            'Thistle', 'Tomato', 'Transparent', 'Turquoise', 'Violet', 'Wheat', 'White',
            'WhiteSmoke', 'Yellow', 'YellowGreen' )]

        [string] $ColorName,

        [switch] $ExcludeEmpty,

        [switch] $Full
    )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        Write-Verbose -Message 'Determining names of colors'
        [System.Drawing.Color] | Get-Member -MemberType *property -Static |
        Select-Object -ExpandProperty Name |
        ForEach-Object -Begin {
            $result1 = @()
        } -Process {
            $tmp = $_ -split '\s+'
            $result1 += $tmp[0]
        } -End { }
        Write-Verbose -Message "There are $($result1.count) named system colors."
        if ($ExcludeEmpty) {
            Write-Verbose -Message 'Excluding empty and transparent'
            $result1 = $result1 | Where-Object { $_ -notin @('Empty', 'Transparent') }
        }

        if (-not $ColorName) {
            $tmpReturn = $result1 | ForEach-Object { [system.drawing.color]::$_ } |
            Select-Object -Property Name, IsKnownColor, IsNamedColor, IsSystemColor, IsEmpty, R, G, B, A
        } else {
            $result2 = @()
            $result2 += $result1 | Where-Object { $_ -eq "$ColorName" } | ForEach-Object { [System.Drawing.Color]::$_ }
            Write-Verbose -Message "There are $($result2.count) named system colors in the result set."
            $tmpReturn = $result2 | Select-Object -Property Name, IsKnownColor, IsNamedColor, IsSystemColor, IsEmpty, R, G, B, A
        }
        foreach ($R in $tmpReturn) { if ($R.Name -eq '0') { $R.Name = 'Empty' } }
        $tmpReturn | ForEach-Object {
            if ($Full) {
                New-Object -TypeName psobject -Property ([ordered] @{
                        PSTypeName    = 'PFNamedColorFull'
                        Name          = $_.Name
                        IsKnownColor  = $_.IsKnownColor
                        IsNamedColor  = $_.IsNamedColor
                        IsSystemColor = $_.IsSystemColor
                        IsEmpty       = $_.IsEmpty
                        A             = $_.A
                        R             = $_.R
                        G             = $_.G
                        B             = $_.B
                        Hex           = ("{0:X2}{1:X2}{2:X2}" -f ([int] $_.R), ([int] $_.G), ([int] $_.B))
                    })
            } else {
                New-Object -TypeName psobject -Property ([ordered] @{
                        PSTypeName = 'PFNamedColorBrief'
                        Name       = $_.Name
                        R          = $_.R
                        G          = $_.G
                        B          = $_.B
                        Hex        = ("{0:X2}{1:X2}{2:X2}" -f ([int] $_.R), ([int] $_.G), ([int] $_.B))
                    })
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

} # EndFunction Get-NamedColor
