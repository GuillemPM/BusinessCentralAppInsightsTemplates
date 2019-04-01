$downloadedDashboardFilePath = "C:\Users\chrishd\Downloads\partnertelemetry Dashboard (4).json"

$template = Get-Content -Path $downloadedDashboardFilePath -Raw
$template = $template -replace "efe5716a-8901-4c86-9f76-2b5837e584e0","<SUBSCRIPTIONID>"
$template = $template -replace "PartnerTelemetryResourceGroup","<RESOURCEGROUPNAME>"
$template = $template -replace "partnertelemetry","<APPINSIGHTSNAME>"
$template | Out-File -FilePath "C:\repos\BusinessCentralAppInsightsTemplates\Dashboards\SimpleDashboard.json" -Encoding utf8