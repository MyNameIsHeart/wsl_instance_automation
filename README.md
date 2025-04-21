# wsl_instance_automation
Script to automate handling wsl2 instances (mainly for testing)

## Before running:

- Open PowerShell as Administrator
- Navigate to script folder
- Run ```Set-ExecutionPolicy Bypass -Scope Process -Force```

## Set up a new clean wsl2 instance:

```
.\setup-clean-wsl2.ps1
```

## Reset everything and rebuild (make the instance "clean" again)

```
.\setup-clean-wsl2.ps1 -Reset
```

## Related WSL commands:

Use this instance: ```wsl -d CleanUbuntu```
<br>
List available instances: ```wsl -l -v```

## Delete said wsl2 instance and folder:

```
.\setup-clean-wsl2.ps1 -Delete
```
