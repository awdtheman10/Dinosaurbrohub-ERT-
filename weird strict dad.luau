
local placeId = game.PlaceId
	
--[[  i'll leave comments so its easy to understand stuff
also so that i can remember wheres stuff is
dont change functions, it wont work
oh hi welcome to my slap battles script
made by Dinosaurbro
if you use this, make sure to give me credits in your video (if its a video)
uh yeah hi
first real UI so dont mind that it sucks
and uh yeah, hi. if you see comments then yes, it's so i can remember where things are AND...
so you can understand things easy
if you see a "..." then it is meaning that it is continued on the next line of code.
--------------------USAGE---------------------
whilst exectuing this, it is UNDETECTED. don't think you'll get banned
oh yeah btw its completely safe, don't get mad at ME if YOU get banned.
this is my script and i don't want you to get banned
if you get banned, it has nothing to do with me
this is meant just for a cheat.
if you get your account banned (like roblox banned you) then thats your executor not working...
and its most likely a SHITTY executor.
speaking of executors, this was made using fluxus AND Visual Studio Code.
if you fail to use this script properly or you steal from me, i will blacklist you...
don't steal my stuff dipshit
using the script properly means DON'T REDISTRIBUTE IT without MY permission.
if you want permission to, on discord message the_giga_gorilla#2505. that is me...
and i will most likely say yes.
however, you MUST provide a reason to why you're redistributing it.
example: "I'm going to make a video on it to show people it and link it in discription."
if you make a youtube video on this, CREDIT ME, AND DON'T CLAIM IT AS YOURS.
that means, again, i will blacklist you from using this script.
if you want to make a website for it, go ahead BUT tell me before-hand so that i can help...
make it.
well, if you are still here, then it's almost the end.
NOW, IF YOU BREAK THE USAGE TERMS OF THIS SCRIPT, YOU WILL BE BLACKLISTED.
also, if you want to join our discord, click the "Copy Discord" button and paste...
the link in your browser.

also, if you steal my work then that is my work and you cannot claim it as yours...
or i will most likely warn you saying you're stealing my work for the whole world...
to see.

if you do steal my work, i WILL point you out to the whole world.
youtube: awd_theman
tiktok: awd_theman

cya
well, bye.




--------------------UPDATES--------------------
10/17/23: I got hacked, however I have got rid of the virus.
more soon
--------------------END--------------------------
--]]









-- UI Library Functions
local UI = {}

-- Create a variable to store UI elements
local uiElements = {}

-- Create a variable to track UI visibility
local uiVisible = false
local isFlying = false

-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game:GetService("CoreGui")

-- Create the main UI frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0.02, 320, 0, 215)  -- Adjusted height
mainFrame.BackgroundColor3 = Color3.new(0, 0, 0)  -- Black background
mainFrame.BorderSizePixel = 0
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
mainFrame.Parent = screenGui

-- Create a scrolling frame to contain UI elements
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, 0, 1, 0)  -- Occupy the entire main frame
scrollFrame.ScrollBarThickness = 12  -- Adjust the scroll bar thickness as needed
scrollFrame.Parent = mainFrame

-- Create the title bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.new(0, 1, 0)  -- black
titleBar.BorderSizePixel = 0
titleBar.Parent = scrollFrame

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, 0, 1, 0)
titleText.BackgroundColor3 = Color3.new(1, 5, 3)  -- White background
titleText.BorderSizePixel = 0
titleText.Text = "Dino UI (wsd)" -- Change to whatever you want
titleText.Parent = titleBar
---------------------FUNCTIONS-----------------------------------------






local function ToggleUI()
uiVisible = not uiVisible
mainFrame.Visible = uiVisible
if uiVisible == true then
    game.StarterGui:SetCore("SendNotification", {
        Title = "UI Opened",
        Text = "Press K to close UI",
        Duration = 5
    })
elseif uiVisible == false then
    game.StarterGui:SetCore("SendNotification", {
        Title = "UI Closed",
        Text = "Press K to open UI",
        Duration = 5
    })
    end
end













