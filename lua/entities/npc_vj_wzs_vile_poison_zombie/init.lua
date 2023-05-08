AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_wzs/poisonzombie.mdl"}
ENT.StartHealth = 550

---------------------------------------------------------------------------------------------------------------------------------------------
ENT.MeleeAttackDamage = 40
ENT.RangeDistance = 600
ENT.GeneralSoundPitch1 = 80
ENT.GeneralSoundPitch2 = 80
ENT.RangeAttackPitch = VJ_Set(110, 110)
ENT.Immune_AcidPoisonRadiation = true
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
if math.random(1,2) == 1 then
self:SetMaterial("models/vj_wzs/vile_poison_zombie_sheet2")
else
self:SetMaterial("models/vj_wzs/vile_poison_zombie_sheet")
end
self:SetColor(Color(45, 90, 38, 255))
self.NextRoarT = CurTime() + math.random(6,24)

for i = 1,2 do	
	local att = i == 2 && "eyeglow1" or "eyeglow2"		
	local EyeGlow = ents.Create("env_sprite")
	EyeGlow:SetKeyValue("model","vj_base/sprites/vj_glow1.vmt")
	EyeGlow:SetKeyValue("scale","0.02")
	EyeGlow:SetKeyValue("rendermode","5")
	EyeGlow:SetKeyValue("rendercolor","0 255 0 255")
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