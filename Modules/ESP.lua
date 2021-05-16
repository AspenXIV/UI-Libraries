--[[
getgenv().clear = rconsoleclear
getgenv().print = function(...)
    local out = ""
    local args = {...}
    for i,v in pairs(args) do
        out = tostring(out) .. tostring(v)
    end
	rconsoleprint(tostring(out) .. "\n")
end
getgenv().error = function(...)
    local out = ""
    local args = {...}
    for i,v in pairs(args) do
        out = tostring(out) .. tostring(v)
    end
	rconsoleerr(tostring(out) .. "\n")
end
getgenv().info = function(...)
    local out = ""
    local args = {...}
    for i,v in pairs(args) do
        out = tostring(out) .. tostring(v)
    end
	rconsoleinfo(tostring(out) .. "\n")
end
getgenv().warn = function(...)
    local out = ""
    local args = {...}
    for i,v in pairs(args) do
        out = tostring(out) .. tostring(v)
    end
	rconsolewarn(tostring(out) .. "\n")
end
print("bruh", "bruh")
getgenv().title = rconsolename
getgenv().inputBAD = rconsoleinput
getgenv().inputA = rconsoleinputasync
clear()
--]]
local ESPLIB = {}

local Transparency = 0 -- this is transparency variable cant edit it cus fuck you

local RenderStepped = game:GetService("RunService").RenderStepped

_G.Stored = {}    -- stores used items probs easier way
_G.UsedNames = {} -- stores used names probs easier way

local MainGui = Instance.new("ScreenGui", game.CoreGui)
MainGui.IgnoreGuiInset = true

local ViewportFrame = Instance.new("ViewportFrame", MainGui)
ViewportFrame.Size = UDim2.new(1, 0, 1, 0)
ViewportFrame.CurrentCamera = workspace.CurrentCamera
ViewportFrame.BackgroundTransparency = 1
ViewportFrame.ImageTransparency = Transparency

function SetUp(part) -- make it archivable
	part.Archivable = true
end

function GenerateRandomString(length) -- generates a random string length of length i think
    local alpha = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
    local split = alpha:split("") -- split at every char
    local final = ""
    for i=0, length, 1 do
        final = tostring(final) .. split[math.random(1, #split)]
    end
    return final
end

function ESPLIB:AddItem(item, clr, changename) -- item to add, color
    local randoms = GenerateRandomString(16) -- gen random string
    repeat
        wait()
        randoms = GenerateRandomString(16)
    until _G.UsedNames[randoms] ~= true -- mass regen until get a new name, if you have more than 15872 items on your esp 1: increase the length 2: what the actuall fuck are you on a nasa computer? (math: (16x16)*62)
    _G.UsedNames[randoms] = item
    --print(item, clr)
    if changename == true then
        item.Name = randoms
    end
    _G.Stored[randoms] = {
        ["Item"] = item,
        ["Color3"] = clr,
        ["Name"] = randoms
    }
    return _G.Stored[randoms] -- returns table incase need to edit
end

function ESPLIB:RemoveItem(item) -- removes item
    for i,v in pairs(_G.UsedNames) do -- loops over used name and frees it up
        if v == item then
            _G.UsedNames[i] = nil
        end
    end
    for i,v in pairs(_G.Stored) do -- loops over esped items and removes it
        if v["Item"] == item then
            _G.Stored[i] = nil
        end
    end
    if ViewportFrame:FindFirstChild(item.Name) then -- deles from viewport frame
        ViewportFrame:FindFirstChild(item.Name):Destroy()
    end
end

function ESPLIB:StartESP()
    local suc2, err2 = coroutine.resume(coroutine.create(function() -- coroutine so it doesnt crash or some shit idk
        while true do
            for name, tbl in next, (_G.Stored) do
                local item = tbl["Item"]-- grab item
                local C3 = tbl["Color3"]--grab color
                --print(item, C3)
                if name == nil or item == nil then _G.Stored[name] = nil _G.UsedNames[name] = nil break end -- if values are nil break and remove
                if C3 == nil or typeof(C3) ~= "Color3" then C3 = Color3.fromRGB(255,255,255) end -- if color is nil default to white
        
                if (not item.Archivable) then -- backup
                    item.Archivable = true
                end
                
                local FakePart = ViewportFrame:FindFirstChild(item.Name) -- fake part finder
                --print(typeof(FakePart))
                if FakePart then
                    if FakePart:IsA("Model") then -- model checking
                        --print("Model")
                        for _, Part in next, (FakePart:GetChildren()) do
                            if Part:IsA("Part") or Part:IsA("MeshPart") then -- if part then do shit below
                                Part.CFrame = (item:FindFirstChild(Part.Name).CFrame) or CFrame.new()
                                Part.Color = C3
                            elseif Part:IsA("Accessory") then -- accessory (hats) handler barely tested
                                if Part:FindFirstChild("Handle") then
                                    Part.Handle.CFrame = (item:FindFirstChild(Part.Name).Handle.CFrame) or CFrame.new()
                                    Part.Handle.Color = C3
                                end
                            elseif Part:IsA("Model") then -- cant remeber how this works
                                for i,v in pairs(Part:GetChildren()) do
                                    if item:FindFirstChildOfClass("Model") ~= nil and item:FindFirstChildOfClass("Model"):FindFirstChild(v.Name) ~= nil then -- Added Error catch.
                                        v.CFrame = (item:FindFirstChildOfClass("Model"):FindFirstChild(v.Name).CFrame) or CFrame.new()
                                    end
                                end
                            end
                        end
                    elseif FakePart:IsA("Part") or FakePart:IsA("MeshPart") then -- part checking
                        --print("Part")
                        FakePart.CFrame = (item.CFrame) or CFrame.new()
                        FakePart.Color = C3
                        --print(C3)
                        for _, Part in next, (FakePart:GetChildren()) do -- check if part has any children
                            if Part:IsA("Part") or Part:IsA("MeshPart") then
                                Part.CFrame = (item:FindFirstChild(Part.Name).CFrame) or CFrame.new()
                                Part.Color = C3
                            elseif Part:IsA("Accessory") then -- accessory (hats) handler barely tested
                                if Part:FindFirstChild("Handle") then
                                    Part.Handle.CFrame = (item:FindFirstChild(Part.Name).Handle.CFrame) or CFrame.new()
                                    Part.Handle.Color = C3
                                end
                            elseif Part:IsA("Model") then -- cant remeber how this works
                                for i,v in pairs(Part:GetChildren()) do
                                    if item:FindFirstChildOfClass("Model") ~= nil and item:FindFirstChildOfClass("Model"):FindFirstChild(v.Name) ~= nil then -- Added Error catch.
                                        v.CFrame = (item:FindFirstChildOfClass("Model"):FindFirstChild(v.Name).CFrame) or CFrame.new()
                                    end
                                end
                            end
                        end
                    end
                else
                    FakePart = item:Clone() -- if not found clone and add to viewportframe
                    FakePart.Parent = ViewportFrame
                end
            end
            RenderStepped:Wait()
        end
    end))
    --[[
    -- debugging shit un comment this if something breaks
    local out = ""
    local args = {suc}
    for i,v in pairs(args) do
        out = tostring(out) .. tostring(v)
    end
    local args = {err2}
    for i,v in pairs(args) do
        out = tostring(out) .. tostring(v)
    end
    rconsoleerr(tostring(out) .. "\n")
    --]]
end

return ESPLIB
