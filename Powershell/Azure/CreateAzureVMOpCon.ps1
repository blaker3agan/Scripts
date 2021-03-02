param(
$VMName = "",
$VMUser = "",
$TenantId = "", 
$ClientId = "", 
$ClientSecret = "", 
$SubscriptionId = "", 
$Resource = "https://management.core.windows.net/"
)

$securePassword = $ClientSecret|ConvertTo-SecureString -AsPlainText -Force
$credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $ClientId, $securePassword
Connect-AzAccount -Credential $credential -Tenant $TenantId -ServicePrincipal

#Set Credentials
$VMPass = "NewAdminPAss2020"|ConvertTo-SecureString -AsPlainText -Force
$UserPass = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $VMUser, $VMPass

#Create VM
New-AzVm -Name $VMNAme -Credential $UserPass -Location "Central US" 