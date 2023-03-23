local Loading = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local Bar = Instance.new("Frame")
local Filler = Instance.new("Frame")
local Gradient = Instance.new("UIGradient")
local Percent = Instance.new("TextLabel")
local Title = Instance.new("TextLabel")
local Gradient_2 = Instance.new("UIGradient")
local ImageLabel = Instance.new("ImageLabel")

--Properties:

Loading.Name = "Loading"
Loading.Parent = game.CoreGui
Loading.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Loading.ResetOnSpawn = false

Background.Name = "Background"
Background.Parent = Loading
Background.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
Background.AnchorPoint = Vector2.new(0.5, 0.5)
Background.BorderColor3 = Color3.fromRGB(136, 0, 190)
Background.Position = UDim2.new(0.296296299, 0, 0.289435595, 0)
Background.Size = UDim2.new(0, 285, 0, 291)

local cam = workspace.CurrentCamera
local x = cam.ViewportSize.X
local y = cam.ViewportSize.Y
local newx = math.floor(x * 0.5)
local newy = math.floor(y * 0.5)
Background.Position = UDim2.new(0,newx,0,newy)

Bar.Name = "Bar"
Bar.Parent = Background
Bar.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
Bar.BorderColor3 = Color3.fromRGB(29, 29, 29)
Bar.Position = UDim2.new(0.056140352, 0, 0.749140918, 0)
Bar.Size = UDim2.new(0, 253, 0, 19)

Filler.Name = "Filler"
Filler.Parent = Bar
Filler.BackgroundColor3 = Color3.fromRGB(120, 10, 156)
Filler.BorderColor3 = Color3.fromRGB(120, 10, 156)
Filler.BorderSizePixel = 0
Filler.Size = UDim2.new(0, 0, 0, 19)

Gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(114, 39, 167)), ColorSequenceKeypoint.new(0.01, Color3.fromRGB(112, 42, 167)), ColorSequenceKeypoint.new(0.56, Color3.fromRGB(109, 50, 167)), ColorSequenceKeypoint.new(0.77, Color3.fromRGB(112, 47, 167)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(139, 26, 167))}
Gradient.Name = "Gradient"
Gradient.Parent = Filler

Percent.Name = "Percent"
Percent.Parent = Bar
Percent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Percent.BackgroundTransparency = 1.000
Percent.Position = UDim2.new(0.0237154141, 0, -0.888225377, 0)
Percent.Size = UDim2.new(0, 24, 0, 16)
Percent.Font = Enum.Font.Sarpanch
Percent.Text = " %0"
Percent.TextColor3 = Color3.fromRGB(255, 255, 255)
Percent.TextSize = 20.000

Title.Name = "Title"
Title.Parent = Background
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0.32882455, 0, -0.000860787928, 0)
Title.Size = UDim2.new(0, 85, 0, 36)
Title.Font = Enum.Font.Gotham
Title.Text = "Sync"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 23.000
Title.TextWrapped = true

Gradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(70, 70, 70)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(167, 167, 167))}
Gradient_2.Rotation = 90
Gradient_2.Name = "Gradient"
Gradient_2.Parent = Background

ImageLabel.Parent = Background
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BorderColor3 = Color3.fromRGB(70, 70, 70)
ImageLabel.Position = UDim2.new(0.301754385, 0, 0.254295528, 0)
ImageLabel.Size = UDim2.new(0, 100, 0, 100)
ImageLabel.Image = "http://www.roblox.com/asset/?id=10442134819"

-- Scripts:

local function GTWAFV_fake_script() -- Loading.Client 
    local script = Instance.new('LocalScript', Loading)

    local gui = script.Parent
    local background = gui:WaitForChild("Background")
    local bar = background:WaitForChild("Bar")
    local filler = bar:WaitForChild("Filler")
    local percentage = bar:WaitForChild("Percent")
    --wait
    wait(0.2)
    --wait end
