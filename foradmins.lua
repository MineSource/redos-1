local io = require("io")
local component = require("component")
local debug = component.debug
print("Напишите команду")
print("day - день")
print("night - ночь")
print("gm 1 - гм 1")
print("gm 0 - гм о")


io.write(":")
local comm = io.read()
if comm == "day" then
debug.runCommand("time set 1000")
elseif comm == "night" then
debug.runCommand("time set 15000")
elseif comm == "gm 1" then
debug.runCommand("gamemode 1 @p")
elseif comm == "gm 0" then
debug.runCommand("gamemode 0 @p")
end