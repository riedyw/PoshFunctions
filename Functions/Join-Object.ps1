Function Join-Object {
<#
.SYNOPSIS
    Combines two object lists based on a related property between them.
.DESCRIPTION
    Combines properties from one or more objects. It creates a set that can
    be saved as a new object or used as it is. An object join is a means for
    combining properties from one (self-join) or more tables by using values
    common to each. The Join-Object cmdlet supports a few proxy commands with
    their own (-JoinType and -Property) defaults:

    * InnerJoin-Object (Alias InnerJoin or Join)
      Returns the joined objects
    * LeftJoin-Object (Alias LeftJoin)
      Returns the joined objects and the rest of the left objects
    * RightJoin-Object (Alias RightJoin)
      Returns the joined objects and the rest of the right objects
    * FullJoin-Object (Alias FullJoin)
      Returns the joined objects and the rest of the left and right objects
    * CrossJoin-Object (Alias CrossJoin)
      Returns each left object joined to each right object
    * Update-Object (Alias Update)
      Returns each left object updated with the right object properties
    * Merge-Object (Alias Merge)
      Returns each left object updated with the right object properties
      and the rest of the right objects
.PARAMETER LeftObject
    The LeftObject, usually provided through the pipeline, defines the
    left object (or datatable) to be joined.
.PARAMETER RightObject
    The RightObject, provided by the first argument, defines the right
    object (or datatable) to be joined.
.PARAMETER On
    The -On parameter (alias -Using) defines which objects should be joined.
    If the -Equals parameter is omitted, the value(s) of the properties
    listed by the -On parameter should be equal at both sides in order to
    join the left object with the right object.

    Note 1: The list of properties defined by the -On parameter will be
    complemented with the list of properties defined by the -Equals
    parameter and vice versa.

    Note 2: Related joined properties will be merged to a single (left)
    property by default (see also the -Property parameter).

    Note 3: If the -On and the -OnExpression parameter are omitted, a
    join by row index is returned.
.PARAMETER Equals
    If the -Equals parameter is supplied, the value(s) of the left object
    properties listed by the -On parameter should be equal to the value(s)
    of the right object listed by the -Equals parameter in order to join
    the left object with the right object.

    Note 1: The list of properties defined by the -Equal parameter will be
    complemented with the list of properties defined by the -On parameter
    and vice versa.

    Note 2: The -Equals parameter can only be used with the -On parameter.
.PARAMETER Strict
    If the -Strict switch is set, the comparison between the related
    properties defined by the -On Parameter (and the -Equals parameter) is
    based on a strict equality (both type and value need to be equal).
.PARAMETER MatchCase
    If the -MatchCase (alias -CaseSensitive) switch is set, the comparison
    between the related properties defined by the -On Parameter (and the
    -Equals parameter) will case sensitive.
.PARAMETER OnExpression
    Any conditional expression (where $Left refers to each left object and
    $Right refers to each right object) that requires to evaluate to true
    in order to join the left object with the right object.

    Note 1: The -OnExporession parameter has the most complex comparison
    possibilities but is considerable slower than the other types.

    Note 2: The -OnExpression parameter cannot be used with the -On
    parameter.
.PARAMETER Where
    An expression that defines the condition to be met for the objects to
    be returned. There is no limit to the number of predicates that can be
    included in the condition.
.PARAMETER Discern
    The -Discern parameter defines how to discern the left and right object
    with respect to the common properties that aren't joined.

    The first string defines how to rename the left property, the second
    string (if defined) defines how to rename the right property.
    If the string contains an asterisks (*), the asterisks will be replaced
    with the original property name, otherwise, the property name will be
    prefixed with the given string.

    Properties that don't exist on both sides will not be renamed.

    Joined properties (defined by the -On parameter) will be merged.

    Note: The -Discern parameter cannot be used with the -Property parameter.
.PARAMETER Property
    A hash table or list of property names (strings) and/or hash tables that
    define a new selection of property names and values

    Hash tables should be in the format @{<PropertyName> = <Expression>}
    where the <Expression> defines how the specific left and right
    properties should be merged. Where the following variables are
    available for each joined object:
    * $_: iterates each property name
    * $Left: the current left object (each self-contained -LeftObject)
    * $LeftIndex: the index of the left object
    * $Right: the current right object (each self-contained -RightObject)
    * $RightIndex: the index of the right object
    If the $LeftObject isn't joined in a Right- or FullJoin then $LeftIndex
    will be $Null and the $Left object will represent an object with each
    property set to $Null.
    If the $RightObject isn't joined in a Left- or FullJoin then $RightIndex
    will be $Null and the $Right object will represent an object with each
    property set to $Null.

    An asterisks (*) represents all known left - and right properties.

    If the -Property and the -Discern parameters are ommited or in case a
    property name (or an asterisks) is supplied without expression, the
    expression will be automatically added using the following rules:
    * If the property only exists on the left side, the expression is:
      {$Left.$_}
    * If the property only exists on the right side, the expression is:
      {$Right.$_}
    * If the properties are joined by the -On parameter, the expression is:
      {If ($Null -ne $LeftIndex) {$Left.$_} Else {$Right.$_}}}
    * If properties aren't joined by the -On parameter, the expression is:
      {$Left.$_, $Right.$_}

    If an expression without a property name assignment is supplied, it will
    be assigned to all known properties in the $LeftObject and $RightObject.

    The last defined expression will overrule any previous defined
    expressions

    Note: The -Property parameter cannot be used with the -Discern parameter.
