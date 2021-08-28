local UserInputService = game:GetService("UserInputService")
local LibraryGui = Instance.new("ScreenGui")
LibraryGui.Name = "Gui Library"

if game:GetService("Workspace"):FindFirstChild("Testing") then
	LibraryGui.Parent = game:GetService("Players").LocalPlayer.PlayerGui
else
	LibraryGui.Parent = game.CoreGui
end

local Library = {}

function MakeGuiDraggable(gui)
	local UserInputService = game:GetService("UserInputService")

	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end

function Library:Window(Window_Name)
	local Window = Instance.new("Frame")
	local TopBar = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local ButtonFrame = Instance.new("Frame")
	local UIGridLayout = Instance.new("UIGridLayout")
	local Title = Instance.new("TextLabel")
	local Tabs = Instance.new("Folder")
	local ExtraVisuals = Instance.new("Folder")
	local Frame = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local Frame_2 = Instance.new("Frame")
	local UICorner_3 = Instance.new("UICorner")

	Window.Name = Window_Name
	Window.Parent = LibraryGui
	Window.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
	Window.BorderSizePixel = 0
	Window.Position = UDim2.new(0.301446944, 0, 0.121990368, 0)
	Window.Size = UDim2.new(0, 549, 0, 471)

	TopBar.Name = "TopBar"
	TopBar.Parent = Window
	TopBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	TopBar.BorderSizePixel = 0
	TopBar.Position = UDim2.new(0, 0, 0.0205761362, 0)
	TopBar.Size = UDim2.new(0, 549, 0, 23)
	TopBar.ZIndex = 2

	UICorner.CornerRadius = UDim.new(0, 4)
	UICorner.Parent = Window

	ButtonFrame.Name = "ButtonFrame"
	ButtonFrame.Parent = Window
	ButtonFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	ButtonFrame.BorderSizePixel = 0
	ButtonFrame.Position = UDim2.new(0, 0, 0.0694083795, 0)
	ButtonFrame.Size = UDim2.new(0, 147, 0, 421)
	ButtonFrame.ZIndex = 2

	UIGridLayout.Parent = ButtonFrame
	UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.CellPadding = UDim2.new(0, 0, 0, 10)
	UIGridLayout.CellSize = UDim2.new(0, 130, 0, 35)

	Title.Name = "Title"
	Title.Parent = Window
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0.0154826958, 0, 0, 0)
	Title.Size = UDim2.new(0, 207, 0, 32)
	Title.ZIndex = 5
	Title.Font = Enum.Font.GothamSemibold
	Title.Text = Window_Name
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextScaled = true
	Title.TextSize = 14.000
	Title.TextWrapped = true
	Title.TextXAlignment = Enum.TextXAlignment.Left

	Tabs.Name = "Tabs"
	Tabs.Parent = Window

	ExtraVisuals.Name = "ExtraVisuals"
	ExtraVisuals.Parent = Window

	Frame.Parent = ExtraVisuals
	Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.Size = UDim2.new(0, 549, 0, 33)

	UICorner_2.CornerRadius = UDim.new(0, 4)
	UICorner_2.Parent = Frame

	Frame_2.Parent = ExtraVisuals
	Frame_2.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Frame_2.BorderSizePixel = 0
	Frame_2.Position = UDim2.new(0, 0, 0.593824506, 0)
	Frame_2.Size = UDim2.new(0, 147, 0, 191)

	UICorner_3.CornerRadius = UDim.new(0, 4)
	UICorner_3.Parent = Frame_2
	MakeGuiDraggable(Window)
end

