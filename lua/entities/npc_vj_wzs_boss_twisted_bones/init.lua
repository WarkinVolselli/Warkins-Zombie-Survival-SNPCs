AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_wzs/poisonzombie.mdl"}
ENT.StartHealth = 2500

---------------------------------------------------------------------------------------------------------------------------------------------
ENT.AnimTbl_Walk = {ACT_WALK} -- Set the walking animations | Put multiple to let the base pick a random animation when it moves
ENT.AnimTbl_Run = {ACT_WALK} -- Set the running animations | Put multiple to let the base pick a random animation when it moves

ENT.BloodColor = "Red"

ENT.MeleeAttackDamageType = DMG_SLASH
ENT.MeleeAttackDamage = 40

ENT.HasRangeAttack = false

ENT.GeneralSoundPitch1 = 70
ENT.GeneralSoundPitch2 = 70
ENT.RangeAttackPitch = VJ_Set(100, 100)
ENT.BreathSoundPitch = VJ_Set(60, 60)
ENT.BreathSoundLevel = 65

-- ====== Sound File Paths ====== --
ENT.SoundTbl_Breath = {"npc/antlion_guard/growl_high.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"npc/strider/striderx_alert2.wav","npc/strider/striderx_alert4.wav","npc/strider/striderx_alert5.wav","npc/strider/striderx_alert6.wav"}
ENT.SoundTbl_Alert = {"npc/strider/striderx_pain2.wav","npc/strider/striderx_pain5.wav","npc/strider/striderx_pain7.wav","npc/strider/striderx_pain8.wav"}
ENT.SoundTbl_Pain = {"npc/combine_gunship/gunship_pain.wav","npc/combine_gunship/gunship_pain.wav","npc/combine_gunship/gunship_pain.wav","npc/combine_gunship/gunship_pain.wav","npc/combine_gunship/gunship_pain.wav","npc/combine_gunship/gunship_pain.wav"}
ENT.SoundTbl_Death = {"npc/antlion_guard/antlion_guard_die1.wav","npc/antlion_guard/antlion_guard_die2.wav","npc/antlion_guard/antlion_guard_die1.wav","npc/antlion_guard/antlion_guard_die2.wav"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
self:SetMaterial("nodraw")	
self:SetModelScale(1.3)
self.NextRoarT = CurTime() + math.random(6,24)

self.TheModel = ents.Create("prop_dynamic")
self.TheModel:SetModel("models/stalker.mdl")
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
self.TheModel2 = ents.Create("prop_dynamic")
self.TheModel2:SetModel("models/vj_wzs/skeleton.mdl")
self.TheModel2:SetLocalPos(self:GetPos())
self.TheModel2:SetOwner(self)
self.TheModel2:SetParent(self)
self.TheModel2:SetColor(Color(255, 255, 255, 255))	
self.TheModel2:SetMaterial("models/charple/charple3_sheet")
self.TheModel2:Fire("SetParentAttachmentMaintainOffset","chest")
self.TheModel2:Fire("SetParentAttachment","chest")
self.TheModel2:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
self.TheModel2:AddEffects(EF_BONEMERGE)
self.TheModel2:Spawn()
self.TheModel2:Activate()
self.TheModel2:SetSolid(SOLID_NONE)
			
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo, hitgroup, corpseEnt)
	if IsValid(corpseEnt) then
		corpseEnt.TheModel = ents.Create("prop_dynamic")
		corpseEnt.TheModel:SetModel("models/stalker.mdl")
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
		corpseEnt.TheModel2 = ents.Create("prop_dynamic")
		corpseEnt.TheModel2:SetModel("models/vj_wzs/skeleton.mdl")
		corpseEnt.TheModel2:SetLocalPos(corpseEnt:GetPos())
		corpseEnt.TheModel2:SetOwner(corpseEnt)
		corpseEnt.TheModel2:SetParent(corpseEnt)
		corpseEnt.TheModel2:SetColor(Color(255, 255, 255, 255))	
		corpseEnt.TheModel2:SetMaterial("models/charple/charple3_sheet")
		corpseEnt.TheModel2:Fire("SetParentAttachmentMaintainOffset","chest")
		corpseEnt.TheModel2:Fire("SetParentAttachment","chest")
		corpseEnt.TheModel2:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		corpseEnt.TheModel2:AddEffects(EF_BONEMERGE)
		corpseEnt.TheModel2:Spawn()
		corpseEnt.TheModel2:Activate()
		corpseEnt.TheModel2:SetSolid(SOLID_NONE)
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/