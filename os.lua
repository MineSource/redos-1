local component = require("component")
local gpu = component.gpu
local term = require("term")
local x, y = gpu.getResolution()
local event = require("event")
local l = 2
local sel = 0
local shell = require("shell")
term.clear()
---------граници
local function up()
l = 2
while l < x do
gpu.set(l, 1, "═", true)
gpu.set(l, y, "═", true)
l = l + 1
end
l = 2
while l < y do
gpu.set(1, l, "║", true)
gpu.set(x/2, l, "║", true)
gpu.set(x, l, "║", true)
l = l + 1
end 
gpu.set(1, 1, "╔", true)
gpu.set(x, 1, "╗", true)
gpu.set(1, y, "╚", true)
gpu.set(x, y, "╝", true)
gpu.set(x/2, 1, "╦", true)
gpu.set(x/2, y, "╩", true)

---------программы
term.setCursor(2, 2)
print("Text editor")
term.setCursor(2, 3)
print("Shutdown")
term.setCursor(2,4)
print("Paint")
end
up()
-------gui
while true do
local ev, _, xs, ys = event.pull()
if ev == "touch" then
----------текстовый редактор
if xs>1 and ys == 2 and sel ~= 1 then
term.setCursor(x/2+1, 2)
print("Текстовый редактор                ")
sel = 1
elseif xs>1 and ys == 2 and sel == 1 then
shell.execute("app/editor.lua")
up()
sel = 0
---------выкл
elseif xs>1 and ys == 3 and sel ~= 2 then
term.setCursor(x/2+1, 2)
sel = 2
print("Выключить компьютер               ")
elseif xs>1 and ys == 3 and sel == 2 then
shell.execute("shutdown")
------------------paint
elseif xs>1 and ys == 4 and sel ~=3 then
term.setCursor(x/2+1, 2)
sel = 3
print("Рисовалка                         ")
elseif xs>1 and ys == 4 and sel == 3 then
shell.execute("app/paint.lua")
up()
sel = 0
end
end
end