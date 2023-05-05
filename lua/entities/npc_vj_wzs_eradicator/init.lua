AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_wzs/poison_player.mdl"}
ENT.StartHealth = 400

---------------------------------------------------------------------------------------------------------------------------------------------
ENT.AnimTbl_IdleStand = {ACT_IDLE_AGITATED} -- The idle animation when AI is enabled
ENT.AnimTbl_Walk = {ACT_WALK_AGITATED} -- Set the walking animations | Put multiple to let the base pick a random animation when it moves
ENT.AnimTbl_Run = {ACT_WALK_AGITATED} -- Set the running animations | Put multiple to let the base pick a random animation when it moves

ENT.MeleeAttackDamage = 35
ENT.GeneralSoundPitch1 = 80
ENT.GeneralSoundPitch2 = 80
ENT.AlertSoundPitch = VJ_Set(100, 100)
ENT.PainSoundPitch = VJ_Set(60, 60)
ENT.DeathSoundPitch = VJ_Set(60, 60)

-- ====== Sound File Paths ====== --
ENT.SoundTbl_BeforeMeleeAttack = {"npc/antlion_guard/angry1.wav","npc/antlion_guard/angry2.wav","npc/antlion_guard/angry3.wav"}
ENT.SoundTbl_Alert = {"npc/combine_gunship/gunship_moan.wav","npc/combine_gunship/gunship_moan.wav","npc/combine_gunship/gunship_moan.wav"}
ENT.SoundTbl_Pain = {"npc/zombie/zombie_pain1.wav","npc/zombie/zombie_pain2.wav","npc/zombie/zombie_pain3.wav","npc/zombie/zombie_pain4.wav","npc/zombie/zombie_pain5.wav","npc/zombie/zombie_pain6.wav"}
ENT.SoundTbl_Death = {"npc/zombie_poison/pz_pain1.wav","npc/zombie_poison/pz_pain2.wav","npc/zombie_poison/pz_pain3.wav"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
self:SetMaterial("models/vj_wzs/eradicator_sheet")
self:SetPlayerColor(Color(math.Rand(0,255),math.Rand(0,255),math.Rand(0,255)):ToVector())
self.NextRoarT = CurTime() + math.random(6,24)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink()

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