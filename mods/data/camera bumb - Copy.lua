
-----settings------
sped = 0.5 --Rapides daaah :v
valo = -15 --Cuanto Quieres que se mueva a los lados
ag = 3 --Angulo
CamZoom = 0.05 --Add Camera Zoom
-----settings------



---------------Code----------------
function onSectionHit()
triggerEvent("Add Camera Zoom",CamZoom,CamZoom)

--doTweenAngle('awa', 'camHUD', 0, sped, 'sineInOut')
--doTweenAngle('ewe', 'camGame', 0, sped, 'sineInOut')

setProperty('camHUD.x',valo)
setProperty('camGame.x',valo)
doTweenX('iwi', 'camHUD', 0, sped, 'sineInOut')
doTweenX('owo', 'camGame', 0, sped, 'sineInOut')

--setProperty('camGame.angle', ag)
--setProperty('camHUD.angle', ag)

valo = -valo
ag = -ag
end
---------------Code----------------