function DelTemp()
    if os.name == "Windows" then
        os.execute('del "temp.lua"') 
    elseif os.name == "Linux" then
        os.execute('rm temp.lua')
    elseif os.name == "MacOS" then 
        os.execute('rm temp.lua')

    end
end