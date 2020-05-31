## From PowerShell Cookbook (O'Reilly)
## by Lee Holmes (http://www.leeholmes.com/guide)
##

Function Invoke-WindowsAPI {
<#
.SYNOPSIS
    Describe purpose of "Invoke-WindowsAPI" in 1-2 sentences.

.DESCRIPTION
    Add a more complete description of what the function does.

.PARAMETER DllName
    The name of the DLL file to be referenced.
.PARAMETER ReturnType
    The datatype that will be returned by the invoking of the API.
.PARAMETER MethodName
    The name of the method within the DLL that will be used.
.PARAMETER ParameterTypes
    Describe parameter -ParameterTypes.

.PARAMETER Parameters
    The parameters to be passed to the API.
.EXAMPLE
    [void] (Invoke-WindowsApi -DllName 'kernel32.dll' -ReturnType ([UInt32]) -MethodName 'WritePrivateProfileString' -ParameterTypes $ParameterTypes -Parameters $Parameters)

    The function as used in the Set-PrivateProfileString function.
.NOTES
    ##############################################################################
    ##
    ## Invoke-WindowsApi.ps1
    ##
    ## From PowerShell Cookbook (O'Reilly)
    ## by Lee Holmes (http://www.leeholmes.com/guide)
    ##
    ## Invoke a native Windows API call that takes and returns simple data types.
    ##
    ## ie:
    ##
    ## ## Prepare the parameter types and parameters for the
    ## CreateHardLink function
    ## $ParameterTypes = [string], [string], [IntPtr]
    ## $Parameters = [string] $filename, [string] $existingFilename, [IntPtr]::Zero
    ##
    ## ## Call the CreateHardLink method in the Kernel32 DLL
    ## $result = Invoke-WindowsApi "kernel32" ([bool]) "CreateHardLink" $ParameterTypes $Parameters
    ##
    ##############################################################################
.LINK
    URLs to related sites
    The first link is opened by Get-Help -Online Invoke-WindowsAPI

.INPUTS
    List of input types that are accepted by this function.

.OUTPUTS
    List of output types produced by this function.
#>

    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [string] $DllName,
        [Type] $ReturnType,
        [string] $MethodName,
        [Type[]] $ParameterTypes,
        [Object[]] $Parameters
        )

    ## Begin to build the dynamic assembly
    $domain = [AppDomain]::CurrentDomain
    $name = New-Object -TypeName Reflection.AssemblyName -ArgumentList 'PInvokeAssembly'
    $assembly = $domain.DefineDynamicAssembly($name, 'Run')
    $module = $assembly.DefineDynamicModule('PInvokeModule')
    $type = $module.DefineType('PInvokeType', 'Public,BeforeFieldInit')

    ## Go through all of the parameters passed to us.  As we do this,
    ## we clone the user's inputs into another array that we will use for
    ## the P/Invoke call.
    $inputParameters = @()
    $refParameters = @()

    for($counter = 1; $counter -le $ParameterTypes.Length; $counter++)
    {
       ## If an item is a PSReference, then the user
       ## wants an [out] parameter.
       if($ParameterTypes[$counter - 1] -eq [Ref]) # -
       {
          ## Remember which parameters are used for [Out] parameters
          $refParameters += $counter

          ## On the cloned array, we replace the PSReference type with the
          ## .Net reference type that represents the value of the PSReference,
          ## and the value with the value held by the PSReference.
          $ParameterTypes[$counter - 1] =
             $Parameters[$counter - 1].Value.GetType().MakeByRefType()
          $inputParameters += $Parameters[$counter - 1].Value
       }
       else
       {
          ## Otherwise, just add their actual parameter to the
          ## input array.
          $inputParameters += $Parameters[$counter - 1]
       }
    }

    ## Define the actual P/Invoke method, adding the [Out]
    ## attribute for any parameters that were originally [Ref]
    ## parameters.
    $method = $type.DefineMethod($MethodName, 'Public,HideBySig,Static,PinvokeImpl',
        $ReturnType, $ParameterTypes)
    foreach($refParameter in $refParameters)
    {
       $null =  $method.DefineParameter($refParameter, 'Out', $null)
    }

    ## Apply the P/Invoke constructor
    $ctor = [Runtime.InteropServices.DllImportAttribute].GetConstructor([string])
    $attr = New-Object -TypeName Reflection.Emit.CustomAttributeBuilder -ArgumentList $ctor, $DllName
    $method.SetCustomAttribute($attr)

    ## Create the temporary type, and invoke the method.
    $realType = $type.CreateType()

    $realType.InvokeMember($MethodName, 'Public,Static,InvokeMethod', $null, $null,
        $inputParameters)

    ## Finally, go through all of the reference parameters, and update the
    ## values of the PSReference objects that the user passed in.
    foreach($refParameter in $refParameters)
    {
       $Parameters[$refParameter - 1].Value = $inputParameters[$refParameter - 1]
    }
} #EndFunction Invoke-WindowsAPI
