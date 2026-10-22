-- ========================================================
-- ORIGIN AUTH CLIENT - PRECISE VISUAL LAYOUT
-- ========================================================
local OriginUI = {
    Config = {
        TitleText = "Welcome to Origin",
        DescriptionText = "Origin is all you need to closet cheat like a pro. Just sign in to your account to load the cheat. Once you are in, you can completely dominate the lobby without anyone ever knowing.",
        FooterText = "Origin | The First Step",
        WindowSize = Vector2.new(500, 420),
        DefaultTheme = "Charcoal",
        API_URL = "http://127.0.0.1:5000/api/login"
    },
    Themes = {
        Charcoal = {
            Background = Color3.fromRGB(15, 16, 20),
            PanelElement = Color3.fromRGB(32, 34, 45),
            AccentLine = Color3.fromRGB(48, 52, 68),
            PrimaryText = Color3.fromRGB(255, 255, 255),
            MutedText = Color3.fromRGB(140, 145, 160),
            AlertRed = Color3.fromRGB(235, 75, 75)
        }
    }
}

local theme = OriginUI.Themes[OriginUI.Config.DefaultTheme]

-- 1. Create Core ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Origin_Framework"
ScreenGui.ResetOnSpawn = false

local success, coreGui = pcall(function() return game:GetService("CoreGui") end)
ScreenGui.Parent = success and coreGui or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

-- 2. Create Main Chassis Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainChassis"
MainFrame.Size = UDim2.new(0, OriginUI.Config.WindowSize.X, 0, OriginUI.Config.WindowSize.Y)
MainFrame.Position = UDim2.new(0.5, -OriginUI.Config.WindowSize.X/2, 0.5, -OriginUI.Config.WindowSize.Y/2)
MainFrame.BackgroundColor3 = theme.Background
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 16)
MainCorner.Parent = MainFrame

local ChassisStroke = Instance.new("UIStroke")
ChassisStroke.Color = theme.AccentLine
ChassisStroke.Thickness = 1
ChassisStroke.Parent = MainFrame

-- 3. Welcome View Container Frame
local WelcomeView = Instance.new("Frame")
WelcomeView.Name = "WelcomeView"
WelcomeView.Size = UDim2.new(1, 0, 1, 0)
WelcomeView.BackgroundTransparency = 1
WelcomeView.Parent = MainFrame

-- Central Eye Logo
local EyeLogo = Instance.new("ImageLabel")
EyeLogo.Size = UDim2.new(0, 120, 0, 65)
EyeLogo.Position = UDim2.new(0.5, -60, 0.08, 0)
EyeLogo.BackgroundTransparency = 1
EyeLogo.Image = "rbxassetid://13511110006"
EyeLogo.ImageColor3 = theme.PrimaryText
EyeLogo.ScaleType = Enum.ScaleType.Fit
EyeLogo.Parent = WelcomeView

-- Header Title
local HeaderLabel = Instance.new("TextLabel")
HeaderLabel.Size = UDim2.new(1, -40, 0, 35)
HeaderLabel.Position = UDim2.new(0, 20, 0.28, 0)
HeaderLabel.BackgroundTransparency = 1
HeaderLabel.Text = OriginUI.Config.TitleText
HeaderLabel.TextColor3 = theme.PrimaryText
HeaderLabel.TextSize = 26
HeaderLabel.Font = Enum.Font.GothamBold
HeaderLabel.TextXAlignment = Enum.TextXAlignment.Center
HeaderLabel.Parent = WelcomeView

-- Subtitle Description Text
local DescriptionLabel = Instance.new("TextLabel")
DescriptionLabel.Size = UDim2.new(1, -80, 0, 60)
DescriptionLabel.Position = UDim2.new(0, 40, 0.38, 0)
DescriptionLabel.BackgroundTransparency = 1
DescriptionLabel.Text = OriginUI.Config.DescriptionText
DescriptionLabel.TextColor3 = theme.MutedText
DescriptionLabel.TextSize = 13
DescriptionLabel.Font = Enum.Font.Gotham
DescriptionLabel.TextWrapped = true
DescriptionLabel.TextXAlignment = Enum.TextXAlignment.Center
DescriptionLabel.TextYAlignment = Enum.TextYAlignment.Top
DescriptionLabel.Parent = WelcomeView

