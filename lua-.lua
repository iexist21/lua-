require('lib/OSTYPE')
function DelTemp()
    if os.name == "Windows" then
        os.execute('del "temp.lua"') 
    elseif os.name == "Linux" then
        os.execute('rm temp.lua')
    elseif os.name == "MacOS" then 
        os.execute('rm temp.lua')

    end
end
-- For now, it will only inset functions, not replace the code at that area. | do not expect an experince like Typescript
local new = "function new(Table) o = {} setmetatable(o, Table) Table.__index = Table return o end \n "
-- timing in seconds
local sleep = "\n function sleep(time) starttime = os.time() repeat until os.time() > starttime + time end \n"
local prot = "\n function protect(tbl) return setmetatable({}, { __index = tbl, __newindex = function(t, key, value) error('attempting to edit a protected table ' .. tostring(key) ..  ' to ' .. tostring(value), 2) end }) end \n"
defaultinserts = {
"math.randomseed(os.time()) \n"
};
local INFILE = arg[1]
local OUTFILE = arg[2]
local AllowEmpty = arg[3]
Getdat = io.open(INFILE, "r")
data = Getdat:read("*a")
Getdat:close()
if AllowEmpty ~= "-a" then
    if #data == 0 then
    io.write("Please add code into the input file")
    os.exit() 
    end
end
if #data < 0 then
    io.write("You somehow have negitive text, maybe try again????")
    os.exit() 
end
FullFileOUT = defaultinserts[1]..prot..new..sleep..data.."\n"
f = io.open("temp.lua", "w")
f:write(FullFileOUT)
f:close()
local TempFileRS = io.open("temp.lua", "r"):read("*a")
pcall(TempFileRS)
DelTemp()
Write = io.open(OUTFILE, "w")
Write:write(defaultinserts[1])
Write:write(prot)
Write:write(new)
Write:write(sleep)
Write:write()
Write:write(data.."\n")
Write:close()
