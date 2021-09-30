# Quick Links
  * [CSGO-Like UI Lib](#CSGOLike-UI-Lib)
  * [Veynx UI Lib](#Veynx-UI-Lib)
  * [Dark Material UI Lib](#Dark-Material-UI-Lib)
  * [MaterialUI Lib](#Material-UI-Lib)

## CSGO-Like UI Lib:
```lua
local Config = {
    WindowName = "Example Library",
	Color = Color3.fromRGB(255,128,64),
	Keybind = Enum.KeyCode.RightBracket
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Roblox/main/BracketV3.lua"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

local Tab1 = Window:CreateTab("Example")
local Tab2 = Window:CreateTab("UI Settings")

local Section1 = Tab1:CreateSection("First Section")
local Section2 = Tab1:CreateSection("Second Section")
local Section3 = Tab2:CreateSection("Menu")
local Section4 = Tab2:CreateSection("Background")

local Label1 = Section1:CreateLabel("Label 1")
Label1:UpdateText("lol")
-------------
local Button1 = Section1:CreateButton("Button 1", function()
	print("Click Button 1")
end)
Button1:AddToolTip("Button 1 ToolTip")
-------------
local Toggle1 = Section1:CreateToggle("Toggle 1", nil, function(State)
	print(State)
end)
Toggle1:AddToolTip("Toggle 1 ToolTip")
Toggle1:CreateKeybind("Y", function(Key)
	print(Key)
end)

local TextBox1 = Section1:CreateTextBox("TextBox 1", "Only numbers", true, function(Value)
	print(Value)
end)
TextBox1:AddToolTip("Yes only numbers")
TextBox1:SetValue("new value here")
Section1:CreateTextBox("TextBox 1\nMultiline", "numbers and letters", false, function(String)
	print(String)
end)
-------------
local Slider1 = Section1:CreateSlider("Slider 1", 0,100,nil,true, function(Value)
	print(Value)
end)
Slider1:AddToolTip("Slider 1 ToolTip")
Slider1:SetValue(50)
-------------
local Dropdown1 = Section1:CreateDropdown("Dropdown 1", {"Option 1","Option 2","Option 3"}, function(String)
	print(String)
end)
Dropdown1:AddToolTip("Dropdown 1 ToolTip")
Dropdown1:SetOption("Option 1")
-------------
local Colorpicker1 = Section1:CreateColorpicker("Colorpicker 1", function(Color)
	print(Color)
end)
Colorpicker1:AddToolTip("Colorpicker 1 ToolTip")
Colorpicker1:UpdateColor(Color3.fromRGB(255,0,0))
-------------
Section2:CreateLabel("Label 2\nMultiline")
-------------
local Button2 = Section2:CreateButton("Button 2\nMultiline", function()
	print("Click Button 2")
end)
Button2:AddToolTip("Button 2 ToolTip\nMultiline")
-------------
local Toggle2 = Section2:CreateToggle("Toggle 2\nMultiline", nil, function(State)
	print(State)
end)
Toggle2:AddToolTip("Toggle 2 ToolTip\nMultiline")
Toggle2:CreateKeybind("U", function(Key)
	print(Key)
end)
-------------
local Slider2 = Section2:CreateSlider("Slider 2\nMultiline", 0,100,nil,false, function(Value)
	print(Value)
end)
Slider2:AddToolTip("Slider 2 ToolTip\nMultiline")
Slider2:SetValue(25)
-------------
local Dropdown2 = Section2:CreateDropdown("Dropdown 2\nMultiline", {"Option 4","Option 5","Option 6"}, function(String)
	print(String)
end)
Dropdown2:AddToolTip("Dropdown 2 ToolTip")
Dropdown2:SetOption("Option 6")
-------------
local Colorpicker2 = Section2:CreateColorpicker("Colorpicker 2\nMultiline", function(Color)
	print(Color)
end)
Colorpicker2:AddToolTip("Colorpicker 2 ToolTip")
Colorpicker2:UpdateColor(Color3.fromRGB(0,0,255))
-------------
local Toggle3 = Section3:CreateToggle("UI Toggle", nil, function(State)
	Window:Toggle(State)
end)
Toggle3:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)
	Config.Keybind = Enum.KeyCode[Key]
end)
Toggle3:SetState(true)

local Colorpicker3 = Section3:CreateColorpicker("UI Color", function(Color)
	Window:ChangeColor(Color)
end)
Colorpicker3:UpdateColor(Config.Color)

-- credits to jan for patterns
local Dropdown3 = Section4:CreateDropdown("Image", {"Default","Hearts","Abstract","Hexagon","Circles","Lace With Flowers","Floral"}, function(Name)
	if Name == "Default" then
		Window:SetBackground("2151741365")
	elseif Name == "Hearts" then
		Window:SetBackground("6073763717")
	elseif Name == "Abstract" then
		Window:SetBackground("6073743871")
	elseif Name == "Hexagon" then
		Window:SetBackground("6073628839")
	elseif Name == "Circles" then
		Window:SetBackground("6071579801")
	elseif Name == "Lace With Flowers" then
		Window:SetBackground("6071575925")
	elseif Name == "Floral" then
		Window:SetBackground("5553946656")
	end
end)
Dropdown3:SetOption("Default")

local Colorpicker4 = Section4:CreateColorpicker("Color", function(Color)
	Window:SetBackgroundColor(Color)
end)
Colorpicker4:UpdateColor(Color3.new(1,1,1))

local Slider3 = Section4:CreateSlider("Transparency",0,1,nil,false, function(Value)
	Window:SetBackgroundTransparency(Value)
end)
Slider3:SetValue(0)

local Slider4 = Section4:CreateSlider("Tile Scale",0,1,nil,false, function(Value)
	Window:SetTileScale(Value)
end)
Slider4:SetValue(0.5)
```

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
section2:addDropdown("Dropdown", {
	"Hello",
	"World",
	"Hello World",
	"Word",
	1,
	2,
	3
})
section2:addDropdown("Dropdown", {
	"Hello",
	"World",
	"Hello World",
	"Word",
	1,
	2,
	3
}, function(text)
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