-- Sign In Button
local SignInButton = Instance.new("TextButton")
SignInButton.Size = UDim2.new(1, -80, 0, 48)
SignInButton.Position = UDim2.new(0, 40, 0.63, 0)
SignInButton.BackgroundColor3 = theme.PanelElement
SignInButton.BorderSizePixel = 0
SignInButton.Text = "Sign in"
SignInButton.TextColor3 = theme.PrimaryText
SignInButton.Font = Enum.Font.GothamBold
SignInButton.TextSize = 15
SignInButton.AutoButtonColor = true
SignInButton.Parent = WelcomeView

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 12)
BtnCorner.Parent = SignInButton

local ButtonBorder = Instance.new("UIStroke")
ButtonBorder.Color = theme.AccentLine
ButtonBorder.Thickness = 1
ButtonBorder.Parent = SignInButton

-- Footer Text
local FooterLabel = Instance.new("TextLabel")
FooterLabel.Size = UDim2.new(1, 0, 0, 20)
FooterLabel.Position = UDim2.new(0, 0, 0.9, 0)
FooterLabel.BackgroundTransparency = 1
FooterLabel.Text = OriginUI.Config.FooterText
FooterLabel.TextColor3 = theme.MutedText
FooterLabel.TextSize = 12
FooterLabel.Font = Enum.Font.Gotham
FooterLabel.TextXAlignment = Enum.TextXAlignment.Center
FooterLabel.Parent = WelcomeView

-- 4. Credentials View Frame
local CredentialsView = Instance.new("Frame")
CredentialsView.Name = "CredentialsView"
CredentialsView.Size = UDim2.new(1, 0, 1, 0)
CredentialsView.BackgroundTransparency = 1
CredentialsView.Visible = false
CredentialsView.Parent = MainFrame

local UsernameBox = Instance.new("TextBox")
UsernameBox.Size = UDim2.new(0, 280, 0, 42)
UsernameBox.Position = UDim2.new(0.5, -140, 0.3, -21)
UsernameBox.BackgroundColor3 = theme.PanelElement
UsernameBox.BorderSizePixel = 0
UsernameBox.Text = ""
UsernameBox.PlaceholderText = "Username"
UsernameBox.PlaceholderColor3 = theme.MutedText
UsernameBox.TextColor3 = theme.PrimaryText
UsernameBox.TextSize = 14
UsernameBox.Font = Enum.Font.Gotham
UsernameBox.Parent = CredentialsView

local UserCorner = Instance.new("UICorner")
UserCorner.CornerRadius = UDim.new(0, 6)
UserCorner.Parent = UsernameBox

local UserStroke = Instance.new("UIStroke")
UserStroke.Color = theme.AccentLine
UserStroke.Parent = UsernameBox

local PasswordBox = Instance.new("TextBox")
PasswordBox.Size = UDim2.new(0, 280, 0, 42)
PasswordBox.Position = UDim2.new(0.5, -140, 0.5, -21)
PasswordBox.BackgroundColor3 = theme.PanelElement
PasswordBox.BorderSizePixel = 0
PasswordBox.Text = ""
PasswordBox.PlaceholderText = "Password"
PasswordBox.PlaceholderColor3 = theme.MutedText
PasswordBox.TextColor3 = theme.PrimaryText
PasswordBox.TextSize = 14
PasswordBox.Font = Enum.Font.Gotham
PasswordBox.Parent = CredentialsView

local PassCorner = Instance.new("UICorner")
PassCorner.CornerRadius = UDim.new(0, 6)
PassCorner.Parent = PasswordBox

local PassStroke = Instance.new("UIStroke")
PassStroke.Color = theme.AccentLine
PassStroke.Parent = PasswordBox

local FinalSubmitButton = Instance.new("TextButton")
FinalSubmitButton.Size = UDim2.new(0, 180, 0, 42)
FinalSubmitButton.Position = UDim2.new(0.5, -90, 0.75, -21)
FinalSubmitButton.BackgroundColor3 = theme.PanelElement
FinalSubmitButton.BorderSizePixel = 0
FinalSubmitButton.Text = "Login"
FinalSubmitButton.TextColor3 = theme.PrimaryText
FinalSubmitButton.Font = Enum.Font.GothamBold
FinalSubmitButton.TextSize = 14
FinalSubmitButton.AutoButtonColor = true
FinalSubmitButton.Parent = CredentialsView

