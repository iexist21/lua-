new = "function new(Table) o = {} setmetatable(o, Table) Table.__index = Table return o end \n "
-- timing in seconds
sleep = "\n function sleep(time) starttime = os.time() repeat until os.time() > starttime + time end \n"
prot = "\n function protect(tbl) return setmetatable({}, { __index = tbl, __newindex = function(t, key, value) error('attempting to edit a protected table ' .. tostring(key) ..  ' to ' .. tostring(value), 2) end }) end \n"
defaultinserts = {
"math.randomseed(os.time()) \n"
};
local INFILE = arg[1]
local OUTFILE = arg[2]

Getdat = io.open(INFILE, "r")
data = Getdat:read("*a")
Getdat:close()

Write = io.open(OUTFILE, "w")
Write:write(defaultinserts[1])
Write:write(prot)
Write:write(new)
Write:write(sleep)
Write:write()
Write:write(data.."\n")
Write:close()