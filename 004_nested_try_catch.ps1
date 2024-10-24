function Test-NestedTryCatch {
  [CmdletBinding()]
  param ()
  
  process {
    Write-Host "Lets enter the outer try-catch block"
    try {
      $PSDefaultParameterValues = @{'Write-Host:ForegroundColor' = 'White';'Write-Host:BackgroundColor' = 'Green'}
      Write-Host "This is happening in the outer try-catch block"
      #region inner try-catch block
      try {
        $PSDefaultParameterValues = @{'Write-Host:ForegroundColor' = 'White';'Write-Host:BackgroundColor' = 'Blue'}
        Write-Host "This is happening in the inner try-catch block"
        1/0
      }
      catch {
        $PSDefaultParameterValues = @{'Write-Host:ForegroundColor' = 'Magenta';'Write-Host:BackgroundColor' = 'Blue'}
        Write-Host "This is happening in the inner catch block"
      }
      finally {
        $PSDefaultParameterValues = @{'Write-Host:ForegroundColor' = 'Black';'Write-Host:BackgroundColor' = 'Blue'}
        Write-Host "This is happening in the inner finally block"
      }
      #endregion inner try-catch block
      1/0
    }
    catch {
      $PSDefaultParameterValues = @{'Write-Host:ForegroundColor' = 'Magenta';'Write-Host:BackgroundColor' = 'Green'}
      Write-Host "This is happening in the outer catch block"
    }
    finally {
      $PSDefaultParameterValues = @{'Write-Host:ForegroundColor' = 'Black';'Write-Host:BackgroundColor' = 'Green'}
      Write-Host "This is happening in the outer finally block"
      $PSDefaultParameterValues.Remove("Write-Host:ForegroundColor")
      $PSDefaultParameterValues.Remove("Write-Host:BackgroundColor")
    }
    Write-Host "We are back from the outer try-catch block"
    1/0
  }
}

Test-NestedTryCatch