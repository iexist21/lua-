local BinaryFormat = package.cpath:match("%p[\\|/]?%p(%a+)")
if BinaryFormat == "dll" then
    function os.name()
        return  "Windows"
    end
elseif BinaryFormat == "so" then
    function os.name()
       return "Linux"
    end
elseif BinaryFormat == "dylib" then
    function os.name()
        return "MacOS"
    end
else
    function os.name()
	return "Unknown"
	end
end
