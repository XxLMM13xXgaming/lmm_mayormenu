surface.CreateFont( "LMMMMfontclose", {
		font = "Lato Light",
		size = 25,
		weight = 250,
		antialias = true,
		strikeout = false,
		additive = true,
} )
 
surface.CreateFont( "LMMMMTitleFont", {
	font = "Lato Light",
	size = 30,
	weight = 250,
	antialias = true,
	strikeout = false,
	additive = true,
} )
 
surface.CreateFont( "LMMMMHeadingFont", {
	font = "Arial",
	size = 25,
	weight = 500,
} )
 
surface.CreateFont( "LMMMMMoneyFont", {
	font = "Arial",
	size = 20,
	weight = 500,
} ) 

local blur = Material("pp/blurscreen")
local function DrawBlur(panel, amount) --Panel blur function
	local x, y = panel:LocalToScreen(0, 0)
	local scrW, scrH = ScrW(), ScrH()
	surface.SetDrawColor(255, 255, 255)
	surface.SetMaterial(blur)
	for i = 1, 6 do
		blur:SetFloat("$blur", (i / 3) * (amount or 6))
		blur:Recompute()
		render.UpdateScreenEffectTexture()
		surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
	end
end

local function drawRectOutline( x, y, w, h, color )
	surface.SetDrawColor( color )
	surface.DrawOutlinedRect( x, y, w, h )
end

net.Receive( "LMMMMOpenMenu", function()

	function MainMenu()
		local menu = vgui.Create( "DFrame" )
		menu:SetSize( 250, 200 )
		menu:Center()
		menu:SetDraggable( true )
		menu:MakePopup()
		menu:SetTitle( "" )
		menu:ShowCloseButton( false )
		menu.Paint = function( self, w, h )
			DrawBlur(menu, 2)
			drawRectOutline( 0, 0, w, h, Color( 0, 0, 0, 85 ) )	
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 85))
			drawRectOutline( 2, 2, w - 4, h / 3.9, Color( 0, 0, 0, 85 ) )
			draw.RoundedBox(0, 2, 2, w - 4, h / 4, Color(0,0,0,125))
			draw.SimpleText( "Mayor Menu", "LMMMMTitleFont", menu:GetWide() / 2, 25, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
		
		local frameclose = vgui.Create( "DButton", menu )
		frameclose:SetSize( 35, 35 )
		frameclose:SetPos( menu:GetWide() - 34,10 )
		frameclose:SetText( "X" )
		frameclose:SetFont( "LMMMMfontclose" )
		frameclose:SetTextColor( Color( 255, 255, 255 ) )
		frameclose.Paint = function()
			
		end
		frameclose.DoClick = function()
			menu:Close()
			menu:Remove()
			gui.EnableScreenClicker( false )			
		end	
		
		local DashboardBtn = vgui.Create( "DButton", menu )
		DashboardBtn:SetPos( 2,70 )
		DashboardBtn:SetSize( menu:GetWide() - 4,20 )
		DashboardBtn:SetText( "Dashboard" )
		DashboardBtn:SetTextColor( Color( 255, 255, 255 ) )	
		DashboardBtn.Paint = function( self, w, h )		
			DrawBlur(DashboardBtn, 2)
			drawRectOutline( 0, 0, w, h, Color( 0, 0, 0, 85 ) )	
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125))
		end
		DashboardBtn.DoClick = function()
			net.Start("LMMMMStartDashbooard")
			net.SendToServer()
			menu:Close()
			menu:Remove()	
			gui.EnableScreenClicker( true )								
		end
	
		local wwpbtn = vgui.Create( "DButton", menu )
		wwpbtn:SetPos( 2,95 )
		wwpbtn:SetSize( menu:GetWide() - 4,20 )
		wwpbtn:SetText( "Wanting/Warranting people" )
		wwpbtn:SetTextColor( Color( 255, 255, 255 ) )	
		wwpbtn.Paint = function( self, w, h )		
			DrawBlur(wwpbtn, 2)
			drawRectOutline( 0, 0, w, h, Color( 0, 0, 0, 85 ) )	
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125))
		end	
		wwpbtn.DoClick = function()
			net.Start("LMMMMStartWWP")
			net.SendToServer()
			menu:Close()
			menu:Remove()	
			gui.EnableScreenClicker( true )									
		end
		
		local EmployeesBtn = vgui.Create( "DButton", menu )
		EmployeesBtn:SetPos( 2,120 )
		EmployeesBtn:SetSize( menu:GetWide() - 4,20 )
		EmployeesBtn:SetText( "Employees" )
		EmployeesBtn:SetTextColor( Color( 255, 255, 255 ) )	
		EmployeesBtn.Paint = function( self, w, h )		
			DrawBlur(EmployeesBtn, 2)
			drawRectOutline( 0, 0, w, h, Color( 0, 0, 0, 85 ) )	
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125))
		end	
		EmployeesBtn.DoClick = function()
			net.Start("LMMMMStartEMP")
			net.SendToServer()		
			menu:Close()
			menu:Remove()	
			gui.EnableScreenClicker( true )								
		end
		
		local LawsBtn = vgui.Create( "DButton", menu )
		LawsBtn:SetPos( 2,145 )
		LawsBtn:SetSize( menu:GetWide() - 4,20 )
		LawsBtn:SetText( "Laws" )
		LawsBtn:SetTextColor( Color( 255, 255, 255 ) )	
		LawsBtn.Paint = function( self, w, h )		
			DrawBlur(LawsBtn, 2)
			drawRectOutline( 0, 0, w, h, Color( 0, 0, 0, 85 ) )	
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125))
		end			
		LawsBtn.DoClick = function()
			net.Start("LMMMMStartLAWS")
			net.SendToServer()
			menu:Close()
			menu:Remove()	
			gui.EnableScreenClicker( true )								
		end
		
		local CommandsBtn = vgui.Create( "DButton", menu )
		CommandsBtn:SetPos( 2,170 )
		CommandsBtn:SetSize( menu:GetWide() - 4,20 )
		CommandsBtn:SetText( "Commands" )
		CommandsBtn:SetTextColor( Color( 255, 255, 255 ) )	
		CommandsBtn.Paint = function( self, w, h )		
			DrawBlur(CommandsBtn, 2)
			drawRectOutline( 0, 0, w, h, Color( 0, 0, 0, 85 ) )	
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125))
		end	
		CommandsBtn.DoClick = function()
			net.Start("LMMMMStartCMDS")
			net.SendToServer()
			menu:Close()
			menu:Remove()	
			gui.EnableScreenClicker( true )					
		end
		
	end
	
	MainMenu()
	
