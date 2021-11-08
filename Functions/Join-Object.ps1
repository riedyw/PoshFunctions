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
    # Source https://www.powershellgallery.com/packages/Join/3.5.3
.LINK
    https://github.com/iRon7/Join-Object
#>

    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('InjectionRisk.Create', '', Scope = 'Function')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseLiteralInitializerForHashtable', '', Scope = 'Function')]
    [CmdletBinding(DefaultParameterSetName = 'Default')]
    [OutputType([Object[]])]
    param(

        [Parameter(ValueFromPipeLine = $True, ParameterSetName = 'Default')]
        [Parameter(ValueFromPipeLine = $True, ParameterSetName = 'On')]
        [Parameter(ValueFromPipeLine = $True, ParameterSetName = 'Expression')]
        $LeftObject,

        [Parameter(Position = 0, ParameterSetName = 'Default')]
        [Parameter(Position = 0, ParameterSetName = 'On')]
        [Parameter(Position = 0, ParameterSetName = 'Expression')]
        $RightObject,

        [Parameter(Position = 1, ParameterSetName = 'On')]
        [Alias('Using')]
        [Collections.Generic.List[string]] $On = [Collections.Generic.List[string]]::new(),

        [Parameter(Position = 1, ParameterSetName = 'Expression')]
        [Alias('UsingExpression')]
        [scriptblock] $OnExpression,

        [Parameter(ParameterSetName = 'On')]
        [Collections.Generic.List[string]] $Equals = [Collections.Generic.List[string]]::new(),

        [Parameter(Position = 2, ParameterSetName = 'Default')]
        [Parameter(Position = 2, ParameterSetName = 'On')]
        [Parameter(Position = 2, ParameterSetName = 'Expression')]
        [Alias('NameItems')]
        [AllowEmptyString()]
        [String[]] $Discern,

        [Parameter(ParameterSetName = 'Default')]
        [Parameter(ParameterSetName = 'On')]
        [Parameter(ParameterSetName = 'Expression')]
        $Property,

        [Parameter(Position = 3, ParameterSetName = 'Default')]
        [Parameter(Position = 3, ParameterSetName = 'On')]
        [Parameter(Position = 3, ParameterSetName = 'Expression')]
        [scriptblock] $Where = { $True },

        [Parameter(ParameterSetName = 'Default')]
        [Parameter(ParameterSetName = 'On')]
        [Parameter(ParameterSetName = 'Expression')]
        [ValidateSet('Inner', 'Left', 'Right', 'Full', 'Cross')]
        [String] $JoinType = 'Inner',

        [Parameter(ParameterSetName = 'Default')]
        [Parameter(ParameterSetName = 'On')]
        [Parameter(ParameterSetName = 'Expression')]
        [string] $ValueName = 'Value',

        [Parameter(ParameterSetName = 'On')]
        [switch] $Strict,

        [Parameter(ParameterSetName = 'On')]
        [Alias('CaseSensitive')]
        [switch] $MatchCase
    )
    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        function StopError($Exception, $Id = 'IncorrectArgument', $Group = [Management.Automation.ErrorCategory]::SyntaxError, $Object){
            if ($Exception -isnot [Exception]) { $Exception = [ArgumentException]$Exception }
            $PSCmdlet.ThrowTerminatingError([System.Management.Automation.ErrorRecord]::new($Exception, $Id, $Group, $Object))
        }
        function GetKeys($Object) {
            if ($Null -eq $Object) {}
            elseif ($Object -is [string] -or $Object -is [ValueType] -or $Object -is [Array]) { $ValueName }
            elseif ($Object -is [Collections.ObjectModel.Collection[psobject]]) { $ValueName }
            elseif ($Object -is [Data.DataRow]) { $Object.Table.Columns.ColumnName }
            elseif ($Object -is [System.Collections.IDictionary]) { $Object.Get_Keys() }
            elseif ($Object) { $Object.PSObject.Properties.Name }
        }
        function GetProperties($Object, $Keys) {
            if (@($Keys).Count -eq 1 -and $Keys.Contains($ValueName) ) { [ordered]@{ $ValueName = $Object } }
            else {
                $Properties = [ordered]@{}
                if ($Null -ne $Object) {
                    foreach ($Key in $Keys) { $Properties.Add($Key, $Object.psobject.properties[$Key].Value) }
                }
                $Properties
            }
        }
        function AsDictionary($Object) {
            if ($Object -isnot [array] -and $Object -isnot [Data.DataTable]) { $Object = @($Object) }
            $Keys = @(GetKeys ($Object |Select-Object -First 1))
            ,@(foreach ($Item in $Object) {
                if ($Item -is [Collections.IDictionary]) { $Object; Break } else { GetProperties $Item $Keys }
            })
        }
        function SetExpression ($Key = '*', $Expression) {
            $Wildcard = if ($Key -is [ScriptBlock]) { $BothKeys } else {
                if (!$BothKeys.Contains($Key)) {
                    if ($Key.Trim() -eq '*') { $BothKeys }
                    else {
                        $Side, $Asterisks = $Key.Split('.', 2)
                        if ($Null -ne $Asterisks -and $Asterisks.Trim() -eq '*') {
                            if ($Side -eq 'Left') { $LeftKeys } elseif ($Side -eq 'Right') { $RightKeys }
                        }
                    }
                }
            }
            if ($Null -ne $Wildcard) {
                if ($Null -eq $Expression) { $Expression = $Key }
                foreach ($Key in $Wildcard) {
                    if ($Null -ne $Key -and !$Expressions.Contains($Key)) {
                        $Expressions[$Key] = $Expression
                    }
                }
            }
            else { $Expressions[$Key] = if ($Expression) { $Expression } else { ' * ' } }
        }
        function OutObject ($LeftIndex, $RightIndex, $Left, $Right) {
            $Nodes = [Ordered]@{}
            foreach ($_ in $Expressions.Get_Keys()) {
                $Value0 = [System.Management.Automation.Internal.AutomationNull]::Value
                $Value1 = [System.Management.Automation.Internal.AutomationNull]::Value
                if ($Expressions[$_] -is [scriptblock]) { $Value0 = &([scriptblock]::Create($Expressions[$_])) } else {
                    $Key = $Expressions[$_]
                    if ($LeftRight.Contains($Key) -or $RightLeft.Contains($Key)) {
                        if ($LeftRight.Contains($Key) -and $RightLeft.Contains($Key)) { $Value0 = $Left[$Key]; $Value1 = $Right[$Key] }
                        elseif ($LeftRight.Contains($Key)) { $Value0 = $Left[$Key] }
                        else { $Value0 = $Right[$Key] } # if($RightLeft.Contains($_))
                    }
                    elseif ($Key.Trim() -eq '*') {
                        if ($LeftRight.Contains($_) -and $RightLeft.Contains($_)) {
                            if ($LeftRight[$_] -eq $_) { if ($Null -ne $LeftIndex -and $Left.Contains($_)) { $Value0 = $Left[$_] } else { $Value0 = $Right[$_] } }
                            elseif ($Null -eq $LeftRight[$_] -and $Null -ne $RightLeft[$_]) { $Value0 = $Left[$_] }
                            elseif ($Null -ne $LeftRight[$_] -and $Null -eq $RightLeft[$_]) { $Value0 = $Right[$_] }
                            else { $Value0 = $Left[$_]; $Value1 = $Right[$_] }
                        }
                        elseif ($LeftRight.Contains($_))  {
                            if ($Null -ne $LeftIndex -and $Left.Contains($_)) { $Value0 = $Left[$_] }
                            elseif ($Null -ne $LeftRight[$_]) { $Value0 = $Right[$LeftRight[$_]] }
                        }
                        elseif ($RightLeft.Contains($_)) {
                            if ($Null -ne $RightIndex -and $Right.Contains($_)) { $Value0 = $Right[$_] }
                            elseif ($Null -ne $RightLeft[$_]) { $Value0 = $Left[$RightLeft[$_]] }
                        }
                    }
                    else {
                        $Side, $Key = $Key.Split('.', 2)
                        if ($Null -ne $Key) {
                            if ($Side[0] -eq 'L') {
                                if ($LeftRight.Contains($Key)) { $Value0 = $Left[$Key] }
                                elseif ($Key -eq '*') {
                                    if ($Null -ne $LeftIndex -and $Left.Contains($_)) { $Value0 = $Left[$_] }
                                    elseif ($Null -ne $RightIndex -and $Right.Contains($_)) { $Value0 = $Right[$_] }
                                }
                            }
                            if ($Side[0] -eq 'R') {
                                if ($RightLeft.Contains($Key)) { $Value0 = $Right[$Key] }
                                elseif ($Key -eq '*') {
                                    if ($Null -ne $RightIndex -and $Right.Contains($_)) { $Value0 = $Right[$_] }
                                    elseif ($Null -ne $LeftIndex -and $Left.Contains($_)) { $Value0 = $Left[$_] }
                                }
                            }
                        } else { StopError "The property '$Key' doesn't exists" 'MissingProperty' }
                    }
                }
                if (@($Value1).Count) {
                    $Node = [Collections.ObjectModel.Collection[psobject]]::new()
                    if ($Value0 -is [Collections.ObjectModel.Collection[psobject]]) { foreach ($Value in $Value0) { $Node.Add($Value) } } else { $Node.Add($Value0) }
                    if ($Value1 -is [Collections.ObjectModel.Collection[psobject]]) { foreach ($Value in $Value1) { $Node.Add($Value) } } else { $Node.Add($Value1) }
                } else { $Node = $Value0 }
                if ($Node -is [Collections.ObjectModel.Collection[psobject]] -and $Null -ne $Discern) {
                    if ($Node.Count -eq $Discern.Count + 1) { $Nodes[$_] = $Node[$Node.Count - $Discern.Count - 1] }
                    if ($Node.Count -gt $Discern.Count + 1) { $Nodes[$_] = $Node[0..($Node.Count - $Discern.Count - 1)] }
                    for ($i = [math]::Min($Node.Count, $Discern.Count); $i -gt 0; $i--) {
                        $Rename = $Discern[$Discern.Count - $i]
                        $Name = if ($Rename.Contains('*')) { ([regex]"\*").Replace($Rename, $_, 1) } elseif ( $_ -eq $ValueName) { $Rename} else { $Rename + $_ }
                        $Nodes[$Name] = if ($Nodes.Contains($Name)) { @($Nodes[$Name]) + $Node[$Node.Count - $i] } else { $Node[$Node.Count - $i] }
                    }
                } else { $Nodes[$_] = $Node }
            }
            if ($Nodes.Count -eq 1 -and $Nodes.Contains($ValueName)) { ,$Nodes[0] } else { New-Object PSCustomObject -Property $Nodes }
        }
        function ProcessObject ($Left) {
            if ($Null -eq $LeftKeys) { ([ref]$LeftKeys).Value = GetKeys $Left }
            if ($Left -isnot [Collections.IDictionary]) { $Left = GetProperties $Left $LeftKeys }
            if (!$LeftIndex) {
                ([ref]$InnerRight).Value = [Boolean[]](@($False) * $RightList.Count)
                foreach ($Key in $LeftKeys) {
                    $LeftRight[$Key] = $Null                                    # Left to Right relation
                    if ($Left[$Key] -isnot [Collections.ObjectModel.Collection[psobject]]) { $LeftNull[$Key] = $Null }
                    else { $LeftNull[$Key] = [Collections.ObjectModel.Collection[psobject]]( ,$Null * $Left[$Key].Count) }
                }
                $Right = if ($RightList) { $RightList[0] }
                ([ref]$RightKeys).Value = if ($Null -ne $Right) { $Right.get_Keys() } else { @() }
                foreach ($Key in $RightKeys) {
                    $RightLeft[$Key] = $Null                                    # Right to Left relation
                    if ($Right[$Key] -isnot [Collections.ObjectModel.Collection[psobject]]) { $RightNull[$Key] = $Null }
                    else { $RightNull[$Key] = [Collections.ObjectModel.Collection[psobject]]( ,$Null * $Left[$Key].Count) }
                }
                $BothKeys = New-Object System.Collections.Generic.HashSet[Object]
                foreach ($Key in (@($LeftKeys) + $RightKeys)) { $Null = $BothKeys.Add($Key) }
                if ($On.Count) {
                    if ($On.Count -eq 1 -and $On[0].Trim() -eq '*' -and !$BothKeys.Contains('*')) { # Use e.g. -On ' * ' if there exists an '*' property
                        $On.Clear()
                        $LeftRight.Get_Keys().Where{ $RightLeft.Contains($_) }.ForEach{ $On.Add($_) }
                    }
                    for ($i = 0; $i -lt [math]::Max($On.Count, $Equals.Count); $i++) {
                        if ($i -ge $On.Count) { $On.Add($Equals[$i]) }
                        if (!$LeftRight.ContainsKey($On[$i])) { StopError "The property '$($On[$i])' cannot be found on the left object." 'MissingLeftProperty' }
                        if ($i -ge $Equals.Count) { $Equals.Add($On[$i]) }
                        if (!$RightLeft.ContainsKey($Equals[$i])) { StopError "The property '$($Equals[$i])' cannot be found on the right object." 'MissingRightProperty' }
                        $LeftRight[$On[$i]] = $Equals[$i]
                        $RightLeft[$Equals[$i]] = $On[$i]
                    }
                    $RightIndex = 0; foreach ($Right in $RightList) {
                        $JoinKeys = foreach ($Name in $Equals) { $Right[$Name] }
                        $HashKey = if (!$Strict) { [string]::Join($EscSeparator, @($JoinKeys)) }
                                   else { [System.Management.Automation.PSSerializer]::Serialize($JoinKeys) }
                        if ($RightIndices.ContainsKey($HashKey)) { $RightIndices[$HashKey].Add($RightIndex++) } else { $RightIndices.Add($HashKey, $RightIndex++) }
                    }
                }
                if ($Property) {
                    foreach ($Item in @($Property)) {
                        if ($Item -is [System.Collections.IDictionary]) { foreach ($Key in $Item.Get_Keys()) { SetExpression $Key $Item[$Key] } }
                        else { SetExpression $Item }
                    }
                } else { SetExpression }
            }
            $Indices =
                if ($On.Count) {
                    if ($JoinType -eq 'Cross') { StopError 'The On parameter cannot be used on a cross join.' 'CrossOn' }
                    $JoinKeys = foreach ($Name in $On) { $Left[$Name] }
                    $HashKey = if (!$Strict) { [string]::Join($EscSeparator, @($JoinKeys)) }
                               else { [System.Management.Automation.PSSerializer]::Serialize($JoinKeys) }
                    $RightIndices[$HashKey]
                }
                elseif ($OnExpression) {
                    if ($JoinType -eq 'Cross') { StopError 'The OnExpression parameter cannot be used on a cross join.' 'CrossExpression' }
                    for ($RightIndex = 0; $RightIndex -lt $RightList.Count; $RightIndex++) {
                        $Right = $RightList[$RightIndex]; if (&([scriptblock]::Create($OnExpression))) { $RightIndex }
                    }
                }
                elseif ($JoinType -eq 'Cross') { 0..($RightList.Length - 1) }
                elseif ($LeftIndex -lt $RightList.Count) { $LeftIndex } else { $Null }
            foreach ($RightIndex in $Indices) {
                $Right = $RightList[$RightIndex]
                if (&([scriptblock]::Create($Where))) {
                    OutObject -LeftIndex $LeftIndex -RightIndex $RightIndex -Left $Left -Right $Right
                    $InnerLeft = $True
                    $InnerRight[$RightIndex] = $True
                }
            }
            $RightIndex = $Null; $Right = $RightNull
            if (!$InnerLeft -and ($JoinType -eq 'Left' -or $JoinType -eq 'Full')) {
                if (&([scriptblock]::Create($Where))) { OutObject -LeftIndex $LeftIndex -RightIndex $RightIndex -Left $Left -Right $Right }
            }
        }
        if ($PSBoundParameters.ContainsKey('Discern') -and !$Discern) { $Discern = @() }
        $Esc = [char]27; $EscSeparator = $Esc + ', '
        $Expressions = [Ordered]@{}
        $StringComparer = if ($MatchCase) { [StringComparer]::Ordinal } Else { [StringComparer]::OrdinalIgnoreCase }
        $Processed, $LeftKeys, $InnerLeft, $RightKeys, $InnerRight, $Pipeline, $LeftList = $Null
        $RightIndices = [Collections.Generic.Dictionary[string, [Collections.Generic.List[Int]]]]::new($StringComparer)
        $LeftRight = @{}; $RightLeft = @{}; $LeftNull = [ordered]@{}; $RightNull = [ordered]@{}
        $LeftParameter = $PSBoundParameters.ContainsKey('LeftObject')
        $RightParameter = $PSBoundParameters.ContainsKey('RightObject')
        $RightList = if ($RightParameter) { AsDictionary $RightObject }
        $LeftIndex = 0
    }
    process {
        $Processed = $True # The Process block is invoked (once) if the pipeline is omitted but not if it is empty: @()
        if ($LeftParameter) { $LeftList = AsDictionary $LeftObject }
        else {
            if ($Null -eq $Pipeline) { $Pipeline = [Collections.Generic.List[Collections.IDictionary]]::New() }
            if ($Null -ne $LeftObject) {
                if ($Null -eq $LeftKeys) { $LeftKeys = GetKeys $LeftObject }
                if ($LeftObject -isnot [Collections.IDictionary]) { $LeftObject = GetProperties $LeftObject $LeftKeys }
                if ($RightParameter) { ProcessObject $LeftObject; $LeftIndex++ } else { $Pipeline.Add($LeftObject) }
            }
        }
    }
    end {
        if (!($LeftParameter -or $Pipeline) -and !$RightParameter) { StopError 'A value for either the LeftObject, pipeline or the RightObject is required.' 'MissingObject' }
        if ($Pipeline) { $LeftList = $Pipeline } elseif (!$Processed) { $LeftList = @() }
        if (!$LeftIndex) { # Not yet streamed/processed
            if ($Null -eq $LeftList)  { $LeftList = $RightList } # Right Self Join
            if ($Null -eq $RightList) { $RightList = $LeftList } # Left Self Join
            foreach ($Left in $LeftList) { ProcessObject $Left; $LeftIndex++ }
        }
        if ($JoinType -eq 'Right' -or $JoinType -eq 'Full') {
            $LeftIndex = $Null; $Left = $LeftNull
            $RightIndex = 0; foreach ($Right in $RightList) {
                if (!$InnerRight[$RightIndex]) {
                    if (&([scriptblock]::Create($Where))) { OutObject -LeftIndex $LeftIndex -RightIndex $RightIndex -Left $Left -Right $Right }
                }
                $RightIndex++
            }
        }
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
} # EndFunction Join-Object
