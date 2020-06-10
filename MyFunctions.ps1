# MyFunctions.psm1
# Author: Bill Riedy

Add-Type -AssemblyName Microsoft.VisualBasic
Add-Type -AssemblyName System.Web

$AliasesToExport = @()
$VariablesToExport = @()
$FunctionsToExport = @()

<#
if (-not (test-path Variable:AliasesToExport)) {
    $AliasesToExport = @()
}
if (-not (test-path Variable:VariablesToExport)) {
    $VariablesToExport = @()
}
#>

$ModulePath = split-path -parent $MyInvocation.MyCommand.Path

# $TokenCSV = join-path -Path $ModulePath -ChildPath 'Token.csv'
# $ModulePath = get-variable PsScriptRoot | select-object -expand Value

$FunctionsPath = join-path -Path $ModulePath -ChildPath "Functions"
$Functions = get-childitem -Path $FunctionsPath -Filter *.ps1
# write-output ($functions | Select-Object fullname | findstr /i "parse")
$Functions | foreach-object { . $_.FullName }

$FunctionsToExport = $Functions | select-object -expand Basename

<#
Set-variable -name Testing -value 'Hello there'
$VariablesToExport += 'Testing'
$VariablesToExport += 'AliasesToExport'
$VariablesToExport += 'VariablesToExport'
$VariablesToExport += 'FunctionsToExport'

#>

<#
The MyFunctions module is saved twice. Once as the file MyFunctions.psm1 A symbolic link of
MyFunctions.ps1 that points to MyFunctions.psm1 So the next line is merely determining if
you are importing the module or if you dot sourced the MyFunctions.ps1 file.
#>

if ($MyInvocation.MyCommand.Name -Match "\.psm1") {
#    write-warning "AliasesToExport are $($AliasesToExport -join ',')"
#    Export-ModuleMember -Function $FunctionsToExport -Alias $AliasesToExport.name -Variable $VariablesToExport
    Export-ModuleMember -Function $FunctionsToExport
    Export-ModuleMember -Alias    *
    Export-ModuleMember -Variable $VariablesToExport
}

# EOF: MyFunctions.psm1 / MyFunctions.ps1
