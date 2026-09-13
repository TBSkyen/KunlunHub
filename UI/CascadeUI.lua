--!nolint
--!nocheck

-- ===================================================================
-- [AGY] Axon Hub Replica - Cascade UI Edition
-- Structure matches Axon_Raw_Backups dump exactly
-- UI ONLY - no logic yet
-- ===================================================================

-- ===================================================================
-- LOAD TRANSLATOR
-- ===================================================================
local Translator = loadstring(game:HttpGet("https://raw.githubusercontent.com/TBSkyen/KunlunHub/main/Translator/Translator.lua"))()
Translator.LoadLanguage("Thai") -- Set to "English", "Thai", or "Brazil"

-- Helper function
local function T(category, key, defaultTitle, defaultSubtitle)
    return Translator.Title(category, key, defaultTitle), Translator.Desc(category, key, defaultSubtitle)
end

local cascade = loadstring(game:HttpGet("https://pastefy.app/5dtnniL9/raw"))()

local app = cascade.New({
    Theme = cascade.Themes.Dark,
    Accent = cascade.Accents.Purple,
})

-- ===================== MAIN WINDOW =====================
local window = app:Window({
    Title = "Axon",
    Subtitle = "v2.0 | AGY Rebuild",
    Size = UDim2.fromOffset(680, 480),
})

-- ===================== TABS =====================
local mainSection = window:Section({ Title = "Main" })

-- ==================== [TAB: JOBS] ====================
local jobsTab = mainSection:Tab({
    Title = "Jobs",
    Selected = true,
    Icon = cascade.Symbols.briefcase,
})

do
    -- Section: Farming
    local farmForm = jobsTab:Form()
    local farmRow0 = farmForm:Row()
    farmRow0:Left():TitleStack({ Title = Translator.Title("General", "Farming", "Farming"), Subtitle = Translator.Desc("General", "Farming", "Core autofarming settings") })

    local farmRow1 = farmForm:Row()
    farmRow1:Left():TitleStack({ Title = Translator.Title("General", "Enabled", "Enabled"), Subtitle = Translator.Desc("General", "Enabled", "Toggle autofarming on/off") })
    farmRow1:Right():Toggle()

    local farmRow2 = farmForm:Row()
    farmRow2:Left():TitleStack({ Title = Translator.Title("General", "Job", "Job"), Subtitle = Translator.Desc("General", "Job", "Select which job to farm") })
    farmRow2:Right():PopUpButton({ Options = {"Cook", "Janitor", "Stocker", "ATM Hacker", "Fisher"} })

    local farmRow3 = farmForm:Row()
    farmRow3:Left():TitleStack({ Title = Translator.Title("General", "Anti Finish", "Anti Finish"), Subtitle = Translator.Desc("General", "Anti Finish", "Prevent job from completing") })
    farmRow3:Right():Toggle()

    local farmRow4 = farmForm:Row()
    farmRow4:Left():TitleStack({ Title = Translator.Title("General", "Respawn On Death", "Respawn On Death"), Subtitle = Translator.Desc("General", "Respawn On Death", "Auto respawn when killed") })
    farmRow4:Right():Toggle()

    local farmRow5 = farmForm:Row()
    farmRow5:Left():TitleStack({ Title = Translator.Title("General", "Stamina Farm", "Stamina Farm"), Subtitle = Translator.Desc("General", "Stamina Farm", "Automatically manage stamina") })
    farmRow5:Right():Toggle()

    -- Section: Rotation
    local rotForm = jobsTab:Form()
    local rotRow0 = rotForm:Row()
    rotRow0:Left():TitleStack({ Title = Translator.Title("General", "Rotation", "Rotation"), Subtitle = Translator.Desc("General", "Rotation", "Job rotation settings") })

    local rotRow1 = rotForm:Row()
    rotRow1:Left():TitleStack({ Title = Translator.Title("General", "Rotation", "Rotation"), Subtitle = Translator.Desc("General", "Rotation", "Enable job rotation") })
    rotRow1:Right():Toggle()

    -- Section: Vehicle
    local vehForm = jobsTab:Form()
    local vehRow0 = vehForm:Row()
    vehRow0:Left():TitleStack({ Title = Translator.Title("General", "Vehicle", "Vehicle"), Subtitle = Translator.Desc("General", "Vehicle", "Vehicle usage settings") })

    local vehRow1 = vehForm:Row()
    vehRow1:Left():TitleStack({ Title = Translator.Title("General", "Use Vehicle", "Use Vehicle"), Subtitle = Translator.Desc("General", "Use Vehicle", "Use vehicle for travel") })
    vehRow1:Right():Toggle()

    local vehRow2 = vehForm:Row()
    vehRow2:Left():TitleStack({ Title = Translator.Title("General", "Type", "Type"), Subtitle = Translator.Desc("General", "Type", "Vehicle type") })
    vehRow2:Right():PopUpButton({ Options = {"Bike", "Car"} })

    -- Section: Self-defense
    local defForm = jobsTab:Form()
    local defRow0 = defForm:Row()
    defRow0:Left():TitleStack({ Title = Translator.Title("General", "Self-defense", "Self-defense"), Subtitle = Translator.Desc("General", "Self-defense", "Auto defense settings") })

    local defRow1 = defForm:Row()
    defRow1:Left():TitleStack({ Title = Translator.Title("General", "Fight back", "Fight back"), Subtitle = Translator.Desc("General", "Fight back", "Auto fight attackers") })
    defRow1:Right():PopUpButton({ Options = {"Off", "Aura", "Defense"} })

    -- Section: Streamer Mode
    local strForm = jobsTab:Form()
    local strRow1 = strForm:Row()
    strRow1:Left():TitleStack({ Title = Translator.Title("General", "Streamer Mode", "Streamer Mode"), Subtitle = Translator.Desc("General", "Streamer Mode", "Hide sensitive info") })
    strRow1:Right():Toggle()
