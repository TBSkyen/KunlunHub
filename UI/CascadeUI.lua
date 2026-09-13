--!nolint
--!nocheck
-- ===================================================================
-- [AGY] Axon Hub Replica - Cascade UI Edition (FULL REPLICA)
-- ===================================================================

local cascade = loadstring(game:HttpGet("https://raw.githubusercontent.com/cascadeui/Cascade/refs/heads/main/dist.luau"))()

-- LOAD TRANSLATOR
local Translator = loadstring(game:HttpGet("https://raw.githubusercontent.com/TBSkyen/KunlunHub/main/Translator/Translator.lua"))()
Translator.LoadLanguage("Thai") -- Set to "English", "Thai", or "Brazil"

local function T(category, key, defaultTitle, defaultSubtitle)
    return Translator.Title(category, key, defaultTitle), Translator.Desc(category, key, defaultSubtitle)
end

local app = cascade.New({
    Theme = cascade.Themes.Dark,
    Accent = cascade.Accents.Purple,
})

local window = app:Window({
    Title = "Axon",
    Subtitle = "v2.0 | FULL REPLICA",
    Size = UDim2.fromOffset(680, 520),
})

local mainSection = window:Section({ Title = "Main" })

local JobsTab = mainSection:Tab({
    Title = Translator.Title("tabs", "Jobs", "Jobs"),
    Selected = true,
    Icon = cascade.Symbols.briefcase,
})

do
    local JobsTabForm0 = JobsTab:Form()
    local r_0_0 = JobsTabForm0:Row()
    r_0_0:Left():TitleStack({ Title = Translator.Title("jobs", "Farming", "Farming"), Subtitle = Translator.Desc("jobs", "Farming", "Core autofarming settings") })
    local r_0_1 = JobsTabForm0:Row()
    r_0_1:Left():TitleStack({ Title = Translator.Title("jobs", "Enabled", "Enabled"), Subtitle = Translator.Desc("jobs", "Enabled", "Toggle autofarming on/off") })
    r_0_1:Right():Toggle()
    local r_0_2 = JobsTabForm0:Row()
    r_0_2:Left():TitleStack({ Title = Translator.Title("jobs", "Job", "Job"), Subtitle = Translator.Desc("jobs", "Job", "Select which job to farm") })
    r_0_2:Right():PopUpButton({ Options = {"Cook", "Janitor", "Stocker", "ATM Hacker", "Fisher", "Runner"} })
    local r_0_3 = JobsTabForm0:Row()
    r_0_3:Left():TitleStack({ Title = Translator.Title("jobs", "Anti Finish", "Anti Finish"), Subtitle = Translator.Desc("jobs", "Anti Finish", "Prevent job from completing") })
    r_0_3:Right():Toggle()
    local r_0_4 = JobsTabForm0:Row()
    r_0_4:Left():TitleStack({ Title = Translator.Title("jobs", "Respawn On Death", "Respawn On Death"), Subtitle = Translator.Desc("jobs", "Respawn On Death", "Auto respawn when killed") })
    r_0_4:Right():Toggle()
    local r_0_5 = JobsTabForm0:Row()
    r_0_5:Left():TitleStack({ Title = Translator.Title("jobs", "Stamina Farm", "Stamina Farm"), Subtitle = Translator.Desc("jobs", "Stamina Farm", "Automatically manage stamina") })
    r_0_5:Right():Toggle()
end

do
    local JobsTabForm1 = JobsTab:Form()
    local r_1_0 = JobsTabForm1:Row()
    r_1_0:Left():TitleStack({ Title = Translator.Title("jobs", "Rotation", "Rotation"), Subtitle = Translator.Desc("jobs", "Rotation", "Job rotation settings") })
    local r_1_1 = JobsTabForm1:Row()
    r_1_1:Left():TitleStack({ Title = Translator.Title("jobs", "Enable Rotation", "Enable Rotation"), Subtitle = Translator.Desc("jobs", "Enable Rotation", "Enable job rotation") })
    r_1_1:Right():Toggle()
    local r_1_2 = JobsTabForm1:Row()
    r_1_2:Left():TitleStack({ Title = Translator.Title("jobs", "Rotation Wait", "Rotation Wait"), Subtitle = Translator.Desc("jobs", "Rotation Wait", "Wait time before next job (s)") })
    r_1_2:Right():Stepper({ Min = 0, Max = 100000, Step = 1000 })
end

do
    local JobsTabForm2 = JobsTab:Form()
    local r_2_0 = JobsTabForm2:Row()
    r_2_0:Left():TitleStack({ Title = Translator.Title("jobs", "Vehicle", "Vehicle"), Subtitle = Translator.Desc("jobs", "Vehicle", "Vehicle usage settings") })
    local r_2_1 = JobsTabForm2:Row()
    r_2_1:Left():TitleStack({ Title = Translator.Title("jobs", "Use Vehicle", "Use Vehicle"), Subtitle = Translator.Desc("jobs", "Use Vehicle", "Use vehicle for travel") })
    r_2_1:Right():Toggle()
    local r_2_2 = JobsTabForm2:Row()
    r_2_2:Left():TitleStack({ Title = Translator.Title("jobs", "Type", "Type"), Subtitle = Translator.Desc("jobs", "Type", "Vehicle type") })
    r_2_2:Right():PopUpButton({ Options = {"Bike", "Car"} })
    local r_2_3 = JobsTabForm2:Row()
    r_2_3:Left():TitleStack({ Title = Translator.Title("jobs", "Auto Spawn", "Auto Spawn"), Subtitle = Translator.Desc("jobs", "Auto Spawn", "Auto spawn vehicle") })
    r_2_3:Right():Toggle()
