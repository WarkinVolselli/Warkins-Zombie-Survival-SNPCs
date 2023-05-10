AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_wzs/zombie.mdl"}
ENT.StartHealth = 370

---------------------------------------------------------------------------------------------------------------------------------------------
ENT.MeleeAttackDamage = 24
ENT.RangeAttackExtraTimers = {0.7,0.7,0.7}

ENT.GeneralSoundPitch1 = 90
ENT.GeneralSoundPitch2 = 90
ENT.RangeAttackPitch = VJ_Set(110, 110)
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
self:SetMaterial("nodraw")	

self.TheModel = ents.Create("prop_dynamic")
self.TheModel:SetModel("models/vj_wzs/poisonzombie.mdl")
self.TheModel:SetLocalPos(self:GetPos())
self.TheModel:SetOwner(self)
self.TheModel:SetParent(self)
self.TheModel:SetColor(Color(30, 50, 0, 255))	
self.TheModel:SetMaterial("models/flesh")
self.TheModel:Fire("SetParentAttachmentMaintainOffset","chest")
self.TheModel:Fire("SetParentAttachment","chest")
self.TheModel:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
self.TheModel:AddEffects(EF_BONEMERGE)
self.TheModel:Spawn()
self.TheModel:Activate()
self.TheModel:SetSolid(SOLID_NONE)

self.NextRoarT = CurTime() + math.random(6,24)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo, hitgroup, corpseEnt)
	if IsValid(corpseEnt) then
		corpseEnt.TheModel = ents.Create("prop_dynamic")
		corpseEnt.TheModel:SetModel("models/vj_wzs/poisonzombie.mdl")
		corpseEnt.TheModel:SetLocalPos(corpseEnt:GetPos())
		corpseEnt.TheModel:SetOwner(corpseEnt)
		corpseEnt.TheModel:SetParent(corpseEnt)
		corpseEnt.TheModel:SetColor(Color(30, 50, 0, 255))	
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
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/