function Library:Tab(Window_Name,Tab_Name)
	local Window = LibraryGui:FindFirstChild(Window_Name)

	if Window then
		local TemplateTab = Instance.new("ScrollingFrame")
		local UIListLayout = Instance.new("UIListLayout")

		TemplateTab.Name = Tab_Name
		TemplateTab.Parent = Window.Tabs
		TemplateTab.Active = true
		TemplateTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TemplateTab.BackgroundTransparency = 1.000
		TemplateTab.BorderSizePixel = 0
		TemplateTab.Position = UDim2.new(0.266178548, 0, 0.0694084093, 0)
		TemplateTab.Selectable = false
		TemplateTab.Size = UDim2.new(0, 402, 0, 437)
		TemplateTab.Visible = false

		UIListLayout.Parent = TemplateTab
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 15)

		local TemplateBtn = Instance.new("TextButton")

		TemplateBtn.Name = Tab_Name
		TemplateBtn.Parent = Window.ButtonFrame
		TemplateBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TemplateBtn.BackgroundTransparency = 1.000
		TemplateBtn.Size = UDim2.new(0, 200, 0, 50)
		TemplateBtn.Font = Enum.Font.GothamSemibold
		TemplateBtn.TextColor3 = Color3.fromRGB(170, 170, 170)
		TemplateBtn.TextScaled = true
		TemplateBtn.TextSize = 14.000
		TemplateBtn.TextWrapped = true
		TemplateBtn.Text = Tab_Name
		TemplateBtn.ZIndex = 5

		TemplateBtn.MouseButton1Click:Connect(function()
			for _, Button in pairs(Window.ButtonFrame:GetChildren()) do
				if Button:IsA("TextButton") then
					Button.TextColor3 = Color3.fromRGB(170, 170, 170)
				end
			end
			for _, Tab in pairs(Window.Tabs:GetChildren()) do
				Tab.Visible = false
			end
			TemplateBtn.TextColor3 = Color3.new(255,255,255)
			TemplateTab.Visible = true
		end)
	else
		error("Window Not Found! "..Window_Name)
	end
end

function Library:Slider(Window_Name,Tab_Name,Min,Max,Name,Function)
	local Window = LibraryGui:FindFirstChild(Window_Name)

	if Window then
		local Tab = Window.Tabs:FindFirstChild(Tab_Name)

		if Tab then
			local SliderTemplate = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local Line = Instance.new("Frame")
			local Grabber = Instance.new("ImageButton")
			local SliderInfo = Instance.new("TextLabel")

			SliderTemplate.Name = "SliderTemplate"
			SliderTemplate.Parent = Tab
			SliderTemplate.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			SliderTemplate.Position = UDim2.new(0.0135056227, 0, 0.106563427, 0)
			SliderTemplate.Size = UDim2.new(0, 311, 0, 51)

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = SliderTemplate

			Line.Name = "Line"
			Line.Parent = SliderTemplate
			Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Line.Position = UDim2.new(0.0739549845, 0, 0.580607533, 0)
			Line.Size = UDim2.new(0, 265, 0, 1)

			Grabber.Name = "Grabber"
			Grabber.Parent = Line
			Grabber.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Grabber.BackgroundTransparency = 1.000
			Grabber.Position = UDim2.new(0, 0, -5.5, 0)
			Grabber.Size = UDim2.new(0, 11, 0, 11)
			Grabber.Image = "http://www.roblox.com/asset/?id=4504304159"

			SliderInfo.Name = "SliderInfo"
			SliderInfo.Parent = SliderTemplate
			SliderInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderInfo.BackgroundTransparency = 1.000
			SliderInfo.Position = UDim2.new(0.176848873, 0, 0.0980392173, 0)
			SliderInfo.Size = UDim2.new(0, 200, 0, 19)
			SliderInfo.Font = Enum.Font.GothamSemibold
			SliderInfo.Text = Name.." "..Min.."/"..Max
			SliderInfo.TextColor3 = Color3.fromRGB(255, 255, 255)
			SliderInfo.TextScaled = true
			SliderInfo.TextSize = 14.000
			SliderInfo.TextWrapped = true

			local Player = game.Players.LocalPlayer
			local UserInputService = game:GetService("UserInputService")
			local RunService = game:GetService("RunService")
			local Frame = Line
			local Button = Grabber
			local Debounce = false
			local Step = 0.01
			local Percentage = 0

			local function Snap(Number,Factor)
				if Factor == 0 then
					return Number
				else
					return math.floor(Number/Factor+0.5)*Factor
				end
			end

			UserInputService.InputEnded:Connect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 then
					Debounce = false
				end
			end)

			Button.MouseButton1Down:Connect(function()
				Debounce = true
			end)

			RunService.RenderStepped:Connect(function()
				if Debounce then
					local MousePosition = UserInputService:GetMouseLocation().X
					local ButtonPosition = Button.Position
					local FrameSize = Frame.AbsoluteSize.X
					local FramePosition = Frame.AbsolutePosition.X
					local Position = Snap((MousePosition-FramePosition)/FrameSize,Step)
					Percentage = math.clamp(Position,0,1)
					Button.Position = UDim2.new(Percentage,0,ButtonPosition.Y.Scale,ButtonPosition.Y.Offset)
				end
			end)

			Button.Changed:Connect(function()
				local Scale = Button.Position.X.Scale
				local Number = math.floor(Scale*Max)
				local Volume = Number

				if Volume < Min then
					Volume = Min
				else
					Volume = Number
				end

				if Function then
					Function(Volume)
				end
				SliderInfo.Text = Name.." "..tostring(Volume).."/"..Max
			end)
		else
			error("Tab Not Found! "..Tab_Name)
		end
	else
		error("Window Not Found! "..Window_Name)
	end