end

-- ==================== [TAB: COOK] ====================
local cookTab = mainSection:Tab({
    Title = "Cook",
    Icon = cascade.Symbols.flameFill,
})

do
    local cookForm = cookTab:Form()
    local cr0 = cookForm:Row()
    cr0:Left():TitleStack({ Title = Translator.Title("General", "Banking", "Banking"), Subtitle = Translator.Desc("General", "Banking", "Cook banking settings") })

    local cr1 = cookForm:Row()
    cr1:Left():TitleStack({ Title = Translator.Title("General", "Bank Surplus", "Bank Surplus"), Subtitle = Translator.Desc("General", "Bank Surplus", "Bank extra cash") })
    cr1:Right():Toggle()

    local cr2 = cookForm:Row()
    cr2:Left():TitleStack({ Title = Translator.Title("General", "Cook Bank Threshold", "Cook Bank Threshold"), Subtitle = Translator.Desc("General", "Cook Bank Threshold", "Min cash to keep") })
    cr2:Right():Stepper({ Min = 0, Max = 100000, Step = 1000 })

    -- Section: Skillet
    local skillForm = cookTab:Form()
    local sk0 = skillForm:Row()
    sk0:Left():TitleStack({ Title = Translator.Title("General", "Skillet", "Skillet"), Subtitle = Translator.Desc("General", "Skillet", "Skillet equipment") })

    local sk1 = skillForm:Row()
    sk1:Left():TitleStack({ Title = Translator.Title("General", "Buy Best Skillet", "Buy Best Skillet"), Subtitle = Translator.Desc("General", "Buy Best Skillet", "Auto buy best available") })
    sk1:Right():Toggle()

    local sk2 = skillForm:Row()
    sk2:Left():TitleStack({ Title = Translator.Title("General", "Pick", "Pick"), Subtitle = Translator.Desc("General", "Pick", "Skillet selection mode") })
    sk2:Right():PopUpButton({ Options = {"Smart", "Manual"} })
end

-- ==================== [TAB: JANITOR] ====================
local janitorTab = mainSection:Tab({
    Title = "Janitor",
    Icon = cascade.Symbols.sparkles,
})

do
    local janForm = janitorTab:Form()
    local jr0 = janForm:Row()
    jr0:Left():TitleStack({ Title = Translator.Title("General", "Banking", "Banking"), Subtitle = Translator.Desc("General", "Banking", "Janitor banking settings") })

    local jr1 = janForm:Row()
    jr1:Left():TitleStack({ Title = Translator.Title("General", "Janitor Bank Threshold", "Janitor Bank Threshold"), Subtitle = Translator.Desc("General", "Janitor Bank Threshold", "Min cash threshold") })
    jr1:Right():Stepper({ Min = 0, Max = 100000, Step = 1000 })

    -- Section: Mop
    local mopForm = janitorTab:Form()
    local mr0 = mopForm:Row()
    mr0:Left():TitleStack({ Title = Translator.Title("General", "Mop", "Mop"), Subtitle = Translator.Desc("General", "Mop", "Mop equipment") })

    local mr1 = mopForm:Row()
    mr1:Left():TitleStack({ Title = Translator.Title("General", "Buy Best Mop", "Buy Best Mop"), Subtitle = Translator.Desc("General", "Buy Best Mop", "Auto buy best available") })
    mr1:Right():Toggle()
