 #Get-ChildItem -Attributes !Directory C:\ProgramData\IBM\AppScanSource\temp. | Sort-Object -Descending -Property LastWriteTime | select -First 1 
 #Get-content -path C:\ProgramData\IBM\Scan file powershell
 #[XML]$xml=Get-variable $latestfile
 #$latestfile = Get-ChildItem -Attributes !Directory C:\ProgramData\IBM\AppScanSource\temp. | Sort-Object -Descending -Property LastWriteTime | select -First 1  
 #$latestfile | Out-File C:\ProgramData\IBM\Scanpowershell\output.ozasmt -Append

 #$latestfile = Get-Content -path C:\ProgramData\IBM\AppScanSource\temp\temp_051922103832.ozasmt

 $maxIssuesAllowed =  50
 #[XML]$xml=Get-Content -path C:\ProgramData\IBM\AppScanSource\temp\temp_051922103832.ozasmt
 [XML]$xml=Get-Content -path C:\Users\appscanadmin\Downloads\Ozasmt file
 

   $highIssues = $xml.AssessmentRun.AssessmentStats.total_high_high_finding
   $mediumIssues = $xml.AssessmentRun.AssessmentStats.total_high_med_finding
   $lowIssues = $xml.AssessmentRun.AssessmentStats.total_high_low_finding

    if (( "$highIssues" -gt "$maxIssuesAllowed" )) {
      echo "There is $highIssues high issues and is allowed $maxIssuesAllowed"
      echo "Security Gate build failed"
    }