end

do
    local JobsTabForm3 = JobsTab:Form()
    local r_3_0 = JobsTabForm3:Row()
    r_3_0:Left():TitleStack({ Title = Translator.Title("jobs", "Self-defense", "Self-defense"), Subtitle = Translator.Desc("jobs", "Self-defense", "Auto defense settings") })
    local r_3_1 = JobsTabForm3:Row()
    r_3_1:Left():TitleStack({ Title = Translator.Title("jobs", "Fight back", "Fight back"), Subtitle = Translator.Desc("jobs", "Fight back", "Auto fight attackers") })
    r_3_1:Right():PopUpButton({ Options = {"Off", "Aura", "Defense"} })
    local r_3_2 = JobsTabForm3:Row()
    r_3_2:Left():TitleStack({ Title = Translator.Title("jobs", "Auto Heal", "Auto Heal"), Subtitle = Translator.Desc("jobs", "Auto Heal", "Auto heal during combat") })
    r_3_2:Right():Toggle()
end

do
    local JobsTabForm4 = JobsTab:Form()
    local r_4_0 = JobsTabForm4:Row()
    r_4_0:Left():TitleStack({ Title = Translator.Title("jobs", "Streamer Mode", "Streamer Mode"), Subtitle = Translator.Desc("jobs", "Streamer Mode", "Privacy settings") })
    local r_4_1 = JobsTabForm4:Row()
    r_4_1:Left():TitleStack({ Title = Translator.Title("jobs", "Enable Streamer Mode", "Enable Streamer Mode"), Subtitle = Translator.Desc("jobs", "Enable Streamer Mode", "Hide sensitive info") })
    r_4_1:Right():Toggle()
    local r_4_2 = JobsTabForm4:Row()
    r_4_2:Left():TitleStack({ Title = Translator.Title("jobs", "Hide Name", "Hide Name"), Subtitle = Translator.Desc("jobs", "Hide Name", "Hide local player name") })
    r_4_2:Right():Toggle()
end

local CookTab = mainSection:Tab({
    Title = Translator.Title("tabs", "Cook", "Cook"),
    Icon = cascade.Symbols.flameFill,
})

do
    local CookTabForm0 = CookTab:Form()
    local r_0_0 = CookTabForm0:Row()
    r_0_0:Left():TitleStack({ Title = Translator.Title("cook", "Banking", "Banking"), Subtitle = Translator.Desc("cook", "Banking", "Cook banking settings") })
    local r_0_1 = CookTabForm0:Row()
    r_0_1:Left():TitleStack({ Title = Translator.Title("cook", "Bank Surplus", "Bank Surplus"), Subtitle = Translator.Desc("cook", "Bank Surplus", "Bank extra cash") })
    r_0_1:Right():Toggle()
    local r_0_2 = CookTabForm0:Row()
    r_0_2:Left():TitleStack({ Title = Translator.Title("cook", "Cook Bank Threshold", "Cook Bank Threshold"), Subtitle = Translator.Desc("cook", "Cook Bank Threshold", "Min cash to keep") })
    r_0_2:Right():Stepper({ Min = 0, Max = 100000, Step = 1000 })
end

do
    local CookTabForm1 = CookTab:Form()
    local r_1_0 = CookTabForm1:Row()
    r_1_0:Left():TitleStack({ Title = Translator.Title("cook", "Skillet", "Skillet"), Subtitle = Translator.Desc("cook", "Skillet", "Skillet equipment") })
    local r_1_1 = CookTabForm1:Row()
    r_1_1:Left():TitleStack({ Title = Translator.Title("cook", "Buy Best Skillet", "Buy Best Skillet"), Subtitle = Translator.Desc("cook", "Buy Best Skillet", "Auto buy best available") })
    r_1_1:Right():Toggle()
    local r_1_2 = CookTabForm1:Row()
    r_1_2:Left():TitleStack({ Title = Translator.Title("cook", "Pick", "Pick"), Subtitle = Translator.Desc("cook", "Pick", "Skillet selection mode") })
    r_1_2:Right():PopUpButton({ Options = {"Smart", "Manual"} })
end

local JanitorTab = mainSection:Tab({
    Title = Translator.Title("tabs", "Janitor", "Janitor"),
    Icon = cascade.Symbols.sparkles,
})

do
    local JanitorTabForm0 = JanitorTab:Form()
    local r_0_0 = JanitorTabForm0:Row()
    r_0_0:Left():TitleStack({ Title = Translator.Title("janitor", "Banking", "Banking"), Subtitle = Translator.Desc("janitor", "Banking", "Janitor banking settings") })
    local r_0_1 = JanitorTabForm0:Row()
    r_0_1:Left():TitleStack({ Title = Translator.Title("janitor", "Janitor Bank Threshold", "Janitor Bank Threshold"), Subtitle = Translator.Desc("janitor", "Janitor Bank Threshold", "Min cash threshold") })
    r_0_1:Right():Stepper({ Min = 0, Max = 100000, Step = 1000 })
