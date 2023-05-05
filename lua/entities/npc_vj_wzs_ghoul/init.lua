AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_wzs/corpse1.mdl"}
ENT.StartHealth = 100

---------------------------------------------------------------------------------------------------------------------------------------------
ENT.BloodColor = "Yellow"

ENT.MeleeAttackDamageType = DMG_ACID

ENT.HasRangeAttack = true
ENT.RangeUseAttachmentForPos = true 
ENT.RangeUseAttachmentForPosID = "forward"
ENT.RangeAttackAnimationStopMovement = false
ENT.AnimTbl_RangeAttack = {"vjges_throw"}
ENT.RangeAttackEntityToSpawn = "obj_vj_wzs_ghoulflesh"
ENT.RangeDistance = 500 
ENT.RangeToMeleeDistance = 100
ENT.TimeUntilRangeAttackProjectileRelease = 0.7
ENT.RangeAttackExtraTimers = {0.7,0.7}
ENT.NextRangeAttackTime = 5

ENT.GeneralSoundPitch1 = 120
ENT.GeneralSoundPitch2 = 120
ENT.RangeAttackPitch = VJ_Set(110, 110)

-- ====== Sound File Paths ====== --
ENT.SoundTbl_BeforeMeleeAttack = {"npc/zombie_poison/pz_warn1.wav","npc/zombie_poison/pz_warn2.wav"}
ENT.SoundTbl_BeforeRangeAttack = {"npc/zombie_poison/pz_throw2.wav","npc/zombie_poison/pz_throw3.wav"}
ENT.SoundTbl_RangeAttack = {"physics/body/body_medium_break2.wav","physics/body/body_medium_break3.wav","physics/body/body_medium_break4.wav"}
ENT.SoundTbl_Alert = {"npc/zombie_poison/pz_alert1.wav","npc/zombie_poison/pz_alert2.wav","npc/zombie_poison/pz_alert1.wav","npc/zombie_poison/pz_alert2.wav"}
ENT.SoundTbl_Pain = {"npc/zombie_poison/pz_pain1.wav","npc/zombie_poison/pz_pain2.wav","npc/zombie_poison/pz_pain3.wav","npc/zombie_poison/pz_pain1.wav","npc/zombie_poison/pz_pain2.wav","npc/zombie_poison/pz_pain3.wav"}
ENT.SoundTbl_Death = {"npc/zombie_poison/pz_die1.wav","npc/zombie_poison/pz_die2.wav","npc/zombie_poison/pz_die1.wav","npc/zombie_poison/pz_die2.wav"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(TheProjectile)
	return self:CalculateProjectile("Curve", self:GetAttachment(self:LookupAttachment(self.RangeUseAttachmentForPosID)).Pos, self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter(), 500) + self:GetUp()*math.Rand(-50,50) + self:GetRight()*math.Rand(-50,50)
end
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/