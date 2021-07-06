<#
.LINK
	Enumerations as flags: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_enum#enumerations-as-flags
#>

# MOS Technology 6502
[Flags()] enum ProcessorStatus {
	C = 1 -shl 0 # ---- ---C Carry
	Z = 1 -shl 1 # ---- --Z- Zero
	I = 1 -shl 2 # ---- -I-- Interrupt disabled
	D = 1 -shl 3 # ---- D--- Decimal
	B = 1 -shl 4 # ---B ---- Break
	U = 1 -shl 5 # --U- ---- Unused (always 1)
	V = 1 -shl 6 # -V-- ---- Overflow
	N = 1 -shl 7 # N--- ---- Negative sign
}

[powershell].Assembly.GetType('System.Management.Automation.TypeAccelerators')::Add('PS', [ProcessorStatus])

$ps = [PS]::C
'{0} = {1}' -f $ps, [System.Convert]::ToString([int]$ps, 2).PadLeft(8, '0')

$ps = [PS]::C -bor [PS]::Z
'{0} = {1}' -f $ps, [System.Convert]::ToString([int]$ps, 2).PadLeft(8, '0')

$ps = [PS]::C -bor [PS]::Z -bor [PS]::B
'{0} = {1}' -f $ps, [System.Convert]::ToString([int]$ps, 2).PadLeft(8, '0')
