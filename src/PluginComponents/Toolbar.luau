local Plugin = script:FindFirstAncestorWhichIsA("Plugin")

type Toolbar = {
	Name: string,
}

return function(props: Toolbar): PluginToolbar
	return Plugin:CreateToolbar(props.Name)
end
