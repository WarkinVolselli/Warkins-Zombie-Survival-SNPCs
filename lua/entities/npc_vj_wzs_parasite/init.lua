AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_wzs/poisonzombie.mdl"}
ENT.StartHealth = 800

---------------------------------------------------------------------------------------------------------------------------------------------
ENT.AnimTbl_IdleStand = {ACT_IDLE_STIMULATED} -- The idle animation when AI is enabled
ENT.AnimTbl_Walk = {ACT_WALK_STIMULATED} -- Set the walking animations | Put multiple to let the base pick a random animation when it moves
ENT.AnimTbl_Run = {ACT_WALK_STIMULATED} -- Set the running animations | Put multiple to let the base pick a random animation when it moves

ENT.BloodColor = "Red"

ENT.MeleeAttackDamageType = DMG_PARALYZE
ENT.MeleeAttackDamage = 30
ENT.MeleeAttackBleedEnemy = true
ENT.MeleeAttackBleedEnemyChance = 1
ENT.MeleeAttackBleedEnemyDamage = math.random(1,2)
ENT.MeleeAttackBleedEnemyTime = 1
ENT.MeleeAttackBleedEnemyReps = math.random(3,6)

ENT.RangeAttackEntityToSpawn = "obj_vj_wzs_flesh"
ENT.RangeDistance = 600
ENT.RangeToMeleeDistance = 100
ENT.NextRangeAttackTime = 7

ENT.GeneralSoundPitch1 = 80
ENT.GeneralSoundPitch2 = 80
ENT.RangeAttackPitch = VJ_Set(100, 100)
ENT.BreathSoundLevel = 60

-- ====== Sound File Paths ====== --
ENT.SoundTbl_Breath = {"npc/barnacle/barnacle_digesting1.wav","npc/barnacle/barnacle_digesting2.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"npc/antlion_guard/angry1.wav","npc/antlion_guard/angry2.wav","npc/antlion_guard/angry3.wav"}
ENT.SoundTbl_BeforeRangeAttack = {"npc/antlion_guard/angry1.wav","npc/antlion_guard/angry2.wav","npc/antlion_guard/angry3.wav"}
ENT.SoundTbl_Alert = {"npc/combine_gunship/gunship_moan.wav","npc/combine_gunship/gunship_moan.wav","npc/combine_gunship/gunship_moan.wav","npc/combine_gunship/gunship_moan.wav"}
ENT.SoundTbl_Pain = {"npc/zombie_poison/pz_pain1.wav","npc/zombie_poison/pz_pain2.wav","npc/zombie_poison/pz_pain3.wav","npc/zombie_poison/pz_pain1.wav","npc/zombie_poison/pz_pain2.wav","npc/zombie_poison/pz_pain3.wav"}
ENT.SoundTbl_Death = {"npc/zombie_poison/pz_die1.wav","npc/zombie_poison/pz_die2.wav","npc/zombie_poison/pz_die1.wav","npc/zombie_poison/pz_die2.wav"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
self:SetMaterial("nodraw")	
self:SetModelScale(1.1)
self.NextRoarT = CurTime() + math.random(6,24)

self.TheModel = ents.Create("prop_dynamic")
self.TheModel:SetModel("models/vj_wzs/zombie.mdl")
self.TheModel:SetLocalPos(self:GetPos())
self.TheModel:SetOwner(self)
self.TheModel:SetParent(self)
self.TheModel:SetColor(Color(100, 0, 0, 255))	
self.TheModel:SetMaterial("models/flesh")
self.TheModel:Fire("SetParentAttachmentMaintainOffset","chest")
self.TheModel:Fire("SetParentAttachment","chest")
self.TheModel:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
self.TheModel:AddEffects(EF_BONEMERGE)
self.TheModel:Spawn()
self.TheModel:Activate()
self.TheModel:SetSolid(SOLID_NONE)
			
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo, hitgroup, corpseEnt)
	if IsValid(corpseEnt) then
		corpseEnt.TheModel = ents.Create("prop_dynamic")
		corpseEnt.TheModel:SetModel("models/vj_wzs/zombie.mdl")
		corpseEnt.TheModel:SetLocalPos(corpseEnt:GetPos())
		corpseEnt.TheModel:SetOwner(corpseEnt)
		corpseEnt.TheModel:SetParent(corpseEnt)
		corpseEnt.TheModel:SetColor(Color(100, 0, 0, 255))	
		corpseEnt.TheModel:SetMaterial("models/flesh")
		corpseEnt.TheModel:Fire("SetParentAttachmentMaintainOffset","chest")
		corpseEnt.TheModel:Fire("SetParentAttachment","chest")
		corpseEnt.TheModel:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		corpseEnt.TheModel:AddEffects(EF_BONEMERGE)
		corpseEnt.TheModel:Spawn()
		corpseEnt.TheModel:Activate()
		corpseEnt.TheModel:SetSolid(SOLID_NONE)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(TheProjectile)
	return self:CalculateProjectile("Curve", self:GetAttachment(self:LookupAttachment(self.RangeUseAttachmentForPosID)).Pos, self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter(), 700) + self:GetUp()*math.Rand(-50,50) + self:GetRight()*math.Rand(-50,50)
end
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/