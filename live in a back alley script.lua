local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local UIS = game:GetService("UserInputService")

-- Чистим старые GUI если они есть
if CoreGui:FindFirstChild("VerifyKey_System") then CoreGui.VerifyKey_System:Destroy() end
if CoreGui:FindFirstChild("Gemini_Original_Full_400") then CoreGui.Gemini_Original_Full_400:Destroy() end

local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "VerifyKey_System"
KeyGui.Parent = CoreGui

-----------------------------------------------------------
-- ИНТЕРФЕЙС СИСТЕМЫ КЛЮЧЕЙ (VERIFY KEY)
-----------------------------------------------------------
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 300, 0, 160)
Main.Position = UDim2.new(0.5, -150, 0.5, -80)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Parent = KeyGui
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 8)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "VERIFY KEY"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.BackgroundTransparency = 1
Title.Parent = Main

local Input = Instance.new("TextBox")
Input.Size = UDim2.new(0, 240, 0, 35)
Input.Position = UDim2.new(0.5, -120, 0, 50)
Input.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Input.Text = ""
Input.PlaceholderText = "Enter key here..."
Input.TextColor3 = Color3.new(1, 1, 1)
Input.Parent = Main
Instance.new("UICorner", Input)

local Check = Instance.new("TextButton")
Check.Size = UDim2.new(0, 115, 0, 35)
Check.Position = UDim2.new(0, 30, 0, 100)
Check.BackgroundColor3 = Color3.fromRGB(50, 120, 50)
Check.Text = "CHECK"
Check.TextColor3 = Color3.new(1, 1, 1)
Check.Font = Enum.Font.GothamBold
Check.Parent = Main
Instance.new("UICorner", Check)

local Copy = Instance.new("TextButton")
Copy.Size = UDim2.new(0, 115, 0, 35)
Copy.Position = UDim2.new(0, 155, 0, 100)
Copy.BackgroundColor3 = Color3.fromRGB(120, 100, 40)
Copy.Text = "GET KEY"
Copy.TextColor3 = Color3.new(1, 1, 1)
Copy.Font = Enum.Font.GothamBold
Copy.Parent = Main
Instance.new("UICorner", Copy)

