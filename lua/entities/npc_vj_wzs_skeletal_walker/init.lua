AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_wzs/skeleton.mdl"}
ENT.StartHealth = 120
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.Bleeds = false

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.FootStepSoundLevel = 65

-- ====== Sound File Paths ====== --
ENT.SoundTbl_BeforeMeleeAttack = {"npc/barnacle/barnacle_bark1.wav","npc/barnacle/barnacle_bark1.wav"}
ENT.SoundTbl_Alert = {"npc/barnacle/barnacle_tongue_pull1.wav","npc/barnacle/barnacle_tongue_pull1.wav","npc/barnacle/barnacle_tongue_pull2.wav"}
ENT.SoundTbl_Pain = {"npc/barnacle/barnacle_pull1.wav","npc/barnacle/barnacle_pull2.wav","npc/barnacle/barnacle_pull3.wav","npc/barnacle/barnacle_pull4.wav","npc/barnacle/barnacle_pull1.wav","npc/barnacle/barnacle_pull2.wav","npc/barnacle/barnacle_pull3.wav","npc/barnacle/barnacle_pull4.wav"}
ENT.SoundTbl_Death = {"npc/barnacle/barnacle_crunch2.wav","npc/barnacle/barnacle_crunch3.wav","npc/barnacle/barnacle_crunch2.wav","npc/barnacle/barnacle_crunch3.wav"}
ENT.SoundTbl_FootStep = {"npc/barnacle/neck_snap1.wav","npc/barnacle/neck_snap2.wav","npc/barnacle/neck_snap1.wav","npc/barnacle/neck_snap2.wav"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
self.NextRoarT = CurTime() + math.random(6,24)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if (dmginfo:IsBulletDamage()) then
		dmginfo:ScaleDamage(0.5)
		local attacker = dmginfo:GetAttacker()
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/