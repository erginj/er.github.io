local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

if CoreGui:FindFirstChild("KeySystemUI") then
    CoreGui.KeySystemUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KeySystemUI"
ScreenGui.Parent = CoreGui
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(1, 0, 1, 0)
mainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
mainFrame.BackgroundTransparency = 1
mainFrame.Parent = ScreenGui

TweenService:Create(mainFrame, TweenInfo.new(1), {BackgroundTransparency = 0.2}):Play()

local function rainbowify(label)
	coroutine.wrap(function()
		while label and label.Parent do
			for i = 0, 1, 0.01 do
				label.TextColor3 = Color3.fromHSV(i, 1, 1)
				task.wait(0.03)
			end
		end
	end)()
end

local container = Instance.new("Frame")
container.Size = UDim2.new(0, 460, 0, 310)
container.Position = UDim2.new(0.5, -230, 0.5, -155)
container.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
container.BorderSizePixel = 0
container.Parent = mainFrame

local corner = Instance.new("UICorner", container)
corner.CornerRadius = UDim.new(0, 20)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 10)
title.BackgroundTransparency = 1
title.Text = "ENTER CODE"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.Parent = container
rainbowify(title)

local inputBox = Instance.new("TextBox")
inputBox.Size = UDim2.new(0.8, 0, 0, 50)
inputBox.Position = UDim2.new(0.1, 0, 0.3, 0)
inputBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
inputBox.TextColor3 = Color3.new(1, 1, 1)
inputBox.Font = Enum.Font.Gotham
inputBox.TextScaled = true
inputBox.ClearTextOnFocus = false
inputBox.Text = ""
inputBox.Parent = container

local round = Instance.new("UICorner", inputBox)
round.CornerRadius = UDim.new(0, 12)

local info = Instance.new("TextLabel")
info.Size = UDim2.new(1, -20, 0, 60)
info.Position = UDim2.new(0, 10, 0.55, 0)
info.BackgroundTransparency = 1
info.Font = Enum.Font.Gotham
info.TextWrapped = true
info.TextScaled = true
info.TextColor3 = Color3.new(1, 1, 1)
info.Text = "Made by Ringta and NotImportant\nJOIN DISCORD FOR KEY\nhttps://discord.gg/ringta"
info.Parent = container
rainbowify(info)

local result = Instance.new("TextLabel")
result.Size = UDim2.new(1, 0, 0, 40)
result.Position = UDim2.new(0, 0, 0.85, 0)
result.BackgroundTransparency = 1
result.Font = Enum.Font.GothamBold
result.TextScaled = true
result.TextColor3 = Color3.new(1, 0, 0)
result.Text = ""
result.Visible = false
result.Parent = container
rainbowify(result)

inputBox.FocusLost:Connect(function(enterPressed)
	if not enterPressed then return end
	local input = inputBox.Text:lower()

	if input == "RINGTA" then
		result.Text = "CORRECT KEY!"
		result.TextColor3 = Color3.new(0, 1, 0)
		result.Visible = true
		wait(1)

		TweenService:Create(mainFrame, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
		for _, obj in ipairs(container:GetDescendants()) do
			if obj:IsA("TextLabel") or obj:IsA("TextBox") then
				TweenService:Create(obj, TweenInfo.new(1), {TextTransparency = 1, BackgroundTransparency = 1}):Play()
			end
		end
		wait(1)
		ScreenGui:Destroy()

		loadstring(game:HttpGet('https://raw.githubusercontent.com/erginj/airweld.github.io/refs/heads/main/weld.lua'))()
	else
		result.Text = "WRONG CODE! JOIN UP GNG"
		result.TextColor3 = Color3.new(1, 0, 0)
		result.Visible = true
	end
end)
