AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_wzs/poisonzombie.mdl"}
ENT.StartHealth = 550

---------------------------------------------------------------------------------------------------------------------------------------------
ENT.MeleeAttackDamage = 40
ENT.RangeDistance = 600
ENT.GeneralSoundPitch1 = 80
ENT.GeneralSoundPitch2 = 80
ENT.RangeAttackPitch = VJ_Set(110, 110)
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
self:SetMaterial("models/vj_wzs/vile_poison_zombie_sheet")
self:SetColor(Color(105, 185, 93, 255))	
self.NextRoarT = CurTime() + math.random(6,24)
end
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/