end

function Library:Toggle(Window_Name,Tab_Name,Toggle_Name,Function)
	local ToggleVal = false
	local Window = LibraryGui:FindFirstChild(Window_Name)

	if Window then
		local Tab = Window.Tabs:FindFirstChild(Tab_Name)

		if Tab then

			local ToggleTemplate = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local ToggleBackround = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")
			local Toggle = Instance.new("TextButton")
			local UICorner_3 = Instance.new("UICorner")
			local Positions = Instance.new("Folder")
			local TruePosition = Instance.new("Frame")
			local FalsePosition = Instance.new("Frame")
			local TextLabel = Instance.new("TextLabel")

			ToggleTemplate.Name = "ToggleTemplate"
			ToggleTemplate.Parent = Tab
			ToggleTemplate.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			ToggleTemplate.Position = UDim2.new(-0.604484379, 0, -0.0997876823, 0)
			ToggleTemplate.Size = UDim2.new(0, 311, 0, 47)

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = ToggleTemplate

			ToggleBackround.Name = "ToggleBackround"
			ToggleBackround.Parent = ToggleTemplate
			ToggleBackround.BackgroundColor3 = Color3.fromRGB(102, 102, 102)
			ToggleBackround.Position = UDim2.new(0.77877897, 0, 0.255319148, 0)
			ToggleBackround.Size = UDim2.new(0, 56, 0, 23)

			UICorner_2.CornerRadius = UDim.new(0, 4)
			UICorner_2.Parent = ToggleBackround

			Toggle.Name = "Toggle"
			Toggle.Parent = ToggleTemplate
			Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Toggle.Position = UDim2.new(0.778999984, 0, 0.254999995, 0)
			Toggle.Size = UDim2.new(0, 25, 0, 23)
			Toggle.Font = Enum.Font.SourceSans
			Toggle.Text = ""
			Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
			Toggle.TextScaled = true
			Toggle.TextSize = 14.000
			Toggle.TextWrapped = true

			UICorner_3.CornerRadius = UDim.new(0, 4)
			UICorner_3.Parent = Toggle

			Positions.Name = "Positions"
			Positions.Parent = ToggleTemplate

			TruePosition.Name = "TruePosition"
			TruePosition.Parent = Positions
			TruePosition.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TruePosition.BackgroundTransparency = 1.000
			TruePosition.Position = UDim2.new(0.875, 0, 0.254999995, 0)
			TruePosition.Size = UDim2.new(0, 25, 0, 23)

			FalsePosition.Name = "FalsePosition"
			FalsePosition.Parent = Positions
			FalsePosition.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			FalsePosition.BackgroundTransparency = 1.000
			FalsePosition.Position = UDim2.new(0.778999984, 0, 0.254999995, 0)
			FalsePosition.Size = UDim2.new(0, 25, 0, 23)

			TextLabel.Parent = ToggleTemplate
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.Position = UDim2.new(0.0225080382, 0, 0.127659574, 0)
			TextLabel.Size = UDim2.new(0, 222, 0, 35)
			TextLabel.Font = Enum.Font.GothamSemibold
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextScaled = true
			TextLabel.TextSize = 14.000
			TextLabel.TextWrapped = true
			TextLabel.Text = Toggle_Name

			Toggle.MouseButton1Click:Connect(function()
				if ToggleVal == false then
					ToggleVal = true
					Toggle:TweenPosition(TruePosition.Position,Enum.EasingDirection.Out,Enum.EasingStyle.Bounce)
				else
					ToggleVal = false
					Toggle:TweenPosition(FalsePosition.Position,Enum.EasingDirection.Out,Enum.EasingStyle.Bounce)
				end

				if Function then
					Function(ToggleVal)
				end
			end)
		else
			error("Tab Not Found! "..Tab_Name)
		end
	else
		error("Window Not Found! "..Window_Name)
	end
