targetScope = 'subscription'

var stringArray = [
  './policies/policy_1.json'
]

var policies = [for i in range(0, length(stringArray)): json(loadTextContent(stringArray[i]))]

resource policyDefinition 'Microsoft.Authorization/policyDefinitions@2020-09-01' = [for policy in policies: {
  name: '${policy.properties.displayName}'
  properties: {
    displayName: policy.properties.displayName
    policyType: policy.properties.policyType
    mode: policy.properties.mode
    metadata: policy.properties.metadata
    parameters: policy.properties.parameters
    policyRule: policy.properties.policyRule
  }
}]

resource policyAssignment 'Microsoft.Authorization/policyAssignments@2020-09-01' = [for (policy,i) in policies: {
  name: '${policy.properties.displayName}'
  properties: {
    policyDefinitionId: policyDefinition[i].id
    displayName: policy.properties.displayName
  }
}]
