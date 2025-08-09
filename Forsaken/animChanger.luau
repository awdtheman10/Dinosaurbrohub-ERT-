-- still fe
-- v2

if _G.loaded and typeof(_G.loaded) == "function" then
    _G.loaded()
end

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
assert(player, "LocalPlayer not found")

local humanoid, animator
local currentAnimName = nil

local animIds = {
	idle = "rbxassetid://105880087711722",
	walk = "rbxassetid://81193817424328",
	run = "rbxassetid://132653655520682",
}

local animations = {}

local function playAnim(animName)
	if currentAnimName == animName then return end

	if animations[currentAnimName] then
		pcall(function()
			animations[currentAnimName]:Stop()
			animations[currentAnimName]:Destroy()
		end)
		animations[currentAnimName] = nil
	end

	local anim = Instance.new("Animation")
	anim.AnimationId = animIds[animName]
	local track = animator:LoadAnimation(anim)
	track.Looped = true
	track.Priority = Enum.AnimationPriority.Movement
	track:Play()

	animations[animName] = track
	currentAnimName = animName

	print("[Animation] Playing fresh:", animName)
end

local function setupCharacter(character)
	humanoid = character:WaitForChild("Humanoid")
	animator = humanoid:WaitForChild("Animator")

	local animateScript = character:FindFirstChild("Animate")
	if animateScript then
		animateScript:Destroy()
	end

	playAnim("idle")

	RunService.RenderStepped:Connect(function()
		if not humanoid or not humanoid.Parent then return end
		local rootPart = humanoid.RootPart or character:FindFirstChild("HumanoidRootPart")
		if not rootPart then return end

		local speed = Vector3.new(rootPart.Velocity.X, 0, rootPart.Velocity.Z).Magnitude
		local isMoving = speed > 0.1
		local isSprinting = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift)

		if not isMoving then
			playAnim("idle")
		elseif isSprinting then
			playAnim("run")
		else
			playAnim("walk")
		end
	end)
end

if player.Character then
	setupCharacter(player.Character)
end

player.CharacterAdded:Connect(setupCharacter)

local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AnimSwitcherGui"
screenGui.Parent = playerGui

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(0, 200, 0, 150)
scrollFrame.Position = UDim2.new(0, 50, 0, 50)
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
scrollFrame.BorderSizePixel = 0
scrollFrame.ScrollBarThickness = 6
scrollFrame.Parent = screenGui

local dragging, dragInput, dragStart, startPos

scrollFrame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = scrollFrame.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

scrollFrame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		local delta = input.Position - dragStart
		scrollFrame.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 5)
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Parent = scrollFrame

local function updateCanvasSize()
	local contentSize = listLayout.AbsoluteContentSize
	scrollFrame.CanvasSize = UDim2.new(0, 0, 0, contentSize.Y + 10)
end

listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateCanvasSize)

local jasonAnims = {
	idle = "rbxassetid://116050994905421",
	walk = "rbxassetid://93622022596108",
	run = "rbxassetid://93054787145505",
}

local function createButton(text, onClick)
	local button = Instance.new("TextButton")
	button.Size = UDim2.new(1, -10, 0, 40)
	button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
	button.BorderSizePixel = 0
	button.Text = text
	button.TextColor3 = Color3.new(1, 1, 1)
	button.Font = Enum.Font.SourceSansBold
	button.TextSize = 18
	button.LayoutOrder = #scrollFrame:GetChildren() + 1
	button.Parent = scrollFrame

	button.MouseButton1Click:Connect(onClick)
end

local function switchAnimSet(newAnimSet)
	animIds = newAnimSet
	playAnim("idle")
	print("[AnimSwitcher] Switched animation set.")
end

createButton("Enable jumping", function()
	player.Character:FindFirstChild("Humanoid").JumpPower = 30
end)

createButton("John Doe Anims", function()
	switchAnimSet({
		idle = "rbxassetid://105880087711722",
		walk = "rbxassetid://81193817424328",
		run = "rbxassetid://132653655520682",
	})
end)

createButton("Jason Anims", function()
	switchAnimSet(jasonAnims)
end)

_G.loaded = function()
	for _, track in pairs(animations) do
		pcall(function()
			track:Stop()
			track:Destroy()
		end)
	end
	if player.PlayerGui:FindFirstChild("AnimSwitcherGui") then
		playerGui.AnimSwitcherGui:Destroy()
	end
	animations = {}
	currentAnimName = nil

	for _, conn in pairs(cleanupFunctions or {}) do
		conn:Disconnect()
	end
	cleanupFunctions = {}
end