end

function Library:SetKeyBind(Window_Name,Tab_Name,StartKeyBind,KeyBindText,Function)
	local CanSetKeyCode = false
	local CurrentBind = StartKeyBind

	local Window = LibraryGui:FindFirstChild(Window_Name)

	if Window then
		local Tab = Window.Tabs:FindFirstChild(Tab_Name)

		if Tab then
			local KeybindTemplate = Instance.new("Frame")
			local TextLabel = Instance.new("TextLabel")
			local UICorner = Instance.new("UICorner")
			local KeyBtn = Instance.new("TextButton")
			local UICorner_2 = Instance.new("UICorner")

			KeybindTemplate.Name = KeyBindText
			KeybindTemplate.Parent = Tab
			KeybindTemplate.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			KeybindTemplate.Position = UDim2.new(0.0833333358, 0, 0, 0)
			KeybindTemplate.Size = UDim2.new(0, 335, 0, 44)

			TextLabel.Parent = KeybindTemplate
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
			TextLabel.Position = UDim2.new(0, 0, 0.13636364, 0)
			TextLabel.Size = UDim2.new(0, 248, 0, 32)
			TextLabel.Font = Enum.Font.GothamSemibold
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextScaled = true
			TextLabel.TextSize = 14.000
			TextLabel.TextWrapped = true
			TextLabel.Text = KeyBindText

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = KeybindTemplate

			KeyBtn.Name = "KeyBtn"
			KeyBtn.Parent = KeybindTemplate
			KeyBtn.BackgroundColor3 = Color3.fromRGB(76, 76, 76)
			KeyBtn.Position = UDim2.new(0.74328351, 0, 0.204545453, 0)
			KeyBtn.Size = UDim2.new(0, 78, 0, 26)
			KeyBtn.Font = Enum.Font.GothamSemibold
			KeyBtn.Text = "Key"
			KeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
			KeyBtn.TextScaled = true
			KeyBtn.TextSize = 14.000
			KeyBtn.TextWrapped = true

			local String1 = tostring(CurrentBind)
			local NewString1 = string.gsub(String1,"Enum.KeyCode.","")
			KeyBtn.Text = NewString1

			UICorner_2.CornerRadius = UDim.new(0, 4)
			UICorner_2.Parent = KeyBtn

			KeyBtn.MouseButton1Click:Connect(function()
				if CanSetKeyCode == false then
					CanSetKeyCode = true
					KeyBtn.Text = "..."
				end
			end)

			UserInputService.InputBegan:Connect(function(Input)
				if CanSetKeyCode == false  then
					if Function then
						if Input.KeyCode == CurrentBind then
							Function()
						end
					end
				else
					CurrentBind = Input.KeyCode
					local String = tostring(CurrentBind)
					local NewString = string.gsub(String,"Enum.KeyCode.","")
					KeyBtn.Text = NewString
					print(NewString)
					CanSetKeyCode = false
				end
			end)
		else
			error("Tab Not Found! "..Tab_Name)
		end
	else
		error("Window Not Found! "..Window_Name)
	end
end