end )

net.Receive("LMMMMOpenDashbooard", function()

	local money = net.ReadFloat()
	local lmmmmarrestednumber = net.ReadFloat()
	local peoplewanted = net.ReadFloat()
	
	local menu = vgui.Create( "DFrame" )
	menu:SetSize( 300, 350 )
	menu:Center()
	menu:SetDraggable( true )
	menu:MakePopup()
	menu:SetTitle( "" )
	menu:ShowCloseButton( false )
	menu.Paint = function( self, w, h )
		DrawBlur(menu, 2)
		drawRectOutline( 0, 0, w, h, Color( 0, 0, 0, 85 ) )	
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 85))
		drawRectOutline( 2, 2, w - 4, h / 8.9, Color( 0, 0, 0, 85 ) )
		draw.RoundedBox(0, 2, 2, w - 4, h / 9, Color(0,0,0,125))
		draw.SimpleText( "Mayor Menu", "LMMMMTitleFont", menu:GetWide() / 2, 25, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		draw.RoundedBox(0, 2, 70, w - 4, 60, Color(255,0,0,125)) -- redbox
		draw.RoundedBox(0, 2, 145, w - 4, 60, Color(255,0,0,125)) -- redbox
		draw.RoundedBox(0, 2, 220, w - 4, 60, Color(255,0,0,125)) -- redbox
	end
	
	local frameclose = vgui.Create( "DButton", menu )
	frameclose:SetSize( 35, 35 )
	frameclose:SetPos( menu:GetWide() - 34,10 )
	frameclose:SetText( "X" )
	frameclose:SetFont( "LMMMMfontclose" )
	frameclose:SetTextColor( Color( 255, 255, 255 ) )
	frameclose.Paint = function()
		
	end
	frameclose.DoClick = function()
		menu:Close()
		menu:Remove()
		gui.EnableScreenClicker( false )			
	end	
	
	local servereco = vgui.Create("DLabel", menu)
	servereco:SetPos( 5, 50 )
	servereco:SetSize( 200, 100 )
	servereco:SetText("Server Economy: ")
	servereco:SetFont("LMMMMHeadingFont")

	local serverecoTxt = vgui.Create("DLabel", menu)
	serverecoTxt:SetPos( 5, 52 )
	serverecoTxt:SetSize( 500, 100 )
	serverecoTxt:SetText("                                   "..DarkRP.formatMoney(money))
	serverecoTxt:SetFont("LMMMMMoneyFont")

	local Arrested = vgui.Create("DLabel", menu)
	Arrested:SetPos( 5, 125 )
	Arrested:SetSize( 200, 100 )
	Arrested:SetText("Players Arrested: ")
	Arrested:SetFont("LMMMMHeadingFont")

	local ArrestedTxt = vgui.Create("DLabel", menu)
	ArrestedTxt:SetPos( 5, 125 )
	ArrestedTxt:SetSize( 500, 100 )
	ArrestedTxt:SetText("                            "..lmmmmarrestednumber)
	ArrestedTxt:SetFont("LMMMMHeadingFont")
	
	local Wanted = vgui.Create("DLabel", menu)
	Wanted:SetPos( 5, 200 )
	Wanted:SetSize( 200, 100 )
	Wanted:SetText("Players Wanted: ")
	Wanted:SetFont("LMMMMHeadingFont")

	local WantedTxt = vgui.Create("DLabel", menu)
	WantedTxt:SetPos( 5, 200 )
	WantedTxt:SetSize( 500, 100 )
	WantedTxt:SetText("                            "..peoplewanted)
	WantedTxt:SetFont("LMMMMHeadingFont")	
	
	
	local BackBtn = vgui.Create("DButton", menu)
	BackBtn:SetPos( 2, 300 )
	BackBtn:SetSize( menu:GetWide() - 4,20 )
	BackBtn:SetText("<-- Back")
	BackBtn:SetTextColor(Color(255,255,255))
	BackBtn.Paint = function( self, w, h )
		DrawBlur(BackBtn, 2)
		drawRectOutline( 0, 0, w, h, Color( 0, 0, 0, 85 ) )	
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125))	
	end
	BackBtn.DoClick = function()
		net.Start("LMMMMBackBtn")
		net.SendToServer()
		menu:Close()
		menu:Remove()
		gui.EnableScreenClicker( true )				
	end
	
