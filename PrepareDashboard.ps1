[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [string] $TemplateFile,

    [Parameter(Mandatory=$true)]
    [string] $OutputFile,

    [Parameter(Mandatory=$true)]
    [string] $SubscriptionId,

    [Parameter(Mandatory=$true)]
    [string] $ResourceGroupName,

    [Parameter(Mandatory=$true)]
    [string] $AppInsightsName
)

# Read input file
$template = Get-Content -Path $TemplateFile -Raw

# Replace
$output = $template
$output = $output -replace "<SUBSCRIPTIONID>",$SubscriptionId
$output = $output -replace "<RESOURCEGROUPNAME>",$ResourceGroupName
$output = $output -replace "<APPINSIGHTSNAME>",$AppInsightsName

# Write output file
$output | Out-File -FilePath $OutputFile -Encoding utf8
Write-Host "Saved to: $OutputFile"