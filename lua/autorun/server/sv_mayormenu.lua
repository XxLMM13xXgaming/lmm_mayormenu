util.AddNetworkString("LMMMMOpenMenu")
util.AddNetworkString("LMMMMIsInDev")
util.AddNetworkString("LMMMMIsNotMayor")
util.AddNetworkString("LMMMMNewMayor")
util.AddNetworkString("LMMMMBackBtn")
util.AddNetworkString("LMMMMStartDashbooard")
util.AddNetworkString("LMMMMOpenDashbooard")
util.AddNetworkString("LMMMMStartWWP")
util.AddNetworkString("LMMMMOpenWWP")
util.AddNetworkString("LMMMMStartEMP")
util.AddNetworkString("LMMMMOpenEMP")
util.AddNetworkString("LMMMMStartLAWS")
util.AddNetworkString("LMMMMOpenLAWS")
util.AddNetworkString("LMMMMStartCMDS")
util.AddNetworkString("LMMMMOpenCMDS")

function LMMMMGetPeopleWanted()
	
	amount = 0
	
	for k, v in pairs(player.GetAll()) do
		if v:isWanted() then
			amount = amount + 1
		end
	end
	
	return amount
end

hook.Add( "OnPlayerChangedTeam", "LMMMMOnPlayerChangedTeam", function( ply, before, after )	
	timer.Simple( .1, function()
		if ply:isMayor() then
			net.Start("LMMMMNewMayor")
			net.Send(ply)				
		end
	end	)
	
	if team.GetName(before) == LMMMMConfig.MayorTeamName and team.GetName(after) != LMMMMConfig.MayorTeamName then
		ply:SetNWInt("LMMMMPlayersArrested", 0)
	end
	
end )

hook.Add( "playerArrested", "LMMMMplayerArrested", function( criminal, time, actor ) 
	for k, v in pairs(player.GetAll()) do
		if v:isMayor() then
			local lmmmmarrestednumber = v:GetNWInt("LMMMMPlayersArrested")
			v:SetNWInt("LMMMMPlayersArrested", lmmmmarrestednumber + 1)
		end
	end
end )

net.Receive( "LMMMMBackBtn", function( len, ply )
	if LMMMMConfig.DevMode then
		net.Start("LMMMMOpenMenu")
		net.Send(ply)
	else
		if ply:isMayor() then
			net.Start("LMMMMOpenMenu")
			net.Send(ply)
		else
			net.Start("LMMMMIsNotMayor")
			net.Send(ply)
		end
	end
end ) 

function LMMMMOpenMenu(ply, text)
	local text = string.lower(text)
	if(string.sub(text, 0, 100)== LMMMMConfig.MayorCommand) then
		if LMMMMConfig.DevMode then
			net.Start("LMMMMOpenMenu")
			net.Send(ply)
			net.Start("LMMMMIsInDev")
			net.Send(ply)
		else
			if ply:isMayor() then
				net.Start("LMMMMOpenMenu")
				net.Send(ply)
			else
				net.Start("LMMMMIsNotMayor")
				net.Send(ply)
			end
		end
		return ''
	end
end 
hook.Add("PlayerSay", "LMMMMOpenMenu", LMMMMOpenMenu)

net.Receive("LMMMMStartDashbooard", function( len, ply )
	if ply:isMayor() then

		money = 0
		lmmmmarrestednumber = ply:GetNWInt("LMMMMPlayersArrested")
		
		for k, v in pairs(player.GetAll()) do
			local theirmoney = v:getDarkRPVar("money")
			money = money + theirmoney
		end
		
		net.Start("LMMMMOpenDashbooard")
			net.WriteFloat(money)
			net.WriteFloat(lmmmmarrestednumber)
			net.WriteFloat(LMMMMGetPeopleWanted())
		net.Send(ply)
	end
end)

net.Receive("LMMMMStartWWP", function( len, ply )
	if ply:isMayor() then
		net.Start("LMMMMOpenWWP")
		net.Send(ply)
	end
end)

net.Receive("LMMMMStartEMP", function( len, ply )
	if ply:isMayor() then
		net.Start("LMMMMOpenEMP")
		net.Send(ply)
	end
end)

net.Receive("LMMMMStartLAWS", function( len, ply )
	if ply:isMayor() then
		net.Start("LMMMMOpenLAWS")
		net.Send(ply)
	end
end)

net.Receive("LMMMMStartCMDS", function( len, ply )
	if ply:isMayor() then
		net.Start("LMMMMOpenCMDS")
		net.Send(ply)
	end
end)