end)

net.Receive("LMMMMOpenWWP", function()
	
	local menu = vgui.Create( "DFrame" )
	menu:SetSize( 300, 350 )
	menu:Center()
	menu:SetDraggable( true )
	menu:MakePopup()
	menu:SetTitle( "" )
	menu:ShowCloseButton( false )
	menu.Paint = function( self, w, h )
		DrawBlur(menu, 2)
		drawRectOutline( 0, 0, w, h, Color( 0, 0, 0, 85 ) )	
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 85))
		drawRectOutline( 2, 2, w - 4, h / 8.9, Color( 0, 0, 0, 85 ) )
		draw.RoundedBox(0, 2, 2, w - 4, h / 9, Color(0,0,0,125))
		draw.SimpleText( "Mayor Menu", "LMMMMTitleFont", menu:GetWide() / 2, 25, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	
	local frameclose = vgui.Create( "DButton", menu )
	frameclose:SetSize( 35, 35 )
	frameclose:SetPos( menu:GetWide() - 34,10 )
	frameclose:SetText( "X" )
	frameclose:SetFont( "LMMMMfontclose" )
	frameclose:SetTextColor( Color( 255, 255, 255 ) )
	frameclose.Paint = function()
		
	end
	frameclose.DoClick = function()
		menu:Close()
		menu:Remove()
		gui.EnableScreenClicker( false )			
	end		

	local DListView = vgui.Create( "DListView", menu )
	DListView:SetSize( menu:GetWide() - 20, menu:GetTall() - 100 )
	DListView:SetPos( 10, 50 )
	DListView:AddColumn( "Name" )
	DListView:AddColumn( "Job" )
	for k, v in pairs( player.GetAll() ) do
		if LMMMMConfig.DevMode then
			DListView:AddLine( v:Nick(), team.GetName(v:Team()))
		else
			if not v:isCP() then
				DListView:AddLine( v:Nick(), team.GetName(v:Team()))
			end
		end
	end
	DListView.Paint = function( self, w, h )
		DrawBlur(DListView, 2)
		drawRectOutline( 0, 0, w, h, Color( 0, 0, 0, 85 ) )	
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125))
	end
	DListView.OnRowRightClick = function( id, line)
		local user = DListView:GetLine( line ):GetValue( 1 )
		local Dmenu = DermaMenu()
		Dmenu:AddOption( "Want", function()
			Derma_StringRequest(
				"Mayor Menu",
				"What is the reason for "..user.." being wanted?",
				"",
				function( text )
					RunConsoleCommand( "darkrp", "wanted", user, text )
					menu:Close()
					menu:Remove()
					gui.EnableScreenClicker( false )				
				end,
				function( text ) end
			)
		end )
		Dmenu:AddOption( "Warrant", function()
			Derma_StringRequest(
				"Mayor Menu",
				"What is the reason for "..user.." being warranted?",
				"",
				function( text )
					RunConsoleCommand( "darkrp", "warrant", user, text )
					menu:Close()
					menu:Remove()
					gui.EnableScreenClicker( false )				
				end,
				function( text ) end
			)
		end )
		Dmenu:Open()		
	end

	local BackBtn = vgui.Create("DButton", menu)
	BackBtn:SetPos( 2, 310 )
	BackBtn:SetSize( menu:GetWide() - 4,20 )
	BackBtn:SetText("<-- Back")
	BackBtn:SetTextColor(Color(255,255,255))
	BackBtn.Paint = function( self, w, h )
		DrawBlur(BackBtn, 2)
		drawRectOutline( 0, 0, w, h, Color( 0, 0, 0, 85 ) )	
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125))	
	end
	BackBtn.DoClick = function()
		net.Start("LMMMMBackBtn")
		net.SendToServer()
		menu:Close()
		menu:Remove()
		gui.EnableScreenClicker( true )		
	end
	
