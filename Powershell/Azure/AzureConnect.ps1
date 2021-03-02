param(
$TenantId = "",
$ClientId = "",
$ClientSecret = "",
$Resource = "",
$SubscriptionId = ""
)

 

$securePassword = $ClientSecret|ConvertTo-SecureString -AsPlainText -Force
$credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $ClientId, $securePassword
Connect-AzAccount -Credential $credential -Tenant $TenantId -ServicePrincipal