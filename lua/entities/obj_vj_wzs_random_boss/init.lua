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
		self.OurBitch = "npc_vj_wzs_boss_ancient_nightmare"
	else
		self.OurBitch = "npc_vj_wzs_boss_twisted_bones"
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