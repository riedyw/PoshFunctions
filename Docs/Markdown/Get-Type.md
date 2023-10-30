---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-Type

## SYNOPSIS

Get exported types in the current session

## SYNTAX

### __AllParameterSets

```
Get-Type [[-Module <String>]] [[-Assembly <String>]] [[-FullName <String>]] [[-Namespace <String>]] [[-BaseType <String>]] [-IsEnum] [<CommonParameters>]
```

## DESCRIPTION

Get exported types in the current session


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-Type | Select-Object -First 1
```

# Default view
IsPublic IsSerial Name                                     BaseType
-------- -------- ----                                     --------
True     False    Registry                                 System.Object





### Example 2: EXAMPLE 2

```
#List the full name of all Enums in the current session
```

$List = Get-Type -IsEnum | Select -ExpandProperty FullName | Sort -Unique





### Example 3: EXAMPLE 3

```
Get-Type -Namespace System.Xaml.Hosting
```

# Default view
IsPublic IsSerial Name                                     BaseType
-------- -------- ----                                     --------
True     False    XamlBuildProvider                        System.Web.Compilation.BuildProvider





### Example 4: EXAMPLE 4

```
# Here is a list of all the properties that are returned
```

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






## PARAMETERS

### -Assembly

Filter on Assembly.
 Accepts wildcard

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 1
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -BaseType

Filter on BaseType.
 Accepts wildcard

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 4
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -FullName

Filter on FullName.
 Accepts wildcard

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 2
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -IsEnum

Switch to just return IsEnum types.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Module

Filter on Module.
 Accepts wildcard

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Namespace

Filter on Namespace.
 Accepts wildcard

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 3
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES

# inspired by https://gallery.technet.microsoft.com/scriptcenter/Get-Type-Get-exported-fee19cf7
# changed what is output by the function


## RELATED LINKS

Fill Related Links Here