local SubmitCorner = Instance.new("UICorner")
SubmitCorner.CornerRadius = UDim.new(0, 6)
SubmitCorner.Parent = FinalSubmitButton

local SubmitStroke = Instance.new("UIStroke")
SubmitStroke.Color = theme.AccentLine
SubmitStroke.Parent = FinalSubmitButton

local ErrorMessageLabel = Instance.new("TextLabel")
ErrorMessageLabel.Size = UDim2.new(1, 0, 0, 20)
ErrorMessageLabel.Position = UDim2.new(0, 0, 0.88, 0)
ErrorMessageLabel.BackgroundTransparency = 1
ErrorMessageLabel.TextTransparency = 1
ErrorMessageLabel.Text = ""
ErrorMessageLabel.TextColor3 = theme.AlertRed
ErrorMessageLabel.Font = Enum.Font.GothamBold
ErrorMessageLabel.TextSize = 13
ErrorMessageLabel.TextXAlignment = Enum.TextXAlignment.Center
ErrorMessageLabel.Parent = CredentialsView

-- View Transitions
SignInButton.MouseButton1Click:Connect(function()
    WelcomeView.Visible = false
    UsernameBox.Text = ""
    PasswordBox.Text = ""
    ErrorMessageLabel.TextTransparency = 1
    CredentialsView.Visible = true
end)

-- Non-blocking Async Login Handler
FinalSubmitButton.MouseButton1Click:Connect(function()
    local targetUser = tostring(UsernameBox.Text)
    local targetPass = tostring(PasswordBox.Text)
    
    if targetUser == "" or targetPass == "" then
        ErrorMessageLabel.Text = "Please fill in all empty fields."
        ErrorMessageLabel.TextColor3 = theme.AlertRed
        ErrorMessageLabel.TextTransparency = 0
        return
    end
    
    ErrorMessageLabel.Text = "Verifying secure tokens..."
    ErrorMessageLabel.TextColor3 = theme.PrimaryText
    ErrorMessageLabel.TextTransparency = 0
    
    task.spawn(function()
        local hwidSuccess, machineFingerprint = pcall(function() 
            return game:GetService("RbxAnalyticsService"):GetClientId() 
        end)
        machineFingerprint = hwidSuccess and machineFingerprint or "UNKNOWN_ENV"
        
        local networkPayload = { username = targetUser, password = targetPass, hwid = tostring(machineFingerprint) }
        local HttpService = game:GetService("HttpService")
        
        local encodeSuccess, jsonPayload = pcall(function()
            return HttpService:JSONEncode(networkPayload)
        end)
        
        if not encodeSuccess then
            ErrorMessageLabel.Text = "Encoding error."
            ErrorMessageLabel.TextColor3 = theme.AlertRed
            return
        end

        local requestSuccess, serverResponse = pcall(function()
            return HttpService:RequestAsync({
                Url = OriginUI.Config.API_URL,
                Method = "POST",
                Headers = { ["Content-Type"] = "application/json" },
                Body = jsonPayload
            })
        end)
        
        if not requestSuccess or not serverResponse then
            ErrorMessageLabel.Text = "Server offline."
            ErrorMessageLabel.TextColor3 = theme.AlertRed
            return
        end
        
        local parseSuccess, parsedData = pcall(function()
            return HttpService:JSONDecode(serverResponse.Body)
        end)
        
        if parseSuccess and serverResponse.StatusCode == 200 and parsedData and parsedData.status == "Authenticated" then
            ErrorMessageLabel.Text = "Access Granted!"
            ErrorMessageLabel.TextColor3 = Color3.fromRGB(46, 204, 113)
            task.wait(0.5)
            ScreenGui:Destroy()
            print("[Origin] Launching system UI dashboard structures...")
        else
            local errorMsg = (parseSuccess and parsedData and parsedData.detail) or "Invalid credentials."
            ErrorMessageLabel.Text = errorMsg
            ErrorMessageLabel.TextColor3 = theme.AlertRed
        end
    end)
end)
