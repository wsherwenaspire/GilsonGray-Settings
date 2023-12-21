
$Logfile = "$env:windir\Temp\Logs\GilsonGraySettings.log"
Function LogWrite{
   Param ([string]$logstring)
   Add-content $Logfile -value $logstring
   write-output $logstring
}

function Get-TimeStamp {
    return "[{0:dd/MM/yy} {0:HH:mm:ss}]" -f (Get-Date)
}

if (!(Test-Path "$env:windir\Temp\Logs\"))
{
   mkdir $env:windir\Temp\Logs
   LogWrite "$(Get-TimeStamp): Script has started."
   LogWrite "$(Get-TimeStamp): Log directory created."
}
else
{
    LogWrite "$(Get-TimeStamp): Script has started."
    LogWrite "$(Get-TimeStamp): Log directory exists."
}

if (!(Test-Path "$env:windir\GilsonGray\Settings\"))
{
   mkdir $env:windir\GilsonGray\Settings
   LogWrite "$(Get-TimeStamp): Settings directory not found."
   LogWrite "$(Get-TimeStamp): Settings Directory has been created."
}
else
{
    LogWrite "$(Get-TimeStamp): Settings directory was found."
    LogWrite "$(Get-TimeStamp): No changes made."
}

LogWrite "$(Get-TimeStamp): Copying IEMode File."
xcopy ".\Resources\IEMode.xml" "$env:windir\GilsonGray\Settings\"
LogWrite "$(Get-TimeStamp): Copied IEMode File."
LogWrite "$(Get-TimeStamp): Copying Background File."
xcopy ".\Resources\Logo.jpg" "$env:windir\GilsonGray\Settings\"
LogWrite "$(Get-TimeStamp): Copied Background File."


exit



