<#
.SYNOPSIS
	The relationship between ConfirmImpact and $ConfirmPreference.
#>

function High {
	[CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
	param()
	"ConfirmImpact = $((New-Object System.Management.Automation.CommandMetadata($MyInvocation.MyCommand)).ConfirmImpact)"
	if ($PSCmdlet.ShouldProcess('target', 'operation')) {
		"Yes to $($MyInvocation.MyCommand)"
	} else {
		"No to $($MyInvocation.MyCommand)"
	}
}

function Medium {
	[CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Medium')]
	param()
	"ConfirmImpact = $((New-Object System.Management.Automation.CommandMetadata($MyInvocation.MyCommand)).ConfirmImpact)"
	if ($PSCmdlet.ShouldProcess('target', 'operation')) {
		"Yes to $($MyInvocation.MyCommand)"
	} else {
		"No to $($MyInvocation.MyCommand)"
	}
}

function Low {
	[CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Low')]
	param()
	"ConfirmImpact = $((New-Object System.Management.Automation.CommandMetadata($MyInvocation.MyCommand)).ConfirmImpact)"
	if ($PSCmdlet.ShouldProcess('target', 'operation')) {
		"Yes to $($MyInvocation.MyCommand)"
	} else {
		"No to $($MyInvocation.MyCommand)"
	}
}

"`e[32m$('*'*32)`e[0m"
"`$ConfirmPreference = $(($ConfirmPreference = 'High'))"
"`e[32m$('*'*32)`e[0m"
High; Medium; Low

"`e[32m$('*'*32)`e[0m"
"`$ConfirmPreference = $(($ConfirmPreference = 'Medium'))"
"`e[32m$('*'*32)`e[0m"
High; Medium; Low

"`e[32m$('*'*32)`e[0m"
"`$ConfirmPreference = $(($ConfirmPreference = 'Low'))"
"`e[32m$('*'*32)`e[0m"
High; Medium; Low