for i = 1, 100 do
	wait(0.08)
	percentage.Text = i.."%"
	
	local formula = i/100
	
	filler:TweenSize(UDim2.new(formula, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
	
	if i == 34 or i == 67 or i == 88 then
		wait(0.2)
		end
		if i == 100 then
       	   Background:Destroy() wait(0)

getgenv().SyncDemoBulletTP = nil
 local character = script.Parent
 local runService = game:GetService("RunService")
  offset = game.Players.LocalPlayer.Character.Humanoid.CameraOffset

runService.Heartbeat:Connect(function()
    if getgenv().SyncDemoBulletTP then
 old_vel = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

game.Players.LocalPlayer.Character.Humanoid.CameraOffset = Vector3.new(0,-79.7,0)


game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(old_vel.X,100,old_vel.Z)
end
end)

runService.RenderStepped:Connect(function()
if getgenv().SyncDemoBulletTP then

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(old_vel.X,old_vel.Y,old_vel.Z)
end
end)


_G.Key = Enum.KeyCode.Q
_G.PredictionVelocity = 0.140
_G.AimPart = "HumanoidRootPart"
_G.AirshotFunc = false
_G.Smoothing = false
_G.Smoothness = 0.0355
_G.AutoPrediction = false
--
_G.Enabled = nil
--
_G.Toggled = nil
--


                        
    
        
        

       function GetClosestPlayer()
        local closestPlayer
        local shortestDistance = 138

        for i, v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("LowerTorso") then
                local pos =  workspace.CurrentCamera:WorldToViewportPoint(v.Character.PrimaryPart.Position)
                local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(game.Players.LocalPlayer:GetMouse().X, game.Players.LocalPlayer:GetMouse().Y)).magnitude
                if magnitude < shortestDistance then
                    closestPlayer = v
                    shortestDistance = magnitude
                end
            end
        end
        return closestPlayer
    end



    game:GetService("UserInputService").InputBegan:Connect(function(keygo)
           if (keygo.KeyCode == _G.Key) then
               Toggled = not Toggled
               if Toggled then
               Plr =  GetClosestPlayer()
end
         end
           
end)
game:GetService("RunService").RenderStepped:Connect(function()
if _G.Smoothing and _G.Enabled and Toggled == true then
    local Main = CFrame.new(workspace.CurrentCamera.CFrame.p, Plr.Character[_G.AimPart].Position + Plr.Character[_G.AimPart].Velocity*_G.Predicting)
                                 workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(Main, _G.Smoothness, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut)
                            elseif _G.Smoothing == false and _G.Enabled and Toggled == true then
    workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, Plr.Character[_G.AimPart].Position + Plr.Character[_G.AimPart].Velocity*_G.Predicting)
                            end

end)
task.spawn(function()
   	while wait() do
	if _G.AutoPrediction == true then
        local pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
        local split = string.split(pingvalue,'(')
        local ping = tonumber(split[1])
        if ping < 130 then
            _G.Predicting = 0.14737
        elseif ping < 125 then
           _G.Predicting = 0.147636
        elseif ping < 110 then
            _G.Predicting = 0.147535
        elseif ping < 105 then
            _G.Predicting = 0.14535
        elseif ping < 90 then
            _G.Predicting = 0.1433333
        elseif ping < 80 then
            _G.Predicting = 0.1433392
        elseif ping < 70 then
            _G.Predicting = 0.136
        elseif ping < 60 then
            _G.Predicting = 0.136
        elseif ping < 50 then
            _G.Predicting = 0.1225
        elseif ping < 40 then
            _G.Predicting = 0.125
        end
	end
    end
end)


if _G.AirshotFunc == true then
    
                if Plr.Character.Humanoid.Jump == true and Plr.Character.Humanoid.FloorMaterial == Enum.Material.Air then
                    _G.AimPart = _G.AirshotPart
                else
                    Plr.Character:WaitForChild("Humanoid").StateChanged:Connect(function(old,new)
                        if new == Enum.HumanoidStateType.Freefall then
                        _G.AimPart = _G.AirshotPart
                        else
                            _G.AimPart = _G.AimPart
                        end
                    end)
                end
            end
