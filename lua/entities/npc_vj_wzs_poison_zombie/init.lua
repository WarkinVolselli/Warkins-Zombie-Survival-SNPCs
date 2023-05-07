AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_wzs/poisonzombie.mdl"}
ENT.StartHealth = 450

---------------------------------------------------------------------------------------------------------------------------------------------
ENT.BloodColor = "Yellow"

ENT.MeleeAttackDamageType = DMG_ACID
ENT.MeleeAttackDamage = 35
ENT.AnimTbl_MeleeAttack = {"vjges_melee_01","vjges_melee_02","vjges_melee_03","vjges_melee_01","vjges_melee_02","vjges_melee_03"}

ENT.HasRangeAttack = true
ENT.RangeUseAttachmentForPos = true 
ENT.RangeUseAttachmentForPosID = "blood_right"
ENT.RangeAttackAnimationStopMovement = false
ENT.AnimTbl_RangeAttack = {"vjges_throw"}
ENT.RangeAttackEntityToSpawn = "obj_vj_wzs_ghoulflesh"
ENT.RangeDistance = 500
ENT.RangeToMeleeDistance = 100
ENT.TimeUntilRangeAttackProjectileRelease = 0.9
ENT.RangeAttackExtraTimers = {0.9,0.9,0.9,0.9}
ENT.NextRangeAttackTime = 7

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.RangeAttackPitch = VJ_Set(110, 110)

-- ====== Sound File Paths ====== --
ENT.SoundTbl_BeforeMeleeAttack = {"npc/zombie_poison/pz_warn1.wav","npc/zombie_poison/pz_warn2.wav"}
ENT.SoundTbl_BeforeRangeAttack = {"npc/zombie_poison/pz_throw2.wav","npc/zombie_poison/pz_throw3.wav"}
ENT.SoundTbl_RangeAttack = {"physics/body/body_medium_break2.wav","physics/body/body_medium_break3.wav","physics/body/body_medium_break4.wav"}
ENT.SoundTbl_Alert = {"npc/zombie_poison/pz_alert1.wav","npc/zombie_poison/pz_alert2.wav","npc/zombie_poison/pz_alert1.wav","npc/zombie_poison/pz_alert2.wav"}
ENT.SoundTbl_Pain = {"npc/zombie_poison/pz_pain1.wav","npc/zombie_poison/pz_pain2.wav","npc/zombie_poison/pz_pain3.wav","npc/zombie_poison/pz_pain1.wav","npc/zombie_poison/pz_pain2.wav","npc/zombie_poison/pz_pain3.wav"}
ENT.SoundTbl_Death = {"npc/zombie_poison/pz_die1.wav","npc/zombie_poison/pz_die2.wav","npc/zombie_poison/pz_die1.wav","npc/zombie_poison/pz_die2.wav"}
ENT.SoundTbl_FootStep = {"npc/zombie_poison/pz_left_foot1.wav","npc/zombie_poison/pz_left_foot1.wav","npc/zombie_poison/pz_left_foot1.wav"}
ENT.SoundTbl_Scuff = {"npc/zombie_poison/pz_right_foot1.wav","npc/zombie_poison/pz_right_foot1.wav","npc/zombie_poison/pz_right_foot1.wav"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
if math.random(1,2) == 1 then
self:SetMaterial("models/vj_wzs/zombie_poison/poisonzombie_sheet2")
end
self:SetPlayerColor(Color(math.Rand(0,255),math.Rand(0,255),math.Rand(0,255)):ToVector())
self.NextRoarT = CurTime() + math.random(6,24)
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
function ENT:RangeAttackCode_GetShootPos(TheProjectile)
	return self:CalculateProjectile("Curve", self:GetAttachment(self:LookupAttachment(self.RangeUseAttachmentForPosID)).Pos, self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter(), 700) + self:GetUp()*math.Rand(-50,50) + self:GetRight()*math.Rand(-50,50)
end
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/