end

-- ==================== [TAB: STOCKER] ====================
local stockerTab = mainSection:Tab({
    Title = "Stocker",
    Icon = cascade.Symbols.shippingboxFill,
})

do
    local stForm = stockerTab:Form()
    local sr0 = stForm:Row()
    sr0:Left():TitleStack({ Title = Translator.Title("General", "Banking", "Banking"), Subtitle = Translator.Desc("General", "Banking", "Stocker banking settings") })

    local sr1 = stForm:Row()
    sr1:Left():TitleStack({ Title = Translator.Title("General", "Stocker Bank Threshold", "Stocker Bank Threshold"), Subtitle = Translator.Desc("General", "Stocker Bank Threshold", "Min cash threshold") })
    sr1:Right():Stepper({ Min = 0, Max = 100000, Step = 1000 })
end

-- ==================== [TAB: ATM HACKER] ====================
local atmTab = mainSection:Tab({
    Title = "ATM Hacker",
    Icon = cascade.Symbols.lockOpenFill,
})

do
    local atmForm = atmTab:Form()
    local ar0 = atmForm:Row()
    ar0:Left():TitleStack({ Title = Translator.Title("General", "Banking", "Banking"), Subtitle = Translator.Desc("General", "Banking", "ATM banking settings") })

    local ar1 = atmForm:Row()
    ar1:Left():TitleStack({ Title = Translator.Title("General", "ATM Bank Threshold", "ATM Bank Threshold"), Subtitle = Translator.Desc("General", "ATM Bank Threshold", "Min cash to keep") })
    ar1:Right():Stepper({ Min = 0, Max = 100000, Step = 1000 })

    local ar2 = atmForm:Row()
    ar2:Left():TitleStack({ Title = Translator.Title("General", "Semi Underground", "Semi Underground"), Subtitle = Translator.Desc("General", "Semi Underground", "Use semi underground mode") })
    ar2:Right():Toggle()

    local ar3 = atmForm:Row()
    ar3:Left():TitleStack({ Title = Translator.Title("General", "ATM Repair Below", "ATM Repair Below"), Subtitle = Translator.Desc("General", "ATM Repair Below", "Auto repair ATM health") })
    ar3:Right():Stepper({ Min = 0, Max = 100, Step = 5 })

    -- Section: ATM Paths
    local pathForm = atmTab:Form()
    local pr0 = pathForm:Row()
    pr0:Left():TitleStack({ Title = Translator.Title("General", "ATM Paths", "ATM Paths"), Subtitle = Translator.Desc("General", "ATM Paths", "Route management") })

    local pr1 = pathForm:Row()
    pr1:Left():TitleStack({ Title = Translator.Title("General", "Collect Routes", "Collect Routes"), Subtitle = Translator.Desc("General", "Collect Routes", "Collect ATM route data") })
    pr1:Right():Button({ Title = Translator.Title("General", "Collect", "Collect") })

    local pr2 = pathForm:Row()
    pr2:Left():TitleStack({ Title = Translator.Title("General", "Test Cached Routes", "Test Cached Routes"), Subtitle = Translator.Desc("General", "Test Cached Routes", "Test saved routes") })
    pr2:Right():Button({ Title = Translator.Title("General", "Test", "Test") })

    local pr3 = pathForm:Row()
    pr3:Left():TitleStack({ Title = Translator.Title("General", "Export ATM Routes", "Export ATM Routes"), Subtitle = Translator.Desc("General", "Export ATM Routes", "Export to clipboard") })
    pr3:Right():Button({ Title = Translator.Title("General", "Copy JSON", "Copy JSON") })

    local pr4 = pathForm:Row()
    pr4:Left():TitleStack({ Title = Translator.Title("General", "Import ATM Routes", "Import ATM Routes"), Subtitle = Translator.Desc("General", "Import ATM Routes", "Import from clipboard") })
    pr4:Right():TextField({ Placeholder = "Paste JSON" })
