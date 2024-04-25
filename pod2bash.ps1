$output = kubectl get pods 
$podName = ($output -split "`n" | Where-Object { $_ -like "client-react-*" }).Split(" ")[0] 
if ($podName) 
{ 
  $command = "kubectl exec -ti $podName -- /bin/bash" 
  Invoke-Expression $command 
} 
else 
{ 
  Write-Host "No se encontró el pod 'client-react'" 
}
