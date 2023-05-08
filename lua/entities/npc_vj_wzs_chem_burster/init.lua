AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_wzs/poisonzombie.mdl"}
ENT.StartHealth = 100
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.AnimTbl_Walk = {ACT_WALK_STIMULATED} -- Set the walking animations | Put multiple to let the base pick a random animation when it moves
ENT.AnimTbl_Run = {ACT_WALK_STIMULATED} -- Set the running animations | Put multiple to let the base pick a random animation when it moves

ENT.BloodColor = "Green"

ENT.HasDeathRagdoll = false -- If set to false, it will not spawn the regular ragdoll of the SNPC
ENT.GibOnDeathDamagesTable = {"All"}

ENT.GeneralSoundPitch1 = 90
ENT.GeneralSoundPitch2 = 90
ENT.Immune_AcidPoisonRadiation = true

-- ====== Sound File Paths ====== --
ENT.SoundTbl_BeforeMeleeAttack = {"npc/metropolice/pain1.wav","npc/metropolice/pain2.wav","npc/metropolice/pain3.wav","npc/metropolice/pain4.wav"}
ENT.SoundTbl_Alert = {"npc/metropolice/pain1.wav","npc/metropolice/pain2.wav","npc/metropolice/pain3.wav","npc/metropolice/pain4.wav"}
ENT.SoundTbl_Pain = {"npc/metropolice/pain1.wav","npc/metropolice/pain2.wav","npc/metropolice/pain3.wav","npc/metropolice/pain4.wav","npc/metropolice/pain1.wav","npc/metropolice/pain2.wav","npc/metropolice/pain3.wav","npc/metropolice/pain4.wav"}
ENT.SoundTbl_Death = {"npc/metropolice/pain1.wav","npc/metropolice/pain2.wav","npc/metropolice/pain3.wav","npc/metropolice/pain4.wav"}
ENT.SoundTbl_FootStep = {"npc/zombie_poison/pz_left_foot1.wav","npc/zombie_poison/pz_left_foot1.wav","npc/zombie_poison/pz_left_foot1.wav"}
ENT.SoundTbl_Scuff = {"npc/zombie_poison/pz_right_foot1.wav","npc/zombie_poison/pz_right_foot1.wav","npc/zombie_poison/pz_right_foot1.wav"}


---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
self:SetMaterial("models/vj_wzs/zombie_poison/poisonzombie_sheet4")
self:SetPlayerColor(Color(math.Rand(0,255),math.Rand(0,255),math.Rand(0,255)):ToVector())
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
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink()
	local idleeffect = EffectData()
	idleeffect:SetOrigin(self:GetPos() +self:OBBCenter())
	idleeffect:SetColor(VJ_Color2Byte(Color(0,255,0)))
	idleeffect:SetScale(24)
	util.Effect("VJ_Blood1",idleeffect)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink_AIEnabled()
    if IsValid(self:GetEnemy()) == true && !self.Dead && self:GetEnemy() != nil && !self.MeleeAttacking && !self.RangeAttacking && self.NextRoarT < CurTime() then
        VJ_EmitSound(self,self.SoundTbl_Alert,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.AlertSoundPitch.a,self.AlertSoundPitch.b))
		 self:VJ_ACT_PLAYACTIVITY("vjges_throwwarning",true,VJ_GetSequenceDuration(self,tbl),false)
        self.NextRoarT = CurTime() + math.random(6,24)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo,hitgroup)
	if self.HasGibDeathParticles == true then
		local bloodeffect = EffectData()
		bloodeffect:SetOrigin(self:GetPos() +self:OBBCenter())
		bloodeffect:SetColor(VJ_Color2Byte(Color(0,255,0)))
		bloodeffect:SetScale(128)
		util.Effect("VJ_Blood1",bloodeffect)
		
		local bloodspray = EffectData()
		bloodspray:SetOrigin(self:GetPos())
		bloodspray:SetScale(8)
		bloodspray:SetFlags(3)
		bloodspray:SetColor(0)
		util.Effect("bloodspray",bloodspray)
		util.Effect("bloodspray",bloodspray)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnKilled(dmginfo,hitgroup)
		util.VJ_SphereDamage(self,self,self:GetPos(),150,math.random(30,40),DMG_BLAST,true,true,{Force=20})
		util.ScreenShake(self:GetPos(),44,600,1.5,250)
		VJ_EmitSound(self,{"physics/body/body_medium_break2.wav","physics/body/body_medium_break3.wav","physics/body/body_medium_break4.wav"},80,90)
		VJ_EmitSound(self,{"weapons/explode3.wav","weapons/explode4.wav","weapons/explode5.wav"},80,130)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer()
	self.GodMode = false
	self:TakeDamage(10000)
end
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/