end

-- ==================== [TAB: FISHING] ====================
local fishTab = mainSection:Tab({
    Title = "Fishing",
    Icon = cascade.Symbols.water,
})

do
    -- Section: Fishing
    local fishForm = fishTab:Form()
    local fr0 = fishForm:Row()
    fr0:Left():TitleStack({ Title = Translator.Title("General", "Fishing", "Fishing"), Subtitle = Translator.Desc("General", "Fishing", "Fishing farm settings") })

    local fr1 = fishForm:Row()
    fr1:Left():TitleStack({ Title = Translator.Title("General", "Fishing Bank Threshold", "Fishing Bank Threshold"), Subtitle = Translator.Desc("General", "Fishing Bank Threshold", "Min cash to keep") })
    fr1:Right():Stepper({ Min = 0, Max = 100000, Step = 1000 })

    local fr2 = fishForm:Row()
    fr2:Left():TitleStack({ Title = Translator.Title("General", "Area", "Area"), Subtitle = Translator.Desc("General", "Area", "Fishing area") })
    fr2:Right():PopUpButton({ Options = {"Normal", "Full Underground"} })

    local fr3 = fishForm:Row()
    fr3:Left():TitleStack({ Title = Translator.Title("General", "Mode", "Mode"), Subtitle = Translator.Desc("General", "Mode", "Fishing mode") })
    fr3:Right():PopUpButton({ Options = {"Normal", "Boost"} })

    -- Section: Selling
    local sellForm = fishTab:Form()
    local se0 = sellForm:Row()
    se0:Left():TitleStack({ Title = Translator.Title("General", "Selling", "Selling"), Subtitle = Translator.Desc("General", "Selling", "Auto sell settings") })

    local se1 = sellForm:Row()
    se1:Left():TitleStack({ Title = Translator.Title("General", "Sell when", "Sell when"), Subtitle = Translator.Desc("General", "Sell when", "Condition to sell") })
    se1:Right():PopUpButton({ Options = {"Any", "Full"} })

    -- Section: Rarity Filter
    local rarForm = fishTab:Form()
    local rf0 = rarForm:Row()
    rf0:Left():TitleStack({ Title = Translator.Title("General", "Rarity Filter", "Rarity Filter"), Subtitle = Translator.Desc("General", "Rarity Filter", "Min rarity to keep") })

    local rf1 = rarForm:Row()
    rf1:Left():TitleStack({ Title = Translator.Title("General", "Min rarity", "Min rarity"), Subtitle = Translator.Desc("General", "Min rarity", "Filter by rarity") })
    rf1:Right():PopUpButton({ Options = {"Common", "Uncommon", "Rare", "Epic", "Legendary", "Omega"} })

    -- Section: Catch Webhook
    local whForm = fishTab:Form()
    local wh0 = whForm:Row()
    wh0:Left():TitleStack({ Title = Translator.Title("General", "Catch Webhook", "Catch Webhook"), Subtitle = Translator.Desc("General", "Catch Webhook", "Discord webhook for rare catches") })

    local wh1 = whForm:Row()
    wh1:Left():TitleStack({ Title = Translator.Title("General", "Webhook URL", "Webhook URL"), Subtitle = Translator.Desc("General", "Webhook URL", "Discord webhook URL") })
    wh1:Right():TextField({ Placeholder = "https://discord.com/api/webhooks/..." })

    local wh2 = whForm:Row()
    wh2:Left():TitleStack({ Title = Translator.Title("General", "Rarities", "Rarities"), Subtitle = Translator.Desc("General", "Rarities", "Notify for these rarities") })
    wh2:Right():PopUpButton({ Options = {"Rare+", "Epic+", "Legendary+", "Omega"} })

    -- Section: Equipment
    local eqForm = fishTab:Form()
    local eq0 = eqForm:Row()
    eq0:Left():TitleStack({ Title = Translator.Title("General", "Equipment", "Equipment"), Subtitle = Translator.Desc("General", "Equipment", "Fishing gear") })

    local eq1 = eqForm:Row()
    eq1:Left():TitleStack({ Title = Translator.Title("General", "Rod", "Rod"), Subtitle = Translator.Desc("General", "Rod", "Fishing rod selection") })
    eq1:Right():PopUpButton({ Options = {"Best", "Manual"} })

    local eq2 = eqForm:Row()
    eq2:Left():TitleStack({ Title = Translator.Title("General", "Bait", "Bait"), Subtitle = Translator.Desc("General", "Bait", "Bait selection") })
    eq2:Right():PopUpButton({ Options = {"Smart", "Manual"} })

    local eq3 = eqForm:Row()
    eq3:Left():TitleStack({ Title = Translator.Title("General", "Bait Per Trip", "Bait Per Trip"), Subtitle = Translator.Desc("General", "Bait Per Trip", "Bait amount per trip") })
    eq3:Right():Stepper({ Min = 1, Max = 50, Step = 1 })

    -- Section: Snap
    local snapForm = fishTab:Form()
    local sn0 = snapForm:Row()
    sn0:Left():TitleStack({ Title = Translator.Title("General", "Snap", "Snap"), Subtitle = Translator.Desc("General", "Snap", "Cast depth settings") })

    local sn1 = snapForm:Row()
    sn1:Left():TitleStack({ Title = Translator.Title("General", "Snap Depth", "Snap Depth"), Subtitle = Translator.Desc("General", "Snap Depth", "Auto snap to depth") })
    sn1:Right():Toggle()

    local sn2 = snapForm:Row()
    sn2:Left():TitleStack({ Title = Translator.Title("General", "Offset", "Offset"), Subtitle = Translator.Desc("General", "Offset", "Depth offset") })
    sn2:Right():Slider({ Min = -10, Max = 10, Step = 1 })
