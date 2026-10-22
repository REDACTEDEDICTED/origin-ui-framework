-- ========================================================
-- ORIGIN CLIENT-SIDE MASTER INTEGRATION BOOTLOADER
-- ========================================================
print("[Origin Bootloader] Linking frontend layout canvases with backend API routing locks...")

-- 1. Pull the external visual layout schema from local project memory paths
local success, LayoutSchema = pcall(function()
    return loadstring(readfile("ui_layout.lua"))()
end)

-- Fallback initialization hook: if running as a standalone file, load core parameters
local API_GATEWAY_URL = "http://127.0.0"
local HttpService = game:GetService("HttpService")

-- 2. Intercept the Stage 2 Final Submit Button to redirect standard validation requests
FinalSubmitButton.MouseButton1Click:DisconnectAll() -- Wipe simulation loops cleanly
FinalSubmitButton.MouseButton1Click:Connect(function()
    local targetUser = UsernameBox.Text
    local targetPass = PasswordBox.Text
    
    if targetUser == "" or targetPass == "" then
        ErrorMessageLabel.Text = "Please fill in all empty fields."
        ErrorMessageLabel.TextTransparency = 0
        return
    end
    
    -- Visual update: notify client that network packets are processing
    ErrorMessageLabel.Text = "Verifying secure credential tokens..."
    ErrorMessageLabel.TextTransparency = 0
    
    -- Extract the strict executor HWID hardware fingerprint token string from active game memory
    local hwidSuccess, machineFingerprint = pcall(function()
        return game:GetService("RbxAnalyticsService"):GetClientId()
    end)
    
    if not hwidSuccess or not machineFingerprint then
        machineFingerprint = "UNKNOWN_OR_UNSUPPORTED_ENV"
    end
    
    -- Package parameters cleanly into a matching JSON dictionary block data structure
    local networkPayload = {
        username = tostring(targetUser),
        password = tostring(targetPass),
        hwid     = tostring(machineFingerprint)
    }
    
    -- 3. Open a cross-origin HTTP connection pipeline straight over to your live Python API server
    local requestSuccess, serverResponse = pcall(function()
        return HttpService:RequestAsync({
            Url = API_GATEWAY_URL,
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = HttpService:JSONEncode(networkPayload)
        })
    end)
    
    -- Handle offline network server drops or maintenance flags seamlessly
    if not requestSuccess then
        ErrorMessageLabel.Text = "Authentication server offline. Check /status in Discord."
        ErrorMessageLabel.TextTransparency = 0
        return
    end
    
    local parsedData = HttpService:JSONDecode(serverResponse.Body)
    
    -- 4. Process response codes dispatched directly from your Python SQLite backend
    if serverResponse.StatusCode == 200 and parsedData.status == "Authenticated" then
        print("[Origin Security] Token verification matched successfully! Access Granted.")
        
        -- Flash visual feedback confirmation text line
        ErrorMessageLabel.Text = "Access Granted! Initializing Option Profiles..."
        ErrorMessageLabel.TextColor3 = Color3.fromRGB(46, 204, 113) -- Flip warning line color to rich green
        ErrorMessageLabel.TextTransparency = 0
        
        task.wait(0.5)
        
        -- 5. Completely tear down the login canvas layers to mount the Stage 3 Options Dashboard panels
        CredentialsView.Visible = false
        mainChassis:Destroy() -- Destroys the entry chassis shell so the main exploit UI script can draw!
        
        -- Kick off your main features script payload right here!
        print("[Origin Client] Main dashboard scripts initialized smoothly.")
        
    else
        -- If wrong password, blacklisted user profile, or hardware layout mismatch, grab error details
        local backendErrorMessage = parsedData and parsedData.detail or "Invalid credentials or HWID mismatch."
        
        ErrorMessageLabel.Text = backendErrorMessage
        ErrorMessageLabel.TextColor3 = Color3.fromRGB(220, 60, 60) -- Ensure error retains vivid red alarm tint
        ErrorMessageLabel.TextTransparency = 0
    end
end)

print("[Origin Bootloader] Infrastructure handshake loops finalized. System ready for runtime distribution.")
