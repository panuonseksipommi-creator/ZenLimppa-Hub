-- === ZenLimppa Hub | Hidden Scripts + Yub X Friendly ===
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local baseKey = "femboydihh"
local permanentKey = "Femboy tit sucker"
local unlocked = false
local saveFile = "ZenLimppaUnlocked.txt"

-- Load saved key
if isfile and isfile(saveFile) then
    unlocked = true
end

local function getDailyKey()
    local t = os.date("*t")
    return baseKey .. "-" .. t.year .. string.format("%02d", t.month) .. string.format("%02d", t.day)
end

local Window = Rayfield:CreateWindow({
    Name = "ZenLimppa Hub",
    LoadingTitle = "Loading ZenLimppa Hub...",
    LoadingSubtitle = "by ZenLimppa",
})

local MainTab = Window:CreateTab("Main", 4483362458)
local ScriptsTab = Window:CreateTab("Scripts", 4483362458)

local enteredKey = ""

-- ==================== KEY SYSTEM ====================
MainTab:CreateSection("🔑 Key System")

MainTab:CreateButton({
    Name = "📌 Get Today's Key (Linkvertise)",
    Callback = function()
        setclipboard("https://link-hub.net/5518040/veJ0Q2Ooo5EC")
        Rayfield:Notify({Title = "✅ Link Copied!", Content = "Complete tasks then paste key below", Duration = 10})
    end
})

MainTab:CreateInput({
    Name = "Paste Key Here",
    PlaceholderText = "Enter key...",
    Callback = function(Value)
        enteredKey = Value
    end
})

MainTab:CreateButton({
    Name = "Submit Key",
    Callback = function()
        local today = getDailyKey()
        
        if enteredKey == today or enteredKey == permanentKey or enteredKey:lower() == permanentKey:lower() then
            unlocked = true
            if writefile then writefile(saveFile, "true") end
            
            Rayfield:Notify({
                Title = "✅ Access Granted",
                Content = "Scripts are now unlocked!",
                Duration = 8
            })
            
            -- Optional: You can notify user that Scripts tab is now available
        else
            Rayfield:Notify({Title = "❌ Wrong Key", Content = "Please try again", Duration = 5})
        end
    end
})

-- ==================== SCRIPTS (Hidden until unlocked) ====================
ScriptsTab:CreateSection("🚀 Script Loader")

local function canLoad()
    if not unlocked then
        Rayfield:Notify({Title = "🔒 Locked", Content = "Submit correct key on Main tab first!", Duration = 6})
        return false
    end
    return true
end

ScriptsTab:CreateButton({
    Name = "Load Crim V2",
    Callback = function() if canLoad() then loadstring(game:HttpGet("https://raw.githubusercontent.com/panuonseksipommi-creator/Crim-V2/refs/heads/main/CrimV2.lua"))() end end
})

ScriptsTab:CreateButton({
    Name = "Load LimppaHub (Arsenal)",
    Callback = function() if canLoad() then loadstring(game:HttpGet("https://raw.githubusercontent.com/panuonseksipommi-creator/Arsenal/refs/heads/main/LimppaHub.lua"))() end end
})

ScriptsTab:CreateButton({
    Name = "Limppa Hub (Fisch)",
    Callback = function() if canLoad() then loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/f6c9f276f7d6a7dd6edfd0173d7a211d.lua"))() end end
})

-- Auto message
if unlocked then
    Rayfield:Notify({Title = "✅ Auto Unlocked", Content = "Scripts are ready", Duration = 7})
else
    Rayfield:Notify({Title = "ZenLimppa Hub", Content = "Enter key on Main tab to unlock scripts", Duration = 10})
end
