getgenv().SecureMode = true
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Dinosaurbrohub",
   LoadingTitle = "dusty trip",
   LoadingSubtitle = "by awdtheman11",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = nil,
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})







-- Create the main tab and button
local Main = Window:CreateTab("Main") -- Title, Image
local Paragraph = Main:CreateParagraph({Title = "by awdtheman11", Content = "Welcome to dinosaurbrohub. Your version of this script (varies by script) is 'Dino_alpha.1.29_release_1.' Script name: dusty trip. Welcome aboard!"})
local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer
local isTweening = false

-- Function to get the closest road part to a given position
local function getClosestRoadPart(position)
    local closestPart = nil
    local closestDistance = math.huge
    
    -- Iterate through all parts in the "Roads" folder
    for _, roadPart in ipairs(game.Workspace.Map.Roads:GetChildren()) do
        local distance = (roadPart.Position - position).Magnitude
        if distance < closestDistance then
            closestPart = roadPart
            closestDistance = distance
        end
    end
    
    return closestPart
end

-- Function to teleport the player to the closest road part
local function teleportToClosestRoadPart()
    local character = player.Character
    if character then
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            -- Get the closest road part to the player's current position
            local closestPart = getClosestRoadPart(humanoidRootPart.Position)
            if closestPart then
                -- Teleport the player to the closest road part
                humanoidRootPart.CFrame = CFrame.new(closestPart.Position)
            end
        end
    end
end

-- Function to continuously teleport the player to the nearest road part
local function continuousTeleportation()
    while true do
        if isTweening then
            teleportToClosestRoadPart()
            wait(0.01)
        else
            wait(0.01)
        end
    end
end

-- Function to tween the player to the target location
local function tweenToTarget(targetPosition, speed)
    isTweening = true
    
    -- Get the player's character and humanoid root part
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    
    -- Calculate the distance to the target position
    local distance = (targetPosition - humanoidRootPart.Position).Magnitude
    
    -- Create a tween
    local tweenInfo = TweenInfo.new(
        distance / speed, -- Duration based on distance and speed
        Enum.EasingStyle.Linear,
        Enum.EasingDirection.Out
    )
    
    local tween = TweenService:Create(humanoidRootPart, tweenInfo, {CFrame = CFrame.new(targetPosition)})
    
    -- Play the tween
    tween:Play()
    
    -- Print "arrived" upon completion
    tween.Completed:Connect(function()
        print("arrived")
        isTweening = false -- Stop teleporting to road when tweening is complete
    end)
end

-- Start the continuous teleportation loop
spawn(continuousTeleportation)

-- Buttons for different tween speeds
local buttons = {
    {
        Name = "Tween to 10000m (normal)",
        Speed = 350,
    },
    {
        Name = "Tween to 10000m (slow)",
        Speed = 150,
    },
    
     {
        Name = "Tween to 10000m (ultra slow)",
        Speed = 35,
    }
}

-- Create buttons
for _, btn in ipairs(buttons) do
    Main:CreateButton({
        Name = btn.Name,
        Callback = function()
            local closestPart = getClosestRoadPart(player.Character.HumanoidRootPart.Position)
            if closestPart then
                local targetPosition = Vector3.new(270, closestPart.Position.Y + 100, -51867)
                tweenToTarget(targetPosition, btn.Speed)
            else
                print("No road part found.")
            end
        end,
    })
end


local Button = Main:CreateButton({
    Name = "Get all items in your area",
    Callback = function()
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        local torsoCFrame = humanoidRootPart.CFrame
        
        -- Get all item names from the items folder
        local itemsFolder = game.ReplicatedStorage:WaitForChild("items")
        local itemNames = {}
        for _, item in ipairs(itemsFolder:GetChildren()) do
            table.insert(itemNames, item.Name)
        end
        
        -- Search game.Workspace for models with names matching those in the items folder
        for _, itemName in ipairs(itemNames) do
            local model = game.Workspace:FindFirstChild(itemName)
            if model and model:IsA("Model") then
                -- Teleport the part inside the model to the player's torso
                local part = model:FindFirstChildWhichIsA("BasePart")
                if part then
                    part.CFrame = torsoCFrame
                else
                    warn("No BasePart found inside model:", model.Name)
                end
            end
        end
        
        print("Items teleported to player's torso position")
    end,
})






local OtherScripts = Window:CreateTab("Other Scripts") -- Title, Image 
local Universal = Window:CreateTab("Universal") -- Title, Image 
local Button = OtherScripts:CreateButton({
    Name = "Lightning hub",
    Callback = function()
    loadstring(game:HttpGet(('https://pastebin.com/raw/CSC0Ky7Z'),true))()
    end,
})
local Button = Universal:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source",true))()
    end,
})
