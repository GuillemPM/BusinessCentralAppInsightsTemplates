[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [string] $DownloadedFile
)

$template = Get-Content -Path $DownloadedFile -Raw
$template = $template -replace "b3a82977-e5a1-465a-92ca-fe89416c56cb","<SUBSCRIPTIONID>"
$template = $template -replace "PartnerTelemetryResourceGroup","<RESOURCEGROUPNAME>"
$template = $template -replace "partnertelemetry","<APPINSIGHTSNAME>"
$template | Out-File -FilePath "C:\repos\BusinessCentralAppInsightsTemplates\DashboardsForVARs\BasicDashboard.json" -Encoding utf8