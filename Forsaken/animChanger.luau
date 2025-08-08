-- uh this is like v1
-- works on solara
-- its fe by the way (other people see the anims)
if _G.loaded and typeof(_G.loaded) == "function" then
    _G.loaded()
end


local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local cleanupFunctions = {}
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

local function playFreshAnimation(animName)
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
	track.Priority = Enum.AnimationPriority.Action
    track:Play()


	animations[animName] = track
	currentAnimName = animName

	print("[Animation] Playing fresh:", animName)
end

local function setupCharacter(character)
	humanoid = character:WaitForChild("Humanoid")
	animator = humanoid:WaitForChild("Animator")

	character:WaitForChild("Animate", 5):Destroy()
	playFreshAnimation("idle")

	RunService.RenderStepped:Connect(function()
		if not humanoid or not humanoid.Parent then return end
		local rootPart = humanoid.RootPart or character:FindFirstChild("HumanoidRootPart")
		if not rootPart then return end

		local speed = Vector3.new(rootPart.Velocity.X, 0, rootPart.Velocity.Z).Magnitude
		local isMoving = speed > 0.1
		local isSprinting = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift)

		if not isMoving then
			playFreshAnimation("idle")
		elseif isSprinting then
			playFreshAnimation("run")
		else
			playFreshAnimation("walk")
		end
	end)
end

if player.Character then
	setupCharacter(player.Character)
end

player.CharacterAdded:Connect(setupCharacter)

_G.loaded = function()
    if updateConnection then
        updateConnection:Disconnect()
        updateConnection = nil
    end

    for _, track in pairs(animations) do
        pcall(function()
            track:Stop()
            track:Destroy()
        end)
    end
    animations = {}
    currentAnimName = nil

    for _, conn in pairs(cleanupFunctions) do
        conn:Disconnect()
    end
    cleanupFunctions = {}
end
