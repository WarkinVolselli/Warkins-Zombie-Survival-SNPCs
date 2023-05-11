AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_wzs/stalkerbeta.mdl"}
ENT.StartHealth = 100
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.AnimTbl_Run = {ACT_WALK}

ENT.Bleeds = true
ENT.HasDeathRagdoll = true
ENT.MeleeAttackDamage = 24

ENT.GeneralSoundPitch1 = 120
ENT.GeneralSoundPitch2 = 120
ENT.BeforeMeleeAttackSoundPitch = VJ_Set(110, 110)
ENT.AlertSoundPitch = VJ_Set(100, 100)
ENT.DeathSoundPitch = VJ_Set(90, 90)

ENT.NoChaseAfterCertainRange = true
ENT.NoChaseAfterCertainRange_FarDistance = 1200
ENT.NoChaseAfterCertainRange_CloseDistance = 250
ENT.NoChaseAfterCertainRange_Type = "OnlyRange"

-- ====== Sound File Paths ====== --
ENT.SoundTbl_BeforeMeleeAttack = {"npc/stalker/go_alert2.wav","npc/stalker/go_alert2.wav"}
ENT.SoundTbl_Alert = {"npc/stalker/go_alert2.wav","npc/stalker/go_alert2.wav","npc/stalker/go_alert2.wav","npc/stalker/go_alert2.wav"}
ENT.SoundTbl_Pain = {"npc/zombie/zombie_pain1.wav","npc/zombie/zombie_pain2.wav","npc/zombie/zombie_pain3.wav","npc/zombie/zombie_pain4.wav","npc/zombie/zombie_pain5.wav","npc/zombie/zombie_pain6.wav"}
ENT.SoundTbl_Death = {"npc/stalker/go_alert2.wav","npc/stalker/go_alert2.wav","npc/stalker/go_alert2.wav","npc/stalker/go_alert2.wav"}
ENT.FootStepSoundLevel = 70

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
self.Laser = CreateSound(self,"npc/stalker/laser_burn.wav")
self.Laser:SetSoundLevel(75)
self.NextLAnimT = 0
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
	self.Laser:Stop()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FireLaser()
	if IsValid(self:GetEnemy()) then
		local startpos =  self:GetAttachment(1).Pos
		local tr = util.TraceLine({
			start = self:GetAttachment(1).Pos,
			endpos = self:GetEnemy():GetPos() +self:GetEnemy():OBBCenter() +VectorRand() *4,
			filter = self
		})
		local hitpos = tr.HitPos

		if tr.Hit then
			local elec = EffectData()
			elec:SetStart(startpos)
			elec:SetOrigin(hitpos)
			elec:SetEntity(self)
			elec:SetAttachment(1)
			util.Effect("vj_wzs_stalkerlaser",elec)

			util.VJ_SphereDamage(self,self,hitpos,30,2,DMG_BURN,true,false,{Force=1})
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:LaserReset()
	self.IsLaserAttacking = false
	self.Laser:Stop()
	self:StopAttacks(true)
	self.NextChaseTime = CurTime()
	self.NextIdleTime = CurTime()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink_AIEnabled()
	self.DisableChasingEnemy = self.IsLaserAttacking
	if self.IsLaserAttacking then
		if CurTime() > self.NextLAnimT then
			self:VJ_ACT_PLAYACTIVITY({"vjges_rangeattack"}, true, false, true)
			self.NextLAnimT = CurTime() +self:SequenceDuration(self:LookupSequence("rangeattack")) -1.25
		end
		local moveCheck = VJ_PICK(self:VJ_CheckAllFourSides(math.random(150,400),true,"0111"))
		if moveCheck && math.random(1,50) == 1 then
			self:StopMoving()
			self:SetLastPosition(moveCheck)
			self:VJ_TASK_GOTO_LASTPOS(VJ_PICK({"TASK_RUN_PATH", "TASK_WALK_PATH"}), function(x) x:EngTask("TASK_FACE_ENEMY", 0) x.ConstantlyFaceEnemy = true end)
		end
		self:FaceCertainEntity(self:GetEnemy(),true)
		self:FireLaser()
		if !self.Laser:IsPlaying() then
			self.Laser:Play()
		end
	else
		self.NextLAnimT = 0
	end
	if !self.VJ_IsBeingControlled then
		local ent = self:GetEnemy()
		if IsValid(ent) then
			if self:Visible(ent) && ent:GetPos():Distance(self:GetPos()) > self.NoChaseAfterCertainRange_CloseDistance && ent:GetPos():Distance(self:GetPos()) < self.NoChaseAfterCertainRange_FarDistance  then
				if !self.IsLaserAttacking then
					self.IsLaserAttacking = true
					VJ_EmitSound(self,"npc/stalker/go_alert2.wav",70,100)
				end
			else
				if self.IsLaserAttacking then
					self:LaserReset()
				end
			end
		end
	else
		if self.VJ_TheController:KeyDown(IN_ATTACK2) then
			if !self.IsLaserAttacking then
				self.IsLaserAttacking = true
				VJ_EmitSound(self,"npc/stalker/go_alert2.wav",70,100)
			end
		else
			if self.IsLaserAttacking then
				self:LaserReset()
			end
		end
	end
	if !IsValid(self:GetEnemy()) || IsValid(self:GetEnemy()) && self:GetEnemy():Health() <= 0 then
		if self.IsLaserAttacking then
			self:LaserReset()
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_AfterStartTimer(seed)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_AfterChecks(hitEnt, isProp)
return false 
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_Miss()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_BeforeCorpseSpawned(dmginfo, hitgroup)
end
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/