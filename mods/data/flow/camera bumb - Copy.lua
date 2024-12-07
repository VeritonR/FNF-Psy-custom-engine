
-----settings------
sped = 0.5 --Rapides daaah :v
valo = -15 --Cuanto Quieres que se mueva a los lados
CamZoom = 0.05 --Add Camera Zoom
-----settings------



---------------Code----------------
function onBeatHit()
    if curStep <= 1785 then
triggerEvent("Add Camera Zoom",CamZoom,CamZoom)

setProperty('camHUD.x',valo)
setProperty('camGame.x',valo)
doTweenX('iwi', 'camHUD', 0, sped, 'sineInOut')
doTweenX('owo', 'camGame', 0, sped, 'sineInOut')

valo = -valo
    end
end
---------------Code----------------