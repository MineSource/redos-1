local io = require("io")
local term = require("term")
local component = require("component")
local gpu = component.gpu
local os = require("os")
local event = require("event")

gpu.setBackground(0x3C3C3C)
term.clear()
term.setCursor(1, 1)
gpu.setBackground(0xFFFFFF)
gpu.setForeground(0xE1E1E1)
---рисовалка
gpu.fill(5, 2, 50, 20, "-")

while true do
local ev, _, x, y = event.pull()
if x>4 and y>1 and x<55 and y<22 then
if ev == "touch" or ev == "drag" then
gpu.setBackground(0x000000)
term.setCursor(x, y)
print(" ")
end
end
end