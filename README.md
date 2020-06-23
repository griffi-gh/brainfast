# brainfast
Brainfuck lua converter

## usage
```lua
local bf=require'bf' --load module
local luaCode = bf( [code,string] , [input,string] ) --convert bf code to lua code
local output = load(luaCode)() --load lua code and save output
print(output) --print output
```