end

-- ==================== [TAB: PLANTING] ====================
local plantTab = mainSection:Tab({
    Title = "Planting",
    Icon = cascade.Symbols.leafFill,
})

do
    local plantForm = plantTab:Form()
    local pl0 = plantForm:Row()
    pl0:Left():TitleStack({ Title = Translator.Title("General", "Planting", "Planting"), Subtitle = Translator.Desc("General", "Planting", "Auto plant settings") })

    local pl1 = plantForm:Row()
    pl1:Left():TitleStack({ Title = Translator.Title("General", "Seed", "Seed"), Subtitle = Translator.Desc("General", "Seed", "Select seed type") })
    pl1:Right():PopUpButton({ Options = {"Auto", "Manual"} })

    local pl2 = plantForm:Row()
    pl2:Left():TitleStack({ Title = Translator.Title("General", "Water Threshold", "Water Threshold"), Subtitle = Translator.Desc("General", "Water Threshold", "Auto water when below") })
    pl2:Right():Stepper({ Min = 0, Max = 100, Step = 5 })
end

-- ==================== [TAB: FINISHER] ====================
local finisherTab = mainSection:Tab({
    Title = "Finisher",
    Icon = cascade.Symbols.checkmarkCircleFill,
})

do
    local finForm = finisherTab:Form()
    local fn0 = finForm:Row()
    fn0:Left():TitleStack({ Title = Translator.Title("General", "Finisher", "Finisher"), Subtitle = Translator.Desc("General", "Finisher", "Job completion automation") })

    local fn1 = finForm:Row()
    fn1:Left():TitleStack({ Title = Translator.Title("General", "Enabled", "Enabled"), Subtitle = Translator.Desc("General", "Enabled", "Toggle finisher") })
    fn1:Right():Toggle()
end

-- ==================== [TAB: MARKETPLACE] ====================
local marketTab = mainSection:Tab({
    Title = "Marketplace",
    Icon = cascade.Symbols.cart,
})

