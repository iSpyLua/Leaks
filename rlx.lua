local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/EvansScripts/rlx/main/WallyUwuWare.lua"))()

local sex = true
local window = library:CreateWindow('RLX') do
	local folder = window:AddFolder('Main') do
        --[[
		folder:AddToggle({ text = 'ESP', flag = 'esp' })
        ]]
            
		folder:AddBox({text = "Prediction", flag = "predictionFlag", value = "7", callback = function(g) timetoaim = g end})
		folder:AddBox({text = "Far Range Aim Height", flag = "aimheightFlag", value = "-0.6", callback = function(a) aimheight = a end})
		folder:AddBox({text = "Close Range Aim Height", flag = "aimHEIGHT2Flag", value = "-0.9", callback = function(b) aimheight2 = b end})
		
		folder:AddBind({text = "Far Range Bind", flag = "farBind", key = "Q", callback = function() print"far key pressed" end})
		folder:AddBind({text = "Close Range Bind", flag = "closeBind", key = "E", callback = function() print"close key pressed" end})
		folder:AddBind({text = "Key to hide GUI", flag = "keyHide", key = "Insert", callback = function() 
		        sex = not sex
		        window.main.Visible = sex
		    end})
	end
end

library:Init()
local plrs = game:GetService("Players")
local lplr = game:GetService("Players").LocalPlayer
local presskeytoaim = true
local aimkey = library.flags.farBind
local aimkey2 = library.flags.closeBind
aimbothider = true; aimbothiderspeed = .9
local Aim_Assist = false ; Aim_Assist_Key = {Enum.KeyCode.LeftControl, "z"}
local movementcounting = true
local movementcounting2 = true

local canaimat = true
local cam = game.Workspace.CurrentCamera
local BetterDeathCount = true
local aimheight = library.flags.aimheightFlag
local aimheight2 = library.flags.aimHEIGHT2Flag

local mouse = lplr:GetMouse()
local switch = false
local aimatpart = nil
local aimatpart2 = nil

local abs = math.abs


local uis = game:GetService("UserInputService")
mouse.KeyDown:Connect(function(a)
    a = a:lower() and a:upper()
	if a == aimkey then
		if not aimatpart then
			local maxangle = math.rad(20)
			for i, plr in pairs(plrs:GetChildren()) do
				if plr.Name ~= lplr.Name and plr.Character and plr.Character.Head and plr.Character.Humanoid and plr.Character.Humanoid.Health > 0 then
					if TeamBased == true then
						if plr.Team.Name ~= lplr.Team.Name then
							local an = checkfov(plr.Character.Head)
							if an < maxangle then
								maxangle = an
								aimatpart = plr.Character.Head
							end
						end
					else
						local an = checkfov(plr.Character.Head)
						if an < maxangle then
							maxangle = an
							aimatpart = plr.Character.Head
						end
						--print(plr)
					end
					local old = aimatpart
					plr.Character.Humanoid.Died:Connect(function()
						--print("died")
						if aimatpart and aimatpart == old then
							aimatpart = nil
						end
					end)

				end
			end
		else
			aimatpart = nil
			canaimat = false
			delay(1.1, function()
				canaimat = true
			end)
		end
	end
	if a == aimkey2 then
		if not aimatpart2 then
			local maxangle = math.rad(20)
			for i, plr in pairs(plrs:GetChildren()) do
				if plr.Name ~= lplr.Name and plr.Character and plr.Character.Head and plr.Character.Humanoid and plr.Character.Humanoid.Health > 0 then

					local an = checkfov(plr.Character.Head)
					if an < maxangle then
						maxangle = an
						aimatpart2 = plr.Character.Head
					end
					local old = aimatpart2
					plr.Character.Humanoid.Died:Connect(function()
						if aimatpart2 and aimatpart2 == old then
							aimatpart2 = nil
						end
					end)

				end
			end
		else
			aimatpart2 = nil
			canaimat = false
			delay(1.1, function()
				canaimat = true
			end)
		end
	end
end)

