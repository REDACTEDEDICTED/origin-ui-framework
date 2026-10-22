-- ========================================================
-- ORIGIN AUTH CLIENT - FULL VISUAL LAYOUT (PART 1)
-- ========================================================
local OriginUI = {
    Config = {
        TitleText = "Origin",
        WindowSize = Vector2.new(550, 380),
        DefaultTheme = "Charcoal",
        API_URL = "http://127.0.0"
    },
    Themes = {
        Charcoal = { Background = Color3.fromRGB(31, 31, 31), PanelElement = Color3.fromRGB(22, 22, 22), AccentLine = Color3.fromRGB(45, 45, 45), PrimaryText = Color3.fromRGB(240, 240, 240), MutedText = Color3.fromRGB(150, 150, 150), AlertRed = Color3.fromRGB(220, 60, 60) },
        Arctic   = { Background = Color3.fromRGB(26, 28, 35), PanelElement = Color3.fromRGB(34, 37, 48), AccentLine = Color3.fromRGB(60, 66, 85), PrimaryText = Color3.fromRGB(255, 255, 255), MutedText = Color3.fromRGB(140, 148, 170), AlertRed = Color3.fromRGB(230, 70, 70) },
        Ember    = { Background = Color3.fromRGB(22, 18, 18), PanelElement = Color3.fromRGB(33, 25, 25), AccentLine = Color3.fromRGB(75, 40, 40), PrimaryText = Color3.fromRGB(245, 230, 230), MutedText = Color3.fromRGB(165, 130, 130), AlertRed = Color3.fromRGB(240, 50, 50) },
        Midnight = { Background = Color3.fromRGB(11, 12, 16), PanelElement = Color3.fromRGB(18, 22, 31), AccentLine = Color3.fromRGB(31, 40, 51), PrimaryText = Color3.fromRGB(197, 198, 199), MutedText = Color3.fromRGB(102, 252, 241), AlertRed = Color3.fromRGB(255, 75, 75) }
    }
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Origin_Framework"
ScreenGui.ResetOnSpawn = false
local success, coreGui = pcall(function() return game:GetService("CoreGui") end)
ScreenGui.Parent = success and coreGui or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

local theme = OriginUI.Themes[OriginUI.Config.DefaultTheme]
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, OriginUI.Config.WindowSize.X, 0, OriginUI.Config.WindowSize.Y)
MainFrame.Position = UDim2.new(0.5, -OriginUI.Config.WindowSize.X/2, 0.5, -OriginUI.Config.WindowSize.Y/2)
MainFrame.BackgroundColor3 = theme.Background
MainFrame.BorderSizePixel = 0
MainFrame.Active, MainFrame.Draggable = true, true
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)

local HeaderLabel = Instance.new("TextLabel")
HeaderLabel.Size = UDim2.new(1, -20, 0, 40)
HeaderLabel.Position = UDim2.new(0, 15, 0, 5)
HeaderLabel.BackgroundTransparency = 1
HeaderLabel.Text = OriginUI.Config.TitleText
HeaderLabel.TextColor3 = theme.PrimaryText
HeaderLabel.TextSize = 18
HeaderLabel.Font = Enum.Font.GothamBold
HeaderLabel.TextXAlignment = Enum.TextXAlignment.Left
HeaderLabel.Parent = MainFrame

local WelcomeView = Instance.new("Frame")
WelcomeView.Size = UDim2.new(1, 0, 1, -50)
WelcomeView.Position = UDim2.new(0, 0, 0, 50)
WelcomeView.BackgroundTransparency = 1
WelcomeView.Parent = MainFrame

local EyeLogo = Instance.new("ImageLabel")
EyeLogo.Size = UDim2.new(0, 90, 0, 90)
EyeLogo.Position = UDim2.new(0.5, -45, 0.35, -45)
EyeLogo.BackgroundTransparency = 1
EyeLogo.Image = "rbxassetid://13511110006"
EyeLogo.ImageColor3 = theme.PrimaryText
EyeLogo.Parent = WelcomeView

local SignInButton = Instance.new("TextButton")
SignInButton.Size = UDim2.new(0, 200, 0, 45)
SignInButton.Position = UDim2.new(0.5, -100, 0.75, -22)
SignInButton.BackgroundColor3 = theme.PanelElement
SignInButton.BorderSizePixel = 0
SignInButton.Text = "Sign In"
SignInButton.TextColor3 = theme.PrimaryText
SignInButton.Font = Enum.Font.GothamBold
SignInButton.TextSize = 15
SignInButton.AutoButtonColor = true
SignInButton.Parent = WelcomeView
Instance.new("UICorner", SignInButton).CornerRadius = UDim.new(0, 6)
local ButtonBorder = Instance.new("UIStroke")
ButtonBorder.Color = theme.AccentLine
ButtonBorder.Parent = SignInButton
-- ========================================================
-- ORIGIN AUTH CLIENT - FULL VISUAL LAYOUT (PART 2)
-- ========================================================
local CredentialsView = Instance.new("Frame")
CredentialsView.Size = UDim2.new(1, 0, 1, -50)
CredentialsView.Position = UDim2.new(0, 0, 0, 50)
CredentialsView.BackgroundTransparency, CredentialsView.Visible = 1, false
CredentialsView.Parent = MainFrame