do
    local mktForm = marketTab:Form()
    local mk0 = mktForm:Row()
    mk0:Left():TitleStack({ Title = Translator.Title("General", "Marketplace", "Marketplace"), Subtitle = Translator.Desc("General", "Marketplace", "Auto marketplace actions") })

    local mk1 = mktForm:Row()
    mk1:Left():TitleStack({ Title = Translator.Title("General", "Balance", "Balance"), Subtitle = Translator.Desc("General", "Balance", "Current balance display") })
    mk1:Right():Label({ Text = "$0" })

    local mk2 = mktForm:Row()
    mk2:Left():TitleStack({ Title = Translator.Title("General", "ATM Amount", "ATM Amount"), Subtitle = Translator.Desc("General", "ATM Amount", "Amount for ATM operations") })
    mk2:Right():Stepper({ Min = 0, Max = 100000, Step = 1000 })

    local mk3 = mktForm:Row()
    mk3:Left():TitleStack({ Title = Translator.Title("General", "Deposit", "Deposit"), Subtitle = Translator.Desc("General", "Deposit", "Deposit cash to bank") })
    mk3:Right():Button({ Title = Translator.Title("General", "Deposit", "Deposit") })

    local mk4 = mktForm:Row()
    mk4:Left():TitleStack({ Title = Translator.Title("General", "Withdraw", "Withdraw"), Subtitle = Translator.Desc("General", "Withdraw", "Withdraw from bank") })
    mk4:Right():Button({ Title = Translator.Title("General", "Withdraw", "Withdraw") })

    -- Section: Spin Skips
    local spinForm = marketTab:Form()
    local sp0 = spinForm:Row()
    sp0:Left():TitleStack({ Title = Translator.Title("General", "Spin Skips", "Spin Skips"), Subtitle = Translator.Desc("General", "Spin Skips", "Blockspin automation") })

    local sp1 = spinForm:Row()
    sp1:Left():TitleStack({ Title = Translator.Title("General", "Enable Spin Skips", "Enable Spin Skips"), Subtitle = Translator.Desc("General", "Enable Spin Skips", "Skip spin animations") })
    sp1:Right():Toggle()
end

-- ===================== UTILITY SECTION =====================
local utilSection = window:Section({ Title = "Utility" })

-- ==================== [TAB: SERVERS] ====================
local serversTab = utilSection:Tab({
    Title = "Servers",
    Selected = true,
    Icon = cascade.Symbols.serverRack,
})

do
    -- Section: This Server
    local thisForm = serversTab:Form()
    local ts0 = thisForm:Row()
    ts0:Left():TitleStack({ Title = Translator.Title("General", "This Server", "This Server"), Subtitle = Translator.Desc("General", "This Server", "Current server info") })

    local ts1 = thisForm:Row()
    ts1:Left():TitleStack({ Title = Translator.Title("General", "Job Id", "Job Id"), Subtitle = Translator.Desc("General", "Job Id", "Current server job ID") })
    ts1:Right():Button({ Title = Translator.Title("General", "Copy", "Copy") })

    local ts2 = thisForm:Row()
    ts2:Left():TitleStack({ Title = Translator.Title("General", "Rejoin", "Rejoin"), Subtitle = Translator.Desc("General", "Rejoin", "Rejoin current server") })
    ts2:Right():Button({ Title = Translator.Title("General", "Rejoin", "Rejoin") })

    -- Section: Server Switching
    local swForm = serversTab:Form()
    local sw0 = swForm:Row()
    sw0:Left():TitleStack({ Title = Translator.Title("General", "Server Switching", "Server Switching"), Subtitle = Translator.Desc("General", "Server Switching", "Server hop options") })

    local sw1 = swForm:Row()
    sw1:Left():TitleStack({ Title = Translator.Title("General", "Join High Player Count", "Join High Player Count"), Subtitle = Translator.Desc("General", "Join High Player Count", "Join most populated") })
    sw1:Right():Button({ Title = Translator.Title("General", "Join", "Join") })

    local sw2 = swForm:Row()
    sw2:Left():TitleStack({ Title = Translator.Title("General", "Join Low Player Count", "Join Low Player Count"), Subtitle = Translator.Desc("General", "Join Low Player Count", "Join least populated") })
    sw2:Right():Button({ Title = Translator.Title("General", "Join", "Join") })

    -- Section: Server Control
    local scForm = serversTab:Form()
    local sc0 = scForm:Row()
    sc0:Left():TitleStack({ Title = Translator.Title("General", "Server Control", "Server Control"), Subtitle = Translator.Desc("General", "Server Control", "Join specific server") })

    local sc1 = scForm:Row()
    sc1:Left():TitleStack({ Title = Translator.Title("General", "Server ID", "Server ID"), Subtitle = Translator.Desc("General", "Server ID", "Enter Job ID to join") })
    sc1:Right():TextField({ Placeholder = "Job ID" })

    local sc2 = scForm:Row()
    sc2:Left():TitleStack({ Title = Translator.Title("General", "Join Server ID", "Join Server ID"), Subtitle = Translator.Desc("General", "Join Server ID", "Join the specified server") })
    sc2:Right():Button({ Title = Translator.Title("General", "Join", "Join") })

    local sc3 = scForm:Row()
    sc3:Left():TitleStack({ Title = Translator.Title("General", "Copy Join Script", "Copy Join Script"), Subtitle = Translator.Desc("General", "Copy Join Script", "Copy to clipboard") })
    sc3:Right():Button({ Title = Translator.Title("General", "Copy", "Copy") })

    -- Section: Auto Rejoin
    local arForm = serversTab:Form()
    local ar0 = arForm:Row()
    ar0:Left():TitleStack({ Title = Translator.Title("General", "Auto Rejoin", "Auto Rejoin"), Subtitle = Translator.Desc("General", "Auto Rejoin", "Auto rejoin on disconnect") })
    ar0:Right():Toggle()