function Library:ToggleWindow(Window_Name)
	local Window = LibraryGui:FindFirstChild(Window_Name)

	if Window then
		Window.Visible = not Window.Visible
	end
end

function Library:Label(Window_Name,Tab_Name,Text)
	local Window = LibraryGui:FindFirstChild(Window_Name)

	if Window then
		local Tab = Window.Tabs:FindFirstChild(Tab_Name)

		if Tab then
			
			local LabelTemplate = Instance.new("TextLabel")
			local UICorner = Instance.new("UICorner")

			LabelTemplate.Name = Text
			LabelTemplate.Parent = Tab
			LabelTemplate.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			LabelTemplate.Position = UDim2.new(0.135572135, 0, 0.432494283, 0)
			LabelTemplate.Size = UDim2.new(0, 293, 0, 48)
			LabelTemplate.Font = Enum.Font.GothamSemibold
			LabelTemplate.TextColor3 = Color3.fromRGB(255, 255, 255)
			LabelTemplate.TextScaled = true
			LabelTemplate.TextSize = 14.000
			LabelTemplate.TextWrapped = true
			LabelTemplate.Text = Text
			
			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = LabelTemplate
			
		else
			error("Tab Not Found! "..Tab_Name)
		end
	else
		error("Window Not Found! "..Window_Name)
	end
end

function Library:Button(Window_Name,Tab_Name,Text,Function)
	local Window = LibraryGui:FindFirstChild(Window_Name)

	if Window then
		local Tab = Window.Tabs:FindFirstChild(Tab_Name)

		if Tab then
			local ButtonTemplate = Instance.new("TextButton")
			local UICorner = Instance.new("UICorner")

			ButtonTemplate.Name = Text
			ButtonTemplate.Parent = Tab
			ButtonTemplate.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			ButtonTemplate.Position = UDim2.new(0.13059701, 0, 0.292906165, 0)
			ButtonTemplate.Size = UDim2.new(0, 297, 0, 46)
			ButtonTemplate.Font = Enum.Font.GothamSemibold
			ButtonTemplate.TextColor3 = Color3.fromRGB(255, 255, 255)
			ButtonTemplate.TextScaled = true
			ButtonTemplate.TextSize = 14.000
			ButtonTemplate.TextWrapped = true
			ButtonTemplate.Text = Text
			
			if Function then
				ButtonTemplate.MouseButton1Click:Connect(Function)
			end

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = ButtonTemplate
		else
			error("Tab Not Found! "..Tab_Name)
		end
	else
		error("Window Not Found! "..Window_Name)
	end
end

function Library:TextBox(Window_Name,Tab_Name,PlaceholderText,Function)
	local Window = LibraryGui:FindFirstChild(Window_Name)

	if Window then
		local Tab = Window.Tabs:FindFirstChild(Tab_Name)

		if Tab then
			local TextBoxTemplate = Instance.new("TextBox")
			local UICorner = Instance.new("UICorner")

			TextBoxTemplate.Name = "TextBoxTemplate"
			TextBoxTemplate.Parent = Tab
			TextBoxTemplate.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			TextBoxTemplate.Position = UDim2.new(0.11691542, 0, 0, 0)
			TextBoxTemplate.Size = UDim2.new(0, 308, 0, 42)
			TextBoxTemplate.Font = Enum.Font.GothamSemibold
			TextBoxTemplate.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
			TextBoxTemplate.PlaceholderText = PlaceholderText
			TextBoxTemplate.Text = ""
			TextBoxTemplate.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextBoxTemplate.TextScaled = true
			TextBoxTemplate.TextSize = 14.000
			TextBoxTemplate.TextWrapped = true

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = TextBoxTemplate
			
			if Function then
				TextBoxTemplate.FocusLost:Connect(function()
					Function(TextBoxTemplate.Text)
				end)
			end
		else
			error("Tab Not Found! "..Tab_Name)
		end
	else
		error("Window Not Found! "..Window_Name)
	end
end

