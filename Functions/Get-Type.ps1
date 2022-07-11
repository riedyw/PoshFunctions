function Get-Type {
    <#
.SYNOPSIS
    Get exported types in the current session
.DESCRIPTION
    Get exported types in the current session
.PARAMETER Module
    Filter on Module.  Accepts wildcard
.PARAMETER Assembly
    Filter on Assembly.  Accepts wildcard
.PARAMETER FullName
    Filter on FullName.  Accepts wildcard
.PARAMETER Namespace
    Filter on Namespace.  Accepts wildcard
.PARAMETER BaseType
    Filter on BaseType.  Accepts wildcard
.PARAMETER IsEnum
    Switch to just return IsEnum types.
.EXAMPLE
    Get-Type | Select-Object -First 1

    # Default view
    IsPublic IsSerial Name                                     BaseType
    -------- -------- ----                                     --------
    True     False    Registry                                 System.Object
.EXAMPLE
    #List the full name of all Enums in the current session
    $List = Get-Type -IsEnum | Select -ExpandProperty FullName | Sort -Unique
.EXAMPLE
    Get-Type -Namespace System.Xaml.Hosting

    # Default view
    IsPublic IsSerial Name                                     BaseType
    -------- -------- ----                                     --------
    True     False    XamlBuildProvider                        System.Web.Compilation.BuildProvider
.EXAMPLE
    # Here is a list of all the properties that are returned
    Get-Type | Select-Object -First 1 | Get-Member -MemberType Property

    TypeName: System.RuntimeType

    Name                       MemberType Definition
    ----                       ---------- ----------
    Assembly                   Property   System.Reflection.Assembly Assembly {get;}
    AssemblyQualifiedName      Property   string AssemblyQualifiedName {get;}
    Attributes                 Property   System.Reflection.TypeAttributes Attributes {get;}
    BaseType                   Property   type BaseType {get;}
    ContainsGenericParameters  Property   bool ContainsGenericParameters {get;}
    CustomAttributes           Property   System.Collections.Generic.IEnumerable[System.Reflection.CustomAttributeData] CustomAttributes {get;}
    DeclaredConstructors       Property   System.Collections.Generic.IEnumerable[System.Reflection.ConstructorInfo] DeclaredConstructors {get;}
    DeclaredEvents             Property   System.Collections.Generic.IEnumerable[System.Reflection.EventInfo] DeclaredEvents {get;}
    DeclaredFields             Property   System.Collections.Generic.IEnumerable[System.Reflection.FieldInfo] DeclaredFields {get;}
    DeclaredMembers            Property   System.Collections.Generic.IEnumerable[System.Reflection.MemberInfo] DeclaredMembers {get;}
    DeclaredMethods            Property   System.Collections.Generic.IEnumerable[System.Reflection.MethodInfo] DeclaredMethods {get;}
    DeclaredNestedTypes        Property   System.Collections.Generic.IEnumerable[System.Reflection.TypeInfo] DeclaredNestedTypes {get;}
    DeclaredProperties         Property   System.Collections.Generic.IEnumerable[System.Reflection.PropertyInfo] DeclaredProperties {get;}
    DeclaringMethod            Property   System.Reflection.MethodBase DeclaringMethod {get;}
    DeclaringType              Property   type DeclaringType {get;}
    FullName                   Property   string FullName {get;}
    GenericParameterAttributes Property   System.Reflection.GenericParameterAttributes GenericParameterAttributes {get;}
    GenericParameterPosition   Property   int GenericParameterPosition {get;}
    GenericTypeArguments       Property   type[] GenericTypeArguments {get;}
    GenericTypeParameters      Property   type[] GenericTypeParameters {get;}
    GUID                       Property   guid GUID {get;}
    HasElementType             Property   bool HasElementType {get;}
    ImplementedInterfaces      Property   System.Collections.Generic.IEnumerable[type] ImplementedInterfaces {get;}
    IsAbstract                 Property   bool IsAbstract {get;}
    IsAnsiClass                Property   bool IsAnsiClass {get;}
    IsArray                    Property   bool IsArray {get;}
    IsAutoClass                Property   bool IsAutoClass {get;}
    IsAutoLayout               Property   bool IsAutoLayout {get;}
    IsByRef                    Property   bool IsByRef {get;}
    IsClass                    Property   bool IsClass {get;}
    IsCOMObject                Property   bool IsCOMObject {get;}
    IsConstructedGenericType   Property   bool IsConstructedGenericType {get;}
    IsContextful               Property   bool IsContextful {get;}
    IsEnum                     Property   bool IsEnum {get;}
    IsExplicitLayout           Property   bool IsExplicitLayout {get;}
    IsGenericParameter         Property   bool IsGenericParameter {get;}
    IsGenericType              Property   bool IsGenericType {get;}
    IsGenericTypeDefinition    Property   bool IsGenericTypeDefinition {get;}
    IsImport                   Property   bool IsImport {get;}
    IsInterface                Property   bool IsInterface {get;}
    IsLayoutSequential         Property   bool IsLayoutSequential {get;}
    IsMarshalByRef             Property   bool IsMarshalByRef {get;}
    IsNested                   Property   bool IsNested {get;}
    IsNestedAssembly           Property   bool IsNestedAssembly {get;}
    IsNestedFamANDAssem        Property   bool IsNestedFamANDAssem {get;}
    IsNestedFamily             Property   bool IsNestedFamily {get;}
    IsNestedFamORAssem         Property   bool IsNestedFamORAssem {get;}
    IsNestedPrivate            Property   bool IsNestedPrivate {get;}
    IsNestedPublic             Property   bool IsNestedPublic {get;}
    IsNotPublic                Property   bool IsNotPublic {get;}
    IsPointer                  Property   bool IsPointer {get;}
    IsPrimitive                Property   bool IsPrimitive {get;}
    IsPublic                   Property   bool IsPublic {get;}
    IsSealed                   Property   bool IsSealed {get;}
    IsSecurityCritical         Property   bool IsSecurityCritical {get;}
    IsSecuritySafeCritical     Property   bool IsSecuritySafeCritical {get;}
    IsSecurityTransparent      Property   bool IsSecurityTransparent {get;}
    IsSerializable             Property   bool IsSerializable {get;}
    IsSpecialName              Property   bool IsSpecialName {get;}
    IsUnicodeClass             Property   bool IsUnicodeClass {get;}
    IsValueType                Property   bool IsValueType {get;}
    IsVisible                  Property   bool IsVisible {get;}
    MemberType                 Property   System.Reflection.MemberTypes MemberType {get;}
    MetadataToken              Property   int MetadataToken {get;}
    Module                     Property   System.Reflection.Module Module {get;}
    Name                       Property   string Name {get;}
    Namespace                  Property   string Namespace {get;}
    ReflectedType              Property   type ReflectedType {get;}
    StructLayoutAttribute      Property   System.Runtime.InteropServices.StructLayoutAttribute StructLayoutAttribute {get;}
    TypeHandle                 Property   System.RuntimeTypeHandle TypeHandle {get;}
    TypeInitializer            Property   System.Reflection.ConstructorInfo TypeInitializer {get;}
    UnderlyingSystemType       Property   type UnderlyingSystemType {get;}
.NOTES
    # inspired by https://gallery.technet.microsoft.com/scriptcenter/Get-Type-Get-exported-fee19cf7
    # changed what is output by the function
#>

    # todo Change += to System.Collections.Arraylist

    [CmdletBinding(ConfirmImpact = 'None')]
    param(
        [string] $Module = '*',
        [string] $Assembly = '*',
        [string] $FullName = '*',
        [string] $Namespace = '*',
        [string] $BaseType = '*',
        [switch] $IsEnum
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        #Build up the Where statement
        $WhereArray = @('$_.IsPublic')
        if ($Module -ne '*') { $WhereArray += '$_.Module -like $Module' }
        if ($Assembly -ne '*') { $WhereArray += '$_.Assembly -like $Assembly' }
        if ($FullName -ne '*') { $WhereArray += '$_.FullName -like $FullName' }
        if ($Namespace -ne '*') { $WhereArray += '$_.Namespace -like $Namespace' }
        if ($BaseType -ne '*') { $WhereArray += '$_.BaseType -like $BaseType' }
        #This clause is only evoked if IsEnum is passed in
        if ($PSBoundParameters.ContainsKey('IsEnum')) { $WhereArray += '$_.IsENum -like $IsENum' }

        #Give verbose output, convert where string to scriptblock
        $WhereString = $WhereArray -Join ' -and '
        $WhereBlock = [scriptblock]::Create( $WhereString )
        Write-Verbose -Message "Where ScriptBlock: { $WhereString }"

        #Invoke the search!
        [AppDomain]::CurrentDomain.GetAssemblies() | ForEach-Object {
            Write-Verbose -Message "Getting types from $($_.FullName)"
            try {
                $_.GetExportedTypes()
            } catch {
                Write-Verbose -Message "$($_.FullName) error getting Exported Types: $_"
                $null
            }
        } | Where-Object -FilterScript $WhereBlock |
            Select-Object -Property Name, FullName, IsPublic, IsSerializable, IsEnum, BaseType, Module, Assembly, NameSpace
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
