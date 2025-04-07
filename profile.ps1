
# Custom Prompt
Function Prompt {
  "PS " + $(Get-Location) + "`n> "
}

# Emacs-like binds
Set-PSReadLineOption -EditMode Emacs

# Ensure that we have the same aliases as Windows PowerShell for ease of use/portability
New-Alias -Name ac -Value Add-Content
New-Alias -Name asnp -Value Add-PSSnapin
New-Alias -Name cat -Value Get-Content
New-Alias -Name CFS -Value ConvertFrom-String
New-Alias -Name clear -Value Clear-Host
New-Alias -Name cnsn -Value Connect-PSSession
New-Alias -Name compare -Value Compare-Object
New-Alias -Name cp -Value Copy-Item
New-Alias -Name cpp -Value Copy-ItemProperty
New-Alias -Name diff -Value Compare-Object
New-Alias -Name dnsn -Value Disconnect-PSSession
New-Alias -Name epsn -Value Export-PSSession
New-Alias -Name gin -Value Get-ComputerInfo
New-Alias -Name gsnp -Value Get-PSSnapin
New-Alias -Name gsv -Value Get-Service
New-Alias -Name gwmi -Value Get-WmiObject
New-Alias -Name ipsn -Value Import-PSSession
New-Alias -Name iwmi -Value Invoke-WmiMethod
New-Alias -Name kill -Value Stop-Process
New-Alias -Name lp -Value Out-Printer
New-Alias -Name ls -Value Get-ChildItem
New-Alias -Name man -Value help
New-Alias -Name mount -Value New-PSDrive
New-Alias -Name mv -Value Move-Item
New-Alias -Name npssc -Value New-PSSessionConfigurationFile
New-Alias -Name ogv -Value Out-GridView
New-Alias -Name ps -Value Get-Process
New-Alias -Name rm -Value Remove-Item
New-Alias -Name rmdir -Value Remove-Item
New-Alias -Name rsnp -Value Remove-PSSnapin
New-Alias -Name rujb -Value Resume-Job
New-Alias -Name rwmi -Value Remove-WmiObject
New-Alias -Name sasv -Value Start-Service
New-Alias -Name sc -Value Set-Content
New-Alias -Name shcm -Value Show-Command
New-Alias -Name sleep -Value Start-Sleep
New-Alias -Name sort -Value Sort-Object
New-Alias -Name spsv -Value Stop-Service
New-Alias -Name start -Value Start-Process
New-Alias -Name stz -Value Set-TimeZone
New-Alias -Name sujb -Value Suspend-Job
New-Alias -Name swmi -Value Set-WmiInstance
New-Alias -Name tee -Value Tee-Object
New-Alias -Name trcm -Value Trace-Command
New-Alias -Name wget -Value Invoke-WebRequest
New-Alias -Name write -Value Write-Output