end

do
    local JanitorTabForm1 = JanitorTab:Form()
    local r_1_0 = JanitorTabForm1:Row()
    r_1_0:Left():TitleStack({ Title = Translator.Title("janitor", "Mop", "Mop"), Subtitle = Translator.Desc("janitor", "Mop", "Mop equipment") })
    local r_1_1 = JanitorTabForm1:Row()
    r_1_1:Left():TitleStack({ Title = Translator.Title("janitor", "Buy Best Mop", "Buy Best Mop"), Subtitle = Translator.Desc("janitor", "Buy Best Mop", "Auto buy best available") })
    r_1_1:Right():Toggle()
    local r_1_2 = JanitorTabForm1:Row()
    r_1_2:Left():TitleStack({ Title = Translator.Title("janitor", "Pick", "Pick"), Subtitle = Translator.Desc("janitor", "Pick", "Mop selection mode") })
    r_1_2:Right():PopUpButton({ Options = {"Smart", "Manual"} })
end

local StockerTab = mainSection:Tab({
    Title = Translator.Title("tabs", "Stocker", "Stocker"),
    Icon = cascade.Symbols.shippingboxFill,
})

do
    local StockerTabForm0 = StockerTab:Form()
    local r_0_0 = StockerTabForm0:Row()
    r_0_0:Left():TitleStack({ Title = Translator.Title("stocker", "Banking", "Banking"), Subtitle = Translator.Desc("stocker", "Banking", "Stocker banking settings") })
    local r_0_1 = StockerTabForm0:Row()
    r_0_1:Left():TitleStack({ Title = Translator.Title("stocker", "Stocker Bank Threshold", "Stocker Bank Threshold"), Subtitle = Translator.Desc("stocker", "Stocker Bank Threshold", "Min cash threshold") })
    r_0_1:Right():Stepper({ Min = 0, Max = 100000, Step = 1000 })
end

local ATMHackerTab = mainSection:Tab({
    Title = Translator.Title("tabs", "ATM Hacker", "ATM Hacker"),
    Icon = cascade.Symbols.lockOpenFill,
})

do
    local ATMHackerTabForm0 = ATMHackerTab:Form()
    local r_0_0 = ATMHackerTabForm0:Row()
    r_0_0:Left():TitleStack({ Title = Translator.Title("atm_hacker", "Banking", "Banking"), Subtitle = Translator.Desc("atm_hacker", "Banking", "ATM banking settings") })
    local r_0_1 = ATMHackerTabForm0:Row()
    r_0_1:Left():TitleStack({ Title = Translator.Title("atm_hacker", "ATM Bank Threshold", "ATM Bank Threshold"), Subtitle = Translator.Desc("atm_hacker", "ATM Bank Threshold", "Min cash to keep") })
    r_0_1:Right():Stepper({ Min = 0, Max = 100000, Step = 1000 })
end

do
    local ATMHackerTabForm1 = ATMHackerTab:Form()
    local r_1_0 = ATMHackerTabForm1:Row()
    r_1_0:Left():TitleStack({ Title = Translator.Title("atm_hacker", "Underground", "Underground"), Subtitle = Translator.Desc("atm_hacker", "Underground", "Underground routing") })
    local r_1_1 = ATMHackerTabForm1:Row()
    r_1_1:Left():TitleStack({ Title = Translator.Title("atm_hacker", "Semi Underground", "Semi Underground"), Subtitle = Translator.Desc("atm_hacker", "Semi Underground", "Use semi underground mode") })
    r_1_1:Right():Toggle()
    local r_1_2 = ATMHackerTabForm1:Row()
    r_1_2:Left():TitleStack({ Title = Translator.Title("atm_hacker", "Full Underground", "Full Underground"), Subtitle = Translator.Desc("atm_hacker", "Full Underground", "Use full underground mode") })
    r_1_2:Right():Toggle()
end

do
    local ATMHackerTabForm2 = ATMHackerTab:Form()
    local r_2_0 = ATMHackerTabForm2:Row()
    r_2_0:Left():TitleStack({ Title = Translator.Title("atm_hacker", "Repair", "Repair"), Subtitle = Translator.Desc("atm_hacker", "Repair", "ATM repair logic") })
    local r_2_1 = ATMHackerTabForm2:Row()
    r_2_1:Left():TitleStack({ Title = Translator.Title("atm_hacker", "ATM Repair Below", "ATM Repair Below"), Subtitle = Translator.Desc("atm_hacker", "ATM Repair Below", "Auto repair ATM health") })
    r_2_1:Right():Stepper({ Min = 0, Max = 100000, Step = 1000 })
end

