--// variables
local screenUI = Instance.new("ScreenGui",game.Players.LocalPlayer.PlayerGui)
local textbox = Instance.new("TextBox",screenUI)
local is = game:GetService("UserInputService")
screenUI.ResetOnSpawn = false

--// colors
textbox.BackgroundColor3 = Color3.new(0,0,0)
textbox.BorderColor3 = Color3.new(0,0,0)

--// scaling
textbox.Position = UDim2.new(0.86,0,0.9,0)
textbox.Size = UDim2.new(0,200,0,50)

--// text
textbox.Font = Enum.Font.Code
textbox.TextColor3 = Color3.new(1,1,1)
textbox.Text = ""
textbox.TextSize = 20
textbox.TextScaled = true
textbox.PlaceholderText = "Names are case-sensitive"

--// commands

local commands = {"out", "freeze", "lag", "forceleave", "panic", "setsplitter", "unfreeze", "febring", "commands", "speed", "version", "getobjname", "getplayernames", "tpto"} --// commands 


local splitter = "#" --// this is the character that splits the command. For example: "freeze*splitter*playername" *splitter* is the character you have set it to.


is.InputBegan:Connect(function(inp) --// Executes everything when the return (enter) key is pressed
	if inp.KeyCode == Enum.KeyCode.Return then

		local cmd = textbox.Text:split(splitter) --// the whole command, split into 2 pieces
		local action = string.lower(cmd[1]) --// the command
		local plr = cmd[2] --// usually the player, can be numbers or strings

		if action == commands[2] then --// Loops through the targets character, if it finds a part it anchores it.
			for i,v in pairs(game.Players:FindFirstChild(plr).Character:GetChildren()) do
				if v:IsA("Part") then
					v.Anchored = true
				end
			end
		end

		if action == commands[1] then
			print(plr) --// Prints out plr
		end

		if action == commands[3] then
			settings().Network.IncomingReplicationLag = plr --// Sets the Incoming Replication Lag to plr
		end

		if action == commands[4] then
			game.Players.LocalPlayer:Kick("force leave called")
		end

		if action == commands[5] then
			screenUI:Destroy() --// Self explanatory
		end

		if action == commands[6] then
			splitter = plr --// Sets the splitter to plr
		end

		if action == commands[7] then
			for i,v in pairs(game.Players:FindFirstChild(plr).Character:GetChildren()) do --// Loops through the targets character, if it finds a part it unanchores it.
				if v:IsA("Part") then
					v.Anchored = false
				end
			end
		end

		if action == commands[8] then
			game.Players:FindFirstChild(plr).Character:MoveTo(game.Players.LocalPlayer.Character.PrimaryPart.Position) --// Moves the target to you
		end

		if action == commands[9] then
			print("Commands: ")
			for i,v in commands do
				print(v)
			end
		end

		if action == commands[10] then
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = plr
		end

		if action == commands[11] then
			textbox.Text = "NebCmd version 0.3.1 programmed in ".._VERSION.." thanks for using NebCmd! ヾ(•ω•`)o" --// thank you for using NebCmd 
		end

		if action == commands[12] then
			for i,v in pairs(game[plr]:GetChildren()) do
				print(i,v)
			end
		end

		if action == commands[13] then
			for _,v in game.Players:GetPlayers() do
				print(v)
			end
		end

		if action == commands[14] then
			game.Players:FindFirstChild(plr).Character:MoveTo(game.Players.LocalPlayer.Character.PrimaryPart.Position)
			game.Players.LocalPlayer.Character:MoveTo(game.Players:FindFirstChild(plr).Character.PrimaryPart)
		end
	end
end)