function getfovxyz (p0, p1, deg)
	local x1, y1, z1 = p0:ToOrientation()
	local cf = CFrame.new(p0.p, p1.p)
	local x2, y2, z2 = cf:ToOrientation()
	local d = math.deg
	if deg then
		return Vector3.new(d(x1-x2), d(y1-y2), d(z1-z2))
	else
		return Vector3.new((x1-x2), (y1-y2), (z1-z2))
	end
end


function aimat(part)
	if part then
		--print(part)
		local d = (cam.CFrame.p - part.CFrame.p).magnitude
		local calculatedrop
		local timetoaim = library.flags.predictionFlag
		local pos2 = Vector3.new()
		if movementcounting == true then
			pos2 = part.Velocity/timetoaim
		end
		local minuseddrop = (aimheight+50)/50
		if aimheight ~= 0 then
			calculatedrop = d - (d/minuseddrop)

		else
			calculatedrop = 0
		end
		--print(calculatedrop)
		local addative = Vector3.new()
		if movementcounting then
			addative = pos2
		end
		local cf = CFrame.new(cam.CFrame.p, (addative + part.CFrame.p+ Vector3.new(0, calculatedrop, 0)))
		if aimbothider == true or Aim_Assist == true then
			cam.CFrame = cam.CFrame:Lerp(cf, aimbothiderspeed)
		else

			cam.CFrame = cf
		end
		--print(cf)
	end
end

function aimat2(part)
	if part then
		--print(part)
		local d = (cam.CFrame.p - part.CFrame.p).magnitude
		local calculatedrop
		local timetoaim = library.flags.predictionFlag
		local pos2 = Vector3.new()
		if movementcounting == true then
			pos2 = part.Velocity/timetoaim
		end
		local minuseddrop = (aimheight2+50)/50
		if aimheight2 ~= 0 then
			calculatedrop = d - (d/minuseddrop)

		else
			calculatedrop = 0
		end
		--print(calculatedrop)
		local addative = Vector3.new()
		if movementcounting then
			addative = pos2
		end
		local cf = CFrame.new(cam.CFrame.p, (addative + part.CFrame.p+ Vector3.new(0, calculatedrop, 0)))
		if aimbothider == true or Aim_Assist == true then
			cam.CFrame = cam.CFrame:Lerp(cf, aimbothiderspeed)
		else

			cam.CFrame = cf
		end
		--print(cf)
	end
end
function checkfov (part)
	local fov = getfovxyz(game.Workspace.CurrentCamera.CFrame, part.CFrame)
	local angle = math.abs(fov.X) + math.abs(fov.Y)
	return angle
end
pcall(function()
	delay(0, function()
		while wait(.32) do
			if Aim_Assist and not aimatpart and canaimat and lplr.Character and lplr.Character.Humanoid and lplr.Character.Humanoid.Health > 0 then
				for i, plr in pairs(plrs:GetChildren()) do


					local minangle = math.rad(5.5)
					local lastpart = nil
					local function gg(plr)
						pcall(function()
							if plr.Name ~= lplr.Name and plr.Character and plr.Character.Humanoid and plr.Character.Humanoid.Health > 0 and plr.Character.Head then
								local raycasted = false
								local cf1 = CFrame.new(cam.CFrame.p, plr.Character.Head.CFrame.p) * CFrame.new(0, 0, -4)
								local r1 = Ray.new(cf1.p, cf1.LookVector * 9000)
								local obj, pos = game.Workspace:FindPartOnRayWithIgnoreList(r1,  {lplr.Character.Head})
								local dist = (plr.Character.Head.CFrame.p- pos).magnitude
								if dist < 4 then
									raycasted = true
								end
								if raycasted == true then
									local an1 = getfovxyz(cam.CFrame, plr.Character.Head.CFrame)
									local an = abs(an1.X) + abs(an1.Y)
									if an < minangle then
										minangle = an
										lastpart = plr.Character.Head
									end
								end
							end
						end)
					end
					if TeamBased then
						if plr.Team.Name ~= lplr.Team.Name then
							gg(plr)
						end
					else
						gg(plr)
					end
					--print(math.deg(minangle))
					if lastpart then
						aimatpart = lastpart
						aimatpart.Parent.Humanoid.Died:Connect(function()
							if aimatpart == lastpart then
								aimatpart = nil
							end
						end)

					end
				end
			
			end
		end
	end)
end)

