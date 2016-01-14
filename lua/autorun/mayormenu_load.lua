if (SERVER) then
	AddCSLuaFile("mayormenu_config.lua")
	include("mayormenu_config.lua")
	
	local message = [[
	
	-------------------------------
	| Mayor Menu                  |
	| Made By: XxLMM13xXgaming    |
	| Project started: 1/12/2016  |
	| Version: 1.0                |
	-------------------------------
	
	]]
	MsgC(Color(140,0,255), message) 
end

if (CLIENT) then
	include("mayormenu_config.lua")

	local message = [[
	
	-------------------------------
	| Mayor Menu                  |
	| Made By: XxLMM13xXgaming    |
	| Project started: 1/12/2016  |
	| Version: 1.0                |
	-------------------------------
	
	]]
	MsgC(Color(140,0,255), message) 
end