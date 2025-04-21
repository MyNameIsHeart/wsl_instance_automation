# wsl_instance_automation
Script to automate handling WSL instances (mainly for testing)

## Before running:

- Open PowerShell as Administrator
- Navigate to script folder
- Run ```Set-ExecutionPolicy Bypass -Scope Process -Force```

## Set up a new clean WSL2 instance:

```
.\setup-clean-wsl2.ps1
```

## Reset everything and rebuild (make the instance "clean" again):

```
.\setup-clean-wsl2.ps1 -Reset
```

## Unregister instance and delete related files:

```
.\setup-clean-wsl2.ps1 -Delete
```

## Related WSL commands:

Use this instance: ```wsl -d CleanUbuntu```
<br>
List available instances: ```wsl -l -v```
