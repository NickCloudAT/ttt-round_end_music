if SERVER then

function ROUNDEM_DATA:LoadSounds()
  local files, folders = file.Find("sound/roundem/*", "GAME")

  for v,f in ipairs(folders) do
    local sounds, _ = file.Find("sound/roundem/" .. f .. "/*", "GAME")
     for k,m in ipairs(sounds) do
      self:RegisterSound(m, f)
    end
  end

end


function ROUNDEM_DATA:RegisterSound(sound, team)
  local split = string.Split(sound, ".")

  if not table.HasValue(ROUNDEM_DATA.ALLOWED_FILES, split[#split]) then return end

  print("[RoundEndMusic] Registering sound " .. sound .. " for team " .. team)

  resource.AddFile("sound/roundem/" .. team .. "/" .. sound)

  if not self.SOUNDS[team] then
    self.SOUNDS[team] = {}
  end

  table.insert(self.SOUNDS[team], sound)
end


function ROUNDEM_DATA:GetSounds(team)
  return self.SOUNDS[team]
end


function ROUNDEM_DATA:GetRandomSound(team)
  local sounds = self:GetSounds(team)

  return table.Random(sounds)
end


hook.Add("OnGamemodeLoaded", "TTT_REM_LOAD_SOUNDS", function()
  ROUNDEM_DATA:LoadSounds()
end)

end
