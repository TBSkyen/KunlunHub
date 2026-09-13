--!nolint
--!nocheck
-- ===================================================================
-- {AGY} Axon Hub Client (Clean Architecture)
-- ===================================================================

-- 1. Load the Host Framework
local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/TBSkyen/KunlunHub/main/UI/CascadeUI.lua"))()
UI.Init("Thai") -- Set language

-- 2. Build the Window
local MainWindow = UI.Window("Axon", "v2.0 | Clean Architecture")

-- Group: Main
local MainGroup = MainWindow:TabGroup("Main")

local JobsTab = MainGroup:Tab("Jobs", "Jobs", "briefcase", true)

local FarmingSection = JobsTab:Section("Farming", "")
local EnabledToggle = FarmingSection:Toggle("Enabled", "Toggle autofarming on/off")
local JobDropdown = FarmingSection:Dropdown("Job", "Select which job to farm", {"Cook", "Janitor", "Stocker", "ATM Hacker", "Fisher", "Runner"})
local AntiFinishToggle = FarmingSection:Toggle("Anti Finish", "Prevent job from completing")
local RespawnOnDeathToggle = FarmingSection:Toggle("Respawn On Death", "Auto respawn when killed")
local StaminaFarmToggle = FarmingSection:Toggle("Stamina Farm", "Automatically manage stamina")

local RotationSection = JobsTab:Section("Rotation", "")
local EnableRotationToggle = RotationSection:Toggle("Enable Rotation", "Enable job rotation")
local RotationWaitStepper = RotationSection:Stepper("Rotation Wait", "Wait time before next job (s)", 0, 100000, 1000)

local VehicleSection = JobsTab:Section("Vehicle", "")
local UseVehicleToggle = VehicleSection:Toggle("Use Vehicle", "Use vehicle for travel")
local TypeDropdown = VehicleSection:Dropdown("Type", "Vehicle type", {"Bike", "Car"})
local AutoSpawnToggle = VehicleSection:Toggle("Auto Spawn", "Auto spawn vehicle")

local Self-defenseSection = JobsTab:Section("Self-defense", "")
local FightbackDropdown = Self-defenseSection:Dropdown("Fight back", "Auto fight attackers", {"Off", "Aura", "Defense"})
local AutoHealToggle = Self-defenseSection:Toggle("Auto Heal", "Auto heal during combat")

local StreamerModeSection = JobsTab:Section("Streamer Mode", "")
local EnableStreamerModeToggle = StreamerModeSection:Toggle("Enable Streamer Mode", "Hide sensitive info")
local HideNameToggle = StreamerModeSection:Toggle("Hide Name", "Hide local player name")

local CookTab = MainGroup:Tab("Cook", "Cook", "flameFill", false)

local BankingSection = CookTab:Section("Banking", "")
local BankSurplusToggle = BankingSection:Toggle("Bank Surplus", "Bank extra cash")
local CookBankThresholdStepper = BankingSection:Stepper("Cook Bank Threshold", "Min cash to keep", 0, 100000, 1000)

local SkilletSection = CookTab:Section("Skillet", "")
local BuyBestSkilletToggle = SkilletSection:Toggle("Buy Best Skillet", "Auto buy best available")
local PickDropdown = SkilletSection:Dropdown("Pick", "Skillet selection mode", {"Smart", "Manual"})

local JanitorTab = MainGroup:Tab("Janitor", "Janitor", "sparkles", false)

local BankingSection = JanitorTab:Section("Banking", "")
local JanitorBankThresholdStepper = BankingSection:Stepper("Janitor Bank Threshold", "Min cash threshold", 0, 100000, 1000)

local MopSection = JanitorTab:Section("Mop", "")
local BuyBestMopToggle = MopSection:Toggle("Buy Best Mop", "Auto buy best available")
local PickDropdown = MopSection:Dropdown("Pick", "Mop selection mode", {"Smart", "Manual"})

local StockerTab = MainGroup:Tab("Stocker", "Stocker", "shippingboxFill", false)

local BankingSection = StockerTab:Section("Banking", "")
local StockerBankThresholdStepper = BankingSection:Stepper("Stocker Bank Threshold", "Min cash threshold", 0, 100000, 1000)

