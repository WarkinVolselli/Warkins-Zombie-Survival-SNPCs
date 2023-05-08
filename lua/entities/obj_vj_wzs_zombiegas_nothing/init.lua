AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
function ENT:CustomOnThink()
	if self.NextGasTime < CurTime() then
		self.NextGasTime = CurTime() + 0.25
		local bloodeffect = EffectData()
		bloodeffect:SetOrigin(self:GetPos() + self:GetUp()*65)
		bloodeffect:SetColor(VJ_Color2Byte(Color(0,255,63,255)))
		bloodeffect:SetScale(200)
		util.Effect("VJ_Blood1",bloodeffect)
	end

		for _,v in ipairs(ents.FindInSphere(self:GetPos(),125)) do
			if v:IsNPC() && !v.Dead && !self.Dead && v:Disposition(self) == D_HT then
				if /*v:Health() <= 1 &&*/ CurTime() > self.GasDamageTime then
					-- v:SetHealth(v:Health() +math.random(30,35))
					v:TakeDamage(10,self,self)
				end
			end
		end
end
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/