local UsernameBox = Instance.new("TextBox")
UsernameBox.Size = UDim2.new(0, 260, 0, 40)
UsernameBox.Position = UDim2.new(0.5, -130, 0.3, -20)
UsernameBox.BackgroundColor3 = theme.PanelElement
UsernameBox.BorderSizePixel = 0
UsernameBox.Text = ""
UsernameBox.PlaceholderText = "Username"
UsernameBox.PlaceholderColor3 = theme.MutedText
UsernameBox.TextColor3 = theme.PrimaryText
UsernameBox.TextSize = 14
UsernameBox.Font = Enum.Font.Gotham
UsernameBox.Parent = CredentialsView
local UserStroke = Instance.new("UIStroke")
UserStroke.Color = theme.AccentLine
UserStroke.Parent = UsernameBox
Instance.new("UICorner", UsernameBox).CornerRadius = UDim.new(0, 6)

local PasswordBox = Instance.new("TextBox")
PasswordBox.Size = UDim2.new(0, 260, 0, 40)
PasswordBox.Position = UDim2.new(0.5, -130, 0.5, -20)
PasswordBox.BackgroundColor3 = theme.PanelElement
PasswordBox.BorderSizePixel = 0
PasswordBox.Text = ""
PasswordBox.PlaceholderText = "Password"
PasswordBox.PlaceholderColor3 = theme.MutedText
PasswordBox.TextColor3 = theme.PrimaryText
PasswordBox.TextSize = 14
PasswordBox.Font = Enum.Font.Gotham
PasswordBox.Password = true -- Correct formatting configuration for entry concealment
PasswordBox.Parent = CredentialsView
local PassStroke = Instance.new("UIStroke")
PassStroke.Color = theme.AccentLine
PassStroke.Parent = PasswordBox
Instance.new("UICorner", PasswordBox).CornerRadius = UDim.new(0, 6)

local FinalSubmitButton = Instance.new("TextButton")
FinalSubmitButton.Size = UDim2.new(0, 160, 0, 40)
FinalSubmitButton.Position = UDim2.new(0.5, -80, 0.75, -20)
FinalSubmitButton.BackgroundColor3 = theme.PanelElement
FinalSubmitButton.BorderSizePixel = 0
FinalSubmitButton.Text = "Login"
FinalSubmitButton.TextColor3 = theme.PrimaryText
FinalSubmitButton.Font = Enum.Font.GothamBold
FinalSubmitButton.TextSize = 14
FinalSubmitButton.AutoButtonColor = true
FinalSubmitButton.Parent = CredentialsView
local SubmitStroke = Instance.new("UIStroke")
SubmitStroke.Color = theme.AccentLine
SubmitStroke.Parent = FinalSubmitButton
Instance.new("UICorner", FinalSubmitButton).CornerRadius = UDim.new(0, 6)

local SettingsIcon = Instance.new("ImageButton")
SettingsIcon.Size = UDim2.new(0, 20, 0, 20)
SettingsIcon.Position = UDim2.new(1, -35, 0, 12)
SettingsIcon.BackgroundTransparency = 1
SettingsIcon.Image = "rbxassetid://13511115555"
SettingsIcon.ImageColor3 = theme.MutedText
SettingsIcon.Parent = MainFrame

local ErrorMessageLabel = Instance.new("TextLabel")
ErrorMessageLabel.Size = UDim2.new(1, 0, 0, 20)
ErrorMessageLabel.Position = UDim2.new(0, 0, 0.9, -10)
ErrorMessageLabel.BackgroundTransparency, ErrorMessageLabel.TextTransparency = 1, 1
ErrorMessageLabel.Text = "Invalid credentials or HWID mismatch."
ErrorMessageLabel.TextColor3 = theme.AlertRed
ErrorMessageLabel.Font = Enum.Font.GothamBold
ErrorMessageLabel.TextSize = 13
ErrorMessageLabel.TextAlignment = Enum.TextXAlignment.Center
ErrorMessageLabel.Parent = CredentialsView