do
    local ATMHackerTabForm3 = ATMHackerTab:Form()
    local r_3_0 = ATMHackerTabForm3:Row()
    r_3_0:Left():TitleStack({ Title = Translator.Title("atm_hacker", "ATM Paths", "ATM Paths"), Subtitle = Translator.Desc("atm_hacker", "ATM Paths", "Route management") })
    local r_3_1 = ATMHackerTabForm3:Row()
    r_3_1:Left():TitleStack({ Title = Translator.Title("atm_hacker", "Collect Routes", "Collect Routes"), Subtitle = Translator.Desc("atm_hacker", "Collect Routes", "Collect ATM route data") })
    r_3_1:Right():Button({ Title = Translator.Title("atm_hacker", "Collect Routes_Btn", "Collect Routes") })
    local r_3_2 = ATMHackerTabForm3:Row()
    r_3_2:Left():TitleStack({ Title = Translator.Title("atm_hacker", "Test Cached Routes", "Test Cached Routes"), Subtitle = Translator.Desc("atm_hacker", "Test Cached Routes", "Test saved routes") })
    r_3_2:Right():Button({ Title = Translator.Title("atm_hacker", "Test Cached Routes_Btn", "Test Cached Routes") })
    local r_3_3 = ATMHackerTabForm3:Row()
    r_3_3:Left():TitleStack({ Title = Translator.Title("atm_hacker", "Export ATM Routes", "Export ATM Routes"), Subtitle = Translator.Desc("atm_hacker", "Export ATM Routes", "Export to clipboard") })
    r_3_3:Right():Button({ Title = Translator.Title("atm_hacker", "Export ATM Routes_Btn", "Export ATM Routes") })
    local r_3_4 = ATMHackerTabForm3:Row()
    r_3_4:Left():TitleStack({ Title = Translator.Title("atm_hacker", "Import ATM Routes", "Import ATM Routes"), Subtitle = Translator.Desc("atm_hacker", "Import ATM Routes", "Import from clipboard") })
    r_3_4:Right():TextField({ Placeholder = Translator.Title("atm_hacker", "Import ATM Routes_Holder", "Import ATM Routes") })
end

local FishingTab = mainSection:Tab({
    Title = Translator.Title("tabs", "Fishing", "Fishing"),
    Icon = cascade.Symbols.water,
})

do
    local FishingTabForm0 = FishingTab:Form()
    local r_0_0 = FishingTabForm0:Row()
    r_0_0:Left():TitleStack({ Title = Translator.Title("fishing", "Banking", "Banking"), Subtitle = Translator.Desc("fishing", "Banking", "Fishing farm settings") })
    local r_0_1 = FishingTabForm0:Row()
    r_0_1:Left():TitleStack({ Title = Translator.Title("fishing", "Fishing Bank Threshold", "Fishing Bank Threshold"), Subtitle = Translator.Desc("fishing", "Fishing Bank Threshold", "Min cash to keep") })
    r_0_1:Right():Stepper({ Min = 0, Max = 100000, Step = 1000 })
end

do
    local FishingTabForm1 = FishingTab:Form()
    local r_1_0 = FishingTabForm1:Row()
    r_1_0:Left():TitleStack({ Title = Translator.Title("fishing", "Location", "Location"), Subtitle = Translator.Desc("fishing", "Location", "Fishing spot settings") })
    local r_1_1 = FishingTabForm1:Row()
    r_1_1:Left():TitleStack({ Title = Translator.Title("fishing", "Area", "Area"), Subtitle = Translator.Desc("fishing", "Area", "Fishing area") })
    r_1_1:Right():PopUpButton({ Options = {"Normal", "Full Underground"} })
    local r_1_2 = FishingTabForm1:Row()
    r_1_2:Left():TitleStack({ Title = Translator.Title("fishing", "Mode", "Mode"), Subtitle = Translator.Desc("fishing", "Mode", "Fishing mode") })
    r_1_2:Right():PopUpButton({ Options = {"Normal", "Boost"} })
end

do
    local FishingTabForm2 = FishingTab:Form()
    local r_2_0 = FishingTabForm2:Row()
    r_2_0:Left():TitleStack({ Title = Translator.Title("fishing", "Selling", "Selling"), Subtitle = Translator.Desc("fishing", "Selling", "Auto sell settings") })
    local r_2_1 = FishingTabForm2:Row()
    r_2_1:Left():TitleStack({ Title = Translator.Title("fishing", "Sell when", "Sell when"), Subtitle = Translator.Desc("fishing", "Sell when", "Condition to sell") })
    r_2_1:Right():PopUpButton({ Options = {"Any", "Full"} })
end

do
    local FishingTabForm3 = FishingTab:Form()
    local r_3_0 = FishingTabForm3:Row()
    r_3_0:Left():TitleStack({ Title = Translator.Title("fishing", "Rarity Filter", "Rarity Filter"), Subtitle = Translator.Desc("fishing", "Rarity Filter", "Keep specific rarities") })
    local r_3_1 = FishingTabForm3:Row()
    r_3_1:Left():TitleStack({ Title = Translator.Title("fishing", "Min rarity", "Min rarity"), Subtitle = Translator.Desc("fishing", "Min rarity", "Filter by rarity") })
    r_3_1:Right():PopUpButton({ Options = {"Common", "Uncommon", "Rare", "Epic", "Legendary", "Omega"} })
end

do
    local FishingTabForm4 = FishingTab:Form()
    local r_4_0 = FishingTabForm4:Row()
    r_4_0:Left():TitleStack({ Title = Translator.Title("fishing", "Catch Webhook", "Catch Webhook"), Subtitle = Translator.Desc("fishing", "Catch Webhook", "Discord webhook for rare catches") })
    local r_4_1 = FishingTabForm4:Row()
    r_4_1:Left():TitleStack({ Title = Translator.Title("fishing", "Webhook URL", "Webhook URL"), Subtitle = Translator.Desc("fishing", "Webhook URL", "Discord webhook URL") })
    r_4_1:Right():TextField({ Placeholder = Translator.Title("fishing", "Webhook URL_Holder", "Webhook URL") })
    local r_4_2 = FishingTabForm4:Row()
    r_4_2:Left():TitleStack({ Title = Translator.Title("fishing", "Rarities", "Rarities"), Subtitle = Translator.Desc("fishing", "Rarities", "Notify for these rarities") })
    r_4_2:Right():PopUpButton({ Options = {"Rare+", "Epic+", "Legendary+", "Omega"} })
