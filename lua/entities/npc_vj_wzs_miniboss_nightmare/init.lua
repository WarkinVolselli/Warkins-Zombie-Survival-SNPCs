AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_wzs/charple.mdl"}
ENT.StartHealth = 1000

---------------------------------------------------------------------------------------------------------------------------------------------
ENT.AnimTbl_IdleStand = {ACT_IDLE_AGITATED} -- The idle animation when AI is enabled
ENT.AnimTbl_Walk = {ACT_WALK_AGITATED} -- Set the walking animations | Put multiple to let the base pick a random animation when it moves
ENT.AnimTbl_Run = {ACT_WALK_AGITATED} -- Set the running animations | Put multiple to let the base pick a random animation when it moves

ENT.BloodColor = "Oil"

ENT.MeleeAttackDamage = 35
ENT.GeneralSoundPitch1 = 80
ENT.GeneralSoundPitch2 = 80
ENT.BreathSoundLevel = 60

-- ====== Sound File Paths ====== --
ENT.SoundTbl_Breath = {"vj_wzs/nightmare_ambiance.ogg"}
ENT.SoundTbl_BeforeMeleeAttack = {"npc/barnacle/barnacle_bark1.wav","npc/barnacle/barnacle_bark1.wav"}
ENT.SoundTbl_Alert = {"npc/fast_zombie/leap1.wav","npc/fast_zombie/leap1.wav","npc/fast_zombie/leap1.wav"}
ENT.SoundTbl_Pain = {"npc/barnacle/barnacle_pull1.wav","npc/barnacle/barnacle_pull2.wav","npc/barnacle/barnacle_pull3.wav","npc/barnacle/barnacle_pull4.wav","npc/barnacle/barnacle_pull1.wav","npc/barnacle/barnacle_pull2.wav","npc/barnacle/barnacle_pull3.wav","npc/barnacle/barnacle_pull4.wav"}
ENT.SoundTbl_Death = {"npc/fast_zombie/fz_alert_close1.wav","npc/fast_zombie/fz_alert_close1.wav","npc/fast_zombie/fz_alert_close1.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
self.NextRoarT = CurTime() + math.random(6,24)
self:SetColor(Color(35, 35, 35, 255))

for i = 1,2 do	
	local att = i == 2 && "eyeglow1" or "eyeglow2"		
	local EyeGlow = ents.Create("env_sprite")
	EyeGlow:SetKeyValue("model","vj_base/sprites/vj_glow1.vmt")
	EyeGlow:SetKeyValue("scale","0.03")
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
	local targetbones = {"ValveBiped.Bip01_Spine2","ValveBiped.Bip01_Spine3","ValveBiped.Bip01_Spine4"}
	self:AdjustBones(targetbones,Vector(math.random(0,2),math.random(0,2),math.random(0,2)))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink_AIEnabled()
    if IsValid(self:GetEnemy()) == true && !self.Dead && self:GetEnemy() != nil && !self.MeleeAttacking && !self.RangeAttacking && self.NextRoarT < CurTime() then
        VJ_EmitSound(self,self.SoundTbl_Alert,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a,self.BeforeMeleeAttackSoundPitch.b))
		 self:VJ_ACT_PLAYACTIVITY("vjges_taunt_zombie",true,VJ_GetSequenceDuration(self,tbl),false)
        self.NextRoarT = CurTime() + math.random(6,24)
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/