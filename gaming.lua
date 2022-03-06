getgenv().Gaminb = false
getgenv().droper = false
getgenv().craccr = false
getgenv().Megamind = false

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local w = library:CreateWindow("Crack") -- Creates the window

local b = w:CreateFolder("Automation") -- Creates the folder(U will put here your buttons,etc)


b:Toggle("Get copies",function(bool)
    getgenv().Gaminb = bool
    if bool then
        Crazy()
    end
end)

b:Toggle("Auto Write",function(bool)
    getgenv().droper = bool
    if bool then
        Derr()
    end
end)

local crazyburger
b:Box("Number of letter to copy","number",function(value) -- "number" or "string"
    crazyburger = tonumber(value)
end)

local cracker
b:Toggle("Activate anonymous mode",function(bool)
    if bool then
        cracker = true
    elseif bool == false then
        cracker = false
    end
end)

local Funnt
b:Box("Text to auto write","string",function(value) -- "number" or "string"
    Funnt = value
end)

local Kral
b:Box("Player to TP to","string",function(value) -- "number" or "string"
    Kral = value
end)

b:Button("TP to player",function()
    teleportTO(game.Players[Kral].Character.HumanoidRootPart.CFrame)
    print("wow that worked?")
end)

b:Toggle("Auto TP",function(bool)
    getgenv().Megamind = bool
    if bool then
        megacool()
    end
end)

b:DestroyGui()

b:Label("Discord: ive seen sunlight#6040",{
    TextSize = 12; -- Self Explaining
    TextColor = Color3.fromRGB(3,252,140); -- Self Explaining
    BgColor = Color3.fromRGB(24,1,48); -- Self Explaining
    
}) 




function Crazy()
task.spawn(function()
    while Gaminb == true do

        local args = {
            [1] = crazyburger
             }

        game:GetService("ReplicatedStorage").COM.Game.RequestTakePage:InvokeServer(unpack(args))
        wait()

     end
end)
end

function Derr()
    task.spawn(function()
        while droper == true do

            local args = {
                [1] = ""..Funnt,
                [2] = cracker
            }

            game:GetService("ReplicatedStorage").COM.Game.RequestTakeNote:InvokeServer(unpack(args))
            wait()

         end
    end)
end

-- teleportz

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


function megacool()
    task.spawn(function() 
        while Megamind == true do
            
            teleportTO(game.Players[Kral].Character.HumanoidRootPart.CFrame)
            wait()
        end
    end)
end
    