-- Function to create a button
function UI.createButton(text, action)
local button = Instance.new("TextButton")
button.Size = UDim2.new(1, 0, 0, 30)
button.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)  -- Dark grey background
button.BorderSizePixel = 0
button.Text = text
button.TextColor3 = Color3.new(1, 1, 1)
button.Parent = scrollFrame  -- Place buttons inside the scrolling frame

button.MouseButton1Click:Connect(action)

table.insert(uiElements, button)

UI.updateUIPositions()

return button
end

-- Detect "K" key presses to toggle UI
local UserInputService = game:GetService("UserInputService")
local kPressed = false

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
if not gameProcessedEvent and input.KeyCode == Enum.KeyCode.K then
    kPressed = true
    ToggleUI()
end
end)




-- Function to create a toggle
function UI.createToggle(title, initialState, action)
local toggleFrame = Instance.new("Frame")
toggleFrame.Size = UDim2.new(1, 0, 0, 30)
toggleFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
toggleFrame.BorderSizePixel = 0
toggleFrame.Parent = scrollFrame  -- Place toggles inside the scrolling frame

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(0, 100, 1, 0)
titleText.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
titleText.BorderSizePixel = 0
titleText.Text = title or "Toggle"
titleText.TextColor3 = Color3.new(1, 1, 1)
titleText.Parent = toggleFrame

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 70, 1, 0)
toggleButton.Position = UDim2.new(1, -70, 0, 0)
toggleButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
toggleButton.BorderSizePixel = 0
toggleButton.Text = initialState and "On" or "Off"
toggleButton.TextColor3 = initialState and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
toggleButton.Parent = toggleFrame

local toggleState = initialState

toggleButton.MouseButton1Click:Connect(function()
    toggleState = not toggleState
    toggleButton.Text = toggleState and "On" or "Off"
    toggleButton.TextColor3 = toggleState and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
    action(toggleState)
end)

table.insert(uiElements, toggleFrame)

UI.updateUIPositions()

return toggleFrame
end

-- Function to create a textbox
function UI.createTextbox(title, action)
local textboxFrame = Instance.new("Frame")
textboxFrame.Size = UDim2.new(1, 0, 0, 30)
textboxFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
textboxFrame.BorderSizePixel = 0
textboxFrame.Parent = scrollFrame  -- Place textboxes inside the scrolling frame

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(0, 100, 1, 0)
titleText.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
titleText.BorderSizePixel = 0
titleText.Text = title or "Textbox"
titleText.TextColor3 = Color3.new(1, 1, 1)
titleText.Parent = textboxFrame

local executeButton = Instance.new("TextButton")
executeButton.Size = UDim2.new(0, 70, 1, 0)
executeButton.Position = UDim2.new(1, -70, 0, 0)
executeButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
executeButton.BorderSizePixel = 0
executeButton.Text = "Execute"
executeButton.TextColor3 = Color3.new(1, 1, 1)
executeButton.Parent = textboxFrame

local codeTextbox = Instance.new("TextBox")
codeTextbox.Size = UDim2.new(1, -180, 1, 0)
codeTextbox.Position = UDim2.new(0, 100, 0, 0)
codeTextbox.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
codeTextbox.BorderSizePixel = 0
codeTextbox.Text = ""
codeTextbox.TextColor3 = Color3.new(1, 1, 1)
codeTextbox.Parent = textboxFrame

executeButton.MouseButton1Click:Connect(function()
    local code = codeTextbox.Text
    action(code)
end)

table.insert(uiElements, textboxFrame)

UI.updateUIPositions()

return textboxFrame
end

-- Function to create a slider
function UI.createSlider(title, minValue, maxValue, initialValue, action)
local sliderFrame = Instance.new("Frame")
sliderFrame.Size = UDim2.new(1, 0, 0, 30)
sliderFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
sliderFrame.BorderSizePixel = 0
sliderFrame.Parent = scrollFrame  -- Place sliders inside the scrolling frame

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(0, 100, 1, 0)
titleText.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
titleText.BorderSizePixel = 0
titleText.Text = title or "Slider"
titleText.TextColor3 = Color3.new(1, 1, 1)
titleText.Parent = sliderFrame

