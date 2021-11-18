function Get-Comp {
	$params = $args
	$lines = docker __complete @params 2> $null
	$result = foreach ($line in $lines) {
		if ($line -match ':\d') { continue }
		if ($line -match 'Completion ended with directive:') { continue }

		$splits = $line -split '\s+', 2
		[pscustomobject]@{
			Argument    = $splits[0]
			Description = $splits[1]
		}
	}
	$result
}

$rootResult = Get-Comp '""'

$operands = @{}
$rootResult | % {
	$r = Get-Comp $_.Argument '""'
	$operands[$_.Argument] = $r
}

$options = @{}
$rootResult | % {
	$r = Get-Comp $_.Argument '"-"'
	$options[$_.Argument] = $r
}

$operands
$options