end

do
    local FishingTabForm5 = FishingTab:Form()
    local r_5_0 = FishingTabForm5:Row()
    r_5_0:Left():TitleStack({ Title = Translator.Title("fishing", "Equipment", "Equipment"), Subtitle = Translator.Desc("fishing", "Equipment", "Fishing gear") })
    local r_5_1 = FishingTabForm5:Row()
    r_5_1:Left():TitleStack({ Title = Translator.Title("fishing", "Rod", "Rod"), Subtitle = Translator.Desc("fishing", "Rod", "Fishing rod selection") })
    r_5_1:Right():PopUpButton({ Options = {"Best", "Manual"} })
    local r_5_2 = FishingTabForm5:Row()
    r_5_2:Left():TitleStack({ Title = Translator.Title("fishing", "Bait", "Bait"), Subtitle = Translator.Desc("fishing", "Bait", "Bait selection") })
    r_5_2:Right():PopUpButton({ Options = {"Smart", "Manual"} })
    local r_5_3 = FishingTabForm5:Row()
    r_5_3:Left():TitleStack({ Title = Translator.Title("fishing", "Bait Per Trip", "Bait Per Trip"), Subtitle = Translator.Desc("fishing", "Bait Per Trip", "Bait amount per trip") })
    r_5_3:Right():Stepper({ Min = 0, Max = 100000, Step = 1000 })
end

do
    local FishingTabForm6 = FishingTab:Form()
    local r_6_0 = FishingTabForm6:Row()
    r_6_0:Left():TitleStack({ Title = Translator.Title("fishing", "Snap", "Snap"), Subtitle = Translator.Desc("fishing", "Snap", "Cast depth settings") })
    local r_6_1 = FishingTabForm6:Row()
    r_6_1:Left():TitleStack({ Title = Translator.Title("fishing", "Snap Depth", "Snap Depth"), Subtitle = Translator.Desc("fishing", "Snap Depth", "Auto snap to depth") })
    r_6_1:Right():Toggle()
    local r_6_2 = FishingTabForm6:Row()
    r_6_2:Left():TitleStack({ Title = Translator.Title("fishing", "Offset", "Offset"), Subtitle = Translator.Desc("fishing", "Offset", "Depth offset") })
    r_6_2:Right():Slider({ Min = -10, Max = 10, Step = 1 })
end

local PlantingTab = mainSection:Tab({
    Title = Translator.Title("tabs", "Planting", "Planting"),
    Icon = cascade.Symbols.leafFill,
})

do
    local PlantingTabForm0 = PlantingTab:Form()
    local r_0_0 = PlantingTabForm0:Row()
    r_0_0:Left():TitleStack({ Title = Translator.Title("planting", "Planting", "Planting"), Subtitle = Translator.Desc("planting", "Planting", "Auto plant settings") })
    local r_0_1 = PlantingTabForm0:Row()
    r_0_1:Left():TitleStack({ Title = Translator.Title("planting", "Seed", "Seed"), Subtitle = Translator.Desc("planting", "Seed", "Select seed type") })
    r_0_1:Right():PopUpButton({ Options = {"Auto", "Manual"} })
    local r_0_2 = PlantingTabForm0:Row()
    r_0_2:Left():TitleStack({ Title = Translator.Title("planting", "Water Threshold", "Water Threshold"), Subtitle = Translator.Desc("planting", "Water Threshold", "Auto water when below") })
    r_0_2:Right():Stepper({ Min = 0, Max = 100000, Step = 1000 })
end

local FinisherTab = mainSection:Tab({
    Title = Translator.Title("tabs", "Finisher", "Finisher"),
    Icon = cascade.Symbols.checkmarkCircleFill,
})

do
    local FinisherTabForm0 = FinisherTab:Form()
    local r_0_0 = FinisherTabForm0:Row()
    r_0_0:Left():TitleStack({ Title = Translator.Title("finisher", "Finisher", "Finisher"), Subtitle = Translator.Desc("finisher", "Finisher", "Job completion automation") })
    local r_0_1 = FinisherTabForm0:Row()
    r_0_1:Left():TitleStack({ Title = Translator.Title("finisher", "Enabled", "Enabled"), Subtitle = Translator.Desc("finisher", "Enabled", "Toggle finisher") })
    r_0_1:Right():Toggle()
end

local MarketplaceTab = mainSection:Tab({
    Title = Translator.Title("tabs", "Marketplace", "Marketplace"),
    Icon = cascade.Symbols.cart,
})

