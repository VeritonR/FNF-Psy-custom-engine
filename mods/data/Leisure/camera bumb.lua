
-----settings------
sped = 0.5 --Rapides daaah :v
valo = -15 --Cuanto Quieres que se mueva a los lados
ag = 3 --Angulo
CamZoom = 0.05 --Add Camera Zoom
-----settings------



---------------Code----------------
function onSectionHit()
    if curStep >= 127 and curStep <= 1024 then

        triggerEvent("Add Camera Zoom",CamZoom,CamZoom)
        setProperty('camHUD.x',valo)
        setProperty('camGame.x',valo)
        doTweenX('iwi', 'camHUD', 0, sped, 'sineInOut')
        doTweenX('owo', 'camGame', 0, sped, 'sineInOut')

        valo = -valo
        ag = -ag
    end
end
---------------Code----------------