.PARAMETER JoinType
    Defines which unrelated objects should be included (see: Descripton).
    Valid values are: 'Inner', 'Left', 'Right', 'Full' or 'Cross'.
    The default is 'Inner'.

    Note: It is recommended to use the related proxy commands instead.
.EXAMPLE
    $Employee

    Id Name    Country Department  Age ReportsTo
    -- ----    ------- ----------  --- ---------
     1 Aerts   Belgium Sales        40         5
     2 Bauer   Germany Engineering  31         4
     3 Cook    England Sales        69         1
     4 Duval   France  Engineering  21         5
     5 Evans   England Marketing    35
     6 Fischer Germany Engineering  29         4

    $Department

    Name        Country
    ----        -------
    Engineering Germany
    Marketing   England
    Sales       France
    Purchase    France

    $Employee | InnerJoin $Department -On Country | Format-Table

    Id Name                   Country Department  Age ReportsTo
    -- ----                   ------- ----------  --- ---------
     2 {Bauer, Engineering}   Germany Engineering  31         4
     3 {Cook, Marketing}      England Sales        69         1
     4 {Duval, Sales}         France  Engineering  21         5
     4 {Duval, Purchase}      France  Engineering  21         5
     5 {Evans, Marketing}     England Marketing    35
     6 {Fischer, Engineering} Germany Engineering  29         4
.EXAMPLE
    $Employee | InnerJoin $Department -On Department -Equals Name -Discern Employee, Department | Format-Table

    Id EmployeeName EmployeeCountry Department  Age ReportsTo DepartmentName DepartmentCountry
    -- ------------ --------------- ----------  --- --------- -------------- -----------------
     1 Aerts        Belgium         Sales        40         5 Sales          France
     2 Bauer        Germany         Engineering  31         4 Engineering    Germany
     3 Cook         England         Sales        69         1 Sales          France
     4 Duval        France          Engineering  21         5 Engineering    Germany
     5 Evans        England         Marketing    35           Marketing      England
     6 Fischer      Germany         Engineering  29         4 Engineering    Germany
.EXAMPLE
    $Changes

    Id Name    Country Department  Age ReportsTo
    -- ----    ------- ----------  --- ---------
     3 Cook    England Sales        69         5
     6 Fischer France  Engineering  29         4
     7 Geralds Belgium Sales        71         1

    $Employee | Merge $Changes -On Id | Format-Table

    Id Name    Country Department  Age ReportsTo
    -- ----    ------- ----------  --- ---------
     1 Aerts   Belgium Sales        40         5
     2 Bauer   Germany Engineering  31         4
     3 Cook    England Sales        69         5
     4 Duval   France  Engineering  21         5
     5 Evans   England Marketing    35
     6 Fischer France  Engineering  29         4
     7 Geralds Belgium Sales        71         1
.EXAMPLE
    LeftJoin $Employee -On ReportsTo -Equals Id -Property @{Name = {$Left.Name}; Manager = {$Right.Name}}

    Name    Manager
    ----    -------
    Aerts   Evans
    Bauer   Duval
    Cook    Aerts
    Duval   Evans
    Evans
    Fischer Duval
