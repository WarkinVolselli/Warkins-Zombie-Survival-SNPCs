AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_wzs/zombie_fast.mdl"}
ENT.StartHealth = 180
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.AnimTbl_IdleStand = {ACT_IDLE_AGITATED} -- The idle animation when AI is enabled
ENT.AnimTbl_Walk = {ACT_WALK_AGITATED} -- Set the walking animations | Put multiple to let the base pick a random animation when it moves
ENT.AnimTbl_Run = {ACT_RUN} -- Set the running animations | Put multiple to let the base pick a random animation when it moves

ENT.HasLeapAttack = false

ENT.GeneralSoundPitch1 = 90
ENT.GeneralSoundPitch2 = 90

ENT.JumpVars = {
	MaxRise = 300, -- How high it can jump up ((S -> A) AND (S -> E))
	MaxDrop = 400, -- How low it can jump down (E -> S)
	MaxDistance = 512, -- Maximum distance between Start and End
}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
self:SetMaterial("models/vj_wzs/ripper_sheet")
self.NextRoarT = CurTime() + math.random(6,24)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink_AIEnabled()
    if IsValid(self:GetEnemy()) == true && !self.Dead && self:GetEnemy() != nil && !self.MeleeAttacking && self.NextRoarT < CurTime() then
        VJ_EmitSound(self,self.SoundTbl_Alert,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.AlertSoundPitch.a,self.AlertSoundPitch.b))
		self:VJ_ACT_PLAYACTIVITY("vjges_taunt_zombie",true,VJ_GetSequenceDuration(self,tbl),false)
        self.NextRoarT = CurTime() + math.random(6,24)
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/