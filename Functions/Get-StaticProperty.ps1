Function Get-StaticProperty {
    <#
            .SYNOPSIS
            To list the static properties of a .NET class
            .DESCRIPTION
            To list the static properties of a .NET class
            .PARAMETER TypeName
            The name of a .Net typename or class
            .PARAMETER IncludeTypeName
            A switch to determine if the typename and expanded full type name will be
            included in the output
            .EXAMPLE
            Get-StaticProperty -TypeName 'Microsoft.Win32.RegistryValueKind'

            Name         Value
            ----         -----
            Binary           3
            DWord            4
            ExpandString     2
            MultiString      7
            None            -1
            QWord           11
            String           1
            Unknown          0
            .EXAMPLE
            Get-StaticProperty -TypeName 'datetime' -IncludeTypeName

            SpecifiedType ExpandedType    Name     Value
            ------------- ------------    ----     -----
            datetime      System.DateTime MaxValue 12/31/9999 11:59:59 PM
            datetime      System.DateTime MinValue 1/1/0001 12:00:00 AM
            datetime      System.DateTime Now      4/9/2020 8:47:49 AM
            datetime      System.DateTime Today    4/9/2020 12:00:00 AM
            datetime      System.DateTime UtcNow   4/9/2020 12:47:49 PM
            .EXAMPLE
            Get-StaticProperty -TypeName 'math' -IncludeTypeName

            SpecifiedType ExpandedType Name            Value
            ------------- ------------ ----            -----
            math          System.Math  E    2.71828182845905
            math          System.Math  PI   3.14159265358979
    #>


    # Get-EnumValue -enum "System.Diagnostics.Eventing.Reader.StandardEventLevel"
    [CmdletBinding()]
    [OutputType('System.Collections.ArrayList')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter','')]
    Param(
        [string[]] $TypeName,

        [switch] $IncludeTypeName
    )
    $oldEA = $ErrorActionPreference
    $ErrorActionPreference = 'Stop'
    $return = [System.Collections.ArrayList] @()
    foreach ($curTypeName in $TypeName) {
        $curExpandTypeName = ([type] $curTypeName) | get-member -static | select-object -Property typename |
            sort-object -Unique | select-object -ExpandProperty TypeName

        $StaticProp = get-member -MemberType *property -Static -InputObject ([type] $curTypeName) |
            select-object -ExpandProperty name

        $staticProp | foreach-object -process {
            $tmpValue = (([type] $curTypeName)::$_.value__)
            if ($null -eq $tmpValue) {
                $tmpValue = (([type] $curTypeName)::$_)
            }
            if ($IncludeTypeName) {
                $prop = [ordered] @{
                    SpecifiedType = $curTypeName
                    ExpandedType = $curExpandTypeName
                    Name = $_
                    Value = $tmpValue
                }
            } else {
                $prop = [ordered] @{
                    Name = $_
                    Value = $tmpValue
                }
            }
            $null = $return.add((new-object -TypeName psobject -Property $prop))
        }
    }
    $return

    $ErrorActionPreference = $oldEA
}
