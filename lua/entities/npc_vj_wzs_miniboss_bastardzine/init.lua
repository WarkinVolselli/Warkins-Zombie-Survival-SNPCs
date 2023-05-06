AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_wzs/zombie.mdl"}
ENT.StartHealth = 1000
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.AnimTbl_MeleeAttack = {"vjges_zombie_attack_frenzy","vjges_zombie_attack_frenzy","vjges_zombie_attack_frenzy","vjges_zombie_attack_frenzy","vjges_zombie_attack_frenzy","vjges_zombie_attack_frenzy"}

ENT.HasLeapAttack = true
ENT.AnimTbl_LeapAttack = {"vjseq_leapstrike"}
ENT.LeapDistance = 800
ENT.NextLeapAttackTime = 7
ENT.LeapAttackVelocityForward = 1000
ENT.LeapAttackVelocityUp = 300

ENT.GeneralSoundPitch1 = 110
ENT.GeneralSoundPitch2 = 110
ENT.LeapAttackJumpSoundPitch = VJ_Set(90, 90)

ENT.JumpVars = {
	MaxRise = 650, -- How high it can jump up ((S -> A) AND (S -> E))
	MaxDrop = 850, -- How low it can jump down (E -> S)
	MaxDistance = 1200, -- Maximum distance between Start and End
}

-- ====== Sound File Paths ====== --
ENT.SoundTbl_BeforeMeleeAttack = {"npc/zombie_poison/pz_warn1.wav","npc/zombie_poison/pz_warn2.wav"}
ENT.SoundTbl_Alert = {"npc/zombie_poison/pz_call1.wav","npc/zombie_poison/pz_call1.wav","npc/zombie_poison/pz_call1.wav"}
ENT.SoundTbl_Pain = {"npc/zombie/zombie_pain1.wav","npc/zombie/zombie_pain2.wav","npc/zombie/zombie_pain3.wav","npc/zombie/zombie_pain4.wav","npc/zombie/zombie_pain5.wav","npc/zombie/zombie_pain6.wav"}
ENT.SoundTbl_Death = {"npc/zombie/zombie_die1.wav","npc/zombie/zombie_die2.wav","npc/zombie/zombie_die3.wav"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
self.NextRoarT = CurTime() + math.random(6,24)
self:SetModelScale(1.2)
self:SetColor(Color(191, 255, 127, 255))	
self:SetBodygroup(1,1)
	for k, v in ipairs(self:GetMaterials()) do 
		if v == "models/vj_wzs/zombie/zombie_players_sheet" then
			self.DeathCorpseSubMaterials = {k - 1}
			self:SetSubMaterial(k - 1, "models/zombie_fast_players/fast_zombie_sheet")
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink_AIEnabled()
    if IsValid(self:GetEnemy()) == true && !self.Dead && self:GetEnemy() != nil && !self.MeleeAttacking && self.NextRoarT < CurTime() then
        VJ_EmitSound(self,self.SoundTbl_Alert,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.AlertSoundPitch.a,self.AlertSoundPitch.b))
        self.NextRoarT = CurTime() + math.random(6,24)
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/