function Library:KeySystem(Gui_Name,CorrectKey,Function)
	local KeyTemplate = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local GuiName = Instance.new("TextLabel")
	local KeyBox = Instance.new("TextBox")
	local UICorner_2 = Instance.new("UICorner")
	local CheckKey = Instance.new("TextButton")
	local UICorner_3 = Instance.new("UICorner")

	KeyTemplate.Name = "KeyTemplate"
	KeyTemplate.Parent = LibraryGui
	KeyTemplate.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
	KeyTemplate.Position = UDim2.new(0.400473952, 0, 0.284109145, 0)
	KeyTemplate.Size = UDim2.new(0, 252, 0, 268)

	UICorner.CornerRadius = UDim.new(0, 4)
	UICorner.Parent = KeyTemplate

	GuiName.Name = "Gui Name"
	GuiName.Parent = KeyTemplate
	GuiName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GuiName.BackgroundTransparency = 1.000
	GuiName.Size = UDim2.new(0, 252, 0, 37)
	GuiName.Font = Enum.Font.GothamSemibold
	GuiName.Text = "Gui Name"
	GuiName.TextColor3 = Color3.fromRGB(255, 255, 255)
	GuiName.TextScaled = true
	GuiName.TextSize = 14.000
	GuiName.TextWrapped = true

	KeyBox.Name = "KeyBox"
	KeyBox.Parent = KeyTemplate
	KeyBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	KeyBox.Position = UDim2.new(0.103174604, 0, 0.604477584, 0)
	KeyBox.Size = UDim2.new(0, 200, 0, 40)
	KeyBox.Font = Enum.Font.GothamSemibold
	KeyBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
	KeyBox.PlaceholderText = "Enter Key Here"
	KeyBox.Text = ""
	KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	KeyBox.TextScaled = true
	KeyBox.TextSize = 14.000
	KeyBox.TextWrapped = true

	UICorner_2.CornerRadius = UDim.new(0, 4)
	UICorner_2.Parent = KeyBox

	CheckKey.Name = "CheckKey"
	CheckKey.Parent = KeyTemplate
	CheckKey.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	CheckKey.BorderColor3 = Color3.fromRGB(27, 42, 53)
	CheckKey.Position = UDim2.new(0.130952388, 0, 0.794776082, 0)
	CheckKey.Size = UDim2.new(0, 185, 0, 29)
	CheckKey.Font = Enum.Font.GothamSemibold
	CheckKey.TextColor3 = Color3.fromRGB(255, 255, 255)
	CheckKey.TextScaled = true
	CheckKey.TextSize = 14.000
	CheckKey.TextWrapped = true

	UICorner_3.CornerRadius = UDim.new(0, 4)
	UICorner_3.Parent = CheckKey
	
	CheckKey.MouseButton1Click:Connect(function()
		if KeyBox.Text == CorrectKey then
			Function()
			KeyTemplate:Destroy()
		end
	end)
end
--Example
--[[
Library:KeySystem("Test Hub","Penis",function()
	Library:Window("Testing Hub")
	Library:Tab("Testing Hub","Tab 1")
	Library:Tab("Testing Hub","Tab 2")
	Library:Slider("Testing Hub","Tab 1",16,500,"WalkSpeed",function(Value)
		game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = Value
	end)
	Library:Toggle("Testing Hub","Tab 1","Test Toggle",function(Value)
		print(Value)
	end)
	Library:SetKeyBind("Testing Hub","Tab 1",Enum.KeyCode.G,"Toggle Gui",function()
		Library:ToggleWindow("Testing Hub")
	end)
	Library:Label("Testing Hub","Tab 1","This Is A Label")
	Library:Button("Testing Hub","Tab 1","This Is A Button",function()
		print("You Pressed The Button")
	end)
	Library:TextBox("Testing Hub","Tab 1","This Is A Text Box!",function(Text)
		print(Text)
	end)
end)
--]]

return Library;

--[[
local Window = LibraryGui:FindFirstChild(Window_Name)
	
	if Window then
		local Tab = Window.Tabs:FindFirstChild(Tab_Name)
		
		if Tab then
			
		else
			error("Tab Not Found! "..Tab_Name)
		end
	else
		error("Window Not Found! "..Window_Name)
	end
]]
