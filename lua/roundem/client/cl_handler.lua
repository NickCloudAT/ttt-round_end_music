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

hook.Add('TTTUlxModifyAddonSettings', 'ttt2_roundem_add_to_ulx', function(name)
local tttrspnl = xlib.makelistlayout{w = 415, h = 318, parent = xgui.null}

-- Sound Settings
local tttrsclp1 = vgui.Create('DCollapsibleCategory', tttrspnl)
tttrsclp1:SetSize(390, 20 * table.Count(ROUNDEM_DATA.SOUNDS))
tttrsclp1:SetExpanded(1)
tttrsclp1:SetLabel('Enable Teams')

local tttrslst1 = vgui.Create('DPanelList', tttrsclp1)
tttrslst1:SetPos(5, 25)
tttrslst1:SetSize(390, 20 * table.Count(ROUNDEM_DATA.SOUNDS))
tttrslst1:SetSpacing(5)

for team in pairs(ROUNDEM_DATA.SOUNDS) do
	local convar_name = 'ttt_roundem_' .. team .. '_enable'
	local repvar_name = 'rep_ttt_roundem_' .. team .. '_enable'

	local sound = xlib.makecheckbox{label = convar_name .. ' (def. 1)', repconvar = repvar_name, parent = tttrslst1}
	tttrslst1:AddItem(sound)
end

-- add to ULX
xgui.hookEvent('onProcessModules', nil, tttrspnl.processModules)
xgui.addSubModule('Round End Music', tttrspnl, nil, name)
end)
