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
    farmRow0:Left():TitleStack({ Title = "Farming", Subtitle = "Core autofarming settings" })

    local farmRow1 = farmForm:Row()
    farmRow1:Left():TitleStack({ Title = Translator.Title("farming", "Enabled", "Enabled"), Subtitle = Translator.Desc("farming", "Enabled", "Toggle autofarming on/off") })
    farmRow1:Right():Toggle()

    local farmRow2 = farmForm:Row()
    farmRow2:Left():TitleStack({ Title = Translator.Title("farming", "Job", "Job"), Subtitle = Translator.Desc("farming", "Job", "Select which job to farm") })
    farmRow2:Right():PopUpButton({ Options = {"Cook", "Janitor", "Stocker", "ATM Hacker", "Fisher"} })

    local farmRow3 = farmForm:Row()
    farmRow3:Left():TitleStack({ Title = "Anti Finish", Subtitle = "Prevent job from completing" })
    farmRow3:Right():Toggle()

    local farmRow4 = farmForm:Row()
    farmRow4:Left():TitleStack({ Title = "Respawn On Death", Subtitle = "Auto respawn when killed" })
    farmRow4:Right():Toggle()

    local farmRow5 = farmForm:Row()
    farmRow5:Left():TitleStack({ Title = "Stamina Farm", Subtitle = "Automatically manage stamina" })
    farmRow5:Right():Toggle()

    -- Section: Rotation
    local rotForm = jobsTab:Form()
    local rotRow0 = rotForm:Row()
    rotRow0:Left():TitleStack({ Title = "Rotation", Subtitle = "Job rotation settings" })

    local rotRow1 = rotForm:Row()
    rotRow1:Left():TitleStack({ Title = "Rotation", Subtitle = "Enable job rotation" })
    rotRow1:Right():Toggle()

    -- Section: Vehicle
    local vehForm = jobsTab:Form()
    local vehRow0 = vehForm:Row()
    vehRow0:Left():TitleStack({ Title = "Vehicle", Subtitle = "Vehicle usage settings" })

    local vehRow1 = vehForm:Row()
    vehRow1:Left():TitleStack({ Title = "Use Vehicle", Subtitle = "Use vehicle for travel" })
    vehRow1:Right():Toggle()

    local vehRow2 = vehForm:Row()
    vehRow2:Left():TitleStack({ Title = "Type", Subtitle = "Vehicle type" })
    vehRow2:Right():PopUpButton({ Options = {"Bike", "Car"} })

    -- Section: Self-defense
    local defForm = jobsTab:Form()
    local defRow0 = defForm:Row()
    defRow0:Left():TitleStack({ Title = "Self-defense", Subtitle = "Auto defense settings" })

    local defRow1 = defForm:Row()
    defRow1:Left():TitleStack({ Title = "Fight back", Subtitle = "Auto fight attackers" })
    defRow1:Right():PopUpButton({ Options = {"Off", "Aura", "Defense"} })

    -- Section: Streamer Mode
    local strForm = jobsTab:Form()
    local strRow1 = strForm:Row()
    strRow1:Left():TitleStack({ Title = "Streamer Mode", Subtitle = "Hide sensitive info" })
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
    cr0:Left():TitleStack({ Title = "Banking", Subtitle = "Cook banking settings" })

    local cr1 = cookForm:Row()
    cr1:Left():TitleStack({ Title = "Bank Surplus", Subtitle = "Bank extra cash" })
    cr1:Right():Toggle()

    local cr2 = cookForm:Row()
    cr2:Left():TitleStack({ Title = "Cook Bank Threshold", Subtitle = "Min cash to keep" })
    cr2:Right():Stepper({ Min = 0, Max = 100000, Step = 1000 })

    -- Section: Skillet
    local skillForm = cookTab:Form()
    local sk0 = skillForm:Row()
    sk0:Left():TitleStack({ Title = "Skillet", Subtitle = "Skillet equipment" })

    local sk1 = skillForm:Row()
    sk1:Left():TitleStack({ Title = "Buy Best Skillet", Subtitle = "Auto buy best available" })
    sk1:Right():Toggle()

    local sk2 = skillForm:Row()
    sk2:Left():TitleStack({ Title = "Pick", Subtitle = "Skillet selection mode" })
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
    jr0:Left():TitleStack({ Title = "Banking", Subtitle = "Janitor banking settings" })

    local jr1 = janForm:Row()
    jr1:Left():TitleStack({ Title = "Janitor Bank Threshold", Subtitle = "Min cash threshold" })
    jr1:Right():Stepper({ Min = 0, Max = 100000, Step = 1000 })

    -- Section: Mop
    local mopForm = janitorTab:Form()
    local mr0 = mopForm:Row()
    mr0:Left():TitleStack({ Title = "Mop", Subtitle = "Mop equipment" })

    local mr1 = mopForm:Row()
    mr1:Left():TitleStack({ Title = "Buy Best Mop", Subtitle = "Auto buy best available" })
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
    sr0:Left():TitleStack({ Title = "Banking", Subtitle = "Stocker banking settings" })

    local sr1 = stForm:Row()
    sr1:Left():TitleStack({ Title = "Stocker Bank Threshold", Subtitle = "Min cash threshold" })
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
    ar0:Left():TitleStack({ Title = "Banking", Subtitle = "ATM banking settings" })

    local ar1 = atmForm:Row()
    ar1:Left():TitleStack({ Title = "ATM Bank Threshold", Subtitle = "Min cash to keep" })
    ar1:Right():Stepper({ Min = 0, Max = 100000, Step = 1000 })

    local ar2 = atmForm:Row()
    ar2:Left():TitleStack({ Title = "Semi Underground", Subtitle = "Use semi underground mode" })
    ar2:Right():Toggle()

    local ar3 = atmForm:Row()
    ar3:Left():TitleStack({ Title = "ATM Repair Below", Subtitle = "Auto repair ATM health" })
    ar3:Right():Stepper({ Min = 0, Max = 100, Step = 5 })

    -- Section: ATM Paths
    local pathForm = atmTab:Form()
    local pr0 = pathForm:Row()
    pr0:Left():TitleStack({ Title = "ATM Paths", Subtitle = "Route management" })

    local pr1 = pathForm:Row()
    pr1:Left():TitleStack({ Title = "Collect Routes", Subtitle = "Collect ATM route data" })
    pr1:Right():Button({ Title = "Collect" })

    local pr2 = pathForm:Row()
    pr2:Left():TitleStack({ Title = "Test Cached Routes", Subtitle = "Test saved routes" })
    pr2:Right():Button({ Title = "Test" })

    local pr3 = pathForm:Row()
    pr3:Left():TitleStack({ Title = "Export ATM Routes", Subtitle = "Export to clipboard" })
    pr3:Right():Button({ Title = "Copy JSON" })

    local pr4 = pathForm:Row()
    pr4:Left():TitleStack({ Title = "Import ATM Routes", Subtitle = "Import from clipboard" })
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
    fr0:Left():TitleStack({ Title = "Fishing", Subtitle = "Fishing farm settings" })

    local fr1 = fishForm:Row()
    fr1:Left():TitleStack({ Title = "Fishing Bank Threshold", Subtitle = "Min cash to keep" })
    fr1:Right():Stepper({ Min = 0, Max = 100000, Step = 1000 })

    local fr2 = fishForm:Row()
    fr2:Left():TitleStack({ Title = "Area", Subtitle = "Fishing area" })
    fr2:Right():PopUpButton({ Options = {"Normal", "Full Underground"} })

    local fr3 = fishForm:Row()
    fr3:Left():TitleStack({ Title = "Mode", Subtitle = "Fishing mode" })
    fr3:Right():PopUpButton({ Options = {"Normal", "Boost"} })

    -- Section: Selling
    local sellForm = fishTab:Form()
    local se0 = sellForm:Row()
    se0:Left():TitleStack({ Title = "Selling", Subtitle = "Auto sell settings" })

    local se1 = sellForm:Row()
    se1:Left():TitleStack({ Title = "Sell when", Subtitle = "Condition to sell" })
    se1:Right():PopUpButton({ Options = {"Any", "Full"} })

    -- Section: Rarity Filter
    local rarForm = fishTab:Form()
    local rf0 = rarForm:Row()
    rf0:Left():TitleStack({ Title = "Rarity Filter", Subtitle = "Min rarity to keep" })

    local rf1 = rarForm:Row()
    rf1:Left():TitleStack({ Title = "Min rarity", Subtitle = "Filter by rarity" })
    rf1:Right():PopUpButton({ Options = {"Common", "Uncommon", "Rare", "Epic", "Legendary", "Omega"} })

    -- Section: Catch Webhook
    local whForm = fishTab:Form()
    local wh0 = whForm:Row()
    wh0:Left():TitleStack({ Title = "Catch Webhook", Subtitle = "Discord webhook for rare catches" })

    local wh1 = whForm:Row()
    wh1:Left():TitleStack({ Title = "Webhook URL", Subtitle = "Discord webhook URL" })
    wh1:Right():TextField({ Placeholder = "https://discord.com/api/webhooks/..." })

    local wh2 = whForm:Row()
    wh2:Left():TitleStack({ Title = "Rarities", Subtitle = "Notify for these rarities" })
    wh2:Right():PopUpButton({ Options = {"Rare+", "Epic+", "Legendary+", "Omega"} })

    -- Section: Equipment
    local eqForm = fishTab:Form()
    local eq0 = eqForm:Row()
    eq0:Left():TitleStack({ Title = "Equipment", Subtitle = "Fishing gear" })

    local eq1 = eqForm:Row()
    eq1:Left():TitleStack({ Title = "Rod", Subtitle = "Fishing rod selection" })
    eq1:Right():PopUpButton({ Options = {"Best", "Manual"} })

    local eq2 = eqForm:Row()
    eq2:Left():TitleStack({ Title = "Bait", Subtitle = "Bait selection" })
    eq2:Right():PopUpButton({ Options = {"Smart", "Manual"} })

    local eq3 = eqForm:Row()
    eq3:Left():TitleStack({ Title = "Bait Per Trip", Subtitle = "Bait amount per trip" })
    eq3:Right():Stepper({ Min = 1, Max = 50, Step = 1 })

    -- Section: Snap
    local snapForm = fishTab:Form()
    local sn0 = snapForm:Row()
    sn0:Left():TitleStack({ Title = "Snap", Subtitle = "Cast depth settings" })

    local sn1 = snapForm:Row()
    sn1:Left():TitleStack({ Title = "Snap Depth", Subtitle = "Auto snap to depth" })
    sn1:Right():Toggle()

    local sn2 = snapForm:Row()
    sn2:Left():TitleStack({ Title = "Offset", Subtitle = "Depth offset" })
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
    pl0:Left():TitleStack({ Title = "Planting", Subtitle = "Auto plant settings" })

    local pl1 = plantForm:Row()
    pl1:Left():TitleStack({ Title = "Seed", Subtitle = "Select seed type" })
    pl1:Right():PopUpButton({ Options = {"Auto", "Manual"} })

    local pl2 = plantForm:Row()
    pl2:Left():TitleStack({ Title = "Water Threshold", Subtitle = "Auto water when below" })
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
    fn0:Left():TitleStack({ Title = "Finisher", Subtitle = "Job completion automation" })

    local fn1 = finForm:Row()
    fn1:Left():TitleStack({ Title = "Enabled", Subtitle = "Toggle finisher" })
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
    mk0:Left():TitleStack({ Title = "Marketplace", Subtitle = "Auto marketplace actions" })

    local mk1 = mktForm:Row()
    mk1:Left():TitleStack({ Title = "Balance", Subtitle = "Current balance display" })
    mk1:Right():Label({ Text = "$0" })

    local mk2 = mktForm:Row()
    mk2:Left():TitleStack({ Title = "ATM Amount", Subtitle = "Amount for ATM operations" })
    mk2:Right():Stepper({ Min = 0, Max = 100000, Step = 1000 })

    local mk3 = mktForm:Row()
    mk3:Left():TitleStack({ Title = "Deposit", Subtitle = "Deposit cash to bank" })
    mk3:Right():Button({ Title = "Deposit" })

    local mk4 = mktForm:Row()
    mk4:Left():TitleStack({ Title = "Withdraw", Subtitle = "Withdraw from bank" })
    mk4:Right():Button({ Title = "Withdraw" })

    -- Section: Spin Skips
    local spinForm = marketTab:Form()
    local sp0 = spinForm:Row()
    sp0:Left():TitleStack({ Title = "Spin Skips", Subtitle = "Blockspin automation" })

    local sp1 = spinForm:Row()
    sp1:Left():TitleStack({ Title = "Enable Spin Skips", Subtitle = "Skip spin animations" })
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
    ts0:Left():TitleStack({ Title = "This Server", Subtitle = "Current server info" })

    local ts1 = thisForm:Row()
    ts1:Left():TitleStack({ Title = "Job Id", Subtitle = "Current server job ID" })
    ts1:Right():Button({ Title = "Copy" })

    local ts2 = thisForm:Row()
    ts2:Left():TitleStack({ Title = "Rejoin", Subtitle = "Rejoin current server" })
    ts2:Right():Button({ Title = "Rejoin" })

    -- Section: Server Switching
    local swForm = serversTab:Form()
    local sw0 = swForm:Row()
    sw0:Left():TitleStack({ Title = "Server Switching", Subtitle = "Server hop options" })

    local sw1 = swForm:Row()
    sw1:Left():TitleStack({ Title = "Join High Player Count", Subtitle = "Join most populated" })
    sw1:Right():Button({ Title = "Join" })

    local sw2 = swForm:Row()
    sw2:Left():TitleStack({ Title = "Join Low Player Count", Subtitle = "Join least populated" })
    sw2:Right():Button({ Title = "Join" })

    -- Section: Server Control
    local scForm = serversTab:Form()
    local sc0 = scForm:Row()
    sc0:Left():TitleStack({ Title = "Server Control", Subtitle = "Join specific server" })

    local sc1 = scForm:Row()
    sc1:Left():TitleStack({ Title = "Server ID", Subtitle = "Enter Job ID to join" })
    sc1:Right():TextField({ Placeholder = "Job ID" })

    local sc2 = scForm:Row()
    sc2:Left():TitleStack({ Title = "Join Server ID", Subtitle = "Join the specified server" })
    sc2:Right():Button({ Title = "Join" })

    local sc3 = scForm:Row()
    sc3:Left():TitleStack({ Title = "Copy Join Script", Subtitle = "Copy to clipboard" })
    sc3:Right():Button({ Title = "Copy" })

    -- Section: Auto Rejoin
    local arForm = serversTab:Form()
    local ar0 = arForm:Row()
    ar0:Left():TitleStack({ Title = "Auto Rejoin", Subtitle = "Auto rejoin on disconnect" })
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
    cf0:Left():TitleStack({ Title = "Configuration List", Subtitle = "Saved configs" })

    local cf1 = cfgForm:Row()
    cf1:Left():TitleStack({ Title = "Load", Subtitle = "Load selected config" })
    cf1:Right():Button({ Title = "Load" })

    local cf2 = cfgForm:Row()
    cf2:Left():TitleStack({ Title = "Save", Subtitle = "Save current settings" })
    cf2:Right():Button({ Title = "Save" })

    local cf3 = cfgForm:Row()
    cf3:Left():TitleStack({ Title = "Delete", Subtitle = "Delete selected config" })
    cf3:Right():Button({ Title = "Delete" })

    -- Section: Configuration Management
    local cmForm = configsTab:Form()
    local cm0 = cmForm:Row()
    cm0:Left():TitleStack({ Title = "Configuration Management", Subtitle = "Create/Import/Export" })

    local cm1 = cmForm:Row()
    cm1:Left():TitleStack({ Title = "New Config", Subtitle = "Create new configuration" })
    cm1:Right():TextField({ Placeholder = "Enter config name" })

    local cm2 = cmForm:Row()
    cm2:Left():TitleStack({ Title = "Create", Subtitle = "Create the config" })
    cm2:Right():Button({ Title = "Create" })

    local cm3 = cmForm:Row()
    cm3:Left():TitleStack({ Title = "Import Config", Subtitle = "Import from code" })
    cm3:Right():TextField({ Placeholder = "Paste config code here" })

    local cm4 = cmForm:Row()
    cm4:Left():TitleStack({ Title = "Export Current", Subtitle = "Export to clipboard" })
    cm4:Right():Button({ Title = "Copy Code" })

    local cm5 = cmForm:Row()
    cm5:Left():TitleStack({ Title = "Auto Load", Subtitle = "Auto load config on start" })
    cm5:Right():Toggle()

    local cm6 = cmForm:Row()
    cm6:Left():TitleStack({ Title = "Generate Loader Config", Subtitle = "Create standalone loader" })
    cm6:Right():Button({ Title = "Copy Loader" })
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
    pf0:Left():TitleStack({ Title = "Performance", Subtitle = "FPS and rendering settings" })

    -- Section: Framerate
    local fpsForm = perfTab:Form()
    local fp0 = fpsForm:Row()
    fp0:Left():TitleStack({ Title = "Framerate", Subtitle = "FPS limit settings" })

    local fp1 = fpsForm:Row()
    fp1:Left():TitleStack({ Title = "FPS Unlock", Subtitle = "Remove FPS cap" })
    fp1:Right():Toggle()

    -- Section: Effects
    local efForm = perfTab:Form()
    local ef0 = efForm:Row()
    ef0:Left():TitleStack({ Title = "Effects", Subtitle = "Visual effect toggles" })

    local ef1 = efForm:Row()
    ef1:Left():TitleStack({ Title = "Disable Particles", Subtitle = "Remove particles" })
    ef1:Right():Toggle()

    local ef2 = efForm:Row()
    ef2:Left():TitleStack({ Title = "Disable Shadows", Subtitle = "Remove shadows" })
    ef2:Right():Toggle()

    -- Section: Appearance
    local apForm = perfTab:Form()
    local ap0 = apForm:Row()
    ap0:Left():TitleStack({ Title = "Appearance", Subtitle = "UI settings" })

    local ap1 = apForm:Row()
    ap1:Left():TitleStack({ Title = "Theme", Subtitle = "Dark/Light mode" })
    ap1:Right():PopUpButton({ Options = {"Dark", "Light"} })

    local ap2 = apForm:Row()
    ap2:Left():TitleStack({ Title = "MinimizeKeybind", Subtitle = "Keybind to toggle UI" })
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
    lv1:Left():TitleStack({ Title = "Hand Cash", Subtitle = "Cash in hand" })
    lv1:Right():Label({ Text = "$0" })

    local lv2 = liveForm:Row()
    lv2:Left():TitleStack({ Title = "Bank Balance", Subtitle = "Cash in bank" })
    lv2:Right():Label({ Text = "$0" })

    local lv3 = liveForm:Row()
    lv3:Left():TitleStack({ Title = "Session Earned", Subtitle = "Earned this session" })
    lv3:Right():Label({ Text = "$0" })

    local lv4 = liveForm:Row()
    lv4:Left():TitleStack({ Title = "Session Time", Subtitle = "Active time" })
    lv4:Right():Label({ Text = "00:00:00" })

    local lv5 = liveForm:Row()
    lv5:Left():TitleStack({ Title = "Status", Subtitle = "Current activity" })
    lv5:Right():Label({ Text = "Idle" })
end

print("[AGY] Axon UI Replica loaded! (Cascade UI)")