-----------------------------------------------------------
-- ФУНКЦИЯ ЗАПУСКА ТВОЕГО ОРИГИНАЛЬНОГО КОДА
-----------------------------------------------------------
local function LoadMainScript()
    KeyGui:Destroy() -- Закрываем окно ключа
    
    -- ТВОЙ КОД НАЧИНАЕТСЯ ТУТ (БЕЗ ИЗМЕНЕНИЙ)
    local Players = game:GetService("Players")
    local CoreGui = game:GetService("CoreGui")
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local VirtualUser = game:GetService("VirtualUser")
    local VirtualInputManager = game:GetService("VirtualInputManager")

    local LocalPlayer = Players.LocalPlayer
    if not LocalPlayer then
        Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
        LocalPlayer = Players.LocalPlayer
    end

    if CoreGui:FindFirstChild("Gemini_Original_Full_400") then CoreGui.Gemini_Original_Full_400:Destroy() end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "Gemini_Original_Full_400"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.DisplayOrder = 10
    ScreenGui.Parent = CoreGui

    local function Round(obj, radius)
        local uiCorner = Instance.new("UICorner")
        uiCorner.CornerRadius = UDim.new(0, radius)
        uiCorner.Parent = obj
    end

    local function ApplyResponsiveText(label, maxSize)
        label.TextScaled = true
        local constraint = Instance.new("UITextSizeConstraint")
        constraint.MaxTextSize = maxSize
        constraint.MinTextSize = 8
        constraint.Parent = label
    end

    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 420, 0, 320)
    MainFrame.Position = UDim2.new(0.5, -210, 0.5, -160)
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    MainFrame.Active = true
    MainFrame.Parent = ScreenGui
    Round(MainFrame, 8)

    local MainStroke = Instance.new("UIStroke")
    MainStroke.Thickness = 1.5
    MainStroke.Color = Color3.fromRGB(60, 60, 75)
    MainStroke.Parent = MainFrame

    local TabBar = Instance.new("Frame")
    TabBar.Size = UDim2.new(1, 0, 0, 40)
    TabBar.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    TabBar.BorderSizePixel = 0
    TabBar.Parent = MainFrame
    Round(TabBar, 8)

    local dragging, dragStart, startPos
    TabBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    local TabList = Instance.new("UIListLayout")
    TabList.FillDirection = Enum.FillDirection.Horizontal
    TabList.Parent = TabBar

    local Pages = Instance.new("Frame")
    Pages.Size = UDim2.new(1, -20, 1, -60)
    Pages.Position = UDim2.new(0, 10, 0, 50)
    Pages.BackgroundTransparency = 1
    Pages.Parent = MainFrame

    local function CreateTab(name, layoutOrder)
        local TabBtn = Instance.new("TextButton")
        TabBtn.Size = UDim2.new(0, 80, 1, 0)
        TabBtn.BackgroundTransparency = 1
        TabBtn.Text = name
        TabBtn.TextColor3 = Color3.fromRGB(120, 120, 130)
        TabBtn.Font = Enum.Font.GothamMedium
        TabBtn.LayoutOrder = layoutOrder
        TabBtn.Parent = TabBar
        ApplyResponsiveText(TabBtn, 12)
        
        local Page = Instance.new("ScrollingFrame")
        Page.Name = name .. "_Page"
        Page.Size = UDim2.new(1, 0, 1, 0)
        Page.BackgroundTransparency = 1
        Page.Visible = false
        Page.ScrollBarThickness = 2
        Page.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 90)
        Page.AutomaticCanvasSize = Enum.AutomaticSize.Y
        Page.Parent = Pages
        
        local PageList = Instance.new("UIListLayout")
        PageList.Padding = UDim.new(0, 10)
        PageList.Parent = Page
        
        TabBtn.MouseButton1Click:Connect(function()
            for _, p in pairs(Pages:GetChildren()) do p.Visible = false end
            for _, t in pairs(TabBar:GetChildren()) do if t:IsA("TextButton") then t.TextColor3 = Color3.fromRGB(120, 120, 130) end end
            Page.Visible = true
            TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        end)
        return Page, TabBtn
    end

    local function CreateButton(parent, text, color)
        local Btn = Instance.new("TextButton")
        Btn.Size = UDim2.new(1, -5, 0, 40)
        Btn.BackgroundColor3 = color or Color3.fromRGB(35, 35, 45)
        Btn.Text = text
        Btn.TextColor3 = Color3.fromRGB(230, 230, 230)
        Btn.Font = Enum.Font.GothamSemibold
        Btn.Parent = parent
        Round(Btn, 6)
        ApplyResponsiveText(Btn, 14)
        Instance.new("UIStroke", Btn).Color = Color3.fromRGB(55, 55, 65)
        return Btn
    end

    local VisualsPage, VisualsTab = CreateTab("VISUALS", 1)
    local TeleportsPage, TeleportsTab = CreateTab("TELEPORTS", 2)
    local MiscPage, MiscTab = CreateTab("MISC", 3)
    local AutofarmPage, AutofarmTab = CreateTab("AUTOFARM", 4)

    VisualsPage.Visible = true
    VisualsTab.TextColor3 = Color3.fromRGB(255, 255, 255)

    local currentFarm = nil 
    local selling = false
    local sellPos = Vector3.new(71.575, 10.237, -89.817)

    local points = {
        Alley = {
            CFrame.new(50.5084, 9.1736, 37.6717),
            CFrame.new(28.4214, 8.5224, 28.9827),
            CFrame.new(41.6648, 8.1298, 7.0735),
            CFrame.new(30.4015, 10.0908, 54.4409)
        },
        Bridge = {
            CFrame.new(104.1, 23.6, -313.1),
            CFrame.new(91.7, 9.7, -287.6),
            CFrame.new(143.5, 5.3, -272.0),
            CFrame.new(106.8, 8.4, -264.7)
        },
        Hood = {
            CFrame.new(398.905, 31.863, -67.969),
            CFrame.new(397.614, 31.663, -107.066),
            CFrame.new(386.440, 31.663, -196.603),
            CFrame.new(516.394, 31.387, -86.405)
        }
    }

    local function GetT(n)
        local c = LocalPlayer.Character
        if not c then return nil end
        
        for _, v in pairs(c:GetChildren()) do
            if v:IsA("Tool") then
                if n == "HOOD_ITEM" then
                    if not (v.Name:lower():find("knife") or v.Name:lower():find("glass")) then
                        v.Parent = LocalPlayer.Backpack
                    end
                else
                    if not v.Name:lower():find(n:lower()) then
                        v.Parent = LocalPlayer.Backpack
                    end
                end
            end
        end

        local currentTool = c:FindFirstChildOfClass("Tool")
        if currentTool then
            if n == "HOOD_ITEM" then
                if currentTool.Name:lower():find("knife") or currentTool.Name:lower():find("glass") then return currentTool end
            elseif currentTool.Name:lower():find(n:lower()) then
                return currentTool
            end
        end
        
        for _, v in pairs(LocalPlayer.Backpack:GetChildren()) do 
            if n == "HOOD_ITEM" then
                if v.Name:lower():find("knife") or v.Name:lower():find("glass") then 
                    v.Parent = c; task.wait(0.1); return v 
                end
            elseif v.Name:lower():find(n:lower()) then 
                v.Parent = c; task.wait(0.1); return v 
            end 
        end
        return nil
    end

    local function IsInventoryFull()
        local pg = LocalPlayer:FindFirstChild("PlayerGui")
        if not pg then return false end
        for _, v in pairs(pg:GetDescendants()) do
            if v:IsA("TextLabel") and v.Visible and v.AbsolutePosition.Y > (workspace.CurrentCamera.ViewportSize.Y * 0.6) then
                local txt = v.Text
                if txt:find("/") then
                    local s = txt:gsub("[^%d/]", ""):split("/")
                    if #s == 2 then
                        local c, m = tonumber(s[1]), tonumber(s[2])
                        if c and m and c >= m and m > 0 then return true end
                    end
                end
            end
        end
        return false
    end

    local function ClickObj(obj)
        if not obj or obj:IsDescendantOf(ScreenGui) then return end
        local x = obj.AbsolutePosition.X + (obj.AbsoluteSize.X / 2)
        local y = obj.AbsolutePosition.Y + (obj.AbsoluteSize.Y / 2) + 58
        VirtualInputManager:SendMouseButtonEvent(x, y, 0, true, game, 0)
        task.wait(0.05)
        VirtualInputManager:SendMouseButtonEvent(x, y, 0, false, game, 0)
    end

    local AlleyBtn = CreateButton(AutofarmPage, "FARM ALLEY: OFF")
    local BridgeBtn = CreateButton(AutofarmPage, "FARM BRIDGE: OFF")
    local HoodBtn = CreateButton(AutofarmPage, "FARM HOOD: OFF")

    local function UpdateFarmUI()
        AlleyBtn.Text = (currentFarm == "Alley") and "FARM ALLEY: ON" or "FARM ALLEY: OFF"
        AlleyBtn.TextColor3 = (currentFarm == "Alley") and Color3.fromRGB(100, 255, 150) or Color3.fromRGB(255, 100, 100)
        BridgeBtn.Text = (currentFarm == "Bridge") and "FARM BRIDGE: ON" or "FARM BRIDGE: OFF"
        BridgeBtn.TextColor3 = (currentFarm == "Bridge") and Color3.fromRGB(100, 255, 150) or Color3.fromRGB(255, 100, 100)
        HoodBtn.Text = (currentFarm == "Hood") and "FARM HOOD: ON" or "FARM HOOD: OFF"
        HoodBtn.TextColor3 = (currentFarm == "Hood") and Color3.fromRGB(100, 255, 150) or Color3.fromRGB(255, 100, 100)
    end

    local function CheckTools(mode)
        local hasTool = false
        if mode == "Alley" then hasTool = GetT("Stick")
        elseif mode == "Bridge" then hasTool = GetT("Shovel")
        elseif mode == "Hood" then hasTool = GetT("HOOD_ITEM") end
        return hasTool
    end

    AlleyBtn.MouseButton1Click:Connect(function()
        if currentFarm == "Alley" then currentFarm = nil 
        else
            if not CheckTools("Alley") then 
                AlleyBtn.Text = "BUY STICK FIRST!"
                task.delay(3, function() UpdateFarmUI() end)
                return 
            end
            currentFarm = "Alley"
            if LocalPlayer.Character then LocalPlayer.Character.HumanoidRootPart.CFrame = points.Alley[math.random(1, #points.Alley)] end
        end
        selling = false; UpdateFarmUI()
    end)

    BridgeBtn.MouseButton1Click:Connect(function()
        if currentFarm == "Bridge" then currentFarm = nil 
        else
            if not CheckTools("Bridge") then 
                BridgeBtn.Text = "BUY SHOVEL FIRST!"
                task.delay(3, function() UpdateFarmUI() end)
                return 
            end
            currentFarm = "Bridge"
            if LocalPlayer.Character then LocalPlayer.Character.HumanoidRootPart.CFrame = points.Bridge[math.random(1, #points.Bridge)] end
        end
        selling = false; UpdateFarmUI()
    end)

    HoodBtn.MouseButton1Click:Connect(function()
        if currentFarm == "Hood" then currentFarm = nil 
        else
            if not CheckTools("Hood") then 
                HoodBtn.Text = "BUY KNIFE FIRST!"
                task.delay(3, function() UpdateFarmUI() end)
                return 
            end
            currentFarm = "Hood"
            if LocalPlayer.Character then LocalPlayer.Character.HumanoidRootPart.CFrame = points.Hood[math.random(1, #points.Hood)] end
        end
        selling = false; UpdateFarmUI()
    end)

    task.spawn(function()
        while true do
            task.wait(0.15)
            if currentFarm and not selling then
                local toolReq = "Stick"
                if currentFarm == "Bridge" then toolReq = "Shovel"
                elseif currentFarm == "Hood" then toolReq = "HOOD_ITEM" end
                local t = GetT(toolReq)
                if t then 
                    t:Activate()
                    VirtualUser:Button1Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame) 
                end
            end
        end
    end)

    task.spawn(function()
        while true do
            task.wait(0.8)
            if currentFarm and not selling and IsInventoryFull() then
                selling = true
                if LocalPlayer.Character then
                    local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
                    if tool then tool.Parent = LocalPlayer.Backpack end
                end
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(sellPos)
                task.wait(0.7)
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                task.wait(0.05); VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                task.wait(0.8)
                
                local targetSell = nil
                local maxArea = 0
                for _, v in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
                    if v:IsA("TextButton") and v.Visible and not v:IsDescendantOf(ScreenGui) then
                        if v.Text:lower():find("sell") then
                            local area = v.AbsoluteSize.X * v.AbsoluteSize.Y
                            if area > maxArea then maxArea = area; targetSell = v end
                        end
                    end
                end
                if targetSell then ClickObj(targetSell) end
                task.wait(0.6)
                
                for _, v in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
                    if v:IsA("GuiButton") and v.Visible and not v:IsDescendantOf(ScreenGui) then
                        local name = v.Name:lower()
                        local text = ""
                        pcall(function() if v:IsA("TextButton") then text = v.Text:lower() end end)
                        if name == "x" or name:find("close") or name:find("exit") or text == "x" or text:find("close") then
                            ClickObj(v)
                        end
                    end
                end
                task.wait(0.4)
                if currentFarm then 
                    LocalPlayer.Character.HumanoidRootPart.CFrame = points[currentFarm][math.random(1, #points[currentFarm])]
                end
                task.wait(0.5)
                selling = false
            end
        end
    end)

    local tps = {
        {"STORE", Vector3.new(-38.449, 10.852, -68.450), Color3.fromRGB(35, 45, 60)},
        {"SELL", Vector3.new(71.575, 10.237, -89.817), Color3.fromRGB(60, 35, 35)},
        {"RESTAURANT", Vector3.new(5.200, 13.596, 33.835), Color3.fromRGB(35, 60, 45)},
        {"BRIDGE", Vector3.new(192.357, 11.776, -240.603), Color3.fromRGB(45, 45, 60)},
        {"BOX GUY", Vector3.new(213.744, 8.850, -132.842), Color3.fromRGB(60, 50, 35)},
        {"LAUNDROMAT", Vector3.new(454.156, 34.593, -94.066), Color3.fromRGB(40, 55, 55)},
        {"HOOD", Vector3.new(386.126, 34.583, -128.686), Color3.fromRGB(50, 30, 50)},
        {"IDK", Vector3.new(352.555, 35.433, -204.485), Color3.fromRGB(45, 45, 45)}
    }
    for _, data in pairs(tps) do
        local b = CreateButton(TeleportsPage, "GO TO: " .. data[1], data[3])
        b.MouseButton1Click:Connect(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then 
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(data[2]) 
            end
        end)
    end

    local espActive = false
    local EspBtn = CreateButton(VisualsPage, "PLAYER ESP: OFF", Color3.fromRGB(40, 35, 35))
    EspBtn.MouseButton1Click:Connect(function()
        espActive = not espActive
        EspBtn.Text = espActive and "PLAYER ESP: ON" or "PLAYER ESP: OFF"
        EspBtn.TextColor3 = espActive and Color3.fromRGB(100, 255, 150) or Color3.fromRGB(255, 100, 100)
        if not espActive then
            for _, p in pairs(Players:GetPlayers()) do
                if p.Character and p.Character:FindFirstChild("ESP_Highlight") then p.Character.ESP_Highlight:Destroy() end
            end
        end
    end)

    local flyActive, noclipActive, antiAfkActive = false, false, false
    local flySpeed = 70

    local function StartFly()
        local char = LocalPlayer.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end
        local root = char.HumanoidRootPart
        local bg = Instance.new("BodyGyro", root); bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9); bg.P = 9e4
        local bv = Instance.new("BodyVelocity", root); bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        task.spawn(function()
            while flyActive and char.Parent do
                RunService.RenderStepped:Wait()
                local cam = workspace.CurrentCamera
                bg.CFrame = cam.CFrame
                local dir = Vector3.new()
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir += cam.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir -= cam.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir -= cam.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir += cam.CFrame.RightVector end
                bv.Velocity = dir.Magnitude > 0 and dir.Unit * flySpeed or Vector3.new(0, 0.1, 0)
            end
            bg:Destroy(); bv:Destroy()
        end)
    end

    local FlyBtn = CreateButton(MiscPage, "FLY: OFF")
    FlyBtn.MouseButton1Click:Connect(function()
        flyActive = not flyActive; FlyBtn.Text = flyActive and "FLY: ON" or "FLY: OFF"
        FlyBtn.TextColor3 = flyActive and Color3.fromRGB(100, 255, 150) or Color3.fromRGB(255, 100, 100)
        if flyActive then StartFly() end
    end)

    local NoclipBtn = CreateButton(MiscPage, "NOCLIP: OFF")
    NoclipBtn.MouseButton1Click:Connect(function()
        noclipActive = not noclipActive
        NoclipBtn.Text = noclipActive and "NOCLIP: ON" or "NOCLIP: OFF"
        NoclipBtn.TextColor3 = noclipActive and Color3.fromRGB(100, 255, 150) or Color3.fromRGB(255, 100, 100)
        
        if not noclipActive and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)

    local BusBtn = CreateButton(MiscPage, "Go through bus without ticket", Color3.fromRGB(50, 45, 35))
    BusBtn.MouseButton1Click:Connect(function()
        local busPos = Vector3.new(71.289, 15.142, -219.717)
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") and (obj.Position - busPos).Magnitude < 5 then obj:Destroy() end
        end
    end)

    local HoodBtnMisc = CreateButton(MiscPage, "Go to hood without ticket", Color3.fromRGB(45, 35, 50))
    HoodBtnMisc.MouseButton1Click:Connect(function()
        local hood = workspace:FindFirstChild("Hood")
        if hood then
            local entry = hood:FindFirstChild("HoodEntry")
            if entry then entry:Destroy(); HoodBtnMisc.Text = "HoodEntry Deleted!" else HoodBtnMisc.Text = "Not Found" end
        else HoodBtnMisc.Text = "Hood Folder Not Found" end
        task.wait(2); HoodBtnMisc.Text = "Go to hood without ticket"
    end)

    local AfkBtn = CreateButton(MiscPage, "ANTI-AFK: OFF")
    AfkBtn.MouseButton1Click:Connect(function()
        antiAfkActive = not antiAfkActive; AfkBtn.Text = antiAfkActive and "ANTI-AFK: ON" or "ANTI-AFK: OFF"
        AfkBtn.TextColor3 = antiAfkActive and Color3.fromRGB(100, 255, 150) or Color3.fromRGB(255, 100, 100)
    end)

    LocalPlayer.Idled:Connect(function() if antiAfkActive then VirtualUser:CaptureController(); VirtualUser:ClickButton2(Vector2.new()) end end)
    RunService.Stepped:Connect(function() if noclipActive and LocalPlayer.Character then for _, v in pairs(LocalPlayer.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end end end)
    RunService.RenderStepped:Connect(function() if espActive then for _, p in pairs(Players:GetPlayers()) do if p ~= LocalPlayer and p.Character then local hl = p.Character:FindFirstChild("ESP_Highlight") or Instance.new("Highlight", p.Character) hl.Name = "ESP_Highlight"; hl.Enabled = true end end end end)
    UserInputService.InputBegan:Connect(function(i, g) if not g and i.KeyCode == Enum.KeyCode.Insert then MainFrame.Visible = not MainFrame.Visible end end)
end

-----------------------------------------------------------
-- ЛОГИКА КНОПОК ПРОВЕРКИ КЛЮЧА
-----------------------------------------------------------
Check.MouseButton1Click:Connect(function()
    -- ТУТ ТВОЙ КЛЮЧ
    if Input.Text == "update20.03" then
        LoadMainScript()
    else
        Input.Text = ""
        Input.PlaceholderText = "WRONG KEY!"
    end
end)

Copy.MouseButton1Click:Connect(function()
    -- ТВОЯ ССЫЛКА НА LINKVERTISE
    setclipboard("https://linkvertise.com/4333014/yrZuO5N2YqUA?o=sharing")
    Copy.Text = "COPIED!"
    task.wait(1)
    Copy.Text = "GET KEY"
end)
