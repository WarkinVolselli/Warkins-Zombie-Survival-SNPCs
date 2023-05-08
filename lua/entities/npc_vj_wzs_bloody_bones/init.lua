AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_wzs/skeleton.mdl"}
ENT.StartHealth = 360
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.MeleeAttackDamage = 28

ENT.GeneralSoundPitch1 = 70
ENT.GeneralSoundPitch2 = 70

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
self:SetMaterial("models/vj_wzs/bloody_bones_sheet")
self.NextRoarT = CurTime() + math.random(6,24)

for i = 1,2 do	
	local att = i == 2 && "eyeglow1" or "eyeglow2"		
	local EyeGlow = ents.Create("env_sprite")
	EyeGlow:SetKeyValue("model","vj_base/sprites/vj_glow1.vmt")
	EyeGlow:SetKeyValue("scale","0.02")
	EyeGlow:SetKeyValue("rendermode","5")
	EyeGlow:SetKeyValue("rendercolor","255 0 0 255")
	EyeGlow:SetKeyValue("spawnflags","1") 
	EyeGlow:SetParent(self)
	EyeGlow:Fire("SetParentAttachment",att,0)
	EyeGlow:Spawn()
	EyeGlow:Activate()
	self:DeleteOnRemove(EyeGlow)
end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
    if 
        dmginfo:IsBulletDamage() or
        dmginfo:IsDamageType(DMG_BUCKSHOT) or
        dmginfo:IsDamageType(DMG_SNIPER) or
        dmginfo:IsDamageType(DMG_AIRBOAT)
    then
        dmginfo:ScaleDamage(0.6)
    end
    if 
        dmginfo:IsDamageType(DMG_GENERIC) or
        dmginfo:IsDamageType(DMG_CLUB) or
        dmginfo:IsDamageType(DMG_SLASH)
    then
        dmginfo:ScaleDamage(1.5)
    end
end
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/