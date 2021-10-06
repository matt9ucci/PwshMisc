$NameTable = [pscustomobject]@{
	Foo = 'Bar'
}

function Complete {
	[CmdletBinding()]
	param (
		[string]
		$Name
	)

	Write-Debug "function Complete()"
	Write-Debug "`$NameTable: $NameTable"
	Write-Debug "`$Name: $Name"

	$n = $NameTable.$Name

	Write-Debug "Reachable code"
	Write-Debug "`$n: $n"
}

function Block {
	[CmdletBinding()]
	param (
		[string]
		$Name
	)

	DynamicParam {
		Write-Debug "function Block()"
		Write-Debug "`$NameTable: $NameTable"
		Write-Debug "`$Name: $Name"

		# Block! When $Name is not bind.
		$n = $NameTable.$Name

		Write-Debug "Unreachable code"
		Write-Debug "`$n: $n"
	}
}

$DebugPreference = 'Continue'
Complete
BLock
