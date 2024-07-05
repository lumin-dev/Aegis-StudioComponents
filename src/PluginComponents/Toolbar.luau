local Plugin = script:FindFirstAncestorWhichIsA("Plugin")
local Packages = script.Parent.Parent.Parent

local Aegis = require(Packages.aegis)
local Update = Aegis.Update

local IgnoredProps = {
	"Name",
}

type Toolbar = {
	Name: string,
	[any]: any,
}

return function(props: Toolbar): PluginToolbar
	local PluginToolbar = Plugin:CreateToolbar(props.Name)
	for _, propName in IgnoredProps do
		props[propName] = nil
	end
	return Update(PluginToolbar, props)
end