local ATMHackerTab = MainGroup:Tab("ATM Hacker", "ATM Hacker", "lockOpenFill", false)

local BankingSection = ATMHackerTab:Section("Banking", "")
local ATMBankThresholdStepper = BankingSection:Stepper("ATM Bank Threshold", "Min cash to keep", 0, 100000, 1000)

local UndergroundSection = ATMHackerTab:Section("Underground", "")
local SemiUndergroundToggle = UndergroundSection:Toggle("Semi Underground", "Use semi underground mode")
local FullUndergroundToggle = UndergroundSection:Toggle("Full Underground", "Use full underground mode")

local RepairSection = ATMHackerTab:Section("Repair", "")
local ATMRepairBelowStepper = RepairSection:Stepper("ATM Repair Below", "Auto repair ATM health", 0, 100000, 1000)

local ATMPathsSection = ATMHackerTab:Section("ATM Paths", "")
local CollectRoutesBtn = ATMPathsSection:Button("Collect Routes", "Collect ATM route data")
local TestCachedRoutesBtn = ATMPathsSection:Button("Test Cached Routes", "Test saved routes")
local ExportATMRoutesBtn = ATMPathsSection:Button("Export ATM Routes", "Export to clipboard")
local ImportATMRoutesInput = ATMPathsSection:TextField("Import ATM Routes", "Import from clipboard")

local FishingTab = MainGroup:Tab("Fishing", "Fishing", "water", false)

local BankingSection = FishingTab:Section("Banking", "")
local FishingBankThresholdStepper = BankingSection:Stepper("Fishing Bank Threshold", "Min cash to keep", 0, 100000, 1000)

local LocationSection = FishingTab:Section("Location", "")
local AreaDropdown = LocationSection:Dropdown("Area", "Fishing area", {"Normal", "Full Underground"})
local ModeDropdown = LocationSection:Dropdown("Mode", "Fishing mode", {"Normal", "Boost"})

local SellingSection = FishingTab:Section("Selling", "")
local SellwhenDropdown = SellingSection:Dropdown("Sell when", "Condition to sell", {"Any", "Full"})

local RarityFilterSection = FishingTab:Section("Rarity Filter", "")
local MinrarityDropdown = RarityFilterSection:Dropdown("Min rarity", "Filter by rarity", {"Common", "Uncommon", "Rare", "Epic", "Legendary", "Omega"})

local CatchWebhookSection = FishingTab:Section("Catch Webhook", "")
local WebhookURLInput = CatchWebhookSection:TextField("Webhook URL", "Discord webhook URL")
local RaritiesDropdown = CatchWebhookSection:Dropdown("Rarities", "Notify for these rarities", {"Rare+", "Epic+", "Legendary+", "Omega"})

local EquipmentSection = FishingTab:Section("Equipment", "")
local RodDropdown = EquipmentSection:Dropdown("Rod", "Fishing rod selection", {"Best", "Manual"})
local BaitDropdown = EquipmentSection:Dropdown("Bait", "Bait selection", {"Smart", "Manual"})
local BaitPerTripStepper = EquipmentSection:Stepper("Bait Per Trip", "Bait amount per trip", 0, 100000, 1000)

local SnapSection = FishingTab:Section("Snap", "")
local SnapDepthToggle = SnapSection:Toggle("Snap Depth", "Auto snap to depth")
local OffsetSlider = SnapSection:Slider("Offset", "Depth offset", -10, 10, 1)

local PlantingTab = MainGroup:Tab("Planting", "Planting", "leafFill", false)

local PlantingSection = PlantingTab:Section("Planting", "")
local SeedDropdown = PlantingSection:Dropdown("Seed", "Select seed type", {"Auto", "Manual"})
local WaterThresholdStepper = PlantingSection:Stepper("Water Threshold", "Auto water when below", 0, 100000, 1000)

local FinisherTab = MainGroup:Tab("Finisher", "Finisher", "checkmarkCircleFill", false)

local FinisherSection = FinisherTab:Section("Finisher", "")
local EnabledToggle = FinisherSection:Toggle("Enabled", "Toggle finisher")

local MarketplaceTab = MainGroup:Tab("Marketplace", "Marketplace", "cart", false)