if _G.PredictMovement == true then
                            if _G.Smoothness == true then
                                --// The part we're going to lerp/smoothen \\--
                                local Main = CF(Camera.CFrame.p, AimlockTarget.Character[_G.AimPart].Position + AimlockTarget.Character[_G.AimPart].Velocity*PredictionVelocity)
                                
                                --// Making it work \\--
                                Camera.CFrame = Camera.CFrame:Lerp(Main, _G.Smoothing, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut)
                            else
                                Camera.CFrame = CF(Camera.CFrame.p, AimlockTarget.Character[_G.AimPart].Position + AimlockTarget.Character[_G.AimPart].Velocity*PredictionVelocity)
                            end
                        elseif _G.PredictMovement == false then 
                            if _G.Smoothness == true then
                                --// The part we're going to lerp/smoothen \\--
                                local Main = CF(Camera.CFrame.p, AimlockTarget.Character[_G.AimPart].Position)

                                --// Making it work \\--
                                Camera.CFrame = Camera.CFrame:Lerp(Main, _G.Smoothing, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut)
                            else
                                Camera.CFrame = CF(Camera.CFrame.p, AimlockTarget.Character[_G.AimPart].Position)
                            end
                        end
        
        



local ResolverSettings = {
    NegativeCFrame = false,
    Confusion = false,
    VelocityAA = false
}
 local character = script.Parent
 local runService = game:GetService("RunService")
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Sync Beta", HidePremium = false, SaveConfig = true, ConfigFolder = "Sync Configs"})
local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Tab1 = Window:MakeTab({
	Name = "Rage",
	Icon = "http://www.roblox.com/asset/?id=8850953349",
	PremiumOnly = false
})
OrionLib:MakeNotification({
	Name = "Sync",
	Content = "Welcome, Thanks for choosing Sync! / Beta",
	Image = "rbxassetid://4483345998",
	Time = 5
})
Tab:AddToggle({
	Name = "CamBot",
	Default = false,
	Callback = function(Value)
		_G.Toggled = Value
		_G.Enabled = Value
	end    
})
Tab:AddToggle({
	Name = "CamBot Auto-Set",
	Default = false,
	Callback = function(Value)
_G.AutoPrediction = Value
_G.AimPart = "HumanoidRootPart"
	end    
})
Tab:AddSlider({
	Name = "CamBot Prediction",
	Min = 0,
	Max = 0.2,
	Default = 0,
	Color = Color3.fromRGB(255,255,255),
	Increment = 0.001,
	ValueName = "Prediction Velocity",
	Callback = function(Value)
	_G.PredictionVelocity = Value
	end    
})


Tab:AddDropdown({
	Name = "CamBot Hit-Part",
	Default = "Hit-Part",
	Options = {"None","Head", "Body"},
	Callback = function(Value)
		if Value == "Head" then
				OrionLib:MakeNotification({
	Name = "Sync",
	Content = "Head Selected!",
	Image = "rbxassetid://4483345998",
	Time = 5
})
		_G.AimPart = "Head"
		end
	  	if Value == "Body" then
	  	    		OrionLib:MakeNotification({
	Name = "Sync",
	Content = "Body Selected!",
	Image = "rbxassetid://4483345998",
	Time = 5
})
		_G.AimPart = "UpperTorso"
	  	end
		  	if Value == "None" then
		  	    	_G.AimPart = "Lol"
		OrionLib:MakeNotification({
	Name = "Sync",
	Content = "None Selected!",
	Image = "rbxassetid://4483345998",
	Time = 5
})
		end  
	end    
})
Tab:AddToggle({
	Name = "CamBot Sensivity",
	Default = false,
	Callback = function(Value)
_G.Smoothing = Value
	end    
})
Tab:AddSlider({
	Name = "CamBot Sens-Value",
	Min = 0,
	Max = 0.2,
	Default = 0,
	Color = Color3.fromRGB(255,255,255),
	Increment = 0.001,
	ValueName = "CamBot Sens-Value",
	Callback = function(Value)
	_G.Smoothness = Value
	end    
})


Tab1:AddToggle({
	Name = "Bullet TP Beta",
	Default = false,
	Callback = function(Value)
getgenv().SyncDemoBulletTP = Value
	end    
})


local httpHook;
httpHook = hookfunction(game.HttpGet, function(self,...)
   local Args = {...}
   if Args[1] and type(Args[1]) == "string" then
       if Args[1]:match("checkPremium.php") then
           return "true"
       end
   end
   return httpHook(self,...)
end)
	end
end
end
coroutine.wrap(GTWAFV_fake_script)()
