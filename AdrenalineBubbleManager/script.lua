--[[ 
	Adrenaline Bubble Manager VPK.
	Create and organize your direct adrenaline bubbles.
	
	Licensed by GNU General Public License v3.0
	
	Designed By:
	- Gdljjrod (https://twitter.com/gdljjrod).
	- DevDavisNunez (https://twitter.com/DevDavisNunez).
]]

if os.access() == 0 then
	os.message("UNSAFE MODE is required for this Homebrew !!!",0)
	os.exit()
end

game.close()
buttons.homepopup(0)	-- Lock exit to livearea! :)
color.loadpalette()		-- Load palette of colors!

buttons.read()
back = image.load("resources/back.png")
buttonskey = image.load("resources/buttons.png",20,20)
buttonskey2 = image.load("resources/buttons2.png",30,20)
icon0 = image.load("system_old/pboot/ICON0.PNG")

dofile("git/updater.lua")
dofile("commons.lua")

adrnew = true
if not game.exists("PSPEMUCFW") then
	os.message("Adrenaline has not been installed...\nOld version ABM is ready")
	adrnew = false
	--os.exit()
end

local system = "system"
if not adrnew then system = "system_old" end

dofile(system.."/exit.lua")
dofile(system.."/tai.lua")
dofile(system.."/utils.lua")
dofile(system.."/scan.lua")
dofile(system.."/bubbles.lua")

tai.load()
if not tai.find("KERNEL",ADRENALINEK) then
	tai.put("KERNEL",ADRENALINEK)
	tai.sync()
	ForcePowerReset()
end
	
scan.games()
if not adrnew then bubbles.load() end
scan.show()

buttons.homepopup(1)	-- Unlock exit to livearea! :)