local MarketplaceSection = MarketplaceTab:Section("Marketplace", "")
local ATMAmountStepper = MarketplaceSection:Stepper("ATM Amount", "Amount for ATM operations", 0, 100000, 1000)
local DepositBtn = MarketplaceSection:Button("Deposit", "Deposit cash to bank")
local WithdrawBtn = MarketplaceSection:Button("Withdraw", "Withdraw from bank")

local SpinSkipsSection = MarketplaceTab:Section("Spin Skips", "")
local EnableSpinSkipsToggle = SpinSkipsSection:Toggle("Enable Spin Skips", "Skip spin animations")

-- Group: Utility
local UtilityGroup = MainWindow:TabGroup("Utility")

local ServersTab = UtilityGroup:Tab("Servers", "Servers", "serverRack", false)

local ThisServerSection = ServersTab:Section("This Server", "")
local JobIdBtn = ThisServerSection:Button("Job Id", "Current server job ID")
local RejoinBtn = ThisServerSection:Button("Rejoin", "Rejoin current server")

local ServerSwitchingSection = ServersTab:Section("Server Switching", "")
local JoinHighPlayerCountBtn = ServerSwitchingSection:Button("Join High Player Count", "Join most populated")
local JoinLowPlayerCountBtn = ServerSwitchingSection:Button("Join Low Player Count", "Join least populated")

local ServerControlSection = ServersTab:Section("Server Control", "")
local ServerIDInput = ServerControlSection:TextField("Server ID", "Enter Job ID to join")
local JoinServerIDBtn = ServerControlSection:Button("Join Server ID", "Join the specified server")
local CopyJoinScriptBtn = ServerControlSection:Button("Copy Join Script", "Copy to clipboard")

local AutoRejoinSection = ServersTab:Section("Auto Rejoin", "")
local EnableAutoRejoinToggle = AutoRejoinSection:Toggle("Enable Auto Rejoin", "Auto rejoin server")

local ConfigsTab = UtilityGroup:Tab("Configs", "Configs", "docFill", false)

local ConfigurationListSection = ConfigsTab:Section("Configuration List", "")
local LoadBtn = ConfigurationListSection:Button("Load", "Load selected config")
local SaveBtn = ConfigurationListSection:Button("Save", "Save current settings")
local DeleteBtn = ConfigurationListSection:Button("Delete", "Delete selected config")

local ConfigurationManagementSection = ConfigsTab:Section("Configuration Management", "")
local NewConfigInput = ConfigurationManagementSection:TextField("New Config", "Create new configuration")
local CreateBtn = ConfigurationManagementSection:Button("Create", "Create the config")
local ImportConfigInput = ConfigurationManagementSection:TextField("Import Config", "Import from code")
local ExportCurrentBtn = ConfigurationManagementSection:Button("Export Current", "Export to clipboard")
local AutoLoadToggle = ConfigurationManagementSection:Toggle("Auto Load", "Auto load config on start")
local GenerateLoaderConfigBtn = ConfigurationManagementSection:Button("Generate Loader Config", "Create standalone loader")

local PerformanceTab = UtilityGroup:Tab("Performance", "Performance", "gauge", false)

local FramerateSection = PerformanceTab:Section("Framerate", "")
local FPSUnlockToggle = FramerateSection:Toggle("FPS Unlock", "Remove FPS cap")
local TargetFPSStepper = FramerateSection:Stepper("Target FPS", "Target framerate limit", 0, 100000, 1000)

local EffectsSection = PerformanceTab:Section("Effects", "")
local DisableParticlesToggle = EffectsSection:Toggle("Disable Particles", "Remove particles")
local DisableShadowsToggle = EffectsSection:Toggle("Disable Shadows", "Remove shadows")
local DisableTexturesToggle = EffectsSection:Toggle("Disable Textures", "Remove textures")

local AppearanceSection = PerformanceTab:Section("Appearance", "")
local ThemeDropdown = AppearanceSection:Dropdown("Theme", "Dark/Light mode", {"Dark", "Light"})
local MinimizeKeybindKeybind = AppearanceSection:Keybind("MinimizeKeybind", "Keybind to toggle UI")

print("{AGY} Axon Client initialized successfully!")
