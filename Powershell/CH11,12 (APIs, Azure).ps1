#Querying and parsing REST API
$result = Invoke-WebRequest -Uri 'http://api.postcodes.io/random/postcodes' -UseBasicParsing
$ContentObject = $result.Content | ConvertFrom-Json
$ContentObject.result


#Invoke rest method can be used as well when authentication isnt needed.
(Invoke-RestMethod -Uri 'http://api.postcodes.io/random/postcodes' -UseBasicParsing).result

#Installing Azure PowersheLL

Install-Module -Name PowerShellGet -Force
if ($PSVersionTable.PSEdition -eq 'Desktop' -and (Get-Module -Name AzureRM -ListAvailable)) {
    Write-Warning -Message ('Az module not installed. Having both the AzureRM and ' +
      'Az modules installed at the same time is not supported.')
} else {
    Install-Module -Name Az -AllowClobber -Scope CurrentUser
}

try { 
    $var = Get-AzureADTenantDetail 
   } 
   catch [Microsoft.Open.Azure.AD.CommonLibrary.AadNeedAuthenticationException] { 
    Write-Host "You're not connected to AzureAD"; 
    Write-Host "Make sure you have AzureAD mudule available on this system then use Connect-AzureAD to establish connection"; 
    exit;
   }

#Add and Connect Accounts
Add-AzureAccount
Connect-AzAccount

param(
$VMResourceGroupName = Read-Host -Prompt 'Input your server  name'
# $VMName = $args[1],
# $TenantId = $args[2],
# $ClientId = $args[3],
# $ClientSecret = $args[4],
# $Resource = $args[4],
# $SubscriptionId = $args[5]
)


$securePassword = $ClientSecret|ConvertTo-SecureString -AsPlainText -Force
$credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $ClientId, $securePassword
Connect-AzAccount -Credential $credential -Tenant $TenantId -ServicePrincipal

Start-AzVM -Name $VMName -ResourceGroupName $VMResourceGroupName 
Stop-AzVM -Name $VMName -ResourceGroupName $VMResourceGroupName 