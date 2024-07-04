-- React version by @sircfenner
-- Aegis version by @2jammers

local Packages = script.Parent.Parent.Parent.Parent
local Studio = settings().Studio

local Aegis = require(Packages.aegis)
local StudioTheme = Aegis.state(Studio.Theme)

Studio.ThemeChanged:Connect(function()
    StudioTheme:Set(Studio.Theme)
end)

return StudioTheme