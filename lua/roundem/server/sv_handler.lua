function ROUNDEM_DATA:StartSound(team)
  local sound = self:GetRandomSound(team)

  net.Start("TTTRoundEndMusic_Start")
  net.WriteString(sound)
  net.WriteString(team)
  net.Broadcast()
end

hook.Add("TTTEndRound", "TTTRoundEndMusic_Start", function(result)
  local team = result

  if team == WIN_TIMELIMIT and ROUNDEM_DATA.SOUNDS["timelimit"] then team = "timelimit" end

  if not ROUNDEM_DATA.SOUNDS[team] then team = "default" end

  ROUNDEM_DATA:StartSound(team)
end)
