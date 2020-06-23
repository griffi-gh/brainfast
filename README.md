# brainfast
Brainfuck lua converter

## usage
```lua
require'bf'
bf( [code,string] , [input,string,optional] )  --returns output
```
## example
```lua
local bf=require'bf' --load module
local luaCode = bf("-[------->+<]>-.--[-->+++<]>.") --convert bf code to lua code
local output = load(luaCode)() --load lua code and save output
print(output) --print output
```


