local component = require("component")
local term = require("term")
local io = require("io")
local shell = require("shell")
term.clear()
print("╔═══════════════════════════════════════════════════╗")
print("║Напишите названи:                                  ║")
print("╚═══════════════════════════════════════════════════╝")
term.setCursor(19, 2)
io.write()
local re = io.read()
shell.execute("edit "..re)