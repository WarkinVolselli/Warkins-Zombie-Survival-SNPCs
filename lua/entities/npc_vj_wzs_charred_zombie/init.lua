AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_wzs/zombie.mdl"}
ENT.StartHealth = 220
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.MeleeAttackDamage = 25

ENT.GeneralSoundPitch1 = 90
ENT.GeneralSoundPitch2 = 90

-- ====== Sound File Paths ====== --
ENT.SoundTbl_BeforeMeleeAttack = {"npc/zombie/zo_attack1.wav","npc/zombie/zo_attack2.wav"}
ENT.SoundTbl_Alert = {"npc/zombie/zombie_alert1.wav","npc/zombie/zombie_alert2.wav","npc/zombie/zombie_alert3.wav"}
ENT.SoundTbl_Pain = {"npc/zombie/zombie_pain1.wav","npc/zombie/zombie_pain2.wav","npc/zombie/zombie_pain3.wav","npc/zombie/zombie_pain4.wav","npc/zombie/zombie_pain5.wav","npc/zombie/zombie_pain6.wav"}
ENT.SoundTbl_Death = {"npc/zombie/zombie_die1.wav","npc/zombie/zombie_die2.wav","npc/zombie/zombie_die3.wav"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
self:SetMaterial("models/vj_wzs/charred_zombie_sheet")
self:SetPlayerColor(Color(math.Rand(0,255),math.Rand(0,255),math.Rand(0,255)):ToVector())
self.NextRoarT = CurTime() + math.random(6,24)

for i = 1,2 do	
	local att = i == 2 && "eyeglow1" or "eyeglow2"		
	local EyeGlow = ents.Create("env_sprite")
	EyeGlow:SetKeyValue("model","vj_base/sprites/vj_glow1.vmt")
	EyeGlow:SetKeyValue("scale","0.02")
	EyeGlow:SetKeyValue("rendermode","5")
	EyeGlow:SetKeyValue("rendercolor","155 0 0 255")
	EyeGlow:SetKeyValue("spawnflags","1") 
	EyeGlow:SetParent(self)
	EyeGlow:Fire("SetParentAttachment",att,0)
	EyeGlow:Spawn()
	EyeGlow:Activate()
	self:DeleteOnRemove(EyeGlow)
end
	
end
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/