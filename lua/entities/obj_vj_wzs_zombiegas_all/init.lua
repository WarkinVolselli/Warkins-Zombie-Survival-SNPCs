AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_wzs/skeleton.mdl"}
ENT.StartHealth = 9999
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}
ENT.CanTurnWhileStationary = false
ENT.FindEnemy_UseSphere = true
ENT.FindEnemy_CanSeeThroughWalls = true
ENT.VJ_IsDetectableDanger = true
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = false
ENT.MeleeAttackDamage = 0
ENT.HasSounds = false
ENT.NextGasTime = 0
ENT.SpawnCoolDownT = 0
ENT.GasDamageTime = 0
ENT.CanGas = true
ENT.IsRandom = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
	if
		self:GetClass() == "obj_vj_wzs_spawner_all" or
		self:GetClass() == "obj_vj_wzs_spawner_all_nobossbaby" or
		self:GetClass() == "obj_vj_wzs_spawner_assault" or
		self:GetClass() == "obj_vj_wzs_spawner_boss" or
		self:GetClass() == "obj_vj_wzs_spawner_destruction" or
		self:GetClass() == "obj_vj_wzs_spawner_miniboss" or
		self:GetClass() == "obj_vj_wzs_spawner_support" or
		self:GetClass() == "obj_vj_wzs_spawner_tank" or
		self:GetClass() == "obj_vj_wzs_random_all" or
		self:GetClass() == "obj_vj_wzs_random_all_nobossbaby" or
		self:GetClass() == "obj_vj_wzs_random_assault" or
		self:GetClass() == "obj_vj_wzs_random_boss" or
		self:GetClass() == "obj_vj_wzs_random_destruction" or
		self:GetClass() == "obj_vj_wzs_random_miniboss" or
		self:GetClass() == "obj_vj_wzs_random_support" or
		self:GetClass() == "obj_vj_wzs_random_tank"
	then
		self.CanGas = false
	end
	if
		self:GetClass() == "obj_vj_wzs_random_all" or
		self:GetClass() == "obj_vj_wzs_random_all_nobossbaby" or
		self:GetClass() == "obj_vj_wzs_random_assault" or
		self:GetClass() == "obj_vj_wzs_random_boss" or
		self:GetClass() == "obj_vj_wzs_random_destruction" or
		self:GetClass() == "obj_vj_wzs_random_miniboss" or
		self:GetClass() == "obj_vj_wzs_random_support" or
		self:GetClass() == "obj_vj_wzs_random_tank"
	then
		self.IsRandom = true
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()

	self.MovementType = VJ_MOVETYPE_STATIONARY
	self:SetSolid(SOLID_NONE)
	self:AddFlags(FL_NOTARGET)
	self:SetRenderMode( RENDERMODE_TRANSCOLOR )
	self:SetColor(Color(0,0,0,0))
	self.GodMode = true
	self.CallForHelp = false
	
	if self.IsRandom && IsValid(self) then
		timer.Simple(0.5,function()
			if IsValid(self) then
				self:Remove()
			end
		end)
	end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()

	if self.NextGasTime < CurTime() && self.CanGas then
		self.NextGasTime = CurTime() + 0.8
		local bloodeffect = EffectData()
		bloodeffect:SetOrigin(self:GetPos() + self:GetUp()*65)
		bloodeffect:SetColor(VJ_Color2Byte(Color(0,255,63,255)))
		bloodeffect:SetScale(200)
		util.Effect("VJ_Blood1",bloodeffect)
	end

	if self.SpawnCoolDownT < CurTime() then
		self:SpawnDude()
	end

	if self.CanGas then
		for _,v in ipairs(ents.FindInSphere(self:GetPos(),125)) do
			if v:IsNPC() && !v.Dead && !self.Dead && v:Disposition(self) == D_HT then
				if /*v:Health() <= 1 &&*/ CurTime() > self.GasDamageTime then
					-- v:SetHealth(v:Health() +math.random(30,35))
					v:TakeDamage(10,self,self)
				end
			end
		end
	end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SpawnDude()
	if !IsValid(self.Bitch) then
		self.Bitch = self:SpawnDudeButActuallySpawnThem()
		return 15
	end
	return 8
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SpawnDudeButActuallySpawnThem()

	local randomclass = math.random(1,101)

	-- Destruction-Class
	if randomclass >= 1 && randomclass <= 23 then
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
	elseif randomclass >= 24 && randomclass <= 46 then
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
	elseif randomclass >= 47 && randomclass <= 69 then
		local randombitch = math.random(1,3)
		if randombitch == 1 then
			self.OurBitch = "npc_vj_wzs_alpha_ghoul"
		else
			self.OurBitch = "npc_vj_wzs_ghoul"
		end

	-- Assault-Class
	elseif randomclass >= 70 && randomclass <= 92 then
		local randombitch = math.random(1,2)
		if randombitch == 1 then
			self.OurBitch = "npc_vj_wzs_fast_zombie"
		else
			self.OurBitch = "npc_vj_wzs_ripper"	
		end

	-- Mini-Bosses
	elseif randomclass >= 93 && randomclass <= 99 then
		local randombitch = math.random(1,2)
		if randombitch == 1 then
			self.OurBitch = "npc_vj_wzs_miniboss_nightmare"
		else
			self.OurBitch = "npc_vj_wzs_miniboss_bastardzine"
		end

	-- Bosses
	else
		local randombitch = math.random(1,2)
		if randombitch == 1 then
			self.OurBitch = "npc_vj_wzs_boss_ancient_nightmare"
		else
			self.OurBitch = "npc_vj_wzs_boss_twisted_bones"
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