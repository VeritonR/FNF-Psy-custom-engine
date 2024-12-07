function onCreate()
        setProperty('defaultCamZoom', 0.88)	
end

function onUpdatePost()
   if curStep == 384 or curStep == 1152 then
	 setProperty('defaultCamZoom', 0.67)
   end 
   if curStep == 768 or curStep == 1280 then
	setProperty('defaultCamZoom', 0.82)
   end	    	
   if curStep == 1504 or curStep == 1508 or curStep == 1512 or curStep == 1520 or curStep == 1524 or curStep == 1528 or curStep == 1631 or curStep == 1636 or curStep == 1640 or curStep == 1644 or curStep == 1648 or curStep == 1651 or curStep == 1656 or curStep == 1660 then
	triggerEvent("Add Camera Zoom",0.03,0.03)
   end
end