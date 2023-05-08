/*--------------------------------------------------
	=============== Autorun File ===============
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
------------------ Addon Information ------------------
local PublicAddonName = "Warkin's Zombie Survival SNPCs"
local AddonName = "Warkin's Zombie Survival SNPCs"
local AddonType = "SNPC"
local AutorunFile = "autorun/vj_wzs.lua"
-------------------------------------------------------
local VJExists = file.Exists("lua/autorun/vj_base_autorun.lua","GAME")
if VJExists == true then
	include('autorun/vj_controls.lua')

	local vCat = "Warkin's Zombie Survival"
	
	VJ.AddNPC("Zombie","npc_vj_wzs_zombie",vCat)
	VJ.AddNPC("Charred Zombie","npc_vj_wzs_charred_zombie",vCat)
	VJ.AddNPC("Eradicator","npc_vj_wzs_eradicator",vCat)
	
	VJ.AddNPC("Fast Zombie","npc_vj_wzs_fast_zombie",vCat)
	VJ.AddNPC("Ripper","npc_vj_wzs_ripper",vCat)
	
	VJ.AddNPC("Bloated Zombie","npc_vj_wzs_bloated_zombie",vCat)
	VJ.AddNPC("Vile Bloated Zombie","npc_vj_wzs_vile_bloated_zombie",vCat)
	
	VJ.AddNPC("Skeletal Walker","npc_vj_wzs_skeletal_walker",vCat)
	VJ.AddNPC("Skeletal Shambler","npc_vj_wzs_skeletal_shambler",vCat)
	VJ.AddNPC("Bloody Bones","npc_vj_wzs_bloody_bones",vCat)
	
	VJ.AddNPC("Shadow Walker","npc_vj_wzs_shadow_walker",vCat)
	VJ.AddNPC("Void Walker","npc_vj_wzs_void_walker",vCat)
	
	VJ.AddNPC("Ghoul","npc_vj_wzs_ghoul",vCat)
	VJ.AddNPC("Alpha Ghoul","npc_vj_wzs_alpha_ghoul",vCat)
	
	VJ.AddNPC("Poison Zombie","npc_vj_wzs_poison_zombie",vCat)
	VJ.AddNPC("Vile Poison Zombie","npc_vj_wzs_vile_poison_zombie",vCat)
	VJ.AddNPC("Parasite","npc_vj_wzs_parasite",vCat)
	
	VJ.AddNPC("Blood Burster","npc_vj_wzs_blood_burster",vCat)
	VJ.AddNPC("Chem Burster","npc_vj_wzs_chem_burster",vCat)
	
	-- BOSSES --
	
	VJ.AddNPC("[BOSS] Twisted Bones","npc_vj_wzs_boss_twisted_bones",vCat)
	VJ.AddNPC("[BOSS] Ancient Nightmare","npc_vj_wzs_boss_ancient_nightmare",vCat)
	
	-- MINI-BOSSES --
	
	VJ.AddNPC("[MINI-BOSS] Bastardzine","npc_vj_wzs_miniboss_bastardzine",vCat)
	VJ.AddNPC("[MINI-BOSS] Nightmare","npc_vj_wzs_miniboss_nightmare",vCat)
	
	-- SPAWNERS --
	
	local vCat = "Warkin's Zombie Survival - Entities"
	
	VJ.AddNPC("[ZOMBIE GAS] All Zombies","obj_vj_wzs_zombiegas_all",vCat)
	VJ.AddNPC("[ZOMBIE GAS] All Zombies (Boss and Mini-Bossless)","obj_vj_wzs_zombiegas_all_nobossbaby",vCat)
	VJ.AddNPC("[ZOMBIE GAS] Destruction-Class Zombies","obj_vj_wzs_zombiegas_destruction",vCat)
	VJ.AddNPC("[ZOMBIE GAS] Tank-Class Zombies","obj_vj_wzs_zombiegas_tank",vCat)
	VJ.AddNPC("[ZOMBIE GAS] Support-Class Zombies","obj_vj_wzs_zombiegas_support",vCat)
	VJ.AddNPC("[ZOMBIE GAS] Assault-Class Zombies","obj_vj_wzs_zombiegas_assault",vCat)
	VJ.AddNPC("[ZOMBIE GAS] Mini-Boss Zombies","obj_vj_wzs_zombiegas_miniboss",vCat)
	VJ.AddNPC("[ZOMBIE GAS] Boss Zombies","obj_vj_wzs_zombiegas_boss",vCat)
	VJ.AddNPC("[ZOMBIE GAS] None","obj_vj_wzs_zombiegas_nothing",vCat)


	-- CONVARS --
	
    VJ.AddConVar("VJ_WZS_Printnames", 0, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_WZS_Chat", 0, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_WZS_UniqueClass", 0, {FCVAR_ARCHIVE})

	if (CLIENT) then
		local function VJ_WZS(Panel)
			if !game.SinglePlayer() then
				if !LocalPlayer():IsAdmin() or !LocalPlayer():IsSuperAdmin() then
					Panel:AddControl( "Label", {Text = "You are not an admin!"})
					Panel:ControlHelp("Note: Only admins can change these settings!")
				return end
			end
			Panel:AddControl( "Label", {Text = "Note: Only admins can change these settings!"})
			Panel:AddControl( "Label", {Text = "Please respawn any existing zombies after changing things in here!"})
			local vj_resetbutton = {Options = {}, CVars = {}, Label = "Reset Everything:", MenuButton = "0"}
			vj_resetbutton.Options["#vjbase.menugeneral.default"] = { 
				VJ_WZS_Printnames = "0",
				VJ_WZS_Chat = "0",
				VJ_WZS_UniqueClass = "0",
			}
			Panel:AddControl( "Label", {Text = "Note: Only admins can change these settings!"})
			Panel:AddControl("ComboBox", vj_resetbutton)

			Panel:AddControl("Checkbox", {Label ="Enable Player-like Printnames?", Command ="VJ_WZS_Printnames"})
			Panel:ControlHelp("If enabled, zombies will have randomized printnames instead of just their class name.")

			Panel:AddControl("Checkbox", {Label ="Enable Zombie Chat?", Command ="VJ_WZS_Chat"})
			Panel:ControlHelp("If enabled, zombies can randomly 'type' stuff in chat.")

			Panel:AddControl("Checkbox", {Label ="Zombies Have Unique Class?", Command ="VJ_WZS_UniqueClass"})
			Panel:ControlHelp("If enabled, zombies will have their own unique class instead of CLASS_ZOMBIE.")
			Panel:ControlHelp("This means they will fight other zombie npcs.")
		end

		function VJ_AddToMenu_WZS(Panel)
			spawnmenu.AddToolMenuOption("DrVrej","SNPC Configures","Warkin's Zombie Survival","Warkin's Zombie Survival","","", VJ_WZS, {} )
		end
		hook.Add("PopulateToolMenu","VJ_AddToMenu_WZS", VJ_AddToMenu_WZS )
	end
	

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local NPC = FindMetaTable("NPC")
	local ENT = FindMetaTable("Entity")
	local Phys = FindMetaTable("PhysObj")
	
	function ENT:AdjustBones(tbl,alter)
		local ang = false
		if type(alter) == "Angle" then
			ang = true
		end
		for _,v in pairs(tbl) do
			local boneid = self:LookupBone(v)
			if boneid && boneid > 0 then
				if ang == false then
					self:ManipulateBonePosition(boneid,alter)
				else
					self:ManipulateBoneAngles(boneid,alter)
				end
			end
		end
	end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- !!!!!! DON'T TOUCH ANYTHING BELOW THIS !!!!!! -------------------------------------------------------------------------------------------------------------------------
	AddCSLuaFile(AutorunFile)
	VJ.AddAddonProperty(AddonName,AddonType)
else
	if (CLIENT) then
		chat.AddText(Color(0,200,200),PublicAddonName,
		Color(0,255,0)," was unable to install, you are missing ",
		Color(255,100,0),"VJ Base!")
	end
	timer.Simple(1,function()
		if not VJF then
			if (CLIENT) then
				VJF = vgui.Create("DFrame")
				VJF:SetTitle("ERROR!")
				VJF:SetSize(790,560)
				VJF:SetPos((ScrW()-VJF:GetWide())/2,(ScrH()-VJF:GetTall())/2)
				VJF:MakePopup()
				VJF.Paint = function()
					draw.RoundedBox(8,0,0,VJF:GetWide(),VJF:GetTall(),Color(200,0,0,150))
				end
				
				local VJURL = vgui.Create("DHTML",VJF)
				VJURL:SetPos(VJF:GetWide()*0.005, VJF:GetTall()*0.03)
				VJURL:Dock(FILL)
				VJURL:SetAllowLua(true)
				VJURL:OpenURL("https://sites.google.com/site/vrejgaming/vjbasemissing")
			elseif (SERVER) then
				timer.Create("VJBASEMissing",5,0,function() print("VJ Base is Missing! Download it from the workshop!") end)
			end
		end
	end)
end