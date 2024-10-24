#Block 1 - the function
class CustomException : Exception {
  [string] $additionalData

  CustomException($Message, $additionalData) : base($Message) {
      $this.additionalData = $additionalData
  }
}
function Test-TryCatchFinally {
  [CmdletBinding()]
  param (
    [Parameter()]
    [switch]
    $ThrowError,
    
    [Parameter()]
    [switch]
    $ThrowUnhandledError
  )
  process {
    try {
      $PSDefaultParameterValues = @{'Write-Host:ForegroundColor' = 'White';'Write-Host:BackgroundColor' = 'Green'}
      Write-Host "ErroractionPreference: $ErrorActionPreference"
      if ($ThrowError.IsPresent) {
        throw [CustomException]::new('Error message', 'Extra data')
      }
      if ($ThrowUnhandledError.IsPresent) {
        throw [System.IO.DirectoryNotFoundException] "Directory not found."
      }
      1/0
      Write-Host "This is executed after the error"
    }

    catch [CustomException] {
      $PSDefaultParameterValues = @{'Write-Host:ForegroundColor' = 'Black';'Write-Host:BackgroundColor' = 'Yellow'}
      Write-Host "Custom error caught: $_"
    }
    catch {
      $PSDefaultParameterValues = @{'Write-Host:ForegroundColor' = 'Black';'Write-Host:BackgroundColor' = 'Yellow'}
      write-host "Default catch $_"
    }
 
    finally {
      $PSDefaultParameterValues = @{'Write-Host:ForegroundColor' = 'White';'Write-Host:BackgroundColor' = 'Blue'}
      Write-Host "This code is always executed"

      #Cleanup PSDefaultParameterValues
      $PSDefaultParameterValues.Remove("Write-Host:ForegroundColor")
      $PSDefaultParameterValues.Remove("Write-Host:BackgroundColor")
    }
  }
}

#Block 2 - default execution
Test-TryCatchFinally

#Block 3 - ErrorAction set to stop
Test-TryCatchFinally -ErrorAction Stop

#Block 4 - Throw error and catch it
Test-TryCatchFinally -ThrowError

#Block 5 - Throw unhandled error
Test-TryCatchFinally -ThrowUnhandledError

#Get-Help about_Try_Catch_Finally -Online
#Get-Help about_Throw -online