do
    local MarketplaceTabForm0 = MarketplaceTab:Form()
    local r_0_0 = MarketplaceTabForm0:Row()
    r_0_0:Left():TitleStack({ Title = Translator.Title("marketplace", "Marketplace", "Marketplace"), Subtitle = Translator.Desc("marketplace", "Marketplace", "Auto marketplace actions") })
    local r_0_1 = MarketplaceTabForm0:Row()
    r_0_1:Left():TitleStack({ Title = Translator.Title("marketplace", "Balance", "Balance"), Subtitle = Translator.Desc("marketplace", "Balance", "Current balance display") })
    local r_0_2 = MarketplaceTabForm0:Row()
    r_0_2:Left():TitleStack({ Title = Translator.Title("marketplace", "ATM Amount", "ATM Amount"), Subtitle = Translator.Desc("marketplace", "ATM Amount", "Amount for ATM operations") })
    r_0_2:Right():Stepper({ Min = 0, Max = 100000, Step = 1000 })
    local r_0_3 = MarketplaceTabForm0:Row()
    r_0_3:Left():TitleStack({ Title = Translator.Title("marketplace", "Deposit", "Deposit"), Subtitle = Translator.Desc("marketplace", "Deposit", "Deposit cash to bank") })
    r_0_3:Right():Button({ Title = Translator.Title("marketplace", "Deposit_Btn", "Deposit") })
    local r_0_4 = MarketplaceTabForm0:Row()
    r_0_4:Left():TitleStack({ Title = Translator.Title("marketplace", "Withdraw", "Withdraw"), Subtitle = Translator.Desc("marketplace", "Withdraw", "Withdraw from bank") })
    r_0_4:Right():Button({ Title = Translator.Title("marketplace", "Withdraw_Btn", "Withdraw") })
end

do
    local MarketplaceTabForm1 = MarketplaceTab:Form()
    local r_1_0 = MarketplaceTabForm1:Row()
    r_1_0:Left():TitleStack({ Title = Translator.Title("marketplace", "Spin Skips", "Spin Skips"), Subtitle = Translator.Desc("marketplace", "Spin Skips", "Blockspin automation") })
    local r_1_1 = MarketplaceTabForm1:Row()
    r_1_1:Left():TitleStack({ Title = Translator.Title("marketplace", "Enable Spin Skips", "Enable Spin Skips"), Subtitle = Translator.Desc("marketplace", "Enable Spin Skips", "Skip spin animations") })
    r_1_1:Right():Toggle()
end

local utilitySection = window:Section({ Title = "Utility" })

local ServersTab = utilitySection:Tab({
    Title = Translator.Title("tabs", "Servers", "Servers"),
    Icon = cascade.Symbols.serverRack,
})

do
    local ServersTabForm0 = ServersTab:Form()
    local r_0_0 = ServersTabForm0:Row()
    r_0_0:Left():TitleStack({ Title = Translator.Title("servers", "This Server", "This Server"), Subtitle = Translator.Desc("servers", "This Server", "Current server info") })
    local r_0_1 = ServersTabForm0:Row()
    r_0_1:Left():TitleStack({ Title = Translator.Title("servers", "Job Id", "Job Id"), Subtitle = Translator.Desc("servers", "Job Id", "Current server job ID") })
    r_0_1:Right():Button({ Title = Translator.Title("servers", "Job Id_Btn", "Job Id") })
    local r_0_2 = ServersTabForm0:Row()
    r_0_2:Left():TitleStack({ Title = Translator.Title("servers", "Rejoin", "Rejoin"), Subtitle = Translator.Desc("servers", "Rejoin", "Rejoin current server") })
    r_0_2:Right():Button({ Title = Translator.Title("servers", "Rejoin_Btn", "Rejoin") })
end

do
    local ServersTabForm1 = ServersTab:Form()
    local r_1_0 = ServersTabForm1:Row()
    r_1_0:Left():TitleStack({ Title = Translator.Title("servers", "Server Switching", "Server Switching"), Subtitle = Translator.Desc("servers", "Server Switching", "Server hop options") })
    local r_1_1 = ServersTabForm1:Row()
    r_1_1:Left():TitleStack({ Title = Translator.Title("servers", "Join High Player Count", "Join High Player Count"), Subtitle = Translator.Desc("servers", "Join High Player Count", "Join most populated") })
    r_1_1:Right():Button({ Title = Translator.Title("servers", "Join High Player Count_Btn", "Join High Player Count") })
    local r_1_2 = ServersTabForm1:Row()
    r_1_2:Left():TitleStack({ Title = Translator.Title("servers", "Join Low Player Count", "Join Low Player Count"), Subtitle = Translator.Desc("servers", "Join Low Player Count", "Join least populated") })
    r_1_2:Right():Button({ Title = Translator.Title("servers", "Join Low Player Count_Btn", "Join Low Player Count") })
end

do
    local ServersTabForm2 = ServersTab:Form()
    local r_2_0 = ServersTabForm2:Row()
    r_2_0:Left():TitleStack({ Title = Translator.Title("servers", "Server Control", "Server Control"), Subtitle = Translator.Desc("servers", "Server Control", "Join specific server") })
    local r_2_1 = ServersTabForm2:Row()
    r_2_1:Left():TitleStack({ Title = Translator.Title("servers", "Server ID", "Server ID"), Subtitle = Translator.Desc("servers", "Server ID", "Enter Job ID to join") })
    r_2_1:Right():TextField({ Placeholder = Translator.Title("servers", "Server ID_Holder", "Server ID") })
    local r_2_2 = ServersTabForm2:Row()
    r_2_2:Left():TitleStack({ Title = Translator.Title("servers", "Join Server ID", "Join Server ID"), Subtitle = Translator.Desc("servers", "Join Server ID", "Join the specified server") })
    r_2_2:Right():Button({ Title = Translator.Title("servers", "Join Server ID_Btn", "Join Server ID") })
    local r_2_3 = ServersTabForm2:Row()
    r_2_3:Left():TitleStack({ Title = Translator.Title("servers", "Copy Join Script", "Copy Join Script"), Subtitle = Translator.Desc("servers", "Copy Join Script", "Copy to clipboard") })
    r_2_3:Right():Button({ Title = Translator.Title("servers", "Copy Join Script_Btn", "Copy Join Script") })
