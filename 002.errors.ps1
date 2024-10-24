# hello world kind of error
1/0

Get-Item x:\filedoesnotexist.txt

#Block 1 - Script
Function Test-ErrorActions {
  [CmdletBinding()]param() 
    process{
      write-host "ErrorActionPreference: $ErrorActionPreference" -ForegroundColor Gray
      1/0
      Write-Host "This is executed after the error"
    }
  }

#block 2 - default execution
Test-ErrorActions

#block 3 - ErrorAction set to stop
Test-ErrorActions -ErrorAction Stop

#Get-Help about_Preference_Variables


