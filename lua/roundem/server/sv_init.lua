ROUNDEM_DATA = {}
ROUNDEM_DATA.SOUNDS = {}
ROUNDEM_DATA.ALLOWED_FILES = {"mp3", "ogg", "wav"}

include("sv_setup.lua")
include("sv_handler.lua")

util.AddNetworkString("TTTRoundEndMusic_Start")
