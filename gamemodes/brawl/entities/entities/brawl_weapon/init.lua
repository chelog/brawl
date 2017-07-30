AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')

function ENT:Initialize()

	self.WeaponClass = ""
	self.Ammo1 = 0
	self.Ammo2 = 0

	self:SetUseType( SIMPLE_USE )

end

function ENT:SetAttachmentsFrom( wep )

	local data = {}
	data.wepClass = (wep.ThisClass or wep:GetClass())
	data.grenadeType = wep.Grenade40MM
	
	-- get attachments that are installed on the weapon and add them to the table for saving
	-- subtract by one since when the attachment check loop begins, it increments the 'position' value by 1
	for k, v in pairs(wep.Attachments) do
		if v.last and v.last > 0 then
			data[k] = v.last
		end
	end

	self.AttachmentsData = data

end

function ENT:SetWeapon( wep )

	if not IsValid( wep ) then return end

	self:SetNWString( "WeaponClass", wep:GetClass() )
	self:SetNWString( "WeaponCategory", wep:GetNWString( "WeaponCategory" ) )
	self.AmmoType1 = wep:GetPrimaryAmmoType()
	self.AmmoType2 = wep:GetSecondaryAmmoType()
	self.Ammo1 = IsValid(wep.Owner) and wep.Owner:GetAmmoCount( self.AmmoType1 ) or 0
	self.Clip1 = wep:Clip1()
	self.Ammo2 = IsValid(wep.Owner) and wep.Owner:GetAmmoCount( self.AmmoType2 ) or 0
	self.Clip2 = wep:Clip2()

	self:SetAttachmentsFrom( wep )

	self:SetModel( wep.WorldModel )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetCollisionGroup( COLLISION_GROUP_WEAPON )

	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
	end

end

function ENT:ApplyAttachmentsTo( wep )
	--[[local data = self.AttachmentsData
	timer.Simple( 0.5, function() 
		net.Start( "brawl.ApplyAttachmentsTo" )
			net.WriteEntity( wep )
			net.WriteTable( data )
		net.Send( wep.Owner )
	end)]]
	
	local data = self.AttachmentsData
	local loadOrder = {}
		
	for k, v in pairs(data) do
		local attCategory = wep.Attachments[k]
		
		-- make sure we're loading a registered attachment
		if attCategory then
			local att = CustomizableWeaponry.registeredAttachmentsSKey[attCategory.atts[v]]
			
			if att then
				local pos = 1
				
				-- if the attachment has dependencies, put it in the back of the load order, and load ones that don't depend on anything
				if att.dependencies or attCategory.dependencies or (wep.AttachmentDependencies and wep.AttachmentDependencies[att.name]) then
					pos = #loadOrder + 1
				end
				
				table.insert(loadOrder, pos, {category = k, position = v})
			end
		end
	end

	wep:detachAll()
		
	for k, v in pairs(loadOrder) do
		wep:attach(v.category, v.position - 1)
	end

end

function ENT:Use( ply, caller )

	if not ply:IsPlayer() then return end

	local oldAmmo1 = ply:GetAmmoCount( self.AmmoType1 )
	local oldAmmo2 = ply:GetAmmoCount( self.AmmoType2 )


	local newclass = self:GetNWString( "WeaponClass" )
	local newcat = self:GetNWString( "WeaponCategory" )
	if not GAMEMODE:PlayerCanPickupWeaponClass( newclass ) then return end

	if not ply:HasWeapon( newclass ) then
		for k, wep in pairs( ply:GetWeapons() ) do
			local oldcat = wep:GetNWString( "WeaponCategory" )
			if newcat == oldcat then
				ply:DropWeapon( wep )
			end
		end

		local wep = ply:Give( newclass, true )
		ply:SetAmmo( oldAmmo1 + self.Ammo1, self.AmmoType1 )
		ply:SetAmmo( oldAmmo2 + self.Ammo2, self.AmmoType2 )
		wep:SetClip1( self.Clip1 )
		wep:SetClip2( self.Clip2 )
		wep:SetNWString( "WeaponCategory", newcat )
		self:ApplyAttachmentsTo( wep )
	else
		ply:SetAmmo( oldAmmo1 + self.Ammo1 + self.Clip1, self.AmmoType1 )
		ply:SetAmmo( oldAmmo2 + self.Ammo2 + self.Clip2, self.AmmoType2 )
	end

	self:Remove()

end
