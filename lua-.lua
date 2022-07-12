require('lib/oslib')
require('lib/del')
require('lib/vars')
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
os.execute("del 'temp.lua'")
os.execute("rm temp.lua")