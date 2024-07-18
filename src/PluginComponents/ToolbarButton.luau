local Packages = script.Parent.Parent.Parent

local Aegis = require(Packages.aegis)

type Toolbar = {
	Active: Aegis.State?,
	ClickableWhenViewportHidden: boolean?,
	Description: string?,
	OnClick: () -> ()?,
	Toolbar: PluginToolbar,
	ToolTip: string,
	Image: string,
	Name: string,
}

return function(props: Toolbar): PluginToolbarButton
	local PluginToolbarButton = props.Toolbar:CreateButton(props.Name, props.ToolTip, props.Image, props.Description)

	if props.Active ~= nil then
		PluginToolbarButton:SetActive(props.Active)
		if props.OnClick then
			PluginToolbarButton.Click:Connect(props.OnClick)
		end
	end

	PluginToolbarButton.ClickableWhenViewportHidden =
		if props.ClickableWhenViewportHidden ~= nil then
			props.ClickableWhenViewportHidden
		else
			false

	return PluginToolbarButton
end
