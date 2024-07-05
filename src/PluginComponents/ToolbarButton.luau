local Packages = script.Parent.Parent.Parent

local Aegis = require(Packages.aegis)
local Update = Aegis.Update

local IgnoredProps = {
	"ToolTip",
	"Name",
	"Image",
	"Toolbar",
	"Active",
    "Description",
}

type Toolbar = {
	Active: Aegis.State?,
    Description: string?,
    OnClick: () -> ()?,
	Toolbar: PluginToolbar,
	ToolTip: string,
	Image: string,
	Name: string,
	[any]: any,
}

return function(props: Toolbar)
    local PluginToolbarButton = props.Toolbar:CreateButton(
        props.Name,
        props.ToolTip,
        props.Image,
        props.Description
    )

    if props.Active ~= nil then
        PluginToolbarButton:SetActive(props.Active)
        if props.OnClick then
            PluginToolbarButton.Click:Connect(props.OnClick)
        end
    end

    for _, propName in IgnoredProps do
		props[propName] = nil
	end
	return Update(PluginToolbarButton, props)
end
