if SERVER then
  include("roundem/server/sv_init.lua")
  AddCSLuaFile("roundem/client/cl_init.lua")
  AddCSLuaFile("roundem/client/cl_handler.lua")
else
  include("roundem/client/cl_init.lua")
end