local oldheadpos
local lastaimapart

local oldheadpos2
local lastaimapart2
game:GetService("RunService").RenderStepped:Connect(function(dt)
    aimheight = library.flags.aimheightFlag
    aimheight2 = library.flags.aimHEIGHT2Flag
    aimkey = library.flags.farBind
    aimkey2 = library.flags.closeBind
	if aimatpart and lplr.Character and lplr.Character.Head then
		if BetterDeathCount and lastaimapart and lastaimapart == aimatpart then
			local dist = (oldheadpos - aimatpart.CFrame.p).magnitude
			if dist > 40 then
				aimatpart = nil
			end
		end
		lastaimapart = aimatpart
		oldheadpos = lastaimapart.CFrame.p
		do 
			if aimatpart.Parent == plrs.LocalPlayer.Character then
				aimatpart = nil
			end
			aimat(aimatpart)
			pcall(function()
				if Aim_Assist == true then
					local cf1 = CFrame.new(cam.CFrame.p, aimatpart.CFrame.p) * CFrame.new(0, 0, -4)
					local r1 = Ray.new(cf1.p, cf1.LookVector * 1000)
					local obj, pos = game.Workspace:FindPartOnRayWithIgnoreList(r1,  {lplr.Character.Head})
					local dist = (aimatpart.CFrame.p- pos).magnitude
					if obj then
						--print(obj:GetFullName())
					end
					if not obj or dist > 6 then
						aimatpart = nil
						--print("ooof")
					end
					canaimat = false
					delay(.5, function()
						canaimat = true
					end)
				end
			end)
		end



	end
	
	if aimatpart2 and lplr.Character and lplr.Character.Head then
		if BetterDeathCount and lastaimapart2 and lastaimapart2 == aimatpart2 then
			local dist = (oldheadpos2 - aimatpart2.CFrame.p).magnitude
			if dist > 40 then
				aimatpart2 = nil
			end
		end
		lastaimapart2 = aimatpart2
		oldheadpos2 = lastaimapart2.CFrame.p
		do 
			if aimatpart2.Parent == plrs.LocalPlayer.Character then
				aimatpart2 = nil
			end
			aimat(aimatpart2)
			aimat2(aimatpart2)
			pcall(function()
				if Aim_Assist == true then
					local cf1 = CFrame.new(cam.CFrame.p, aimatpart2.CFrame.p) * CFrame.new(0, 0, -4)
					local r1 = Ray.new(cf1.p, cf1.LookVector * 1000)
					local obj, pos = game.Workspace:FindPartOnRayWithIgnoreList(r1,  {lplr.Character.Head})
					local dist = (aimatpart2.CFrame.p- pos).magnitude
					if obj then
						--print(obj:GetFullName())
					end
					if not obj or dist > 6 then
						aimatpart2 = nil
						--print("ooof")
					end
					canaimat = false
					delay(.5, function()
						canaimat = true
					end)
				end
			end)
		end



	end
end)

local Target = "username"


local Y = -0
game:GetService("RunService").RenderStepped:Connect(function()
    for i,v in pairs(game.Players:GetPlayers()) do
        Target = v.Name 
        if Target ~= game.Players.LocalPlayer.Name then
        old_vel = game.Players[Target].Character.HumanoidRootPart.Velocity
        game.Players[Target].Character.HumanoidRootPart.Velocity = Vector3.new(old_vel.X, Y, old_vel.Z)
    end
    end
end)
