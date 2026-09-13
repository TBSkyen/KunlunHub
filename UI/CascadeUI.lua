--!nolint
--!nocheck
-- ===================================================================
-- [AGY] KunlunHub Framework - Cascade UI Wrapper
-- ===================================================================

local cascade = loadstring(game:HttpGet("https://raw.githubusercontent.com/cascadeui/Cascade/refs/heads/main/dist.luau"))()
local Translator = loadstring(game:HttpGet("https://raw.githubusercontent.com/TBSkyen/KunlunHub/main/Translator/Translator.lua"))()

local Wrapper = {}
Wrapper.App = nil

function Wrapper.Init(language)
    Translator.LoadLanguage(language or "English")
    Wrapper.App = cascade.New({
        Theme = cascade.Themes.Dark,
        Accent = cascade.Accents.Purple,
    })
    return Wrapper
end

local function T(category, key, defaultDesc)
    return Translator.Title(category, key, key), Translator.Desc(category, key, defaultDesc or "")
end

function Wrapper.Window(title, subtitle)
    local win = Wrapper.App:Window({
        Title = title,
        Subtitle = subtitle,
        Size = UDim2.fromOffset(680, 520),
    })
    
    local WindowObj = { _win = win }
    
    function WindowObj:TabGroup(groupName)
        local grp = win:Section({ Title = groupName })
        local GroupObj = { _grp = grp }
        
        function GroupObj:Tab(category, tabName, iconName, selected)
            local t = grp:Tab({
                Title = Translator.Title("tabs", tabName, tabName),
                Icon = cascade.Symbols[iconName] or cascade.Symbols.box,
                Selected = selected or false
            })
            local TabObj = { _tab = t, _cat = category:lower() }
            
            function TabObj:Section(sectionKey, subtitle)
                local form = t:Form()
                local row = form:Row()
                local titleStr, descStr = T(self._cat, sectionKey, subtitle)
                row:Left():TitleStack({ Title = titleStr, Subtitle = descStr })
                
                local SectionObj = { _form = form, _cat = self._cat }
                
                function SectionObj:Toggle(key, defaultSubtitle)
                    local r = self._form:Row()
                    local tStr, dStr = T(self._cat, key, defaultSubtitle)
                    r:Left():TitleStack({ Title = tStr, Subtitle = dStr })
                    return r:Right():Toggle()
                end
                
                function SectionObj:Button(key, defaultSubtitle)
                    local r = self._form:Row()
                    local tStr, dStr = T(self._cat, key, defaultSubtitle)
                    r:Left():TitleStack({ Title = tStr, Subtitle = dStr })
                    return r:Right():Button({ Title = Translator.Title(self._cat, key .. "_Btn", key) })
                end
                
                function SectionObj:Dropdown(key, defaultSubtitle, options)
                    local r = self._form:Row()
                    local tStr, dStr = T(self._cat, key, defaultSubtitle)
                    r:Left():TitleStack({ Title = tStr, Subtitle = dStr })
                    return r:Right():PopUpButton({ Options = options })
                end
                
                function SectionObj:Slider(key, defaultSubtitle, min, max, step)
                    local r = self._form:Row()
                    local tStr, dStr = T(self._cat, key, defaultSubtitle)
                    r:Left():TitleStack({ Title = tStr, Subtitle = dStr })
                    return r:Right():Slider({ Min = min, Max = max, Step = step })
                end
                
                function SectionObj:Stepper(key, defaultSubtitle, min, max, step)
                    local r = self._form:Row()
                    local tStr, dStr = T(self._cat, key, defaultSubtitle)
                    r:Left():TitleStack({ Title = tStr, Subtitle = dStr })
                    return r:Right():Stepper({ Min = min, Max = max, Step = step })
                end

                function SectionObj:TextField(key, defaultSubtitle)
                    local r = self._form:Row()
                    local tStr, dStr = T(self._cat, key, defaultSubtitle)
                    r:Left():TitleStack({ Title = tStr, Subtitle = dStr })
                    return r:Right():TextField({ Placeholder = Translator.Title(self._cat, key .. "_Holder", key) })
                end
                
                function SectionObj:Keybind(key, defaultSubtitle)
                    local r = self._form:Row()
                    local tStr, dStr = T(self._cat, key, defaultSubtitle)
                    r:Left():TitleStack({ Title = tStr, Subtitle = dStr })
                    return r:Right():KeybindField()
                end
                
                return SectionObj
            end
            
            return TabObj
        end
        return GroupObj
    end
    
    return WindowObj
end

return Wrapper
