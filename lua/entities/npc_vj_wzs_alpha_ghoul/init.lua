AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_wzs/corpse1.mdl"}
ENT.StartHealth = 190

---------------------------------------------------------------------------------------------------------------------------------------------
ENT.BloodColor = "Red"

ENT.MeleeAttackDamageType = DMG_SLASH
ENT.MeleeAttackDamage = 22

ENT.RangeAttackEntityToSpawn = "obj_vj_wzs_flesh"

ENT.GeneralSoundPitch1 = 110
ENT.GeneralSoundPitch2 = 110
ENT.RangeAttackPitch = VJ_Set(110, 110)

-- ====== Sound File Paths ====== --

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
self:SetMaterial("models/vj_wzs/alpha_ghoul_sheet")
self:SetColor(Color(255, 155, 0, 255))
self.NextRoarT = CurTime() + math.random(6,24)

for i = 1,2 do	
	local att = i == 2 && "eyeglow1" or "eyeglow2"		
	local EyeGlow = ents.Create("env_sprite")
	EyeGlow:SetKeyValue("model","vj_base/sprites/vj_glow1.vmt")
	EyeGlow:SetKeyValue("scale","0.02")
	EyeGlow:SetKeyValue("rendermode","5")
	EyeGlow:SetKeyValue("rendercolor","255 95 0 255")
	EyeGlow:SetKeyValue("spawnflags","1") 
	EyeGlow:SetParent(self)
	EyeGlow:Fire("SetParentAttachment",att,0)
	EyeGlow:Spawn()
	EyeGlow:Activate()
	self:DeleteOnRemove(EyeGlow)
end

end
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/