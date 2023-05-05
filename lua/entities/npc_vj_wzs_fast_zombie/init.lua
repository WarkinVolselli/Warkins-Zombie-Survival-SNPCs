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
ENT.AnimTbl_IdleStand = {ACT_IDLE_STIMULATED} -- The idle animation when AI is enabled
ENT.AnimTbl_Walk = {ACT_WALK_STIMULATED} -- Set the walking animations | Put multiple to let the base pick a random animation when it moves
ENT.AnimTbl_Run = {ACT_RUN_STIMULATED} -- Set the running animations | Put multiple to let the base pick a random animation when it moves

ENT.MeleeAttackDamage = 5
ENT.AnimTbl_MeleeAttack = {"vjges_zombie_attack_frenzy","vjges_zombie_attack_frenzy","vjges_zombie_attack_frenzy","vjges_zombie_attack_frenzy","vjges_zombie_attack_frenzy","vjges_zombie_attack_frenzy"}

ENT.HasLeapAttack = true
ENT.AnimTbl_LeapAttack = {"vjseq_leapstrike"}
ENT.LeapDistance = 1000
ENT.LeapToMeleeDistance = 150
ENT.TimeUntilLeapAttackDamage = 0.2
ENT.NextLeapAttackTime = 5
ENT.NextAnyAttackTime_Leap = 0.4
ENT.TimeUntilLeapAttackVelocity = 0.2
ENT.LeapAttackVelocityForward = 600
ENT.LeapAttackVelocityUp = 300
ENT.LeapAttackDamage = 10
ENT.LeapAttackDamageDistance = 100

ENT.JumpVars = {
	MaxRise = 600, -- How high it can jump up ((S -> A) AND (S -> E))
	MaxDrop = 800, -- How low it can jump down (E -> S)
	MaxDistance = 1000, -- Maximum distance between Start and End
}

-- ====== Sound File Paths ====== --
ENT.SoundTbl_BeforeMeleeAttack = {"npc/fast_zombie/fz_frenzy1.wav","npc/fast_zombie/fz_frenzy1.wav"}
ENT.SoundTbl_BeforeLeapAttack = {"npc/fast_zombie/fz_scream1.wav"}
ENT.SoundTbl_LeapAttackJump = {"npc/fast_zombie/leap1.wav"}
ENT.SoundTbl_Alert = {"npc/fast_zombie/fz_alert_far1.wav","npc/fast_zombie/fz_alert_close1.wav","npc/fast_zombie/fz_alert_close1.wav"}
ENT.SoundTbl_Pain = {"npc/barnacle/barnacle_pull1.wav","npc/barnacle/barnacle_pull2.wav","npc/barnacle/barnacle_pull3.wav","npc/barnacle/barnacle_pull4.wav","npc/barnacle/barnacle_pull1.wav","npc/barnacle/barnacle_pull2.wav","npc/barnacle/barnacle_pull3.wav","npc/barnacle/barnacle_pull4.wav"}
ENT.SoundTbl_Death = {"npc/fast_zombie/wake1.wav","npc/fast_zombie/wake1.wav","npc/fast_zombie/wake1.wav"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
self.NextRoarT = CurTime() + math.random(6,24)
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