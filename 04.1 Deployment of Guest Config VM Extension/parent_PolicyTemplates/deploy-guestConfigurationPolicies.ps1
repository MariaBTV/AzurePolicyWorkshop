param (
    $ManagementGroupId = "8efecb12-cbaa-4612-b850-e6a68c14d336",
    $location = "australiaeast",
    $ts_resourcegroupname = "TemplateSpecs"
)

$TimeNow = Get-Date -Format yyyyMMdd-hhmm

New-AzResourceGroupDeployment -ResourceGroupName 'Company_IaaS' -TemplateFile '.\04.1 Deployment of Guest Config VM Extension\child_PolicyTemplates\policyAssignments.json' -Name $TimeNow -Verbose -ErrorAction Continue






######## Testing - do not run
$lastDeploymentName = (Get-AzSubscriptionDeployment | where {$_.ProvisioningState -ne 'Succeeded'} | sort Timestamp -Descending)[0].DeploymentName
if($lastDeploymentName){Remove-AzSubscriptionDeployment -Name $lastDeploymentName}


