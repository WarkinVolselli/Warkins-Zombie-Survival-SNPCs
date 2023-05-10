AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_wzs/zombie_fast.mdl"}
ENT.StartHealth = 80

---------------------------------------------------------------------------------------------------------------------------------------------
ENT.BloodColor = "Red"

ENT.MeleeAttackDamageType = DMG_PARALYZE
ENT.MeleeAttackDamage = 18
ENT.SlowPlayerOnMeleeAttack = true
ENT.SlowPlayerOnMeleeAttack_WalkSpeed = 100
ENT.SlowPlayerOnMeleeAttack_RunSpeed = 200
ENT.SlowPlayerOnMeleeAttackTime = math.random(2,3)

ENT.HasRangeAttack = true
ENT.RangeUseAttachmentForPos = true 
ENT.RangeUseAttachmentForPosID = "forward"
ENT.RangeAttackAnimationStopMovement = false
ENT.AnimTbl_RangeAttack = {"vjges_throw"}
ENT.RangeAttackEntityToSpawn = "obj_vj_wzs_gunk"
ENT.RangeDistance = 600 
ENT.RangeToMeleeDistance = 100
ENT.TimeUntilRangeAttackProjectileRelease = 0.7
ENT.RangeAttackExtraTimers = {0.7,0.7}
ENT.NextRangeAttackTime = 5.5

ENT.GeneralSoundPitch1 = 110
ENT.GeneralSoundPitch2 = 110
ENT.RangeAttackPitch = VJ_Set(110, 110)

-- ====== Sound File Paths ====== --
ENT.SoundTbl_BeforeRangeAttack = {"npc/zombie/zombie_pain1.wav","npc/zombie/zombie_pain2.wav","npc/zombie/zombie_pain3.wav","npc/zombie/zombie_pain4.wav","npc/zombie/zombie_pain5.wav","npc/zombie/zombie_pain6.wav"}
ENT.SoundTbl_RangeAttack = {"physics/body/body_medium_break2.wav","physics/body/body_medium_break3.wav","physics/body/body_medium_break4.wav"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
self:SetMaterial("models/flesh")
self:SetColor(Color(30, 50, 0, 255))	
self.NextRoarT = CurTime() + math.random(6,24)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(TheProjectile)
	return self:CalculateProjectile("Curve", self:GetAttachment(self:LookupAttachment(self.RangeUseAttachmentForPosID)).Pos, self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter(), 600) + self:GetUp()*math.Rand(-50,50) + self:GetRight()*math.Rand(-50,50)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_AfterChecks(hitEnt, isProp)
	if hitEnt:IsPlayer() then
		hitEnt:ConCommand( "pp_mat_overlay vj_base/decals/blood/vj_oilblood" .. math.random(5) )
		timer.Create( "hideoverlay", math.random(2,3), 1, function()	
		if !IsValid(hitEnt) then return end
		hitEnt:ConCommand( "pp_mat_overlay  " )
		end)
	end
	
    return false
end
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/