local ThemeDropdownMenu = Instance.new("Frame")
ThemeDropdownMenu.Size = UDim2.new(0, 140, 0, 150)
ThemeDropdownMenu.Position = UDim2.new(1, -155, 0, 40)
ThemeDropdownMenu.BackgroundColor3 = theme.PanelElement
ThemeDropdownMenu.BorderSizePixel = 0
ThemeDropdownMenu.Visible = false
ThemeDropdownMenu.ZIndex = 5
ThemeDropdownMenu.Parent = MainFrame
local MenuStroke = Instance.new("UIStroke")
MenuStroke.Color = theme.AccentLine
MenuStroke.Parent = ThemeDropdownMenu
Instance.new("UICorner", ThemeDropdownMenu).CornerRadius = UDim.new(0, 6)

local function ApplyNewThemeColors(themeName)
    local targetColors = OriginUI.Themes[themeName]
    if not targetColors then return end
    MainFrame.BackgroundColor3 = targetColors.Background
    ThemeDropdownMenu.BackgroundColor3 = targetColors.PanelElement
    MenuStroke.Color = targetColors.AccentLine
    UsernameBox.BackgroundColor3 = targetColors.PanelElement
    UserStroke.Color = targetColors.AccentLine
    PasswordBox.BackgroundColor3 = targetColors.PanelElement
    PassStroke.Color = targetColors.AccentLine
    FinalSubmitButton.BackgroundColor3 = targetColors.PanelElement
    SubmitStroke.Color = targetColors.AccentLine
    SignInButton.BackgroundColor3 = targetColors.PanelElement
    ButtonBorder.Color = targetColors.AccentLine
end

local targetStylesList = {"Charcoal", "Arctic", "Ember", "Midnight"}
for index, styleName in ipairs(targetStylesList) do
    local StyleSelectButton = Instance.new("TextButton")
    StyleSelectButton.Size = UDim2.new(1, -10, 0, 30)
    StyleSelectButton.Position = UDim2.new(0, 5, 0, (index - 1) * 35 + 8)
    StyleSelectButton.BackgroundTransparency = 1
    StyleSelectButton.Text = styleName
    StyleSelectButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    StyleSelectButton.TextSize = 13
    StyleSelectButton.Font = Enum.Font.Gotham
    StyleSelectButton.ZIndex = 6
    StyleSelectButton.Parent = ThemeDropdownMenu
    StyleSelectButton.MouseButton1Click:Connect(function()
        ApplyNewThemeColors(styleName)
        ThemeDropdownMenu.Visible = false
    end)
end

SettingsIcon.MouseButton1Click:Connect(function()
    ThemeDropdownMenu.Visible = not ThemeDropdownMenu.Visible
end)

SignInButton.MouseButton1Click:Connect(function()
    WelcomeView.Visible = false
    UsernameBox.Text = ""
    PasswordBox.Text = ""
    ErrorMessageLabel.TextTransparency = 1
    CredentialsView.Visible = true
end)

FinalSubmitButton.MouseButton1Click:Connect(function()
    local targetUser = UsernameBox.Text
    local targetPass = PasswordBox.Text -- FIX: Reads the string value out of the text entry layer properties directly
    if targetUser == "" or targetPass == "" then
        ErrorMessageLabel.Text = "Please fill in all empty fields."
        ErrorMessageLabel.TextTransparency = 0
        return
    end
    
    ErrorMessageLabel.Text = "Verifying secure tokens..."
    ErrorMessageLabel.TextColor3 = theme.PrimaryText
    ErrorMessageLabel.TextTransparency = 0
    
    local hwidSuccess, machineFingerprint = pcall(function() return game:GetService("RbxAnalyticsService"):GetClientId() end)
    machineFingerprint = hwidSuccess and machineFingerprint or "UNKNOWN_ENV"
    
    local networkPayload = { username = tostring(targetUser), password = tostring(targetPass), hwid = tostring(machineFingerprint) }
    local HttpService = game:GetService("HttpService")
    
    local requestSuccess, serverResponse = pcall(function()
        return HttpService:RequestAsync({
            Url = OriginUI.Config.API_URL,
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = HttpService:JSONEncode(networkPayload)
        })
    end)
    
    if not requestSuccess then
        ErrorMessageLabel.Text = "Authentication server offline."
        ErrorMessageLabel.TextColor3 = theme.AlertRed
        ErrorMessageLabel.TextTransparency = 0
        return
    end
    
    local parsedData = HttpService:JSONDecode(serverResponse.Body)
    if serverResponse.StatusCode == 200 and parsedData.status == "Authenticated" then
        ErrorMessageLabel.Text = "Access Granted!"
        ErrorMessageLabel.TextColor3 = Color3.fromRGB(46, 204, 113)
        ErrorMessageLabel.TextTransparency = 0
        task.wait(0.5)
        ScreenGui:Destroy()
        print("[Origin] Launching system UI dashboard structures...")
    else
        ErrorMessageLabel.Text = parsedData and parsedData.detail or "Invalid credentials."
        ErrorMessageLabel.TextColor3 = theme.AlertRed
        ErrorMessageLabel.TextTransparency = 0
    end
end)
