AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_wzs/corpse1.mdl"}
ENT.StartHealth = 180
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.BloodColor = "Oil"

ENT.GeneralSoundPitch1 = 80
ENT.GeneralSoundPitch2 = 80

-- ====== Sound File Paths ====== --
ENT.SoundTbl_BeforeMeleeAttack = {"npc/antlion/attack_single1.wav","npc/antlion/attack_single2.wav","npc/antlion/attack_single3.wav"}
ENT.SoundTbl_Alert = {"npc/antlion/idle1.wav","npc/antlion/idle2.wav","npc/antlion/idle3.wav","npc/antlion/idle4.wav","npc/antlion/idle5.wav"}
ENT.SoundTbl_Pain = {"npc/antlion/pain1.wav","npc/antlion/pain2.wav","npc/antlion/pain1.wav","npc/antlion/pain2.wav"}
ENT.SoundTbl_Death = {"npc/antlion/distract1.wav","npc/antlion/distract1.wav","npc/antlion/distract1.wav"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
self.NextRoarT = CurTime() + math.random(6,24)
self:SetRenderMode( RENDERMODE_TRANSCOLOR )
self:SetColor(Color(50, 50, 50, 245))
self:SetMaterial("models/humans/corpse/corpse1")

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
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo, hitgroup, corpseEnt)
self:SetRenderMode( RENDERMODE_TRANSCOLOR )
self:SetColor(Color(50, 50, 50, 245))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
    if 
        dmginfo:IsDamageType(DMG_GENERIC) or
        dmginfo:IsDamageType(DMG_CLUB) or
        dmginfo:IsDamageType(DMG_SLASH) or
        dmginfo:IsDamageType(DMG_BURN) or
        dmginfo:IsDamageType(DMG_SLOWBURN) or
        dmginfo:IsDamageType(DMG_SHOCK) or
        dmginfo:IsDamageType(DMG_ENERGYBEAM) or
        dmginfo:IsDamageType(DMG_PLASMA) or
        dmginfo:IsDamageType(DMG_SONIC)
    then
        dmginfo:ScaleDamage(0.5)
    end
end
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/