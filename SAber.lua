getgenv().AutoBuySaber = false
getgenv().AutoTap = false
getgenv().AutoBuyDNA = false
getgenv().AutoSell = false

local remoteFire = game:GetService("ReplicatedStorage").Events


local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local w = library:CreateWindow("SSAF") -- Creates the window

local b = w:CreateFolder("Auto farming") -- Creates the folder(U will put here your buttons,etc)

local c = w:CreateFolder("Buying")

local d = w:CreateFolder("Utility")

b:Toggle("AutoClicker",function(bool)
    getgenv().AutoTap = bool
    print('Auto clicker set to' , bool)
    if bool then
        doTap()
    end
end)

b:Toggle("Auto Sell",function(bool)
    getgenv().AutoSell = bool
    print('Auto sell set to' , bool)
    if bool then
        dosell()
    end
end)

c:Toggle("Auto buy best DNA",function(bool)
    getgenv().AutoBuyDNA = bool
    print('Auto Buy DNA set to' , bool)
    if bool then
        buydna()
    end
end)

c:Toggle("Auto buy best saber",function(bool)
    getgenv().AutoBuySaber = bool
    print('Auto Buy Saber set to' , bool)
    if bool then
        buySaber()
    end
end)

b:Label("!! You must stand on the sell platform for the auto sell to work !!",{
    TextSize = 12; -- Self Explaining
    TextColor = Color3.fromRGB(255,0,0); -- Self Explaining
    BgColor = Color3.fromRGB(69,69,69); -- Self Explaining
    
}) 

d:Button("Teleport to sell pad (may crash lol)",function()
    teleportTO(game:GetService("Workspace").Locations.Sell.CFrame)
end)




d:DestroyGui()



function doTap()
task.spawn(function() 
    while AutoTap == true do
    
        game:GetService("ReplicatedStorage").Events.Clicked:FireServer()
        
        wait()
        end
end)
end

function buySaber()
task.spawn(function() 
    while AutoBuySaber == true do

    local args = {
        [1] = "Swords"
    }

    remoteFire.BuyAll:FireServer(unpack(args))
    wait()
     end
end)
end

function buydna()
task.spawn(function() 

while AutoBuyDNA == true do

    local args = {
        [1] = "Backpacks"
    }

    remoteFire.BuyAll:FireServer(unpack(args))
    wait()

    end
end)
end

function dosell()
task.spawn(function() 
    while AutoSell == true do

    remoteFire.Sell:FireServer()
    wait()

    end
end)
end


print("Executed!")



-- teleporting --

function getPlayerPOS()
    local plyr = game.Players.LocalPlayer
    if plyr.Character then
        return plyr.Character.HumanoidRootPart.Position
    end
        return false
end

function teleportTO(placeCFrame)
    local plyr = game.Players.LocalPlayer
    if plyr.Character then
        plyr.Character.HumanoidRootPart.CFrame = placeCFrame
    end
end





-- b:Slider("Slider",{
--     min = 10; -- min value of the slider
--     max = 50; -- max value of the slider
--     precise = true; -- max 2 decimals
-- },function(value)
--     print(value)
-- end)

-- b:Dropdown("Dropdown",{"A","B","C"},true,function(mob) --true/false, replaces the current title "Dropdown" with the option that t
--     print(mob)
-- end)

-- b:Bind("Bind",Enum.KeyCode.C,function() --Default bind
--     print("Yes")
-- end)

-- b:ColorPicker("ColorPicker",Color3.fromRGB(255,0,0),function(color) --Default color
--     print(color)
-- end)

-- b:Box("Box","number",function(value) -- "number" or "string"
--     print(value)
-- end)
