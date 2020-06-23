# Brainfast
Brainfuck lua converter

## Usage
```lua
bf=require'bf'
bf( [code,string] , [input,string,optional] )  --returns output
```
## Example
```lua
local bf=require'bf' --load module
local bfCode = "-[------->+<]>-.--[-->+++<]>." --brainfuck code
local luaCode = bf(bfCode) --convert brainfuck code to lua code
local output = load(luaCode)() --run lua code and save output
print(output) --print output
```
**Output:** Hi