end)	

net.Receive("LMMMMOpenEMP", function()
	
	local menu = vgui.Create( "DFrame" )
	menu:SetSize( 300, 350 )
	menu:Center()
	menu:SetDraggable( true )
	menu:MakePopup()
	menu:SetTitle( "" )
	menu:ShowCloseButton( false )
	menu.Paint = function( self, w, h )
		DrawBlur(menu, 2)
		drawRectOutline( 0, 0, w, h, Color( 0, 0, 0, 85 ) )	
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 85))
		drawRectOutline( 2, 2, w - 4, h / 8.9, Color( 0, 0, 0, 85 ) )
		draw.RoundedBox(0, 2, 2, w - 4, h / 9, Color(0,0,0,125))
		draw.SimpleText( "Mayor Menu", "LMMMMTitleFont", menu:GetWide() / 2, 25, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	
	local frameclose = vgui.Create( "DButton", menu )
	frameclose:SetSize( 35, 35 )
	frameclose:SetPos( menu:GetWide() - 34,10 )
	frameclose:SetText( "X" )
	frameclose:SetFont( "LMMMMfontclose" )
	frameclose:SetTextColor( Color( 255, 255, 255 ) )
	frameclose.Paint = function()
		
	end
	frameclose.DoClick = function()
		menu:Close()
		menu:Remove()
		gui.EnableScreenClicker( false )			
	end		

	local DListView = vgui.Create( "DListView", menu )
	DListView:SetSize( menu:GetWide() - 20, menu:GetTall() - 100 )
	DListView:SetPos( 10, 50 )
	DListView:AddColumn( "Name" )
	DListView:AddColumn( "Job" )
	for k, v in pairs( player.GetAll() ) do
		if v:isCP() then
			DListView:AddLine( v:Nick(), team.GetName(v:Team()))
		end
	end
	DListView.Paint = function( self, w, h )
		DrawBlur(DListView, 2)
		drawRectOutline( 0, 0, w, h, Color( 0, 0, 0, 85 ) )	
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125))
	end
	DListView.OnRowRightClick = function( id, line)
		local user = DListView:GetLine( line ):GetValue( 1 )
		local Dmenu = DermaMenu()
		Dmenu:AddOption( "Demote", function()
			Derma_StringRequest(
				"Mayor Menu",
				"What is the reason for "..user.." being demoted?",
				"",
				function( text )
					RunConsoleCommand( "darkrp", "demote", user, text )
					menu:Close()
					menu:Remove()
					gui.EnableScreenClicker( false )				
				end,
				function( text ) end
			)
		end )
		Dmenu:AddOption( "Call", function()
			RunConsoleCommand( "say", "/g "..user.." I need you!" )
		end )
		Dmenu:Open()		
	end

	local BackBtn = vgui.Create("DButton", menu)
	BackBtn:SetPos( 2, 310 )
	BackBtn:SetSize( menu:GetWide() - 4,20 )
	BackBtn:SetText("<-- Back")
	BackBtn:SetTextColor(Color(255,255,255))
	BackBtn.Paint = function( self, w, h )
		DrawBlur(BackBtn, 2)
		drawRectOutline( 0, 0, w, h, Color( 0, 0, 0, 85 ) )	
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125))	
	end
	BackBtn.DoClick = function()
		net.Start("LMMMMBackBtn")
		net.SendToServer()
		menu:Close()
		menu:Remove()
		gui.EnableScreenClicker( true )		
	end
	
