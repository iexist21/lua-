new = "function new(Table) o = {} setmetatable(o, Table) Table.__index = Table return o end \n "
sleep = "function sleep(time) starttime = os.time() repeat until os.time() > starttime + time end \n"
prot = "function protect(tbl) return setmetatable({}, { __index = tbl, __newindex = function(t, key, value) error('attempting to edit a protected table ' .. tostring(key) ..  ' to ' .. tostring(value), 2) end }) end \n"
defaultinserts = {
"math.randomseed(os.time()) \n"
};