
local placeId = game.PlaceId
	
--[[  i'll leave comments so its easy to understand stuff
also so that i can remember wheres stuff is
dont change functions, it wont work
oh hi welcome to my slap royale script
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
screenGui.Name = "Dinosaurbrohub"
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
titleText.Text = "Dino UI (Slap Battles)" -- Change to whatever you want
titleText.Parent = titleBar
---------------------FUNCTIONS-----------------------------------------
   local Items = {"Potion of Strength", "Bull's essence", "Speed Potion", "Boba", "Frog Potion", "Strength Brew", "Frog Brew", "Speed Brew"}

    local Lplr = game.Players.LocalPlayer

	local Time = tick()
	
	local Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/cheesynob39/R20-EXPLOITER/main/Files/Functions.lua"))()

 


if not game:IsLoaded() then
    
    game.Loaded:Wait()

end


if game.PlaceId == 9431156611 then 

if game:GetService("CoreGui"):FindFirstChild("Dinosaurbrohub") then 
    
         getgenv().Running = true

      else
    
          getgenv().Running = false
  
     end

    
if getgenv().Running  then
        
             
	warn("don't execute me multiple times")
		
		
    else

    local decal_codes = {
        
    ["http://www.roblox.com/asset/?id=9648769161"] = "4",

    ["http://www.roblox.com/asset/?id=9648765536"] = "2",

    ["http://www.roblox.com/asset/?id=9648762863"] = "3",

    ["http://www.roblox.com/asset/?id=9648759883"] = "9",

    ["http://www.roblox.com/asset/?id=9648755440"] = "8",

    ["http://www.roblox.com/asset/?id=9648752438"] = "2",

    ["http://www.roblox.com/asset/?id=9648749145"] = "8",

    ["http://www.roblox.com/asset/?id=9648745618"] = "3",

    ["http://www.roblox.com/asset/?id=9648742013"] = "7",

    ["http://www.roblox.com/asset/?id=9648738553"] = "8",

    ["http://www.roblox.com/asset/?id=9648734698"] = "2",

    ["http://www.roblox.com/asset/?id=9648730082"] = "6",

    ["http://www.roblox.com/asset/?id=9648723237"] = "3",

    ["http://www.roblox.com/asset/?id=9648718450"] = "6",

    ["http://www.roblox.com/asset/?id=9648715920"] = "6",

    ["http://www.roblox.com/asset/?id=9648712563"] = "2"
}

end
end
	

    local namecall
    namecall = hookmetamethod(game, "__namecall", function(self, ...)
        local Args = {...}
        if getnamecallmethod() == "FireServer" and tostring(self) == "WS" then
            return
        elseif getnamecallmethod() == "FireServer" and tostring(self) == "WS2" then
            return
        elseif getnamecallmethod() == "FireServer" and tostring(self) == "AdminGUI" then
            return
        elseif getnamecallmethod() == "FireServer" and tostring(self) == "Ban" then
            return
        end
        return namecall(self, ...)
    end)




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









UI.createSlider("Walkspeed", 16, 55, 16, function(sliderValue)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = sliderValue
end)












UI.createButton("Get All Items", function()
 if Lplr.Character.inMatch.Value and workspace:FindFirstChildWhichIsA("Tool") then
            
            for _, Items in ipairs(game.Workspace:GetDescendants()) do
                
                if Items:IsA("TouchTransmitter") and Items.Parent.Name == "Handle" then
                    Lplr.Character.Humanoid:EquipTool(Items.Parent.Parent)
                end
            end
            
            Lplr.Character.Humanoid:UnequipTools()
            
            else
        
                print("No Items")
                
        end
    end)





UI.createButton("Use Perm Items", function()

  for _, L_3 in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                
            if L_3:IsA("Tool") and table.find(Items, L_3.Name) then
                L_3.Parent = Lplr.Character
            end
                
        end
            
            task.wait(.3)
            
            for _, L_4 in pairs(Lplr.Character:GetChildren()) do
                
                if L_4:IsA("Tool") then
                    L_4:Activate()
                end
                
            end
    end)






UI.createButton("Bomb da bus", function()
for _, L_5 in ipairs(game.Workspace:GetDescendants()) do
				
				if L_5:IsA("TouchTransmitter") and L_5.Parent.Name == "Handle" and L_5.Parent.Parent.Name == "Bomb" and workspace:FindFirstChild("BusModel") then
					Lplr.Character.Humanoid:EquipTool(L_5.Parent.Parent)
				end
				
			end
			
			wait(.1)
			
			for _, L_6 in pairs(Lplr.Backpack:GetChildren()) do
				
				if L_6:IsA("Tool") and L_6.Name == "Bomb" then
					L_6.Parent = Lplr.Character
				end
				
			end
			
			wait(.25)
			
			for _, L_7 in pairs(Lplr.Character:GetChildren()) do
				
				if L_7:IsA("Tool") and L_7.Name == "Bomb" then
					L_7:Activate()
				end
				
			end
			
    end)






UI.createButton("chain", function()
 
    for i,v in ipairs(game:GetService("Workspace").Map:WaitForChild("CodeBrick"):WaitForChild("SurfaceGui"):GetDescendants()) do
        
        if v.Name == 'IMGTemplate' then
            
            local decal_url = tostring(v.Image)
            local code = decal_codes[decal_url]

            if 0 < #game:GetService("Workspace").Map:WaitForChild("OriginOffice").Door.Keypad.Display.SurfaceGui.TextLabel.Text then
                fireclickdetector(game:GetService("Workspace").Map:WaitForChild("OriginOffice").Door.Keypad.Buttons.Reset.ClickDetector)
            end

            task.wait(.2)

            fireclickdetector(game:GetService("Workspace").Map:WaitForChild("OriginOffice").Door.Keypad.Buttons[code].ClickDetector)
        end
    end

    task.wait(.2)

    fireclickdetector(game:GetService("Workspace").Map:WaitForChild("OriginOffice").Door.Keypad.Buttons.Enter.ClickDetector)

    end)







UI.createToggle("salmon aura", false, function(bool)
  slapAura = bool
		  
		  if bool == true then
		      
		    while slapAura == true do
					
				task.wait()
					
				for _, L_8 in pairs(game.Players:GetPlayers()) do
						
					if L_8 ~= Lplr then
						
						if L_8.Character:FindFirstChild("HumanoidRootPart") ~= nil and L_8.Character:FindFirstChild("Humanoid") and not L_8.Character:FindFirstChild("Dead")  and not Lplr.Character:FindFirstChild("Dead")  then
								
							local magnitude = (L_8.Character.HumanoidRootPart.Position - Lplr.Character.HumanoidRootPart.Position).Magnitude
						
								if 55 >= magnitude then
									game:GetService("ReplicatedStorage").Events.Slap:FireServer(L_8.Character.Torso)
								end
								
							end
						end
					end
		    end
			
		  end
		  
		end)



UI.createToggle("Anti green liquid", false, function(bool)
if bool == true then
            
        game.Workspace:FindFirstChild("antiAcid").CanCollide = true

        else
            
        game.Workspace:FindFirstChild("antiAcid").CanCollide = false
            
        end

	end)








-- Create a code executor textbox
UI.createTextbox("Code Executor", function(code)
-- Here, you can run the provided Lua code
local success, errorMsg = pcall(function()
    loadstring(code)()  -- Execute the Lua code
end)

if not success then
    warn("Error executing code:", errorMsg)
    game.StarterGui:SetCore("SendNotification", {
        Title = "Code Execution Error",
        Text = "Check the output for details.",
        Duration = 5
    })
else
    game.StarterGui:SetCore("SendNotification", {
        Title = "Code Executed",
        Text = "The code has been executed successfully.",
        Duration = 5
    })
end
end)

















print("Dinosaurbrohub BETA v1 Took " .. tick() - Time .. " Seconds To Load ") -- Load time





local antiAcid = Instance.new("Part", workspace)
	antiAcid.Name = "antiAcid"
	antiAcid.Size = Vector3.new(154, 26, 132)
	antiAcid.Position = Vector3.new(-60, -5, -731)
	antiAcid.Transparency = 1
	antiAcid.CanCollide = false
	antiAcid.Anchored = true
	
