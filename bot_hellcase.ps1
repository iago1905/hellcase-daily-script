Function Mostrar-MensajeCuadroDialogo {
    param (
        $contenido
    )

    [reflection.assembly]::loadwithpartialname('System.Windows.Forms')
    [reflection.assembly]::loadwithpartialname('System.Drawing')
    $notify = new-object system.windows.forms.notifyicon
    $notify.icon = [System.Drawing.SystemIcons]::Information
    $notify.visible = $true
    $notify.showballoontip(5,'HELLCASE',$contenido,[system.windows.forms.tooltipicon]::None)
    
}


    $remoteFileLocation = "https://api.hellcase.com/csgo/es/dailyfree/buy"
  
    $session = New-Object Microsoft.PowerShell.Commands.WebRequestSession
    
    $cookie = New-Object System.Net.Cookie 
    
    $cookie.Name = "hellcase_session"
    $cookie.Value = ""    # Aqui poner la cookie de sesion !!
    $cookie.Domain = ".hellcase.com"

    $session.Cookies.Add($cookie);

    $r = Invoke-WebRequest $remoteFileLocation -WebSession $session #-TimeoutSec 900 # -OutFile 'D:\verano 2021\bot'
    
    

    
    
    if($r.Content -eq '{"status":"error","error_message":"free_allready_received"}')
                        
    {
        Mostrar-MensajeCuadroDialogo("Recompensa recogida")

    }
    else
    {
        Mostrar-MensajeCuadroDialogo("Algo falló, miraver!!")
    }
