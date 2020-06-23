--((false and 1)or 0) bool to number
local function bf(code,input)
  
  --init
  local seq={}
  local out=''
  local o={
    ['+']={code='m[p]=(m[p]+*r*)%256 *c*'},
    ['-']={code='m[p]=(m[p]-*r*)%256 *c*'},
    ['>']={code='p=p+*r* --(>)'},
    ['<']={code='p=p-*r* --(<)'},
    ['.']={code='o=o..(string.rep(string.char(m[p]),*r*)) *c*'},
    [',']={code='m[p]=i:byte(ip) *c*\n\tip=ip+1',r=true},
    ['[']={code='while m[p]~=0 do *c*',r=true,t=1},
    [']']={code='end *c*',r=true,t=-1},
  }
  
  do --search for repeated symbols
    local c,r,s
    for i=1,code:len()+1 do
      s=code:sub(i,i)
      if c==s and not(o[s].r) then
        r=r+1
      else
        table.insert(seq,{c=c,r=r})
        r,c=1,s
      end
    end
  end
  
  do --assemble code
    out=(
      "local p,ip,m=1,1,{}\n"..
      "setmetatable(m,{__index=function() return 0 end})\n"..
      "local i,o='"..(input or'').."',''\n\n"
    )
  
    local tab=0
    for i,v in ipairs(seq) do
      local oi=o[v.c] 
      if oi then
        local toadd=(oi.t or 0)
        local lcode=oi.code
        tab=tab+math.min(toadd,0)
        
        local ltab=string.rep('    ',tab)
        if not oi.r then
          lcode=lcode:gsub("%*r%*",tostring(v.r))
        end
        lcode=lcode:gsub("\t",ltab)
        lcode=lcode:gsub("%*c%*","--("..v.c..")")
        
        out=out..(ltab..lcode..'\n')
        tab=tab+math.max(toadd,0)
      end
    end
    out=out..'\nreturn o'
  end
  
  return out
end

return bf