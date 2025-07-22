local HttpService = game:GetService("HttpService")
httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
if game.PlaceId == 2753915549 or game.PlaceId == 4442272183 or game.PlaceId == 7449423635 then
	game.StarterGui:SetCore("SendNotification", {
		Icon = "rbxassetid://98317112770528",
		Title = "Running Ss+ Hub",
		Text = "Please waiting a sec.."
	})

	local library = {}

	do
		if game.CoreGui:FindFirstChild("Script Ui Library") then
			game.CoreGui:FindFirstChild("Script Ui Library"):Destroy()
		end
	end


	local UserInputService = game:GetService("UserInputService")
	local TweenService = game:GetService("TweenService")

	local function MakeDraggable(topbarobject, object)
		local Dragging = nil
		local DragInput = nil
		local DragStart = nil
		local StartPosition = nil

		local function Update(input)
			local Delta = input.Position - DragStart
			local pos =
				UDim2.new(
					StartPosition.X.Scale,
					StartPosition.X.Offset + Delta.X,
					StartPosition.Y.Scale,
					StartPosition.Y.Offset + Delta.Y
				)
			local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
			Tween:Play()
		end

		topbarobject.InputBegan:Connect(
			function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					Dragging = true
					DragStart = input.Position
					StartPosition = object.Position

					input.Changed:Connect(
						function()
							if input.UserInputState == Enum.UserInputState.End then
								Dragging = false
							end
						end
					)
				end
			end
		)

		topbarobject.InputChanged:Connect(
			function(input)
				if
					input.UserInputType == Enum.UserInputType.MouseMovement or
					input.UserInputType == Enum.UserInputType.Touch
				then
					DragInput = input
				end
			end
		)

		UserInputService.InputChanged:Connect(
			function(input)
				if input == DragInput and Dragging then
					Update(input)
				end
			end
		)
	end

	function library:addWindow()
		local SSScreen = Instance.new("ScreenGui")
		SSScreen.Name = "Script Ui Library"
		SSScreen.Parent = game.CoreGui
		SSScreen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

		local logo = Instance.new("ImageButton")
		logo.Name = "Floating"
		logo.Parent = SSScreen
		logo.Position = UDim2.new(0.1, 0, 0.230, 0)
		logo.Size = UDim2.new(0, 50, 0, 50)
		logo.Image = "rbxassetid://98317112770528"

		local logoCorner = Instance.new("UICorner")
		logoCorner.Name = "UICorner"
		logoCorner.Parent = logo
		logoCorner.CornerRadius = UDim.new(0, 8)

		local hub = Instance.new("Frame")
		hub.Name = "Hub"
		hub.Parent = SSScreen
		hub.AnchorPoint = Vector2.new(0.5, 0.5)
		hub.Size = UDim2.new(0, 557, 0, 325)
		hub.Position = UDim2.new(0.499526083, 0, 0.499241292, 0)
		hub.BackgroundColor3 = Color3.fromRGB(20, 19, 27)
		hub.ClipsDescendants = true
		hub.BackgroundTransparency = 0

		local uicorner = Instance.new("UICorner")
		uicorner.Name = "UiCorner"
		uicorner.Parent = hub
		uicorner.CornerRadius = UDim.new(0, 8)

		local main = Instance.new("Frame")
		main.Name = "Main"
		main.Parent = hub
		main.Position = UDim2.new(0.284, 0, 0.098, 0)
		main.Size = UDim2.new(0, 398, 0, 276)
		main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		main.BackgroundTransparency = 1

		local top = Instance.new("Frame")
		top.Name = "TopBar"
		top.Parent = hub
		top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		top.BackgroundTransparency = 1
		top.Position = UDim2.new(0, 0, 0, 0)
		top.Size = UDim2.new(0, 557, 0, 29)

		local toptitle = Instance.new("TextLabel")
		toptitle.Name = "TextLabel"
		toptitle.Parent = top
		toptitle.Text = "SS+ SCRIPT HUB : Blox Fruit (Beta)"
		toptitle.Position = UDim2.new(0.011, 0, 0.066, 0)
		toptitle.Size = UDim2.new(0, 225, 0, 29)
		toptitle.TextSize = 17
		toptitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		toptitle.BackgroundTransparency = 1
		toptitle.FontFace = Font.fromEnum(Enum.Font.Highway)
		toptitle.TextColor3 = Color3.fromRGB(255, 255, 255)

		local windowminimize = Instance.new("ImageButton")
		windowminimize.Image = "rbxassetid://126347269508668"
		windowminimize.Name = "Minimize"
		windowminimize.Parent = top
		windowminimize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		windowminimize.Transparency = 1
		windowminimize.Position = UDim2.new(0.909, 0, 0.289, 0)
		windowminimize.Size = UDim2.new(0, 15, 0, 15)

		local windowclose = Instance.new("ImageButton")
		windowclose.Image = "rbxassetid://85706969372759"
		windowclose.Name = "Close"
		windowclose.Parent = top
		windowclose.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		windowclose.Transparency = 1
		windowclose.Position = UDim2.new(0.955, 0, 0.289, 0)
		windowclose.Size = UDim2.new(0, 15, 0, 15)

		local menu = Instance.new("Frame")
		menu.Name = "Menu"
		menu.Parent = hub
		menu.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		menu.BackgroundTransparency = 1
		menu.Position = UDim2.new(0, 0, 0.088, 0)
		menu.Size = UDim2.new(0, 156, 0, 279)

		local menulist = Instance.new("UIListLayout")
		menulist.Name = "UiListLayout"
		menulist.Parent = menu 
		menulist.Padding = UDim.new(0, 8)
		menulist.FillDirection = Enum.FillDirection.Vertical
		menulist.SortOrder = Enum.SortOrder.LayoutOrder

		local menupadding = Instance.new("UIPadding")
		menupadding.Name = "UiPadding"
		menupadding.Parent = menu
		menupadding.PaddingLeft = UDim.new(0, 7)
		menupadding.PaddingTop = UDim.new(0, 8)
		local containers = nil
		local menuTab = {}
		MakeDraggable(top, hub)
		MakeDraggable(logo, logo)

		local uihide = false

		logo.MouseButton1Click:Connect(function ()
			if (uihide == false) then
				uihide = true
				hub:TweenSize(UDim2.new(0, 0, 0, 0),"Out","Quad",0.2,true)
				hub.Visible = false
			else 
				uihide = false
				hub:TweenSize(UDim2.new(0, 557, 0, 325),"Out","Quad",0.2,true)
				hub.Visible = true
			end

		end)

		function menuTab:addTab(name, icon, canvasSize)
			local elements = {}
			local menuTabButton = Instance.new("TextButton")
			menuTabButton.Name = name
			menuTabButton.Parent = menu
			menuTabButton.Size = UDim2.new(0, 144, 0, 26)
			menuTabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			menuTabButton.BackgroundTransparency = 0
			menuTabButton.Text = " "

			local menuTabCorner = Instance.new("UICorner")
			menuTabCorner.Name = "UiCorner"
			menuTabCorner.Parent = menuTabButton
			menuTabCorner.CornerRadius = UDim.new(0, 6)

			local menuTabImageLabel = Instance.new("ImageLabel")
			menuTabImageLabel.Name = "ImageLabel"
			menuTabImageLabel.Parent = menuTabButton
			menuTabImageLabel.Position = UDim2.new(0.063, 0, 0.192, 0)
			menuTabImageLabel.Size = UDim2.new(0, 16, 0, 16)
			menuTabImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			menuTabImageLabel.BackgroundTransparency = 1
			menuTabImageLabel.Image = "rbxassetid://"..tostring(icon)

			local menuTabTextLabel = Instance.new("TextLabel")
			menuTabTextLabel.Name = "TextLabel"
			menuTabTextLabel.Parent = menuTabButton
			menuTabTextLabel.Position = UDim2.new(0.271, 0, 0.024, 0)
			menuTabTextLabel.Size = UDim2.new(0, 98, 0, 25)
			menuTabTextLabel.BackgroundTransparency = 1
			menuTabTextLabel.TextSize = 14
			menuTabTextLabel.TextXAlignment = Enum.TextXAlignment.Left
			menuTabTextLabel.Text = name 
			menuTabTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			menuTabTextLabel.FontFace = Font.fromEnum(Enum.Font.Highway)


			local Tab = {}

			function Tab:addButton(text, information, callback)
				table.insert(elements, {
					type = "Button",
					props = {
						text = text,
						description = information,
						callback = callback
					}
				})
			end
			function Tab:addTitle(text)
				table.insert(elements, {
					type = "Title",
					props = {
						text = text
					}
				})
			end

			function Tab:addLabel(text)
				table.insert(elements, {
					type = "Label",
					props = {
						text = text
					}
				})
			end

			function Tab:addCard(name, text, button, image, callback)
				table.insert(elements, {
					type = "Card",
					props = {
						name = name,
						text = text,
						button = button,
						image = image,
						callback = callback
					}
				})
			end
			function Tab:showTab()
				if containers  then
					table.clear(containers)
					containers:Destroy()
					containers = nil
					Tab:showTab()
					return
				end

				local containerTab = Instance.new("ScrollingFrame")
				containerTab.Name = "Container "..tostring(name)
				containerTab.Parent = main
				containerTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				containerTab.BackgroundTransparency = 1 
				containerTab.CanvasSize = canvasSize or UDim2.new(0, 0, 1, 0)
				containerTab.Position = UDim2.new(0, 0, 0.021, 0)
				containerTab.Size = UDim2.new(0, 399, 0, 270)
				containerTab.ScrollBarThickness = 3
				containerTab.ScrollBarImageColor3 = Color3.fromRGB(76, 76, 76)
				containers = containerTab

				local containerListItem = Instance.new("UIListLayout")
				containerListItem.Name = "UiListLayout"
				containerListItem.Parent = containerTab
				containerListItem.Padding = UDim.new(0, 7)
				containerListItem.FillDirection = Enum.FillDirection.Vertical
				containerListItem.SortOrder = Enum.SortOrder.LayoutOrder

				for _, element in ipairs(elements) do
					if element.type == "Title" then
						local title = Instance.new("Frame")
						title.Name = "Title"
						title.Parent = containerTab
						title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						title.BackgroundTransparency = 1
						title.Size = UDim2.new(0, 391, 0, 25)

						local label = Instance.new("TextLabel")
						label.Name = "TextLabel"
						label.Parent = title
						label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						label.BackgroundTransparency = 1
						label.Position = UDim2.new(0, 0, 0, 0)
						label.Size = UDim2.new(0, 391, 0, 24)
						label.TextSize = 20
						label.TextXAlignment = Enum.TextXAlignment.Left
						label.Text = element.props.text
						label.TextColor3 = Color3.fromRGB(255, 255, 255)
						label.FontFace = Font.fromEnum(Enum.Font.FredokaOne)

					elseif element.type == "Label" then
						local panel = Instance.new("Frame")
						panel.Name = "TextLabel"
						panel.Parent = containerTab
						panel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
						panel.BackgroundTransparency = 0
						panel.Size = UDim2.new(0, 375, 0, 29)

						local panelCorner = Instance.new("UICorner")
						panelCorner.Name = "UICorner"
						panelCorner.Parent = panel
						panelCorner.CornerRadius = UDim.new(0, 8)

						local label = Instance.new("TextLabel")
						label.Name = "TextLabel"
						label.Parent = panel
						label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						label.BackgroundTransparency = 1
						label.Position = UDim2.new(0, 0, 0, 0)
						label.Size = UDim2.new(0, 375, 0, 29)
						label.TextSize = 15
						label.Text = element.props.text
						label.TextXAlignment = Enum.TextXAlignment.Left
						label.TextColor3 = Color3.fromRGB(255, 255, 255)
						label.FontFace = Font.fromEnum(Enum.Font.Highway)

						local labelPadding = Instance.new("UIPadding")
						labelPadding.Name = "UIPadding"
						labelPadding.Parent = label
						labelPadding.PaddingLeft = UDim.new(0, 10)

					elseif element.type == "Button" then
						local button = Instance.new("TextButton")
						button.Name = "Button"
						button.Parent = containerTab
						button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
						button.BackgroundTransparency = 0
						button.Size = UDim2.new(0, 375, 0, 29)
						button.Text = " "

						local icon = Instance.new("ImageLabel")
						icon.Name = "ImageLabel"
						icon.Parent = button
						icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						icon.BackgroundTransparency = 1
						icon.Position = UDim2.new(0.925, 0, 0.207, 0)
						icon.Size = UDim2.new(0, 17, 0, 17)
						icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
						icon.Image = "rbxassetid://80144514419349"

						local buttonCorner = Instance.new("UICorner")
						buttonCorner.Name = "UICorner"
						buttonCorner.Parent = button
						buttonCorner.CornerRadius = UDim.new(0, 8)

						local label = Instance.new("TextLabel")
						label.Name = "TextLabel"
						label.Parent = button
						label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						label.BackgroundTransparency = 1
						label.Position = UDim2.new(0, 0, 0, 0)
						label.Size = UDim2.new(0, 337, 0, 22)
						label.TextSize = 15
						label.Text = element.props.text
						label.TextXAlignment = Enum.TextXAlignment.Left
						label.TextColor3 = Color3.fromRGB(255, 255, 255)
						label.FontFace = Font.fromEnum(Enum.Font.Highway)

						local labelPadding = Instance.new("UIPadding")
						labelPadding.Name = "UIPadding"
						labelPadding.Parent = label
						labelPadding.PaddingLeft = UDim.new(0, 10)

						local description = Instance.new("TextLabel")
						description.Name = "TextDescription"
						description.Parent = button
						description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						description.BackgroundTransparency = 1
						description.Position = UDim2.new(0, 0, 0.516, 0)
						description.Size = UDim2.new(0, 337, 0, 15)
						description.TextSize = 10
						description.TextXAlignment = Enum.TextXAlignment.Left
						description.TextColor3 = Color3.fromRGB(255, 255, 255)
						description.FontFace = Font.fromEnum(Enum.Font.Highway)
						description.Text = element.props.description

						local labelPadding = Instance.new("UIPadding")
						labelPadding.Name = "UIPadding"
						labelPadding.Parent = description
						labelPadding.PaddingLeft = UDim.new(0, 10)

						button.MouseButton1Click:Connect(function()
							element.props.callback()
						end)

					elseif element.type == "Card" then
						local card = Instance.new("Frame")
						card.Name = element.props.name
						card.Parent = containerTab
						card.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
						card.Size = UDim2.new(0, 377, 0, 66)


						local cardUICorner = Instance.new("UICorner")
						cardUICorner.Name = "UICorner"
						cardUICorner.Parent = card
						cardUICorner.CornerRadius = UDim.new(0, 8)

						local button = Instance.new("TextButton")
						button.Name = "TextButton"
						button.Parent = card
						button.BackgroundColor3 = Color3.fromRGB(72, 221, 78)
						button.Position = UDim2.new(0.198, 0, 0.636, 0)
						button.Size = UDim2.new(0, 275, 0, 15)
						button.Text = element.props.button
						button.TextColor3 = Color3.fromRGB(255, 255, 255)
						button.TextSize = 14
						button.FontFace = Font.fromEnum(Enum.Font.SourceSans)


						local buttonUICorner = Instance.new("UICorner")
						buttonUICorner.Name = "UICORNER"
						buttonUICorner.Parent = button
						buttonUICorner.CornerRadius = UDim.new(0, 4)

						local image = Instance.new("ImageLabel")
						image.Name =  "ImageLabel"
						image.Parent = card
						image.BackgroundTransparency = 1
						image.Position = UDim2.new(0.035, 0, 0.146, 0)
						image.Size = UDim2.new(0, 48, 0, 48)
						image.Image = "rbxassetid://"..tostring(element.props.image)

						local imageUICorner = Instance.new("UICorner")
						imageUICorner.Name = "UICorner"
						imageUICorner.Parent = image
						imageUICorner.CornerRadius = UDim.new(0, 10)

						local label = Instance.new("TextLabel")
						label.Name = "TextLabel"
						label.Parent = card
						label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						label.BackgroundTransparency = 1
						label.Position = UDim2.new(0.198, 0, 0.136, 0)
						label.Size = UDim2.new(0, 173, 0, 18)
						label.TextSize = 14
						label.Text = element.props.text
						label.TextXAlignment = Enum.TextXAlignment.Left
						label.TextColor3 = Color3.fromRGB(255, 255, 255)
						label.FontFace = Font.fromEnum(Enum.Font.Highway)

						button.MouseButton1Click:Connect(function()
							element.props.callback()
						end)

					end

				end

			end
			menuTabButton.MouseButton1Click:Connect(function ()
				Tab:showTab()
			end)

			return Tab
		end
		return menuTab
	end

	local SS = library:addWindow()
	local Information = SS:addTab("Information", 113738736728305)
	local Farm = SS:addTab("Farm", 87496145490440)
	local Stats = SS:addTab("Stats", 118152914617094)
	local QuestItem = SS:addTab("Quest & Item", 133451511384276)
	local Sea = SS:addTab("Sea Event", 132123451896339)
	local Shop = SS:addTab("Shop", 129238231078097, UDim2.new(0, 0, 2, 0))
	local Visual = SS:addTab("Visual", 108543291476305)
	local Other = SS:addTab("Other", 78677332015961)
	local args = {
		"PlayerHunter"
	}
	local PlayerHunter = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
	local isPrivateServer = not string.find(PlayerHunter, "public")

	Information:addCard("Discord", "SS+ Discord Server", "Join Discord", 98317112770528, function()
		setclipboard("https://discord.gg/dnXF7waQ")
	end)
	Information:addTitle("Channel")
	Information:addLabel("Tiktok: @ssplus_store")
	Information:addButton("Follow", "Please Help me follow", function() 
		setclipboard("https://www.tiktok.com/@ssplus_1")
	end)
	Information:showTab()

	Farm:addTitle("Main Farm")

	spawn(function()
		local boss = {}
		local count = 0
		local Island = {}
		while true do
			for _, v in pairs(game.Workspace.Map:GetChildren()) do
				wait(2)
				if v.Name == "KitsuneIsland" and not table.find(Island, "KitsuneIsland") then
					table.insert(Island, "KitsuneIsland")
					httprequest({
						Url = "https://discord.com/api/webhooks/1367844215060435076/KLwHdw6s2TQezB9dUNBOK4hkrRVVh6-DfqOKovO6tK9QqV1ogCRFnqzvOoYutH4ujK9r",
						Method = "POST",
						Headers = {["Content-Type"] = "application/json"},
						Body = HttpService:JSONEncode({
							username = "Island Spawned",
							content = " ",
							embeds = {
								{
									color = 15844367,
									title = "\# Kitsune Island Spawned!",
									fields = {
										{
											name = "PlaceInfo\:", 
											value = "\> Online Players\: " .. tostring(#game:GetService("Players"):GetPlayers())
										},
										{
											name = "JobID\:",
											value = "```" .. game.JobId .. "```"
										}
									}
								}
							}
						})
					})
				elseif v.Name == "PrehistoricIsland" and not table.find(Island, "PrehistoricIsland") then
					table.insert(Island, "PrehistoricIsland")
					httprequest({
						Url = "https://discord.com/api/webhooks/1367844215060435076/KLwHdw6s2TQezB9dUNBOK4hkrRVVh6-DfqOKovO6tK9QqV1ogCRFnqzvOoYutH4ujK9r",
						Method = "POST",
						Headers = {["Content-Type"] = "application/json"},
						Body = HttpService:JSONEncode({
							username = "Island Spawned",
							content = " ",
							embeds = {
								{
									color = 15844367,
									title = "\# Prehistoric Island Spawned!",
									fields = {
										{
											name = "PlaceInfo\:", 
											value = "\> Online Players\: " .. tostring(#game:GetService("Players"):GetPlayers())
										},
										{
											name = "JobID\:",
											value = "```" .. game.JobId .. "```"
										}
									}
								}
							}
						})
					})
				elseif v.Name == "MysticIsland" and not table.find(Island, "MysticIsland") then
					table.insert(Island, "MysticIsland")
					httprequest({
						Url = "https://discord.com/api/webhooks/1367844215060435076/KLwHdw6s2TQezB9dUNBOK4hkrRVVh6-DfqOKovO6tK9QqV1ogCRFnqzvOoYutH4ujK9r",
						Method = "POST",
						Headers = {["Content-Type"] = "application/json"},
						Body = HttpService:JSONEncode({
							username = "Island Spawned",
							content = " ",
							embeds = {
								{
									color = 15844367,
									title = "\# Mirage Island Spawned!",
									fields = {
										{
											name = "PlaceInfo\:", 
											value = "\> Online Players\: " .. tostring(#game:GetService("Players"):GetPlayers())
										},
										{
											name = "JobID\:",
											value = "```" .. game.JobId .. "```"
										}
									}
								}
							}
						})
					})

				end
			end
			for _, v in pairs(game.Workspace._WorldOrigin.EnemySpawns:GetChildren()) do
				wait(2)
				if string.find(v.Name, "Boss") then
					if not table.find(boss, v.Name) then
						print("Bosses", v.Name)
						pcall(function()
							local PlayerOn = game:GetService("Players"):GetPlayers()

							local data = {
								username = "Raid Boss",
								avatar_url = "https://cdn.discordapp.com/attachments/1330924434789236768/1367414336943030413/WhatsApp_Image_2025-05-01_at_13.29.44.jpeg",
								content = "",
								embeds = {
									{	
										color = 15844367,
										title = v.Name,
										fields = {
											{
												name = "Server Info",
												value = "\> Online Player\: " .. tostring(#PlayerOn) .. "\/12 \n \> Is Public Server: " .. tostring(isPrivateServer)
											},
											{ 
												name = "JobID",
												value = "```" .. game.JobId .. "```" 
											}
										}
									}
								}
							}

							local JSONData = HttpService:JSONEncode(data)

							httprequest({
								Url = "https://discord.com/api/webhooks/1367384549977358397/N0q9oK6pjbOtoMWSLtJGfLv_NGq9yrGm3OMSbFv7ACSHduDEzkgwulGWFt-sUzSXyA8x",
								Method = "POST",
								Headers = {["Content-Type"] = "application/json"},
								Body = JSONData
							})
						end)

						table.insert(boss, v.Name)
					end
				end
			end
			wait(2)
		end
	end)
	function getAllBerries(folder, resultTable)
		resultTable = resultTable or {}

		for _, child in ipairs(folder:GetChildren()) do
			if child.Name == "Berries" then
				table.insert(resultTable, child)
			end
			getAllBerries(child, resultTable) -- rekursi
		end

		return resultTable
	end

	spawn(function()
		while true do
			local berriesFolders = getAllBerries(game)

			for _, berries in ipairs(berriesFolders) do
				if berries.ClassName == "Configuration" then
					print("Berries ditemukan sebagai Configuration:", berries:GetFullName())
					-- lakukan sesuatu di sini
				end
			end

			wait(5) -- penting! beri jeda untuk mencegah lag
		end
	end)
	Shop:addTitle("Fighting Styles")
	Shop:addButton("Buy Sanguine Art", "", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt")

	end)
	Shop:addButton("Buy God human", "", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodHuman")

	end)
	Shop:addButton("Buy Dragon Talon", "", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")

	end)
	Shop:addButton("Buy Sharkman Karate", "", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")

	end)
	Shop:addButton("Buy Electric Claw", "", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")

	end)
	Shop:addButton("Buy Death Step", "", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")

	end)
	Shop:addButton("Buy Super Human", "", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperHuman")

	end)
	Shop:addButton("Buy Dragon Breath", "", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonClaw")

	end)
	Shop:addButton("Buy Fishman Karate", "", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")

	end)
	Shop:addButton("Buy Electro", "", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")

	end)
	Shop:addButton("Buy Black Leg", "", function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")

	end)

	Visual:addTitle("Teleport Menu")
	Visual:addButton("Teleport to Temple Of Time", " ", function() 
		local args = {
			"RaceV4Progress",
			"Check"
		}
		local reslt1 = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
		print(reslt1)
		local args = {
			"RaceV4Progress",
			"Teleport"
		}
		local reslt = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))

		print("reslt:", HttpService:JSONEncode(reslt))

	end)
	Other:addTitle("Misc")
	Other:addButton("Join Pirate", "Joining Pirate Team")

else 
	game.Players.LocalPlayer:Kick("Game not supported")
end
