<#
   .Description
   Project: TXT 2 JSON
   Author/Autor: Carlos Mena (https://github.com/carlosm00)
   Definition: PowerShell Script for creating a TXT file to JSON format (https://github.com/carlosm00/simple-toolkit).

#>
function txt2json {
   param (
        [string]$inputFile,
        [string]$outputFile
    )

   try {
      $content = Get-Content -Path $inputFile -Raw

      $psObject = ConvertFrom-Json $content
      $jsonOut = $psObject | ConvertTo-Json

      $jsonOut | Set-Content -Path $outputFile

   }
   catch {
      $message = $_.Exception.message
      $error_type = $_.Exception.GetType()
      Write-Output "$error_type : $message"
   }
}

txt2json -inputFile "$args[0]" -outputFile "$args[1]"
