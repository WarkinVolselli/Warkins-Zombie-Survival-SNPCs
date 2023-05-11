AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_wzs/stalkerbeta.mdl"}
ENT.StartHealth = 70
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.AnimTbl_Run = {ACT_RUN}

ENT.Bleeds = false
ENT.HasDeathRagdoll = false

ENT.MeleeAttackDamage = 18
ENT.AnimTbl_MeleeAttack = {"vjges_attack1","vjges_attack2","vjges_attack3","vjges_attack1","vjges_attack2","vjges_attack3"}

-- ====== Sound File Paths ====== --
ENT.SoundTbl_BeforeMeleeAttack = {"npc/antlion/distract1.wav","npc/antlion/distract1.wav"}
ENT.SoundTbl_MeleeAttack = {"ambient/machines/slicer1.wav","ambient/machines/slicer2.wav","ambient/machines/slicer3.wav","ambient/machines/slicer4.wav"}
ENT.SoundTbl_Death = {"vj_wzs/wraithdeath1.ogg","vj_wzs/wraithdeath2.ogg","vj_wzs/wraithdeath3.ogg","vj_wzs/wraithdeath4.ogg"}
ENT.SoundTbl_FootStep = {"npc/stalker/stalker_footstep_left1.wav","npc/stalker/stalker_footstep_left2.wav","npc/stalker/stalker_footstep_right1.wav","npc/stalker/stalker_footstep_right2.wav"}

ENT.FootStepSoundLevel = 55

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
self:SetRenderMode( RENDERMODE_TRANSCOLOR )
self:SetColor(Color(50, 50, 50, 10))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink_AIEnabled()
 
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_AfterStartTimer(seed)
self:SetColor(Color(50, 50, 50, 155))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_AfterChecks(hitEnt, isProp)
	timer.Simple(0.2,function() if IsValid(self) then
		self:SetColor(Color(50, 50, 50, 10))
		end
	end)
return false 
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_Miss()
	timer.Simple(0.2,function() if IsValid(self) then
		self:SetColor(Color(50, 50, 50, 10))
		end
	end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_BeforeCorpseSpawned(dmginfo, hitgroup)
        local bloodeffect = EffectData()
		bloodeffect:SetOrigin(self:GetPos()+ self:GetUp()*50)
		bloodeffect:SetColor(VJ_Color2Byte(Color(0,0,0,255)))
		bloodeffect:SetScale(100)
		util.Effect("VJ_Blood1",bloodeffect)
end
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/