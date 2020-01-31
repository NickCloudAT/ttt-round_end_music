local music_enabled = CreateClientConVar( "ttt_roundendmusic_playmusic", "1", true, false, "Enable or Disable the Round end music?")

net.Receive("TTTRoundEndMusic_Start", function()
  local ply = LocalPlayer()
  local sound = net.ReadString()
  local team = net.ReadString()

  if not ply or not IsValid(ply) or not sound or not team or not music_enabled:GetBool() then return end

  surface.PlaySound( "roundem/" .. team .. "/" .. sound )

end)

hook.Add("TTTSettingsTabs", "TTTRoundEndMusicSettings", function(dtabs)

	local settings_panel = vgui.Create( "DPanelList", dtabs )
	settings_panel:StretchToParent(0,0,dtabs:GetPadding()*2,0)
	settings_panel:SetPadding(10)
	settings_panel:SetSpacing(10)
	dtabs:AddSheet( "Round-End Music", settings_panel, "icon16/music.png", false, false, "Round End Music settings")
	local AddonList = vgui.Create( "DIconLayout", settings_panel )
	AddonList:SetSpaceX( 5 )
	AddonList:SetSpaceY( 5 )
	AddonList:Dock( FILL )
	AddonList:DockMargin( 5, 5, 5, 5 )
	AddonList:DockPadding( 10, 10, 10, 10 )

	local Settings = vgui.Create( "DForm" )
	Settings:SetSpacing( 10 )
	Settings:SetName( "Settings" )
	Settings:SetWide(settings_panel:GetWide()-30)
	settings_panel:AddItem(Settings)
	Settings:CheckBox("Play Round End music", "ttt_roundendmusic_playmusic")

end)
