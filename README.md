# Brainfast
Brainfuck lua converter

Generates "readable" code

Output for ```+[++.]```:
```lua
local p,ip,m=1,1,{}
setmetatable(m,{__index=function() return 0 end})
local i,o='',''

m[p]=(m[p]+1)%256 --(+)
while m[p]~=0 do --([)
    m[p]=(m[p]+2)%256 --(++)
    o=o..(string.rep(string.char(m[p]),1)) --(.)
end --(])

return o
```
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