end)

net.Receive("LMMMMOpenLAWS", function()

	DarkRPLawsFormat = DarkRP.getLaws() 
	
	local menu = vgui.Create( "DFrame" )
	menu:SetSize( 300, 350 )
	menu:Center()
	menu:SetDraggable( true )
	menu:MakePopup()
	menu:SetTitle( "" )
	menu:ShowCloseButton( false )
	menu.Paint = function( self, w, h )
		DrawBlur(menu, 2)
		drawRectOutline( 0, 0, w, h, Color( 0, 0, 0, 85 ) )	
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 85))
		drawRectOutline( 2, 2, w - 4, h / 8.9, Color( 0, 0, 0, 85 ) )
		draw.RoundedBox(0, 2, 2, w - 4, h / 9, Color(0,0,0,125))
		draw.SimpleText( "Mayor Menu", "LMMMMTitleFont", menu:GetWide() / 2, 25, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	
	local frameclose = vgui.Create( "DButton", menu )
	frameclose:SetSize( 35, 35 )
	frameclose:SetPos( menu:GetWide() - 34,10 )
	frameclose:SetText( "X" )
	frameclose:SetFont( "LMMMMfontclose" )
	frameclose:SetTextColor( Color( 255, 255, 255 ) )
	frameclose.Paint = function()
		
	end
	frameclose.DoClick = function()
		menu:Close()
		menu:Remove()
		gui.EnableScreenClicker( false )			
	end		

	local DListView = vgui.Create( "DListView", menu )
	DListView:SetSize( menu:GetWide() - 20, menu:GetTall() - 100 )
	DListView:SetPos( 10, 50 )
	DListView:AddColumn( "Number" )
	DListView:AddColumn( "Law" )
	for k, v in pairs( DarkRPLawsFormat ) do
	   DListView:AddLine( k, v )
	end	
	DListView.Paint = function( self, w, h )
		DrawBlur(DListView, 2)
		drawRectOutline( 0, 0, w, h, Color( 0, 0, 0, 85 ) )	
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125))
	end
	DListView.OnRowRightClick = function( id, line)
		local number = DListView:GetLine( line ):GetValue( 1 )
		local law = DListView:GetLine( line ):GetValue( 2 )
		local Dmenu = DermaMenu()
		Dmenu:AddOption( "Remove Law", function()
			RunConsoleCommand( "say", "/removelaw "..number )
			timer.Simple( 1, function()
				menu:Close()
				menu:Remove()
				gui.EnableScreenClicker( true )
				net.Start("LMMMMStartLAWS")
				net.SendToServer()
			end )
		end )
		Dmenu:AddOption( "Read Full Law", function()
			Derma_Message( law, "Mayor Menu", "Close" )
		end	)
		Dmenu:AddOption( "Reset Laws", function()
			Derma_StringRequest(
				"Mayor Menu", 
				"Are you sure you want to reset the laws? (type yes or no)",
				"",
				function( text ) 
					if text == "yes" or text == "YES" then
						RunConsoleCommand( "say", "/resetlaws" )
						timer.Simple( 1, function()
							menu:Close()
							menu:Remove()
							gui.EnableScreenClicker( true )
							net.Start("LMMMMStartLAWS")
							net.SendToServer()
						end )					
					end
				end,
				function( text ) end
			)		
		end )		
		Dmenu:Open()		
	end

	local AddLawBtn = vgui.Create("DButton", menu)
	AddLawBtn:SetPos( 2, 303 )
	AddLawBtn:SetSize( menu:GetWide() - 4,20 )
	AddLawBtn:SetText("Add Law")
	AddLawBtn:SetTextColor(Color(255,255,255))
	AddLawBtn.Paint = function( self, w, h )
		DrawBlur(AddLawBtn, 2)
		drawRectOutline( 0, 0, w, h, Color( 0, 0, 0, 85 ) )	
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125))	
	end
	AddLawBtn.DoClick = function()
		Derma_StringRequest(
			"Mayor Menu", 
			"What is the law you want to make",
			"",
			function( text ) RunConsoleCommand("say", "/addlaw "..text) timer.Simple( 1, function()
				menu:Close()
				menu:Remove()
				net.Start("LMMMMStartLAWS")
				net.SendToServer()
				end )
			end,
			function( text ) end
		 )
	end	
	
	local BackBtn = vgui.Create("DButton", menu)
	BackBtn:SetPos( 2, 325 )
	BackBtn:SetSize( menu:GetWide() - 4,20 )
	BackBtn:SetText("<-- Back")
	BackBtn:SetTextColor(Color(255,255,255))
	BackBtn.Paint = function( self, w, h )
		DrawBlur(BackBtn, 2)
		drawRectOutline( 0, 0, w, h, Color( 0, 0, 0, 85 ) )	
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125))	
	end
	BackBtn.DoClick = function()
		net.Start("LMMMMBackBtn")
		net.SendToServer()
		menu:Close()
		menu:Remove()
		gui.EnableScreenClicker( true )		
	end
	
