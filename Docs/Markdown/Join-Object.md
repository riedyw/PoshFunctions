---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Join-Object

## SYNOPSIS

Combines two object lists based on a related property between them.

## SYNTAX

### Default (Default)

```
Join-Object [[-RightObject <Object>]] [[-Discern <String[]>]] [[-Where <ScriptBlock>]] [-JoinType <String>] [-LeftObject <Object>] [-Property <Object>] [-ValueName <String>] [<CommonParameters>]
```

### Expression

```
Join-Object [[-RightObject <Object>]] [[-OnExpression <ScriptBlock>]] [[-Discern <String[]>]] [[-Where <ScriptBlock>]] [-JoinType <String>] [-LeftObject <Object>] [-Property <Object>] [-ValueName <String>] [<CommonParameters>]
```

### On

```
Join-Object [[-RightObject <Object>]] [[-On <List`1[System.String]>]] [[-Discern <String[]>]] [[-Where <ScriptBlock>]] [-Equals <List`1[System.String]>] [-JoinType <String>] [-LeftObject <Object>] [-MatchCase] [-Property <Object>] [-Strict] [-ValueName <String>] [<CommonParameters>]
```

## DESCRIPTION

Combines properties from one or more objects.
It creates a set that can
be saved as a new object or used as it is.
An object join is a means for
combining properties from one (self-join) or more tables by using values
common to each.
The Join-Object cmdlet supports a few proxy commands with
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


## EXAMPLES

### Example 1: EXAMPLE 1

```
$Employee
```

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





### Example 2: EXAMPLE 2

```
$Employee | InnerJoin $Department -On Department -Equals Name -Discern Employee, Department | Format-Table
```

Id EmployeeName EmployeeCountry Department  Age ReportsTo DepartmentName DepartmentCountry
-- ------------ --------------- ----------  --- --------- -------------- -----------------
 1 Aerts        Belgium         Sales        40         5 Sales          France
 2 Bauer        Germany         Engineering  31         4 Engineering    Germany
 3 Cook         England         Sales        69         1 Sales          France
 4 Duval        France          Engineering  21         5 Engineering    Germany
 5 Evans        England         Marketing    35           Marketing      England
 6 Fischer      Germany         Engineering  29         4 Engineering    Germany





### Example 3: EXAMPLE 3

```
$Changes
```

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





### Example 4: EXAMPLE 4

```
LeftJoin $Employee -On ReportsTo -Equals Id -Property @{Name = {$Left.Name}; Manager = {$Right.Name}}
```

Name    Manager
----    -------
Aerts   Evans
Bauer   Duval
Cook    Aerts
Duval   Evans
Evans
Fischer Duval






## PARAMETERS

### -Discern

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

```yaml
Type: String[]
Parameter Sets: Expression, On, Default
Aliases: NameItems
Accepted values: 

Required: True (None) False (Expression, On, Default)
Position: 2
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Equals

If the -Equals parameter is supplied, the value(s) of the left object
properties listed by the -On parameter should be equal to the value(s)
of the right object listed by the -Equals parameter in order to join
the left object with the right object.

Note 1: The list of properties defined by the -Equal parameter will be
complemented with the list of properties defined by the -On parameter
and vice versa.

Note 2: The -Equals parameter can only be used with the -On parameter.

```yaml
Type: List`1[System.String]
Parameter Sets: On
Aliases: 
Accepted values: 

Required: True (None) False (On)
Position: Named
Default value: [Collections.Generic.List[string]]::new()
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -JoinType

Defines which unrelated objects should be included (see: Descripton).
Valid values are: 'Inner', 'Left', 'Right', 'Full' or 'Cross'.
The default is 'Inner'.

Note: It is recommended to use the related proxy commands instead.

```yaml
Type: String
Parameter Sets: Expression, On, Default
Aliases: 
Accepted values: 

Required: True (None) False (Expression, On, Default)
Position: Named
Default value: Inner
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -LeftObject

The LeftObject, usually provided through the pipeline, defines the
left object (or datatable) to be joined.

```yaml
Type: Object
Parameter Sets: Expression, On, Default
Aliases: 
Accepted values: 

Required: True (None) False (Expression, On, Default)
Position: Named
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -MatchCase

If the -MatchCase (alias -CaseSensitive) switch is set, the comparison
between the related properties defined by the -On Parameter (and the
-Equals parameter) will case sensitive.

```yaml
Type: SwitchParameter
Parameter Sets: On
Aliases: CaseSensitive
Accepted values: 

Required: True (None) False (On)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -On

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

```yaml
Type: List`1[System.String]
Parameter Sets: On
Aliases: Using
Accepted values: 

Required: True (None) False (On)
Position: 1
Default value: [Collections.Generic.List[string]]::new()
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -OnExpression

Any conditional expression (where $Left refers to each left object and
$Right refers to each right object) that requires to evaluate to true
in order to join the left object with the right object.

Note 1: The -OnExporession parameter has the most complex comparison
possibilities but is considerable slower than the other types.

Note 2: The -OnExpression parameter cannot be used with the -On
parameter.

```yaml
Type: ScriptBlock
Parameter Sets: Expression
Aliases: UsingExpression
Accepted values: 

Required: True (None) False (Expression)
Position: 1
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Property

A hash table or list of property names (strings) and/or hash tables that
define a new selection of property names and values

Hash tables should be in the format @{<PropertyName> = <Expression>}
where the <Expression> defines how the specific left and right
properties should be merged.
Where the following variables are
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

```yaml
Type: Object
Parameter Sets: Expression, On, Default
Aliases: 
Accepted values: 

Required: True (None) False (Expression, On, Default)
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -RightObject

The RightObject, provided by the first argument, defines the right
object (or datatable) to be joined.

```yaml
Type: Object
Parameter Sets: Expression, On, Default
Aliases: 
Accepted values: 

Required: True (None) False (Expression, On, Default)
Position: 0
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Strict

If the -Strict switch is set, the comparison between the related
properties defined by the -On Parameter (and the -Equals parameter) is
based on a strict equality (both type and value need to be equal).

```yaml
Type: SwitchParameter
Parameter Sets: On
Aliases: 
Accepted values: 

Required: True (None) False (On)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -ValueName

{{ Fill ValueName Description }}

```yaml
Type: String
Parameter Sets: Expression, On, Default
Aliases: 
Accepted values: 

Required: True (None) False (Expression, On, Default)
Position: Named
Default value: Value
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Where

An expression that defines the condition to be met for the objects to
be returned.
There is no limit to the number of predicates that can be
included in the condition.

```yaml
Type: ScriptBlock
Parameter Sets: Expression, On, Default
Aliases: 
Accepted values: 

Required: True (None) False (Expression, On, Default)
Position: 3
Default value: { $True }
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### System.Object[]



## NOTES

# Source https://www.powershellgallery.com/packages/Join/3.5.3


## RELATED LINKS

[] (https://github.com/iRon7/Join-Object)

