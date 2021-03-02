param(
$VMResourceGroupName = $args[0],
$VMName = $args[1],
$TenantId = "",
$ClientId = "",
$ClientSecret = "",
$Resource = "",
$SubscriptionId = ""
)


$securePassword = $ClientSecret|ConvertTo-SecureString -AsPlainText -Force
$credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $ClientId, $securePassword
Connect-AzAccount -Credential $credential -Tenant $TenantId -ServicePrincipal

Start-AzVM -Name $VMName -ResourceGroupName $VMResourceGroupName 