# Quick Links
  * [Veynx UI Lib](#Veynx-UI-Lib)
  * [Dark Material UI Lib](#Dark-Material-UI-Lib)
  * [MaterialUI Lib](#Material-UI-Lib)

## Veynx UI Lib:
```lua
-- init
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/SkyeX9/UI-Libraries/master/VeynxLib.lua"))()
local venyx = library.new("Venyx", 5013109572)

-- themes
local themes = {
Background = Color3.fromRGB(24, 24, 24),
Glow = Color3.fromRGB(0, 0, 0),
Accent = Color3.fromRGB(10, 10, 10),
LightContrast = Color3.fromRGB(20, 20, 20),
DarkContrast = Color3.fromRGB(14, 14, 14),  
TextColor = Color3.fromRGB(255, 255, 255)
}

-- first page
local page = venyx:addPage("Test", 5012544693)
local section1 = page:addSection("Section 1")
local section2 = page:addSection("Section 2")

section1:addToggle("Toggle", nil, function(value)
print("Toggled", value)
end)
section1:addButton("Button", function()
print("Clicked")
end)
section1:addTextbox("Notification", "Default", function(value, focusLost)
print("Input", value)

if focusLost then
venyx:Notify("Title", value)
end
end)

section2:addKeybind("Toggle Keybind", Enum.KeyCode.One, function()
print("Activated Keybind")
venyx:toggle()
end, function()
print("Changed Keybind")
end)
section2:addColorPicker("ColorPicker", Color3.fromRGB(50, 50, 50))
section2:addColorPicker("ColorPicker2")
section2:addSlider("Slider", 0, -100, 100, function(value)
print("Dragged", value)
end)
section2:addDropdown("Dropdown", {"Hello", "World", "Hello World", "Word", 1, 2, 3})
section2:addDropdown("Dropdown", {"Hello", "World", "Hello World", "Word", 1, 2, 3}, function(text)
print("Selected", text)
end)
section2:addButton("Button")

-- second page
local theme = venyx:addPage("Theme", 5012544693)
local colors = theme:addSection("Colors")

for theme, color in pairs(themes) do -- all in one theme changer, i know, im cool
colors:addColorPicker(theme, color, function(color3)
venyx:setTheme(theme, color3)
end)
end

-- load
venyx:SelectPage(venyx.pages[1], true)
```

## Dark Material UI Lib: 
```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/SkyeX9/UI-Libraries/master/FaltMatUILib.lua", true))()

local Window = Library:CreateWindow("Miner's Haven")
local folder = Window:AddFolder('Main Features')

folder:AddLabel({text = "Ore Options"})
folder:AddToggle({text = "This is a toggle", callback = function(v) print(v) end})
folder:AddButton({text = 'button', callback = function() print('button clicked') end})
folder:AddBind{text = "Gayness",key = "F",hold = true}
folder:AddSlider({text = 'slider', min = 1, max = 100, dual = true, callback = function(v) print(v) end})
folder:AddList({text = 'option', values = {'yo', 'yes'}, callback = function(v) print(v) end})
folder:AddBox({text = 'text box', callback = function(v) print(v) end})
folder:AddColor({text = 'color', callback = function(v) print(v) end})
Library:Init()
```

## Material UI Lib: 
 ![JustARandomString1](https://i.imgur.com/11745MO.png)
```lua
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/SkyeX9/UILibTest/master/MaterialUI.lua"))()

local X = Material.Load({
    Title = "Material UI Lib Example",
    Style = 1,
    SizeX = 650,
    SizeY = 350,
    Theme = "Dark",
    ColorOverrides = {
        --MainFrame = Color3.fromRGB(235,235,235)
    }
})

local Y = X.New({
    Title = "Main Tab"
})

local Z = X.New({
    Title = "Second Tab"
})

local A = Y.Button({
    Text = "Kill All",
    Callback = function()
        print("hello")
    end,
    Menu = {
        Information = function(self)
            X.Banner({
                Text = "This function can get you banned in up-to-date servers; use at your own risk."
            })
        end
    }
})

local B = Y.Toggle({
    Text = "I'm a switch",
    Callback = function(Value)
        print(Value)
    end,
    Enabled = false
})

local C = Y.Slider({
    Text = "Slip and... you get the idea",
    Callback = function(Value)
        print(Value)
    end,
    Min = 200,
    Max = 400,
    Def = 300
})

local D = Y.Dropdown({
    Text = "Dropping care package",
    Callback = function(Value)
        print(Value)
    end,
    Options = {
        "Floor 1",
        "Floor 2",
        "Floor 3",
        "Floor 4",
        "Floor 5"
    },
    Menu = {
        Information = function(self)
            X.Banner({
                Text = "Test alert!"
            })
        end
    }
})

local E = Y.ChipSet({
    Text = "Chipping away",
    Callback = function(ChipSet)
        table.foreach(ChipSet, function(Option, Value)
            print(Option, Value)
        end)
    end,
    Options = {
        ESP = true,
        TeamCheck = false,
        UselessBool = {
            Enabled = true,
            Menu = {
                Information = function(self)
                    X.Banner({
                        Text = "This bool has absolutely no purpose whatsoever."
                    })
                end
            }
        }
    }
})

local F = Y.DataTable({
    Text = "Chipping away",
    Callback = function(ChipSet)
        table.foreach(ChipSet, function(Option, Value)
            print(Option, Value)
        end)
    end,
    Options = {
        ESP2 = true,
        TeamCheck2 = false,
        UselessBool2 = {
            Enabled = true,
            Menu = {
                Information = function(self)
                    X.Banner({
                        Text = "This bool ALSO has absolutely no purpose. Sorry."
                    })
                end
            }
        }
    }
})

local G = Z.ColorPicker({
    Text = "ESP Colour",
    Default = Color3.fromRGB(0,255,110),
    Callback = function(Value)
        print("RGB:", Value.R * 255, Value.G * 255, Value.B * 255)
    end,
    Menu = {
        Information = function(self)
            X.Banner({
                Text = "This changes the color of your ESP."
            })
        end
    }
})

local H = Z.TextField({
    Text = "Country",
    Callback = function(Value)
        print(Value)
    end,
    Menu = {
        GB = function(self)
            self.SetText("GB")
        end,
        JP = function(self)
            self.SetText("JP")
        end,
        KO = function(self)
            self.SetText("KO")
        end
    }
})
```
