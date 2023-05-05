AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_wzs/fatty.mdl"}
ENT.StartHealth = 430
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.MeleeAttackDamage = 30

ENT.HasRangeAttack = true
ENT.RangeUseAttachmentForPos = true 
ENT.RangeUseAttachmentForPosID = "chest"
ENT.RangeAttackAnimationStopMovement = false
ENT.AnimTbl_RangeAttack = {"vjges_throw"}
ENT.RangeAttackEntityToSpawn = "obj_vj_wzs_ghoulflesh"
ENT.RangeDistance = 500 
ENT.RangeToMeleeDistance = 100
ENT.TimeUntilRangeAttackProjectileRelease = 0.7
ENT.RangeAttackExtraTimers = {0.7,0.7}
ENT.NextRangeAttackTime = 5

ENT.GeneralSoundPitch1 = 90
ENT.GeneralSoundPitch2 = 90
ENT.PainSoundPitch = VJ_Set(70, 70)
ENT.AlertSoundPitch = VJ_Set(70, 70)

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
self:SetMaterial("models/vj_wzs/vile_bloated_zombie_sheet")
self:SetColor(Color(45, 90, 38, 255))
self.NextRoarT = CurTime() + math.random(6,24)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(TheProjectile)
	return self:CalculateProjectile("Curve", self:GetAttachment(self:LookupAttachment(self.RangeUseAttachmentForPosID)).Pos, self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter(), 500) + self:GetUp()*math.Rand(-50,50) + self:GetRight()*math.Rand(-50,50)
end
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/