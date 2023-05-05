AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_wzs/fatty.mdl"}
ENT.StartHealth = 330
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.AnimTbl_IdleStand = {ACT_IDLE_AGITATED} -- The idle animation when AI is enabled
ENT.AnimTbl_Walk = {ACT_WALK_AGITATED} -- Set the walking animations | Put multiple to let the base pick a random animation when it moves
ENT.AnimTbl_Run = {ACT_WALK_AGITATED} -- Set the running animations | Put multiple to let the base pick a random animation when it moves

ENT.MeleeAttackDamage = 25

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.PainSoundPitch = VJ_Set(80, 80)
ENT.AlertSoundPitch = VJ_Set(80, 80)
ENT.RangeAttackPitch = VJ_Set(110, 110)

-- ====== Sound File Paths ====== --
ENT.SoundTbl_BeforeMeleeAttack = {"npc/ichthyosaur/attack_growl1.wav","npc/ichthyosaur/attack_growl2.wav","npc/ichthyosaur/attack_growl3.wav"}
ENT.SoundTbl_BeforeRangeAttack = {"npc/ichthyosaur/attack_growl1.wav","npc/ichthyosaur/attack_growl2.wav","npc/ichthyosaur/attack_growl3.wav"}
ENT.SoundTbl_RangeAttack = {"physics/body/body_medium_break2.wav","physics/body/body_medium_break3.wav","physics/body/body_medium_break4.wav"}
ENT.SoundTbl_Alert = {"npc/barnacle/barnacle_tongue_pull1.wav","npc/barnacle/barnacle_tongue_pull2.wav","npc/barnacle/barnacle_tongue_pull3.wav"}
ENT.SoundTbl_Pain = {"npc/barnacle/barnacle_pull1.wav","npc/barnacle/barnacle_pull2.wav","npc/barnacle/barnacle_pull3.wav","npc/barnacle/barnacle_pull4.wav","npc/barnacle/barnacle_pull1.wav","npc/barnacle/barnacle_pull2.wav","npc/barnacle/barnacle_pull3.wav","npc/barnacle/barnacle_pull4.wav"}
ENT.SoundTbl_Death = {"npc/ichthyosaur/water_growl5.wav","npc/ichthyosaur/water_growl5.wav","npc/ichthyosaur/water_growl5.wav"}

/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/