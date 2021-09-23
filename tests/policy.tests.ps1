describe 'Deploy a public storage' {
    it 'Not be deployed' {
        write-output "Starting test : "
        $output = New-AzDeployment -Location "West Europe" -TemplateFile "$($PSScriptRoot)/bicepFiles/main.bicep" 2>&1
        $policyName = "storage-vnet-required-1"
        "$output" -like "*$policyName*" | Should -Be $true
    }
}