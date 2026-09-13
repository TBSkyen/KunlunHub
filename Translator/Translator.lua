local HttpService = game:GetService("HttpService")

local Translator = {}
Translator.Language = "English"
Translator.Game = "Blockspin"
Translator.Translations = {}
-- URL for raw github files
Translator.GithubURL = "https://raw.githubusercontent.com/TBSkyen/KunlunHub/main/Translator/"

function Translator.LoadLanguage(lang)
    Translator.Language = lang
    if lang == "English" then
        Translator.Translations = {}
        return true
    end
    
    local url = Translator.GithubURL .. Translator.Game .. "/" .. lang .. ".json"
    local success, result = pcall(function()
        return game:HttpGet(url)
    end)
    
    if success and result then
        local decodeSuccess, decoded = pcall(function()
            return HttpService:JSONDecode(result)
        end)
        if decodeSuccess then
            Translator.Translations = decoded
            return true
        end
    end
    
    warn("[Translator] Failed to load language: " .. lang)
    return false
end

function Translator.Get(category, key, type)
    if Translator.Language == "English" then return nil end
    if Translator.Translations[category] and Translator.Translations[category][key] then
        return Translator.Translations[category][key][type]
    end
    return nil
end

-- Helper functions for UI
function Translator.Title(category, key, default)
    return Translator.Get(category, key, "title") or default or key
end

function Translator.Desc(category, key, default)
    return Translator.Get(category, key, "desc") or default or ""
end

return Translator