end

do
    local ServersTabForm3 = ServersTab:Form()
    local r_3_0 = ServersTabForm3:Row()
    r_3_0:Left():TitleStack({ Title = Translator.Title("servers", "Auto Rejoin", "Auto Rejoin"), Subtitle = Translator.Desc("servers", "Auto Rejoin", "Auto rejoin on disconnect") })
    local r_3_1 = ServersTabForm3:Row()
    r_3_1:Left():TitleStack({ Title = Translator.Title("servers", "Enable Auto Rejoin", "Enable Auto Rejoin"), Subtitle = Translator.Desc("servers", "Enable Auto Rejoin", "Auto rejoin server") })
    r_3_1:Right():Toggle()
end

local ConfigsTab = utilitySection:Tab({
    Title = Translator.Title("tabs", "Configs", "Configs"),
    Icon = cascade.Symbols.docFill,
})

do
    local ConfigsTabForm0 = ConfigsTab:Form()
    local r_0_0 = ConfigsTabForm0:Row()
    r_0_0:Left():TitleStack({ Title = Translator.Title("configs", "Configuration List", "Configuration List"), Subtitle = Translator.Desc("configs", "Configuration List", "Saved configs") })
    local r_0_1 = ConfigsTabForm0:Row()
    r_0_1:Left():TitleStack({ Title = Translator.Title("configs", "Load", "Load"), Subtitle = Translator.Desc("configs", "Load", "Load selected config") })
    r_0_1:Right():Button({ Title = Translator.Title("configs", "Load_Btn", "Load") })
    local r_0_2 = ConfigsTabForm0:Row()
    r_0_2:Left():TitleStack({ Title = Translator.Title("configs", "Save", "Save"), Subtitle = Translator.Desc("configs", "Save", "Save current settings") })
    r_0_2:Right():Button({ Title = Translator.Title("configs", "Save_Btn", "Save") })
    local r_0_3 = ConfigsTabForm0:Row()
    r_0_3:Left():TitleStack({ Title = Translator.Title("configs", "Delete", "Delete"), Subtitle = Translator.Desc("configs", "Delete", "Delete selected config") })
    r_0_3:Right():Button({ Title = Translator.Title("configs", "Delete_Btn", "Delete") })
end

do
    local ConfigsTabForm1 = ConfigsTab:Form()
    local r_1_0 = ConfigsTabForm1:Row()
    r_1_0:Left():TitleStack({ Title = Translator.Title("configs", "Configuration Management", "Configuration Management"), Subtitle = Translator.Desc("configs", "Configuration Management", "Create/Import/Export") })
    local r_1_1 = ConfigsTabForm1:Row()
    r_1_1:Left():TitleStack({ Title = Translator.Title("configs", "New Config", "New Config"), Subtitle = Translator.Desc("configs", "New Config", "Create new configuration") })
    r_1_1:Right():TextField({ Placeholder = Translator.Title("configs", "New Config_Holder", "New Config") })
    local r_1_2 = ConfigsTabForm1:Row()
    r_1_2:Left():TitleStack({ Title = Translator.Title("configs", "Create", "Create"), Subtitle = Translator.Desc("configs", "Create", "Create the config") })
    r_1_2:Right():Button({ Title = Translator.Title("configs", "Create_Btn", "Create") })
    local r_1_3 = ConfigsTabForm1:Row()
    r_1_3:Left():TitleStack({ Title = Translator.Title("configs", "Import Config", "Import Config"), Subtitle = Translator.Desc("configs", "Import Config", "Import from code") })
    r_1_3:Right():TextField({ Placeholder = Translator.Title("configs", "Import Config_Holder", "Import Config") })
    local r_1_4 = ConfigsTabForm1:Row()
    r_1_4:Left():TitleStack({ Title = Translator.Title("configs", "Export Current", "Export Current"), Subtitle = Translator.Desc("configs", "Export Current", "Export to clipboard") })
    r_1_4:Right():Button({ Title = Translator.Title("configs", "Export Current_Btn", "Export Current") })
    local r_1_5 = ConfigsTabForm1:Row()
    r_1_5:Left():TitleStack({ Title = Translator.Title("configs", "Auto Load", "Auto Load"), Subtitle = Translator.Desc("configs", "Auto Load", "Auto load config on start") })
    r_1_5:Right():Toggle()
    local r_1_6 = ConfigsTabForm1:Row()
    r_1_6:Left():TitleStack({ Title = Translator.Title("configs", "Generate Loader Config", "Generate Loader Config"), Subtitle = Translator.Desc("configs", "Generate Loader Config", "Create standalone loader") })
    r_1_6:Right():Button({ Title = Translator.Title("configs", "Generate Loader Config_Btn", "Generate Loader Config") })
end

