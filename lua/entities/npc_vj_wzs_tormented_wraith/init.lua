AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_wzs/stalkerbeta.mdl"}
ENT.StartHealth = 170
---------------------------------------------------------------------------------------------------------------------------------------------

ENT.MeleeAttackDamage = 20

ENT.GeneralSoundPitch1 = 90
ENT.GeneralSoundPitch2 = 90

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
self:SetRenderMode( RENDERMODE_TRANSCOLOR )
self:SetColor(Color(255, 0, 0, 10))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_AfterStartTimer(seed)
self:SetColor(Color(255, 0, 0, 100))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_AfterChecks(hitEnt, isProp)
	timer.Simple(0.2,function() if IsValid(self) then
		self:SetColor(Color(255, 0, 0, 10))
		end
	end)
return false 
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_Miss()
	timer.Simple(0.2,function() if IsValid(self) then
		self:SetColor(Color(255, 0, 0, 10))
		end
	end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_BeforeCorpseSpawned(dmginfo, hitgroup)
        local bloodeffect = EffectData()
		bloodeffect:SetOrigin(self:GetPos()+ self:GetUp()*50)
		bloodeffect:SetColor(VJ_Color2Byte(Color(40,0,0,255)))
		bloodeffect:SetScale(100)
		util.Effect("VJ_Blood1",bloodeffect)
end
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/