end

-- ==================== [TAB: CONFIGS] ====================
local configsTab = utilSection:Tab({
    Title = "Configs",
    Icon = cascade.Symbols.docFill,
})

do
    -- Section: Configuration List
    local cfgForm = configsTab:Form()
    local cf0 = cfgForm:Row()
    cf0:Left():TitleStack({ Title = Translator.Title("General", "Configuration List", "Configuration List"), Subtitle = Translator.Desc("General", "Configuration List", "Saved configs") })

    local cf1 = cfgForm:Row()
    cf1:Left():TitleStack({ Title = Translator.Title("General", "Load", "Load"), Subtitle = Translator.Desc("General", "Load", "Load selected config") })
    cf1:Right():Button({ Title = Translator.Title("General", "Load", "Load") })

    local cf2 = cfgForm:Row()
    cf2:Left():TitleStack({ Title = Translator.Title("General", "Save", "Save"), Subtitle = Translator.Desc("General", "Save", "Save current settings") })
    cf2:Right():Button({ Title = Translator.Title("General", "Save", "Save") })

    local cf3 = cfgForm:Row()
    cf3:Left():TitleStack({ Title = Translator.Title("General", "Delete", "Delete"), Subtitle = Translator.Desc("General", "Delete", "Delete selected config") })
    cf3:Right():Button({ Title = Translator.Title("General", "Delete", "Delete") })

    -- Section: Configuration Management
    local cmForm = configsTab:Form()
    local cm0 = cmForm:Row()
    cm0:Left():TitleStack({ Title = Translator.Title("General", "Configuration Management", "Configuration Management"), Subtitle = Translator.Desc("General", "Configuration Management", "Create/Import/Export") })

    local cm1 = cmForm:Row()
    cm1:Left():TitleStack({ Title = Translator.Title("General", "New Config", "New Config"), Subtitle = Translator.Desc("General", "New Config", "Create new configuration") })
    cm1:Right():TextField({ Placeholder = "Enter config name" })

    local cm2 = cmForm:Row()
    cm2:Left():TitleStack({ Title = Translator.Title("General", "Create", "Create"), Subtitle = Translator.Desc("General", "Create", "Create the config") })
    cm2:Right():Button({ Title = Translator.Title("General", "Create", "Create") })

    local cm3 = cmForm:Row()
    cm3:Left():TitleStack({ Title = Translator.Title("General", "Import Config", "Import Config"), Subtitle = Translator.Desc("General", "Import Config", "Import from code") })
    cm3:Right():TextField({ Placeholder = "Paste config code here" })

    local cm4 = cmForm:Row()
    cm4:Left():TitleStack({ Title = Translator.Title("General", "Export Current", "Export Current"), Subtitle = Translator.Desc("General", "Export Current", "Export to clipboard") })
    cm4:Right():Button({ Title = Translator.Title("General", "Copy Code", "Copy Code") })

    local cm5 = cmForm:Row()
    cm5:Left():TitleStack({ Title = Translator.Title("General", "Auto Load", "Auto Load"), Subtitle = Translator.Desc("General", "Auto Load", "Auto load config on start") })
    cm5:Right():Toggle()

    local cm6 = cmForm:Row()
    cm6:Left():TitleStack({ Title = Translator.Title("General", "Generate Loader Config", "Generate Loader Config"), Subtitle = Translator.Desc("General", "Generate Loader Config", "Create standalone loader") })
    cm6:Right():Button({ Title = Translator.Title("General", "Copy Loader", "Copy Loader") })
end

-- ==================== [TAB: PERFORMANCE] ====================
local perfTab = utilSection:Tab({
    Title = "Performance",
    Icon = cascade.Symbols.gauge,
})