local PerformanceTab = utilitySection:Tab({
    Title = Translator.Title("tabs", "Performance", "Performance"),
    Icon = cascade.Symbols.gauge,
})

do
    local PerformanceTabForm0 = PerformanceTab:Form()
    local r_0_0 = PerformanceTabForm0:Row()
    r_0_0:Left():TitleStack({ Title = Translator.Title("performance", "Performance", "Performance"), Subtitle = Translator.Desc("performance", "Performance", "FPS and rendering settings") })
end

do
    local PerformanceTabForm1 = PerformanceTab:Form()
    local r_1_0 = PerformanceTabForm1:Row()
    r_1_0:Left():TitleStack({ Title = Translator.Title("performance", "Framerate", "Framerate"), Subtitle = Translator.Desc("performance", "Framerate", "FPS limit settings") })
    local r_1_1 = PerformanceTabForm1:Row()
    r_1_1:Left():TitleStack({ Title = Translator.Title("performance", "FPS Unlock", "FPS Unlock"), Subtitle = Translator.Desc("performance", "FPS Unlock", "Remove FPS cap") })
    r_1_1:Right():Toggle()
    local r_1_2 = PerformanceTabForm1:Row()
    r_1_2:Left():TitleStack({ Title = Translator.Title("performance", "Target FPS", "Target FPS"), Subtitle = Translator.Desc("performance", "Target FPS", "Target framerate limit") })
    r_1_2:Right():Stepper({ Min = 0, Max = 100000, Step = 1000 })
end

do
    local PerformanceTabForm2 = PerformanceTab:Form()
    local r_2_0 = PerformanceTabForm2:Row()
    r_2_0:Left():TitleStack({ Title = Translator.Title("performance", "Effects", "Effects"), Subtitle = Translator.Desc("performance", "Effects", "Visual effect toggles") })
    local r_2_1 = PerformanceTabForm2:Row()
    r_2_1:Left():TitleStack({ Title = Translator.Title("performance", "Disable Particles", "Disable Particles"), Subtitle = Translator.Desc("performance", "Disable Particles", "Remove particles") })
    r_2_1:Right():Toggle()
    local r_2_2 = PerformanceTabForm2:Row()
    r_2_2:Left():TitleStack({ Title = Translator.Title("performance", "Disable Shadows", "Disable Shadows"), Subtitle = Translator.Desc("performance", "Disable Shadows", "Remove shadows") })
    r_2_2:Right():Toggle()
    local r_2_3 = PerformanceTabForm2:Row()
    r_2_3:Left():TitleStack({ Title = Translator.Title("performance", "Disable Textures", "Disable Textures"), Subtitle = Translator.Desc("performance", "Disable Textures", "Remove textures") })
    r_2_3:Right():Toggle()
end

do
    local PerformanceTabForm3 = PerformanceTab:Form()
    local r_3_0 = PerformanceTabForm3:Row()
    r_3_0:Left():TitleStack({ Title = Translator.Title("performance", "Appearance", "Appearance"), Subtitle = Translator.Desc("performance", "Appearance", "UI settings") })
    local r_3_1 = PerformanceTabForm3:Row()
    r_3_1:Left():TitleStack({ Title = Translator.Title("performance", "Theme", "Theme"), Subtitle = Translator.Desc("performance", "Theme", "Dark/Light mode") })
    r_3_1:Right():PopUpButton({ Options = {"Dark", "Light"} })
    local r_3_2 = PerformanceTabForm3:Row()
    r_3_2:Left():TitleStack({ Title = Translator.Title("performance", "MinimizeKeybind", "MinimizeKeybind"), Subtitle = Translator.Desc("performance", "MinimizeKeybind", "Keybind to toggle UI") })
    r_3_2:Right():KeybindField()
end

local liveSection = window:Section({ Title = "Live" })

local ActivityTab = liveSection:Tab({
    Title = Translator.Title("tabs", "Activity", "Activity"),
    Icon = cascade.Symbols.chartBar,
})

do
    local ActivityTabForm0 = ActivityTab:Form()
    local r_0_0 = ActivityTabForm0:Row()
    r_0_0:Left():TitleStack({ Title = Translator.Title("activity", "Hand Cash", "Hand Cash"), Subtitle = Translator.Desc("activity", "Hand Cash", "Cash in hand") })
    local r_0_1 = ActivityTabForm0:Row()
    r_0_1:Left():TitleStack({ Title = Translator.Title("activity", "Bank Balance", "Bank Balance"), Subtitle = Translator.Desc("activity", "Bank Balance", "Cash in bank") })
    local r_0_2 = ActivityTabForm0:Row()
    r_0_2:Left():TitleStack({ Title = Translator.Title("activity", "Session Earned", "Session Earned"), Subtitle = Translator.Desc("activity", "Session Earned", "Earned this session") })
    local r_0_3 = ActivityTabForm0:Row()
    r_0_3:Left():TitleStack({ Title = Translator.Title("activity", "Session Time", "Session Time"), Subtitle = Translator.Desc("activity", "Session Time", "Active time") })
    local r_0_4 = ActivityTabForm0:Row()
    r_0_4:Left():TitleStack({ Title = Translator.Title("activity", "Status", "Status"), Subtitle = Translator.Desc("activity", "Status", "Current activity") })
end

print("[AGY] Full Axon UI Replica loaded! (Cascade UI)")
