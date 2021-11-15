# Microsoft Teams clear cache w/ PowerShell
Nothing special here, just a script to clear the MS Teams cache and other folders.

### Turning into an .exe

Simply install ps2exe with:

`Install-Module ps2exe`

then:

`Invoke-ps2exe .\source.ps1 .\target.exe`

This will compile the script into an .exe that you can share.