end)

net.Receive("LMMMMOpenCMDS", function()
	
	local menu = vgui.Create( "DFrame" )
	menu:SetSize( 300, 350 )
	menu:Center()
	menu:SetDraggable( true )
	menu:MakePopup()
	menu:SetTitle( "" )
	menu:ShowCloseButton( false )
	menu.Paint = function( self, w, h )
		DrawBlur(menu, 2)
		drawRectOutline( 0, 0, w, h, Color( 0, 0, 0, 85 ) )	
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 85))
		drawRectOutline( 2, 2, w - 4, h / 8.9, Color( 0, 0, 0, 85 ) )
		draw.RoundedBox(0, 2, 2, w - 4, h / 9, Color(0,0,0,125))
		draw.SimpleText( "Mayor Menu", "LMMMMTitleFont", menu:GetWide() / 2, 25, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	
	local frameclose = vgui.Create( "DButton", menu )
	frameclose:SetSize( 35, 35 )
	frameclose:SetPos( menu:GetWide() - 34,10 )
	frameclose:SetText( "X" )
	frameclose:SetFont( "LMMMMfontclose" )
	frameclose:SetTextColor( Color( 255, 255, 255 ) )
	frameclose.Paint = function()
		
	end
	frameclose.DoClick = function()
		menu:Close()
		menu:Remove()
		gui.EnableScreenClicker( false )			
	end		

	local DListView = vgui.Create( "DListView", menu )
	DListView:SetSize( menu:GetWide() - 20, menu:GetTall() - 100 )
	DListView:SetPos( 10, 50 )
	DListView:AddColumn( "Name" )
	DListView:AddColumn( "Command" )
	for k, v in pairs( LMMMMConfig.MayorCMDS ) do
		DListView:AddLine( v[1], v[2] )
	end
	DListView.DoDoubleClick = function( lineID, line )
		local command = DListView:GetLine( line ):GetValue( 2 )	
		LocalPlayer():ConCommand("say "..command)
	end	
	DListView.Paint = function( self, w, h )
		DrawBlur(DListView, 2)
		drawRectOutline( 0, 0, w, h, Color( 0, 0, 0, 85 ) )	
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125))
	end

	local BackBtn = vgui.Create("DButton", menu)
	BackBtn:SetPos( 2, 310 )
	BackBtn:SetSize( menu:GetWide() - 4,20 )
	BackBtn:SetText("<-- Back")
	BackBtn:SetTextColor(Color(255,255,255))
	BackBtn.Paint = function( self, w, h )
		DrawBlur(BackBtn, 2)
		drawRectOutline( 0, 0, w, h, Color( 0, 0, 0, 85 ) )	
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125))	
	end
	BackBtn.DoClick = function()
		net.Start("LMMMMBackBtn")
		net.SendToServer()
		menu:Close()
		menu:Remove()
		gui.EnableScreenClicker( true )		
	end
	
end)
		
net.Receive("LMMMMIsNotMayor", function()
	chat.AddText(Color(255,0,0), "[Mayor Menu] ", Color(255,255,255), "You are not mayor!")
end)		
net.Receive("LMMMMIsInDev", function()
	chat.AddText(Color(255,0,0), "[Mayor Menu] ", Color(255,255,255), "WARNING: THE ADDON IS IN DEV MODE! PLEASE WARN A ADMIN THAT THE MAYOR ADDON IS IN DEV MODE!")
end)
net.Receive("LMMMMNewMayor", function()
	chat.AddText(Color(255,0,0), "[Mayor Menu] ", Color(255,255,255), LMMMMConfig.MayorGreatingMessage)
end)