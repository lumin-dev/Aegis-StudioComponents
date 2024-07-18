local PluginComponents = script.PluginComponents
local StudioComponents

return {
    PluginComponents = {
        PluginWidget = require(PluginComponents.PluginWidget),
        Toolbar = require(PluginComponents.Toolbar),
        ToolbarButton = require(PluginComponents.ToolbarButton)
    },
    StudioComponents = {},
}