local sliderValueText = Instance.new("TextLabel")
sliderValueText.Size = UDim2.new(0, 70, 1, 0)
sliderValueText.Position = UDim2.new(1, -70, 0, 0)
sliderValueText.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
sliderValueText.BorderSizePixel = 0
sliderValueText.Text = tostring(initialValue)
sliderValueText.TextColor3 = Color3.new(1, 1, 1)
sliderValueText.Parent = sliderFrame

local slider = Instance.new("TextButton")
slider.Size = UDim2.new(1, -180, 1, 0)
slider.Position = UDim2.new(0, 100, 0, 0)
slider.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
slider.BorderSizePixel = 0
slider.Text = ""
slider.Parent = sliderFrame

local sliderFill = Instance.new("Frame")
sliderFill.Size = UDim2.new((initialValue - minValue) / (maxValue - minValue), 0, 1, 0)
sliderFill.BackgroundColor3 = Color3.new(0, 1, 0)  -- Green fill color
sliderFill.BorderSizePixel = 0
sliderFill.Parent = slider

local isDragging = false

slider.MouseButton1Down:Connect(function()
    isDragging = true
end)

game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = false
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if isDragging then
        local mousePosition = input.Position.X
        local framePosition = slider.AbsolutePosition.X
        local frameSize = slider.AbsoluteSize.X
        local relativePosition = math.clamp((mousePosition - framePosition) / frameSize, 0, 1)
        local newValue = minValue + (maxValue - minValue) * relativePosition

        sliderFill.Size = UDim2.new(relativePosition, 0, 1, 0)
        sliderValueText.Text = tostring(math.floor(newValue))
        action(newValue)
    end
end)

table.insert(uiElements, sliderFrame)

UI.updateUIPositions()

return sliderFrame
end

-- Function to update UI element positions
function UI.updateUIPositions()
local yOffset = 30  -- Initial Y position offset

for _, element in ipairs(uiElements) do
    local overlapping = false

    for _, otherElement in ipairs(uiElements) do
        if element == otherElement then
            continue
        end

        local elementPosition = element.Position
        local otherElementPosition = otherElement.Position

        if elementPosition.Y.Offset < otherElementPosition.Y.Offset + otherElement.Size.Y.Offset and
            elementPosition.Y.Offset + element.Size.Y.Offset > otherElementPosition.Y.Offset then
            overlapping = true
            break
        end
    end

    if overlapping then
        yOffset = yOffset + element.Size.Y.Offset + 5  -- Add some spacing
    end

    element.Position = UDim2.new(0, 0, 0, yOffset)
    yOffset = yOffset + element.Size.Y.Offset
end

scrollFrame.CanvasSize = UDim2.new(0, 0, 0, yOffset)
end























































------------------------BUTTONS AND TOGGLES------------------------

















































-- Function to copy text to clipboard
local function copyToClipboard(text)
    if typeof(text) == "string" then
        local success, error = pcall(function()
            local clipboard = game:GetService("GuiService"):GetClass("Clipboard")
            clipboard:SetText(text)
        end)
        
        if not success then
            warn("Failed to copy text to clipboard:", error)
        end
    else
        warn("Text to copy is not a string.")
    end
end





























    game.StarterGui:SetCore("SendNotification", {
        Title = "Open/Close UI",
        Text = "Press K to open/close the UI",
        Duration = 15
    })



-- Walk Speed Slider
UI.createSlider("Walk Speed", 16, 35, 16, function(sliderValue)
game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").WalkSpeed = sliderValue
end)

-- Gravity Slider
UI.createSlider("Gravity", 0, 300, 196.2, function(sliderValue)
game.Workspace.Gravity = sliderValue
end)

-- Jump Power Slider
UI.createSlider("Jump Power", 0, 450, 50, function(sliderValue)
game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").JumpPower = sliderValue
end)



UI.createToggle("Infinite Oxygen", false, function(toggleState)
	while toggleState == true do
		wait()
		game:GetService("Players").LocalPlayer.Oxygen.Value = 100
	end
end)

UI.createToggle("Infinite Food", false, function(toggleState)
	while toggleState == true do
		wait()
		game:GetService("Players").LocalPlayer.Hunger.Value = 100
	end
end)

UI.createToggle("Infinite Water", false, function(toggleState)
	while toggleState == true do
		wait()
		game:GetService("Players").LocalPlayer.Thirst.Value = 100
	end
end)

