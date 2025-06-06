
# Custom Prompt
Function Prompt
{
   # "PS " + $(Get-Location) + "`n> "
   Write-Host $(Get-Location) -ForegroundColor Cyan
   "> "
}

# Notepad Next
Function npp
{
   # First we need to translate the files into absolute paths
   Invoke-Expression ('flatpak run com.github.dail8859.NotepadNext ' `
      + (($args | ForEach-Object { (Resolve-Path $_).Path }) -join ' '))
}

# Use 'more' as the pager, like in Windows 10 PowerShell 5.1
$env:PAGER = '/usr/bin/more'

# Ensure that we have the same environment as Windows 10 PowerShell 5.1 for ease of use/portability

### Set the theme to the Windows 10 PowerShell theme
# Configure both the new way and legacy way. They should match.

# Legacy
# $Host.PrivateData.ErrorForegroundColor    = [System.ConsoleColor]::Red
# $Host.PrivateData.ErrorBackgroundColor    = [System.ConsoleColor]::Black
# $Host.PrivateData.WarningForegroundColor  = [System.ConsoleColor]::Yellow
# $Host.PrivateData.WarningBackgroundColor  = [System.ConsoleColor]::Black
# $Host.PrivateData.DebugForegroundColor    = [System.ConsoleColor]::Yellow
# $Host.PrivateData.DebugBackgroundColor    = [System.ConsoleColor]::Black
# $Host.PrivateData.VerboseForegroundColor  = [System.ConsoleColor]::Yellow
# $Host.PrivateData.VerboseBackgroundColor  = [System.ConsoleColor]::Black
# $Host.PrivateData.ProgressForegroundColor = [System.ConsoleColor]::Yellow
# $Host.PrivateData.ProgressBackgroundColor = [System.ConsoleColor]::DarkCyan
# $Host.UI.RawUI.ForegroundColor            = [System.ConsoleColor]::DarkYellow
# $Host.UI.RawUI.BackgroundColor            = [System.ConsoleColor]::DarkMagenta

# Match the Windows 10 syntax colors
Set-PSReadLineOption -Colors @{
    Command                  = "`e[93m"
    Comment                  = "`e[32m"
    ContinuationPrompt       = "`e[0m"
    Default                  = "`e[0m"
    Emphasis                 = "`e[96m"
    Error                    = "`e[91m"
    Keyword                  = "`e[92m"
    Member                   = "`e[97m"
    Number                   = "`e[97m"
    Operator                 = "`e[90m"
    Parameter                = "`e[90m"
    Selection                = "`e[7m"
    String                   = "`e[36m"
    Type                     = "`e[37m"
    Variable                 = "`e[92m"
}

# Match the Windows 10 progress style
$PSStyle.Progress.View = [System.Management.Automation.ProgressView]::Classic
$PSStyle.Progress.Style = "`e[93;46m"

# Match the Windows 10 formatting style
$PSStyle.Formatting.Error          = "`e[91;40m"
$PSStyle.Formatting.ErrorAccent    = "`e[96;40m"
$PSStyle.Formatting.Warning        = "`e[93;40m"
$PSStyle.Formatting.Verbose        = "`e[93;40m"
$PSStyle.Formatting.Debug          = "`e[93;40m"


# Match the Windows 10 keybinds
Set-PSReadLineOption -EditMode Windows
Get-PSReadLineKeyHandler | ForEach-Object { Remove-PSReadLineKeyHandler -Chord $_.Key }
Set-PSReadLineKeyHandler -Chord "Enter"                 -Function "AcceptLine"
Set-PSReadLineKeyHandler -Chord "Shift+Enter"           -Function "AddLine"
Set-PSReadLineKeyHandler -Chord "Backspace"             -Function "BackwardDeleteChar"
Set-PSReadLineKeyHandler -Chord "Ctrl+h"                -Function "BackwardDeleteChar"
Set-PSReadLineKeyHandler -Chord "Ctrl+Home"             -Function "BackwardDeleteLine"
Set-PSReadLineKeyHandler -Chord "Ctrl+Backspace"        -Function "BackwardKillWord"
Set-PSReadLineKeyHandler -Chord "Ctrl+C"                -Function "Copy"
Set-PSReadLineKeyHandler -Chord "Ctrl+c"                -Function "CopyOrCancelLine"
Set-PSReadLineKeyHandler -Chord "Ctrl+x"                -Function "Cut"
Set-PSReadLineKeyHandler -Chord "Delete"                -Function "DeleteChar"
Set-PSReadLineKeyHandler -Chord "Ctrl+End"              -Function "ForwardDeleteLine"
Set-PSReadLineKeyHandler -Chord "Ctrl+Enter"            -Function "InsertLineAbove"
Set-PSReadLineKeyHandler -Chord "Shift+Ctrl+Enter"      -Function "InsertLineBelow"
Set-PSReadLineKeyHandler -Chord "Ctrl+Delete"           -Function "KillWord"
Set-PSReadLineKeyHandler -Chord "Ctrl+v"                -Function "Paste"
Set-PSReadLineKeyHandler -Chord "Shift+Insert"          -Function "Paste"
Set-PSReadLineKeyHandler -Chord "Ctrl+y"                -Function "Redo"
Set-PSReadLineKeyHandler -Chord "Escape"                -Function "RevertLine"
Set-PSReadLineKeyHandler -Chord "Ctrl+z"                -Function "Undo"
Set-PSReadLineKeyHandler -Chord "Alt+."                 -Function "YankLastArg"
Set-PSReadLineKeyHandler -Chord "LeftArrow"             -Function "BackwardChar"
Set-PSReadLineKeyHandler -Chord "Ctrl+LeftArrow"        -Function "BackwardWord"
Set-PSReadLineKeyHandler -Chord "Home"                  -Function "BeginningOfLine"
Set-PSReadLineKeyHandler -Chord "End"                   -Function "EndOfLine"
Set-PSReadLineKeyHandler -Chord "RightArrow"            -Function "ForwardChar"
Set-PSReadLineKeyHandler -Chord "Ctrl+]"                -Function "GotoBrace"
Set-PSReadLineKeyHandler -Chord "Ctrl+RightArrow"       -Function "NextWord"
Set-PSReadLineKeyHandler -Chord "Alt+F7"                -Function "ClearHistory"
Set-PSReadLineKeyHandler -Chord "Ctrl+s"                -Function "ForwardSearchHistory"
Set-PSReadLineKeyHandler -Chord "F8"                    -Function "HistorySearchBackward"
Set-PSReadLineKeyHandler -Chord "Shift+F8"              -Function "HistorySearchForward"
Set-PSReadLineKeyHandler -Chord "DownArrow"             -Function "NextHistory"
Set-PSReadLineKeyHandler -Chord "UpArrow"               -Function "PreviousHistory"
Set-PSReadLineKeyHandler -Chord "Ctrl+r"                -Function "ReverseSearchHistory"
Set-PSReadLineKeyHandler -Chord "Ctrl+@"                -Function "MenuComplete"
Set-PSReadLineKeyHandler -Chord "Tab"                   -Function "TabCompleteNext"
Set-PSReadLineKeyHandler -Chord "Shift+Tab"             -Function "TabCompletePrevious"
Set-PSReadLineKeyHandler -Chord "Ctrl+l"                -Function "ClearScreen"
Set-PSReadLineKeyHandler -Chord "Alt+0"                 -Function "DigitArgument"
Set-PSReadLineKeyHandler -Chord "Alt+1"                 -Function "DigitArgument"
Set-PSReadLineKeyHandler -Chord "Alt+2"                 -Function "DigitArgument"
Set-PSReadLineKeyHandler -Chord "Alt+3"                 -Function "DigitArgument"
Set-PSReadLineKeyHandler -Chord "Alt+4"                 -Function "DigitArgument"
Set-PSReadLineKeyHandler -Chord "Alt+5"                 -Function "DigitArgument"
Set-PSReadLineKeyHandler -Chord "Alt+6"                 -Function "DigitArgument"
Set-PSReadLineKeyHandler -Chord "Alt+7"                 -Function "DigitArgument"
Set-PSReadLineKeyHandler -Chord "Alt+8"                 -Function "DigitArgument"
Set-PSReadLineKeyHandler -Chord "Alt+9"                 -Function "DigitArgument"
Set-PSReadLineKeyHandler -Chord "Alt+-"                 -Function "DigitArgument"
Set-PSReadLineKeyHandler -Chord "PageDown"              -Function "ScrollDisplayDown"
Set-PSReadLineKeyHandler -Chord "Ctrl+PageDown"         -Function "ScrollDisplayDownLine"
Set-PSReadLineKeyHandler -Chord "PageUp"                -Function "ScrollDisplayUp"
Set-PSReadLineKeyHandler -Chord "Ctrl+PageUp"           -Function "ScrollDisplayUpLine"
Set-PSReadLineKeyHandler -Chord "Ctrl+Alt+?"            -Function "ShowKeyBindings"
Set-PSReadLineKeyHandler -Chord "Alt+?"                 -Function "WhatIsKey"
Set-PSReadLineKeyHandler -Chord "Ctrl+a"                -Function "SelectAll"
Set-PSReadLineKeyHandler -Chord "Shift+LeftArrow"       -Function "SelectBackwardChar"
Set-PSReadLineKeyHandler -Chord "Shift+Home"            -Function "SelectBackwardsLine"
Set-PSReadLineKeyHandler -Chord "Shift+Ctrl+LeftArrow"  -Function "SelectBackwardWord"
Set-PSReadLineKeyHandler -Chord "Shift+RightArrow"      -Function "SelectForwardChar"
Set-PSReadLineKeyHandler -Chord "Shift+End"             -Function "SelectLine"
Set-PSReadLineKeyHandler -Chord "Shift+Ctrl+RightArrow" -Function "SelectNextWord"
Set-PSReadLineKeyHandler -Chord "F3"                    -Function "CharacterSearch"
Set-PSReadLineKeyHandler -Chord "Shift+F3"              -Function "CharacterSearchBackward"


# Set the aliases to Windows 10 PowerShell 5.1 aliases
# Commented out aliases are commands that no longer exist in PowerShell 7.x
Get-Alias | Remove-Alias -Force
Set-Alias -Name '%'       -Value 'ForEach-Object'                 -Option ReadOnly, AllScope
Set-Alias -Name '?'       -Value 'Where-Object'                   -Option ReadOnly, AllScope
Set-Alias -Name 'ac'      -Value 'Add-Content'                    -Option ReadOnly, AllScope
# Set-Alias -Name 'asnp'    -Value 'Add-PSSnapIn'                   -Option ReadOnly, AllScope
Set-Alias -Name 'cat'     -Value 'Get-Content'                    -Option AllScope
Set-Alias -Name 'cd'      -Value 'Set-Location'                   -Option AllScope
# Set-Alias -Name 'CFS'     -Value 'ConvertFrom-String'             -Option None
Set-Alias -Name 'chdir'   -Value 'Set-Location'                   -Option AllScope
Set-Alias -Name 'clc'     -Value 'Clear-Content'                  -Option ReadOnly, AllScope
Set-Alias -Name 'clear'   -Value 'Clear-Host'                     -Option AllScope
Set-Alias -Name 'clhy'    -Value 'Clear-History'                  -Option ReadOnly, AllScope
Set-Alias -Name 'cli'     -Value 'Clear-Item'                     -Option ReadOnly, AllScope
Set-Alias -Name 'clp'     -Value 'Clear-ItemProperty'             -Option ReadOnly, AllScope
Set-Alias -Name 'cls'     -Value 'Clear-Host'                     -Option AllScope
Set-Alias -Name 'clv'     -Value 'Clear-Variable'                 -Option ReadOnly, AllScope
# Set-Alias -Name 'cnsn'    -Value 'Connect-PSSession'              -Option ReadOnly, AllScope
Set-Alias -Name 'compare' -Value 'Compare-Object'                 -Option ReadOnly, AllScope
Set-Alias -Name 'copy'    -Value 'Copy-Item'                      -Option AllScope
Set-Alias -Name 'cp'      -Value 'Copy-Item'                      -Option AllScope
Set-Alias -Name 'cpi'     -Value 'Copy-Item'                      -Option ReadOnly, AllScope
Set-Alias -Name 'cpp'     -Value 'Copy-ItemProperty'              -Option ReadOnly, AllScope
Set-Alias -Name 'curl'    -Value 'Invoke-WebRequest'              -Option AllScope
Set-Alias -Name 'cvpa'    -Value 'Convert-Path'                   -Option ReadOnly, AllScope
Set-Alias -Name 'dbp'     -Value 'Disable-PSBreakpoint'           -Option ReadOnly, AllScope
Set-Alias -Name 'del'     -Value 'Remove-Item'                    -Option AllScope
Set-Alias -Name 'diff'    -Value 'Compare-Object'                 -Option ReadOnly, AllScope
Set-Alias -Name 'dir'     -Value 'Get-ChildItem'                  -Option AllScope
# Set-Alias -Name 'dnsn'    -Value 'Disconnect-PSSession'           -Option ReadOnly, AllScope
Set-Alias -Name 'ebp'     -Value 'Enable-PSBreakpoint'            -Option ReadOnly, AllScope
Set-Alias -Name 'echo'    -Value 'Write-Output'                   -Option AllScope
Set-Alias -Name 'epal'    -Value 'Export-Alias'                   -Option ReadOnly, AllScope
Set-Alias -Name 'epcsv'   -Value 'Export-Csv'                     -Option ReadOnly, AllScope
Set-Alias -Name 'epsn'    -Value 'Export-PSSession'               -Option AllScope
Set-Alias -Name 'erase'   -Value 'Remove-Item'                    -Option AllScope
Set-Alias -Name 'etsn'    -Value 'Enter-PSSession'                -Option AllScope
Set-Alias -Name 'exsn'    -Value 'Exit-PSSession'                 -Option AllScope
Set-Alias -Name 'fc'      -Value 'Format-Custom'                  -Option ReadOnly, AllScope
Set-Alias -Name 'fhx'     -Value 'Format-Hex'                     -Option None
Set-Alias -Name 'fl'      -Value 'Format-List'                    -Option ReadOnly, AllScope
Set-Alias -Name 'foreach' -Value 'ForEach-Object'                 -Option ReadOnly, AllScope
Set-Alias -Name 'ft'      -Value 'Format-Table'                   -Option ReadOnly, AllScope
Set-Alias -Name 'fw'      -Value 'Format-Wide'                    -Option ReadOnly, AllScope
Set-Alias -Name 'gal'     -Value 'Get-Alias'                      -Option ReadOnly, AllScope
Set-Alias -Name 'gbp'     -Value 'Get-PSBreakpoint'               -Option ReadOnly, AllScope
Set-Alias -Name 'gc'      -Value 'Get-Content'                    -Option ReadOnly, AllScope
Set-Alias -Name 'gcb'     -Value 'Get-Clipboard'                  -Option None
Set-Alias -Name 'gci'     -Value 'Get-ChildItem'                  -Option ReadOnly, AllScope
Set-Alias -Name 'gcm'     -Value 'Get-Command'                    -Option ReadOnly, AllScope
Set-Alias -Name 'gcs'     -Value 'Get-PSCallStack'                -Option ReadOnly, AllScope
Set-Alias -Name 'gdr'     -Value 'Get-PSDrive'                    -Option ReadOnly, AllScope
Set-Alias -Name 'ghy'     -Value 'Get-History'                    -Option ReadOnly, AllScope
Set-Alias -Name 'gi'      -Value 'Get-Item'                       -Option ReadOnly, AllScope
# Set-Alias -Name 'gin'     -Value 'Get-ComputerInfo'               -Option None
Set-Alias -Name 'gjb'     -Value 'Get-Job'                        -Option AllScope
Set-Alias -Name 'gl'      -Value 'Get-Location'                   -Option ReadOnly, AllScope
Set-Alias -Name 'gm'      -Value 'Get-Member'                     -Option ReadOnly, AllScope
Set-Alias -Name 'gmo'     -Value 'Get-Module'                     -Option ReadOnly, AllScope
Set-Alias -Name 'gp'      -Value 'Get-ItemProperty'               -Option ReadOnly, AllScope
Set-Alias -Name 'gps'     -Value 'Get-Process'                    -Option ReadOnly, AllScope
Set-Alias -Name 'gpv'     -Value 'Get-ItemPropertyValue'          -Option ReadOnly, AllScope
Set-Alias -Name 'group'   -Value 'Group-Object'                   -Option ReadOnly, AllScope
Set-Alias -Name 'gsn'     -Value 'Get-PSSession'                  -Option AllScope
# Set-Alias -Name 'gsnp'    -Value 'Get-PSSnapIn'                   -Option ReadOnly, AllScope
# Set-Alias -Name 'gsv'     -Value 'Get-Service'                    -Option ReadOnly, AllScope
Set-Alias -Name 'gtz'     -Value 'Get-TimeZone'                   -Option None
Set-Alias -Name 'gu'      -Value 'Get-Unique'                     -Option ReadOnly, AllScope
Set-Alias -Name 'gv'      -Value 'Get-Variable'                   -Option ReadOnly, AllScope
# Set-Alias -Name 'gwmi'    -Value 'Get-WmiObject'                  -Option ReadOnly, AllScope
Set-Alias -Name 'h'       -Value 'Get-History'                    -Option AllScope
Set-Alias -Name 'history' -Value 'Get-History'                    -Option AllScope
Set-Alias -Name 'icm'     -Value 'Invoke-Command'                 -Option AllScope
Set-Alias -Name 'iex'     -Value 'Invoke-Expression'              -Option ReadOnly, AllScope
Set-Alias -Name 'ihy'     -Value 'Invoke-History'                 -Option ReadOnly, AllScope
Set-Alias -Name 'ii'      -Value 'Invoke-Item'                    -Option ReadOnly, AllScope
Set-Alias -Name 'ipal'    -Value 'Import-Alias'                   -Option ReadOnly, AllScope
Set-Alias -Name 'ipcsv'   -Value 'Import-Csv'                     -Option ReadOnly, AllScope
Set-Alias -Name 'ipmo'    -Value 'Import-Module'                  -Option ReadOnly, AllScope
Set-Alias -Name 'ipsn'    -Value 'Import-PSSession'               -Option AllScope
Set-Alias -Name 'irm'     -Value 'Invoke-RestMethod'              -Option ReadOnly, AllScope
# Set-Alias -Name 'ise'     -Value 'powershell_ise.exe'             -Option ReadOnly, AllScope
# Set-Alias -Name 'iwmi'    -Value 'Invoke-WMIMethod'               -Option ReadOnly, AllScope
Set-Alias -Name 'iwr'     -Value 'Invoke-WebRequest'              -Option ReadOnly, AllScope
Set-Alias -Name 'kill'    -Value 'Stop-Process'                   -Option AllScope
# Set-Alias -Name 'lp'      -Value 'Out-Printer'                    -Option AllScope
Set-Alias -Name 'ls'      -Value 'Get-ChildItem'                  -Option AllScope
Set-Alias -Name 'man'     -Value 'help'                           -Option AllScope
Set-Alias -Name 'md'      -Value 'mkdir'                          -Option AllScope
Set-Alias -Name 'measure' -Value 'Measure-Object'                 -Option ReadOnly, AllScope
Set-Alias -Name 'mi'      -Value 'Move-Item'                      -Option ReadOnly, AllScope
Set-Alias -Name 'mount'   -Value 'New-PSDrive'                    -Option AllScope
Set-Alias -Name 'move'    -Value 'Move-Item'                      -Option AllScope
Set-Alias -Name 'mp'      -Value 'Move-ItemProperty'              -Option ReadOnly, AllScope
Set-Alias -Name 'mv'      -Value 'Move-Item'                      -Option AllScope
Set-Alias -Name 'nal'     -Value 'New-Alias'                      -Option ReadOnly, AllScope
Set-Alias -Name 'ndr'     -Value 'New-PSDrive'                    -Option ReadOnly, AllScope
Set-Alias -Name 'ni'      -Value 'New-Item'                       -Option ReadOnly, AllScope
Set-Alias -Name 'nmo'     -Value 'New-Module'                     -Option ReadOnly, AllScope
Set-Alias -Name 'npssc'   -Value 'New-PSSessionConfigurationFile' -Option ReadOnly, AllScope
Set-Alias -Name 'nsn'     -Value 'New-PSSession'                  -Option AllScope
Set-Alias -Name 'nv'      -Value 'New-Variable'                   -Option ReadOnly, AllScope
# Set-Alias -Name 'ogv'     -Value 'Out-GridView'                   -Option ReadOnly, AllScope
Set-Alias -Name 'oh'      -Value 'Out-Host'                       -Option ReadOnly, AllScope
Set-Alias -Name 'popd'    -Value 'Pop-Location'                   -Option AllScope
Set-Alias -Name 'ps'      -Value 'Get-Process'                    -Option AllScope
Set-Alias -Name 'pushd'   -Value 'Push-Location'                  -Option AllScope
Set-Alias -Name 'pwd'     -Value 'Get-Location'                   -Option AllScope
Set-Alias -Name 'r'       -Value 'Invoke-History'                 -Option AllScope
Set-Alias -Name 'rbp'     -Value 'Remove-PSBreakpoint'            -Option ReadOnly, AllScope
Set-Alias -Name 'rcjb'    -Value 'Receive-Job'                    -Option AllScope
# Set-Alias -Name 'rcsn'    -Value 'Receive-PSSession'              -Option ReadOnly, AllScope
Set-Alias -Name 'rd'      -Value 'Remove-Item'                    -Option AllScope
Set-Alias -Name 'rdr'     -Value 'Remove-PSDrive'                 -Option ReadOnly, AllScope
Set-Alias -Name 'ren'     -Value 'Rename-Item'                    -Option AllScope
Set-Alias -Name 'ri'      -Value 'Remove-Item'                    -Option ReadOnly, AllScope
Set-Alias -Name 'rjb'     -Value 'Remove-Job'                     -Option AllScope
Set-Alias -Name 'rm'      -Value 'Remove-Item'                    -Option AllScope
Set-Alias -Name 'rmdir'   -Value 'Remove-Item'                    -Option AllScope
Set-Alias -Name 'rmo'     -Value 'Remove-Module'                  -Option ReadOnly, AllScope
Set-Alias -Name 'rni'     -Value 'Rename-Item'                    -Option ReadOnly, AllScope
Set-Alias -Name 'rnp'     -Value 'Rename-ItemProperty'            -Option ReadOnly, AllScope
Set-Alias -Name 'rp'      -Value 'Remove-ItemProperty'            -Option ReadOnly, AllScope
Set-Alias -Name 'rsn'     -Value 'Remove-PSSession'               -Option AllScope
# Set-Alias -Name 'rsnp'    -Value 'Remove-PSSnapIn'                -Option ReadOnly, AllScope
# Set-Alias -Name 'rujb'    -Value 'Resume-Job'                     -Option AllScope
Set-Alias -Name 'rv'      -Value 'Remove-Variable'                -Option ReadOnly, AllScope
Set-Alias -Name 'rvpa'    -Value 'Resolve-Path'                   -Option ReadOnly, AllScope
# Set-Alias -Name 'rwmi'    -Value 'Remove-WMIObject'               -Option ReadOnly, AllScope
Set-Alias -Name 'sajb'    -Value 'Start-Job'                      -Option AllScope
Set-Alias -Name 'sal'     -Value 'Set-Alias'                      -Option ReadOnly, AllScope
Set-Alias -Name 'saps'    -Value 'Start-Process'                  -Option ReadOnly, AllScope
# Set-Alias -Name 'sasv'    -Value 'Start-Service'                  -Option ReadOnly, AllScope
Set-Alias -Name 'sbp'     -Value 'Set-PSBreakpoint'               -Option ReadOnly, AllScope
Set-Alias -Name 'sc'      -Value 'Set-Content'                    -Option ReadOnly, AllScope
Set-Alias -Name 'scb'     -Value 'Set-Clipboard'                  -Option None
Set-Alias -Name 'select'  -Value 'Select-Object'                  -Option ReadOnly, AllScope
Set-Alias -Name 'set'     -Value 'Set-Variable'                   -Option AllScope
# Set-Alias -Name 'shcm'    -Value 'Show-Command'                   -Option ReadOnly, AllScope
Set-Alias -Name 'si'      -Value 'Set-Item'                       -Option ReadOnly, AllScope
Set-Alias -Name 'sl'      -Value 'Set-Location'                   -Option ReadOnly, AllScope
Set-Alias -Name 'sleep'   -Value 'Start-Sleep'                    -Option ReadOnly, AllScope
Set-Alias -Name 'sls'     -Value 'Select-String'                  -Option None
Set-Alias -Name 'sort'    -Value 'Sort-Object'                    -Option ReadOnly, AllScope
Set-Alias -Name 'sp'      -Value 'Set-ItemProperty'               -Option ReadOnly, AllScope
Set-Alias -Name 'spjb'    -Value 'Stop-Job'                       -Option AllScope
Set-Alias -Name 'spps'    -Value 'Stop-Process'                   -Option ReadOnly, AllScope
# Set-Alias -Name 'spsv'    -Value 'Stop-Service'                   -Option ReadOnly, AllScope
Set-Alias -Name 'start'   -Value 'Start-Process'                  -Option ReadOnly, AllScope
# Set-Alias -Name 'stz'     -Value 'Set-TimeZone'                   -Option None
# Set-Alias -Name 'sujb'    -Value 'Suspend-Job'                    -Option AllScope
Set-Alias -Name 'sv'      -Value 'Set-Variable'                   -Option ReadOnly, AllScope
# Set-Alias -Name 'swmi'    -Value 'Set-WMIInstance'                -Option ReadOnly, AllScope
Set-Alias -Name 'tee'     -Value 'Tee-Object'                     -Option ReadOnly, AllScope
Set-Alias -Name 'trcm'    -Value 'Trace-Command'                  -Option ReadOnly, AllScope
Set-Alias -Name 'type'    -Value 'Get-Content'                    -Option AllScope
Set-Alias -Name 'wget'    -Value 'Invoke-WebRequest'              -Option AllScope
Set-Alias -Name 'where'   -Value 'Where-Object'                   -Option ReadOnly, AllScope
Set-Alias -Name 'wjb'     -Value 'Wait-Job'                       -Option AllScope
Set-Alias -Name 'write'   -Value 'Write-Output'                   -Option ReadOnly, AllScope
