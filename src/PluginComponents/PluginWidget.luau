local Plugin = script:FindFirstAncestorWhichIsA("Plugin")
local Packages = script.Parent.Parent.Parent

local Aegis = require(Packages.aegis)
local Update = Aegis.Update

local IgnoredProps = {
	"Enabled",
	"Id",
	"Name",
	"InitialDockState",
	"ForceEnabled",
	"ForceEnabledNextRestart",
	"FloatingSize",
	"MinimumSize",
}

type PluginWidget = {
	Enabled: Aegis.State?,
	Id: string,
	Name: string,
	InitialDockState: Enum.InitialDockState,
	ForceEnabled: boolean,
	ForceEnabledNextRestart: boolean,
	FloatingSize: Vector2,
	MinimumSize: Vector2,
}

return function(props: PluginWidget)
	local PluginWidget = Plugin:CreateDockWidgetPluginGui(
		props.Id,
		DockWidgetPluginGuiInfo.new(
			props.InitialDockState,
			props.ForceEnabled,
			props.ForceEnabledNextRestart,
			props.FloatingSize.X,
			props.FloatingSize.Y,
			props.MinimumSize.X,
			props.MinimumSize.Y
		)
	)

	PluginWidget.Title = props.Name

	if props.Enabled ~= nil then
		props.Enabled:Set(PluginWidget.Enabled)
		PluginWidget.Enabled = props.Enabled
	end

	for _, propName in IgnoredProps do
		props[propName] = nil
	end

	return Update(PluginWidget, props)
end
