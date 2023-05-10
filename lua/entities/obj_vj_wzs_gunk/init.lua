AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/spitball_small.mdl"} -- The models it should spawn with | Picks a random one from the table
ENT.DoesDirectDamage = true -- Should it do a direct damage when it hits something?
ENT.DirectDamage = 5 -- How much damage should it do when it hits something
ENT.DirectDamageType = DMG_PARALYZE  -- Damage type
ENT.DecalTbl_DeathDecals = {"VJ_Blood_Oil"}
ENT.SoundTbl_OnCollide = {"physics/flesh/flesh_squishy_impact_hard1.wav","physics/flesh/flesh_squishy_impact_hard2.wav","physics/flesh/flesh_squishy_impact_hard3.wav","physics/flesh/flesh_squishy_impact_hard4.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomPhysicsObjectOnInitialize(phys)
	phys:Wake()
	phys:SetBuoyancyRatio(0)
	phys:EnableDrag(false)
	self:SetNoDraw(true)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDoDamage_Direct(data, phys, hitEnt)
	if hitEnt:IsPlayer() then
		hitEnt:ConCommand( "pp_mat_overlay vj_base/decals/blood/vj_oilblood" .. math.random(5) )
		timer.Create( "hideoverlay", math.random(2,3), 1, function()	
		if !IsValid(hitEnt) then return end
		hitEnt:ConCommand( "pp_mat_overlay  " )
		end)
	end
	
    return false
end
/*-----------------------------------------------
	*** Copyright (c) 2023 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/