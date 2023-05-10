AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_wzs/zombie.mdl"}
ENT.StartHealth = 180

---------------------------------------------------------------------------------------------------------------------------------------------
ENT.MeleeAttackDamage = 24

ENT.RangeUseAttachmentForPosID = "head"
ENT.RangeDistance = 650

ENT.GeneralSoundPitch1 = 105
ENT.GeneralSoundPitch2 = 105
ENT.RangeAttackPitch = VJ_Set(110, 110)
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
self:SetMaterial("models/flesh")
self:SetColor(Color(30, 50, 0, 255))		
self.NextRoarT = CurTime() + math.random(6,24)
end
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/