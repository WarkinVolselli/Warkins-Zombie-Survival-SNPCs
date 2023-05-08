AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
function ENT:SpawnDudeButActuallySpawnThem()

	local randombitch = math.random(1,2)
	if randombitch == 1 then
		local randbloatzomb = math.random(1,3)
		if randbloatzomb == 1 then
			self.OurBitch = "npc_vj_wzs_vile_bloated_zombie"
		else
			self.OurBitch = "npc_vj_wzs_bloated_zombie"
		end
	else
		local randpoizomb = math.random(1,8)
		if randpoizomb == 8 then
			self.OurBitch = "npc_vj_wzs_parasite"
		elseif randpoizomb < 8 && randpoizomb >= 5 then
			self.OurBitch = "npc_vj_wzs_vile_poison_zombie"
		else
			self.OurBitch = "npc_vj_wzs_poison_zombie"
		end
	end

		
	local tr = util.TraceLine({
		start = self:GetPos(),
		endpos = self:GetPos() + self:GetForward() * 0 + self:GetRight() * 0 + self:GetUp() * 0,
		filter = {self},
		mask = MASK_ALL,
	})
	local spawnpos = tr.HitPos + tr.HitNormal*-150
	local ally = ents.Create(self.OurBitch)
	ally:SetPos(spawnpos)
	ally:SetAngles(self:GetAngles())
	ally:Spawn()
	ally:Activate()
	self.SpawnCoolDownT = CurTime() + 3
	return ally

end
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/