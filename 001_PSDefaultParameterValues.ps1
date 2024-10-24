Write-Host "Playing with colors" -ForegroundColor Green -BackgroundColor Yellow
Write-Host "Playing with colors" -ForegroundColor White -BackgroundColor Blue

#PSDefaultParameterValues
$PSDefaultParameterValues = @{
    'Write-Host:ForegroundColor' = 'Green'
    'Write-Host:BackgroundColor' = 'Yellow'
}
Write-Host "Playing with colors - using default parameters"
Write-Host "Playing even more with colors - using default parameters"

$PSDefaultParameterValues = @{'Write-Host:ForegroundColor' = 'Red';'Write-Host:BackgroundColor' = 'White'}
Write-Host "Playing with colors - using new default parameters"
Write-Host "Playing even more with colors - using new default parameters"

#Cleanup PSDefaultParameterValues
$PSDefaultParameterValues.Remove("Write-Host:ForegroundColor")
$PSDefaultParameterValues.Remove("Write-Host:BackgroundColor")
Write-Host "Back to normal"

#With splatting
$writeHostParams = @{
    ForegroundColor = 'Green'
    BackgroundColor = 'Yellow'
}
write-host "Playing with colors - using splatting" @writeHostParams
#get-help about_Parameters_Default_Values -Online