.NOTES
    # Source https://www.powershellgallery.com/packages/Join/3.2.1
.LINK
    https://github.com/iRon7/Join-Object
#>

    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseLiteralInitializerForHashtable', '', Scope = 'Function')]
    [CmdletBinding(DefaultParameterSetName = 'Default')]
    [OutputType([Object[]])]
    Param (

        [Parameter(ValueFromPipeLine, HelpMessage = 'Add help message for user', Mandatory, ParameterSetName = 'Default')]
        [Parameter(ValueFromPipeLine, Mandatory, ParameterSetName = 'On')]
        [Parameter(ValueFromPipeLine, Mandatory, ParameterSetName = 'Expression')]
        [Parameter(ValueFromPipeLine, Mandatory, ParameterSetName = 'Property')]
        [Parameter(ValueFromPipeLine, Mandatory, ParameterSetName = 'Discern')]
        [Parameter(ValueFromPipeLine, Mandatory, ParameterSetName = 'OnProperty')]
        [Parameter(ValueFromPipeLine, Mandatory, ParameterSetName = 'OnDiscern')]
        [Parameter(ValueFromPipeLine, Mandatory, ParameterSetName = 'ExpressionProperty')]
        [Parameter(ValueFromPipeLine, Mandatory, ParameterSetName = 'ExpressionDiscern')]
        $LeftObject,

        [Parameter(Position = 0, HelpMessage = 'Add help message for user', Mandatory, ParameterSetName = 'Default')]
        [Parameter(Position = 0, Mandatory, ParameterSetName = 'On')]
        [Parameter(Position = 0, Mandatory, ParameterSetName = 'Expression')]
        [Parameter(Position = 0, Mandatory, ParameterSetName = 'Property')]
        [Parameter(Position = 0, Mandatory, ParameterSetName = 'Discern')]
        [Parameter(Position = 0, Mandatory, ParameterSetName = 'OnProperty')]
        [Parameter(Position = 0, Mandatory, ParameterSetName = 'OnDiscern')]
        [Parameter(Position = 0, Mandatory, ParameterSetName = 'ExpressionProperty')]
        [Parameter(Position = 0, Mandatory, ParameterSetName = 'ExpressionDiscern')]
        [Parameter(Position = 0, Mandatory, ParameterSetName = 'Self')]
        [Parameter(Position = 0, Mandatory, ParameterSetName = 'SelfOn')]
        [Parameter(Position = 0, Mandatory, ParameterSetName = 'SelfExpression')]
        [Parameter(Position = 0, Mandatory, ParameterSetName = 'SelfProperty')]
        [Parameter(Position = 0, Mandatory, ParameterSetName = 'SelfDiscern')]
        [Parameter(Position = 0, Mandatory, ParameterSetName = 'SelfOnProperty')]
        [Parameter(Position = 0, Mandatory, ParameterSetName = 'SelfOnDiscern')]
        [Parameter(Position = 0, Mandatory, ParameterSetName = 'SelfExpressionProperty')]
        [Parameter(Position = 0, Mandatory, ParameterSetName = 'SelfExpressionDiscern')]
        $RightObject,

        [Parameter(Position = 1, HelpMessage = 'Add help message for user', ParameterSetName = 'On', Mandatory)]
        [Parameter(Position = 1, ParameterSetName = 'OnProperty', Mandatory)]
        [Parameter(Position = 1, ParameterSetName = 'OnDiscern', Mandatory)]
        [Parameter(Position = 1, ParameterSetName = 'SelfOn', Mandatory)]
        [Parameter(Position = 1, ParameterSetName = 'SelfOnProperty', Mandatory)]
        [Parameter(Position = 1, ParameterSetName = 'SelfOnDiscern', Mandatory)]
        [Alias('Using')][String[]]$On,

        [Parameter(Position = 1, HelpMessage = 'Add help message for user', ParameterSetName = 'Expression', Mandatory)]
        [Parameter(Position = 1, ParameterSetName = 'ExpressionProperty', Mandatory)]
        [Parameter(Position = 1, ParameterSetName = 'ExpressionDiscern', Mandatory)]
        [Parameter(Position = 1, ParameterSetName = 'SelfExpression', Mandatory)]
        [Parameter(Position = 1, ParameterSetName = 'SelfExpressionProperty', Mandatory)]
        [Parameter(Position = 1, ParameterSetName = 'SelfExpressionDiscern', Mandatory)]
        [Alias('UsingExpression')][ScriptBlock]$OnExpression,

        [Parameter(ParameterSetName = 'On')]
        [Parameter(ParameterSetName = 'OnProperty')]
        [Parameter(ParameterSetName = 'OnDiscern')]
        [Parameter(ParameterSetName = 'SelfOn')]
        [Parameter(ParameterSetName = 'SelfOnProperty')]
        [Parameter(ParameterSetName = 'SelfOnDiscern')]
        [String[]]$Equals,

        [Parameter(Position = 2, HelpMessage = 'Add help message for user', ParameterSetName = 'Discern', Mandatory)]
        [Parameter(Position = 2, ParameterSetName = 'OnDiscern', Mandatory)]
        [Parameter(Position = 2, ParameterSetName = 'ExpressionDiscern', Mandatory)]
        [Parameter(Position = 2, ParameterSetName = 'SelfDiscern', Mandatory)]
        [Parameter(Position = 2, ParameterSetName = 'SelfOnDiscern', Mandatory)]
        [Parameter(Position = 2, ParameterSetName = 'SelfExpressionDiscern', Mandatory)]
        [AllowEmptyString()][String[]]$Discern,

        [Parameter(ParameterSetName = 'Property', HelpMessage = 'Add help message for user', Mandatory)]
        [Parameter(ParameterSetName = 'OnProperty', Mandatory)]
        [Parameter(ParameterSetName = 'ExpressionProperty', Mandatory)]
        [Parameter(ParameterSetName = 'SelfProperty', Mandatory)]
        [Parameter(ParameterSetName = 'SelfOnProperty', Mandatory)]
        [Parameter(ParameterSetName = 'SelfExpressionProperty', Mandatory)]
        $Property,

        [Parameter(Position = 3, ParameterSetName = 'Default')]
        [Parameter(Position = 3, ParameterSetName = 'On')]
        [Parameter(Position = 3, ParameterSetName = 'Expression')]
        [Parameter(Position = 3, ParameterSetName = 'Property')]
        [Parameter(Position = 3, ParameterSetName = 'Discern')]
        [Parameter(Position = 3, ParameterSetName = 'OnProperty')]
        [Parameter(Position = 3, ParameterSetName = 'OnDiscern')]
        [Parameter(Position = 3, ParameterSetName = 'ExpressionProperty')]
        [Parameter(Position = 3, ParameterSetName = 'ExpressionDiscern')]
        [Parameter(Position = 3, ParameterSetName = 'Self')]
        [Parameter(Position = 3, ParameterSetName = 'SelfOn')]
        [Parameter(Position = 3, ParameterSetName = 'SelfExpression')]
        [Parameter(Position = 3, ParameterSetName = 'SelfProperty')]
        [Parameter(Position = 3, ParameterSetName = 'SelfDiscern')]
        [Parameter(Position = 3, ParameterSetName = 'SelfOnProperty')]
        [Parameter(Position = 3, ParameterSetName = 'SelfOnDiscern')]
        [Parameter(Position = 3, ParameterSetName = 'SelfExpressionProperty')]
        [Parameter(Position = 3, ParameterSetName = 'SelfExpressionDiscern')]
        [ScriptBlock]$Where = { $True },

        [Parameter(ParameterSetName = 'Default')]
        [Parameter(ParameterSetName = 'On')]
        [Parameter(ParameterSetName = 'Expression')]
        [Parameter(ParameterSetName = 'Property')]
        [Parameter(ParameterSetName = 'Discern')]
        [Parameter(ParameterSetName = 'OnProperty')]
        [Parameter(ParameterSetName = 'OnDiscern')]
        [Parameter(ParameterSetName = 'ExpressionProperty')]
        [Parameter(ParameterSetName = 'ExpressionDiscern')]
        [Parameter(ParameterSetName = 'Self')]
        [Parameter(ParameterSetName = 'SelfOn')]
        [Parameter(ParameterSetName = 'SelfExpression')]
        [Parameter(ParameterSetName = 'SelfProperty')]
        [Parameter(ParameterSetName = 'SelfDiscern')]
        [Parameter(ParameterSetName = 'SelfOnProperty')]
        [Parameter(ParameterSetName = 'SelfOnDiscern')]
        [Parameter(ParameterSetName = 'SelfExpressionProperty')]
        [Parameter(ParameterSetName = 'SelfExpressionDiscern')]
        [ValidateSet('Inner', 'Left', 'Right', 'Full', 'Cross')]$JoinType = 'Inner',

        [Parameter(ParameterSetName = 'On')]
        [Parameter(ParameterSetName = 'OnProperty')]
        [Parameter(ParameterSetName = 'OnDiscern')]
        [Parameter(ParameterSetName = 'SelfOn')]
        [Parameter(ParameterSetName = 'SelfOnProperty')]
        [Parameter(ParameterSetName = 'SelfOnDiscern')]
        [Switch]$Strict,

        [Parameter(ParameterSetName = 'On')]
        [Parameter(ParameterSetName = 'OnProperty')]
        [Parameter(ParameterSetName = 'OnDiscern')]
        [Parameter(ParameterSetName = 'SelfOn')]
        [Parameter(ParameterSetName = 'SelfOnProperty')]
        [Parameter(ParameterSetName = 'SelfOnDiscern')]
        [Alias('CaseSensitive')][Switch]$MatchCase
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $HashTable = $Null
        $Esc = [Char]27
        $EscSeparator = $Esc + ','
        $Expression = [Ordered]@{}
        $PropertyList = [Ordered]@{}
        $Related = @()
        if ($RightObject -isnot [Array] -and $RightObject -isnot [Data.DataTable]) {
            $RightObject = @($RightObject)
        }
        $RightKeys = @(
            if ($RightObject -is [Data.DataTable]) {
                $RightObject.Columns | Select-Object -ExpandProperty 'ColumnName'
            } else {
                $First = $RightObject | Select-Object -First 1
                if ($First -is [System.Collections.IDictionary]) {
                    $First.Get_Keys()
                } else {
                    $First.PSObject.Properties | Select-Object -ExpandProperty 'Name'
                }
            }
        )
        $RightProperties = @{}
        foreach ($Key in $RightKeys) {
            $RightProperties.$Key = $Null
        }
        $RightVoid = New-Object -TypeName PSCustomObject -Property $RightProperties
        $RightLength = @($RightObject).Length
        $LeftIndex = 0
        $InnerRight = @($False) * $RightLength

        function OutObject($LeftIndex, $RightIndex, $Left = $LeftVoid, $Right = $RightVoid) {
            If (&$Where) {
                ForEach ($_ in $Expression.Get_Keys()) { $PropertyList.$_ = &$Expression.$_ }
                New-Object -TypeName PSCustomObject -Property $PropertyList
            }
        }

        function SetExpression([String]$Key, [ScriptBlock]$ScriptBlock) {
            if ($Key -eq '*') {
                $Key = $Null
            }
            if ($Key -and $ScriptBlock) {
                $Expression.$Key = $ScriptBlock
            } else {
                $Keys = if ($Key) {
                    @($Key)
                } else {
                    $LeftKeys + $RightKeys
                }
                foreach ($Key in $Keys) {
                    if (!$Expression.Contains($Key)) {
                        $InLeft = $LeftKeys -Contains $Key
                        $InRight = $RightKeys -Contains $Key
                        if ($InLeft -and $InRight) {
                            $Expression.$Key = If ($ScriptBlock) { $ScriptBlock }
                            elseif ($Related -NotContains $Key) { { $Left.$_, $Right.$_ } }
                            else { { if ($Null -ne $LeftIndex) { $Left.$_ } else { $Right.$_ } } }
                        } elseif ($InLeft) { $Expression.$Key = { $Left.$_ } }
                        elseif ($InRight) { $Expression.$Key = { $Right.$_ } }
                        else { throw "The property '$Key' cannot be found on the left or right object." }
                    }
                }
            }
        }
    }

    process {
        $SelfJoin = !$PSBoundParameters.ContainsKey('LeftObject')
        If ($SelfJoin) {
            $LeftObject = $RightObject
        }
        foreach ($Left in @($LeftObject)) {
            $InnerLeft = $Null
            if (!$LeftIndex) {
                $LeftKeys = @(
                    if ($Left -is [Data.DataRow]) {
                        $Left.Table.Columns | Select-Object -ExpandProperty 'ColumnName'
                    } elseif ($Left -is [System.Collections.IDictionary]) {
                        $Left.Get_Keys()
                    } else {
                        $Left.PSObject.Properties | Select-Object -ExpandProperty 'Name'
                    }
                )
                $LeftProperties = @{}
                foreach ($Key in $LeftKeys) {
                    $LeftProperties.$Key = $Null
                }
                $LeftVoid = New-Object -TypeName PSCustomObject -Property $LeftProperties
                if ($Null -ne $On -or $Null -ne $Equals) {
                    $On = if ($On) {
                        , @($On)
                    } else {
                        , @()
                    }
                    $Equals = if ($Equals) {
                        , @($Equals)
                    } else {
                        , @()
                    }
                    for ($i = 0; $i -lt [Math]::Max($On.Length, $Equals.Length); $i++) {
                        if ($i -ge $On.Length) {
                            $On += $Equals[$i]
                        }
                        if ($LeftKeys -NotContains $On[$i]) {
                            throw "The property '$($On[$i])' cannot be found on the left object."
                        }
                        if ($i -ge $Equals.Length) {
                            $Equals += $On[$i]
                        }
                        if ($RightKeys -NotContains $Equals[$i]) {
                            throw "The property '$($Equals[$i])' cannot be found on the right object."
                        }
                        if ($On[$i] -eq $Equals[$i]) {
                            $Related += $On[$i]
                        }
                    }
                    $HashTable = if ($MatchCase) {
                        [HashTable]::New(0, [StringComparer]::Ordinal)
                    } else {
                        @{}
                    }
                    $RightIndex = 0
                    foreach ($Right in $RightObject) {
                        $Keys = foreach ($Name in @($Equals)) {
                            $Right.$Name
                        }
                        $HashKey = if (!$Strict) {
                            [String]::Join($EscSeparator, @($Keys))
                        } else {
                            [System.Management.Automation.PSSerializer]::Serialize($Keys)
                        }
                        [Array] $HashTable[$HashKey] += $RightIndex++
                    }
                }
                if ($Discern) {
                    if (@($Discern).Count -le 1) {
                        $Discern = @($Discern) + ''
                    }
                    foreach ($Key in $LeftKeys) {
                        if ($RightKeys -Contains $Key) {
                            if ($Related -Contains $Key) {
                                $Expression[$Key] = {
                                    if ($Null -ne $LeftIndex) {
                                        $Left.$_
                                    } else {
                                        $Right.$_
                                    }
                                }
                            } else {
                                $Name = if ($Discern[0].Contains('*')) {
                                    ([Regex]'\*').Replace($Discern[0], $Key, 1)
                                } else {
                                    $Discern[0] + $Key
                                }
                                $Expression[$Name] = [ScriptBlock]::Create("`$Left.'$Key'")
                            }
                        } else {
                            $Expression[$Key] = { $Left.$_ }
                        }
                    }
                    foreach ($Key in $RightKeys) {
                        if ($LeftKeys -Contains $Key) {
                            if ($Related -NotContains $Key) {
                                $Name = if ($Discern[1].Contains('*')) {
                                    ([Regex]'\*').Replace($Discern[1], $Key, 1)
                                } else {
                                    $Discern[1] + $Key
                                }
                                $Expression[$Name] = [ScriptBlock]::Create("`$Right.'$Key'")
                            }
                        } else {
                            $Expression[$Key] = { $Right.$_ }
                        }
                    }
                } elseif ($Property) {
                    foreach ($Item in @($Property)) {
                        if ($Item -is [ScriptBlock]) {
                            SetExpression -Key $Null -ScriptBlock $Item
                        } elseif ($Item -is [System.Collections.IDictionary]) {
                            foreach ($Key in $Item.Get_Keys()) {
                                SetExpression -Key $Key -ScriptBlock $Item.$Key
                            }
                        } else {
                            SetExpression -Key $Item
                        }
                    }
                } else {
                    SetExpression
                }
            }
            $RightList = `
                if ($On) {
                if ($JoinType -eq 'Cross') {
                    throw 'The On parameter cannot be used on a cross join.'
                }
                $Keys = forEach ($Name in @($On)) {
                    $Left.$Name
                }
                $HashKey = if (!$Strict) {
                    [String]::Join($EscSeparator, @($Keys))
                } else {
                    [System.Management.Automation.PSSerializer]::Serialize($Keys)
                }
                $HashTable[$HashKey]
            } elseif ($OnExpression) {
                if ($JoinType -eq 'Cross') {
                    throw 'The OnExpression parameter cannot be used on a cross join.'
                }
                for ($RightIndex = 0; $RightIndex -lt $RightLength; $RightIndex++) {
                    $Right = $RightObject[$RightIndex]
                    if (&$OnExpression) {
                        $RightIndex
                    }
                }
            } elseif ($JoinType -eq 'Cross') {
                0..($RightObject.Length - 1)
            } elseif ($LeftIndex -lt $RightLength) {
                $LeftIndex
            } else {
                $Null
            }
            foreach ($RightIndex in $RightList) {
                $Right = if ($RightObject -is [Data.DataTable]) {
                    $RightObject.Rows[$RightIndex]
                } else {
                    $RightObject[$RightIndex]
                }
                $OutObject = OutObject -LeftIndex $LeftIndex -RightIndex $RightIndex -Left $Left -Right $Right
                if ($Null -ne $OutObject) {
                    $OutObject
                    $InnerLeft = $True
                    $InnerRight[$RightIndex] = $True
                }
            }
            if (!$InnerLeft -and ($JoinType -eq 'Left' -or $JoinType -eq 'Full')) {
                OutObject -LeftIndex $LeftIndex -Left $Left
            }
            $LeftIndex++
        }
    }

    end {
        if ($JoinType -eq 'Right' -or $JoinType -eq 'Full') {
            $Left = $Null
            $RightIndex = 0
            foreach ($Right in $RightObject) {
                if (!$InnerRight[$RightIndex]) {
                    OutObject -RightIndex $RightIndex -Right $Right
                }
                $RightIndex++
            }
        }
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
} # EndFunction Join-Object

# Function Copy-Command([System.Management.Automation.CommandInfo]$Command, [String]$Name, [HashTable]$DefaultParameters) {
# Try {
# $MetaData = [System.Management.Automation.CommandMetadata]$Command
# $Value = [System.Management.Automation.ProxyCommand]::Create($MetaData)
# $Null = New-Item -Path Function:\ -Name "Script:$Name" -Value $Value -Force
# ForEach ($Key in $DefaultParameters.Keys) {$PSDefaultParameterValues["$Name`:$Key"] = $DefaultParameters.$Key}
# } Catch {$PSCmdlet.WriteError($_)}
# }

# $JoinCommand = Get-Command Join-Object
# Copy-Command -Command $JoinCommand -Name 'InnerJoin-Object' -Default @{JoinType = 'Inner'}; Set-Alias InnerJoin InnerJoin-Object
# Copy-Command -Command $JoinCommand -Name 'LeftJoin-Object'  -Default @{JoinType = 'Left'};  Set-Alias LeftJoin  LeftJoin-Object
# Copy-Command -Command $JoinCommand -Name 'RightJoin-Object' -Default @{JoinType = 'Right'}; Set-Alias RightJoin RightJoin-Object
# Copy-Command -Command $JoinCommand -Name 'FullJoin-Object'  -Default @{JoinType = 'Full'};  Set-Alias FullJoin  FullJoin-Object
# Copy-Command -Command $JoinCommand -Name 'CrossJoin-Object' -Default @{JoinType = 'Cross'}; Set-Alias CrossJoin CrossJoin-Object
# Copy-Command -Command $JoinCommand -Name 'Update-Object'    -Default @{JoinType = 'Left'; Property = {{If ($Null -ne $RightIndex) {$Right.$_} Else {$Left.$_}}}}; Set-Alias Update Update-Object
# Copy-Command -Command $JoinCommand -Name Merge-Object     -Default @{JoinType = 'Full'; Property = {{If ($Null -ne $RightIndex) {$Right.$_} Else {$Left.$_}}}}; Set-Alias Merge  Merge-Object
