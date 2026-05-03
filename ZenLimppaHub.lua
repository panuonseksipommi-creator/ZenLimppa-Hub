-- === ZenLimppa Hub | Strong Close ===
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local baseKey = "femboydihh"
local permanentKey = "Femboy tit sucker"

local unlocked = false
local isCreator = false
local saveFile = "ZenLimppaUnlocked.txt"

if isfile and isfile(saveFile) then unlocked = true end

local function getDailyKey()
    local t = os.date("*t")
    return baseKey .. "-" .. t.year .. string.format("%02d", t.month) .. string.format("%02d", t.day)
end

local Window = Rayfield:CreateWindow({
    Name = "ZenLimppa Hub",
    LoadingTitle = "ZenLimppa Hub",
    LoadingSubtitle = "by ZenLimppa",
})

local MainTab = Window:CreateTab("Main", 4483362458)
local ScriptsTab = Window:CreateTab("Scripts", 4483362458)

local enteredKey = ""
local generateButton = nil

MainTab:CreateSection("🔑 Key System")

MainTab:CreateButton({
    Name = "📌 Get Key via Linkvertise",
    Callback = function()
        setclipboard("https://link-hub.net/5518040/veJ0Q2Ooo5EC")
        Rayfield:Notify({Title = "✅ Link Copied!", Content = "Complete tasks then paste key", Duration = 10})
    end
})

MainTab:CreateInput({
    Name = "Paste Key Here",
    PlaceholderText = "Enter key...",
    Callback = function(Value) enteredKey = Value end
})

MainTab:CreateButton({
    Name = "Submit Key",
    Callback = function()
        local today = getDailyKey()
        if enteredKey == today then
            unlocked = true
            isCreator = false
            if writefile then writefile(saveFile, "true") end
            Rayfield:Notify({Title = "✅ Success", Content = "Daily key accepted", Duration = 8})
        elseif enteredKey == permanentKey or enteredKey:lower() == permanentKey:lower() then
            unlocked = true
            isCreator = true
            if writefile then writefile(saveFile, "true") end
            Rayfield:Notify({Title = "✅ Creator Access", Content = "Permanent key accepted", Duration = 10})
            
            if not generateButton then
                generateButton = MainTab:CreateButton({
                    Name = "🔑 Generate Today's Key",
                    Callback = function()
                        local key = getDailyKey()
                        setclipboard(key)
                        Rayfield:Notify({Title = "✅ Key Copied", Content = key, Duration = 12})
                    end
                })
            end
        else
            Rayfield:Notify({Title = "❌ Wrong Key", Content = "Invalid", Duration = 5})
        end
    end
})

MainTab:CreateButton({
    Name = "🔄 Reset Key",
    Callback = function()
        unlocked = false
        isCreator = false
        if isfile and isfile(saveFile) then delfile(saveFile) end
        Rayfield:Notify({Title = "✅ Reset Done", Content = "Key deleted", Duration = 8})
    end
})

-- Strong Close Button
MainTab:CreateButton({
    Name = "❌ Close Hub (Force)",
    Callback = function()
        Rayfield:Notify({Title = "Closing Hub...", Content = "Please wait", Duration = 3})
        
        task.spawn(function()
            task.wait(0.5)
            pcall(function() Window:Destroy() end)
            task.wait(0.3)
            -- Extra aggressive close
            pcall(function()
                local rayfield = game:GetService("CoreGui"):FindFirstChild("Rayfield")
                if rayfield then rayfield:Destroy() end
            end)
        end)
    end
})

-- Scripts (same as before)
ScriptsTab:CreateSection("🚀 Script Loader")

local function Load(name, url)
    if not unlocked then
        Rayfield:Notify({Title = "🔒 Locked", Content = "Enter key first!", Duration = 5})
        return
    end
    Rayfield:Notify({Title = "Loading " .. name, Content = "", Duration = 4})
    task.spawn(function() loadstring(game:HttpGet(url))() end)
end

ScriptsTab:CreateButton({Name = "Load Crim V2", Callback = function() Load("Crim V2", "https://raw.githubusercontent.com/panuonseksipommi-creator/Crim-V2/refs/heads/main/CrimV2.lua") end})
ScriptsTab:CreateButton({Name = "Load LimppaHub (Arsenal)", Callback = function() Load("LimppaHub (Arsenal)", "https://raw.githubusercontent.com/panuonseksipommi-creator/Arsenal/refs/heads/main/LimppaHub.lua") end})
ScriptsTab:CreateButton({Name = "Limppa Hub (Fisch)", Callback = function() Load("Limppa Hub (Fisch)", "https://api.luarmor.net/files/v3/loaders/f6c9f276f7d6a7dd6edfd0173d7a211d.lua") end})

if unlocked then Rayfield:Notify({Title = "✅ Auto Unlocked", Content = "Ready", Duration = 6}) end
