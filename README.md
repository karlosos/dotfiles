# dotfiles

Personal configuration files

## Windows

### Configuring **neovim**

1. Create symlink to `init.vim` with command using `cmd.exe`:

```
mklink C:\Users\karol\AppData\Local\nvim\init.vim C:\Dev\dotfiles\windows\init.vim
```

> NOTE: `mklink` won't work in powershell

2. Create folder `C:\Users\karol\virtualenvs` and make there two virtual envs:

* `nvimpy3`
* `black`

With command `python3 -m virtualenv nvimpy3`, `python3 -m virtualenv black`. Then install in `nvimpy3` `nvimpy3/Scripts/pip.exe install nvimpy3` and `jedi` and in `black` install `black`.

### Configuring **powershell**

1. Create symlink to `profile.ps1` with command using `cmd.exe`:

```
mklink C:\Users\karol\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 C:\Dev\dotfiles\windows\profile.ps1
```
