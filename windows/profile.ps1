Function CDDEV {Set-Location -Path C:\Dev}

Function DOWN {
    explorer.exe C:\Users\karol\Downloads
}

Function OPEN-EXPLORER {
    explorer.exe .
}

Function ACTIV {
    .\.venv\Scripts\activate
}

Set-Alias -Name activ -Value ACTIV 
Set-Alias -Name d -Value CDDEV
Set-Alias -Name dev -Value CDDEV
Set-Alias -Name vim -Value nvim-qt
Set-Alias -Name here -Value OPEN-EXPLORER 
Set-Alias -Name open -Value explorer.exe
Set-Alias -Name o -Value explorer.exe

# Import-Module posh-git
Invoke-Expression (&starship init powershell)

# Disable env prompt
$ENV:VIRTUAL_ENV_DISABLE_PROMPT=1
