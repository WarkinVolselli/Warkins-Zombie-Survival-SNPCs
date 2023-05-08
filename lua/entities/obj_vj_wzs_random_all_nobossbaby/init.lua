AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
function ENT:SpawnDudeButActuallySpawnThem()

	local randomclass = math.random(1,4)

	-- Destruction-Class
	if randomclass == 1 then
		local randombitch = math.random(1,6)
		if randombitch == 6 then
			local randbloatzomb = math.random(1,3)
			if randbloatzomb == 1 then
				self.OurBitch = "npc_vj_wzs_void_walker"
			else
				self.OurBitch = "npc_vj_wzs_shadow_walker"
			end
		elseif randombitch == 5 then
			local randbloatzomb = math.random(1,3)
			if randbloatzomb == 1 then
				self.OurBitch = "npc_vj_wzs_chem_burster"
			else
				self.OurBitch = "npc_vj_wzs_blood_burster"
			end
		elseif randombitch == 4 or randombitch == 3 then
			local randpoizomb = math.random(1,8)
			if randpoizomb == 8 then
				self.OurBitch = "npc_vj_wzs_bloody_bones"
			elseif randpoizomb < 8 && randpoizomb >= 5 then
				self.OurBitch = "npc_vj_wzs_skeletal_shambler"
			else
				self.OurBitch = "npc_vj_wzs_skeletal_walker"
			end
		else
			local randpoizomb = math.random(1,8)
			if randpoizomb == 8 then
				self.OurBitch = "npc_vj_wzs_eradicator"
			elseif randpoizomb < 8 && randpoizomb >= 5 then
				self.OurBitch = "npc_vj_wzs_charred_zombie"
			else
				self.OurBitch = "npc_vj_wzs_zombie"
			end
		end

	-- Tank-Class
	elseif randomclass == 2 then
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

	-- Support-Class
	elseif randomclass == 3 then
		local randombitch = math.random(1,3)
		if randombitch == 1 then
			self.OurBitch = "npc_vj_wzs_alpha_ghoul"
		else
			self.OurBitch = "npc_vj_wzs_ghoul"
		end

	-- Assault-Class
	else
		local randombitch = math.random(1,2)
		if randombitch == 1 then
			self.OurBitch = "npc_vj_wzs_fast_zombie"
		else
			self.OurBitch = "npc_vj_wzs_ripper"	
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