do
    -- Section: Performance
    local perfForm = perfTab:Form()
    local pf0 = perfForm:Row()
    pf0:Left():TitleStack({ Title = Translator.Title("General", "Performance", "Performance"), Subtitle = Translator.Desc("General", "Performance", "FPS and rendering settings") })

    -- Section: Framerate
    local fpsForm = perfTab:Form()
    local fp0 = fpsForm:Row()
    fp0:Left():TitleStack({ Title = Translator.Title("General", "Framerate", "Framerate"), Subtitle = Translator.Desc("General", "Framerate", "FPS limit settings") })

    local fp1 = fpsForm:Row()
    fp1:Left():TitleStack({ Title = Translator.Title("General", "FPS Unlock", "FPS Unlock"), Subtitle = Translator.Desc("General", "FPS Unlock", "Remove FPS cap") })
    fp1:Right():Toggle()

    -- Section: Effects
    local efForm = perfTab:Form()
    local ef0 = efForm:Row()
    ef0:Left():TitleStack({ Title = Translator.Title("General", "Effects", "Effects"), Subtitle = Translator.Desc("General", "Effects", "Visual effect toggles") })

    local ef1 = efForm:Row()
    ef1:Left():TitleStack({ Title = Translator.Title("General", "Disable Particles", "Disable Particles"), Subtitle = Translator.Desc("General", "Disable Particles", "Remove particles") })
    ef1:Right():Toggle()

    local ef2 = efForm:Row()
    ef2:Left():TitleStack({ Title = Translator.Title("General", "Disable Shadows", "Disable Shadows"), Subtitle = Translator.Desc("General", "Disable Shadows", "Remove shadows") })
    ef2:Right():Toggle()

    -- Section: Appearance
    local apForm = perfTab:Form()
    local ap0 = apForm:Row()
    ap0:Left():TitleStack({ Title = Translator.Title("General", "Appearance", "Appearance"), Subtitle = Translator.Desc("General", "Appearance", "UI settings") })

    local ap1 = apForm:Row()
    ap1:Left():TitleStack({ Title = Translator.Title("General", "Theme", "Theme"), Subtitle = Translator.Desc("General", "Theme", "Dark/Light mode") })
    ap1:Right():PopUpButton({ Options = {"Dark", "Light"} })

    local ap2 = apForm:Row()
    ap2:Left():TitleStack({ Title = Translator.Title("General", "MinimizeKeybind", "MinimizeKeybind"), Subtitle = Translator.Desc("General", "MinimizeKeybind", "Keybind to toggle UI") })
    ap2:Right():KeybindField()
end

-- ===================== LIVE SECTION =====================
local liveSection = window:Section({ Title = "Live" })

local liveTab = liveSection:Tab({
    Title = "Activity",
    Selected = true,
    Icon = cascade.Symbols.chartBar,
})

do
    local liveForm = liveTab:Form()

    local lv1 = liveForm:Row()
    lv1:Left():TitleStack({ Title = Translator.Title("General", "Hand Cash", "Hand Cash"), Subtitle = Translator.Desc("General", "Hand Cash", "Cash in hand") })
    lv1:Right():Label({ Text = "$0" })

    local lv2 = liveForm:Row()
    lv2:Left():TitleStack({ Title = Translator.Title("General", "Bank Balance", "Bank Balance"), Subtitle = Translator.Desc("General", "Bank Balance", "Cash in bank") })
    lv2:Right():Label({ Text = "$0" })

    local lv3 = liveForm:Row()
    lv3:Left():TitleStack({ Title = Translator.Title("General", "Session Earned", "Session Earned"), Subtitle = Translator.Desc("General", "Session Earned", "Earned this session") })
    lv3:Right():Label({ Text = "$0" })

    local lv4 = liveForm:Row()
    lv4:Left():TitleStack({ Title = Translator.Title("General", "Session Time", "Session Time"), Subtitle = Translator.Desc("General", "Session Time", "Active time") })
    lv4:Right():Label({ Text = "00:00:00" })

    local lv5 = liveForm:Row()
    lv5:Left():TitleStack({ Title = Translator.Title("General", "Status", "Status"), Subtitle = Translator.Desc("General", "Status", "Current activity") })
    lv5:Right():Label({ Text = "Idle" })
end

print("[AGY] Axon UI Replica loaded! (Cascade UI)")

