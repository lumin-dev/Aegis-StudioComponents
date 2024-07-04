-- React version by @sircfenner
-- Aegis version by @2jammers

local Packages = script.Parent.Parent.Parent.Parent
local Aegis = require(Packages.aegis)

local CommonProps = require(script.Parent.Parent.CommonProps)
local useTheme = require(script.Parent.Parent.Utilities.useTheme)

type BackgroundProps = CommonProps.T & {
	[any]: any | {any}
}

return function(props: BackgroundProps)
	local theme = useTheme:Get()
	return Aegis.new("Frame", {
		BackgroundColor3 = theme:GetColor(Enum.StudioStyleGuideColor.MainBackground),
		BorderSizePixel = 0,
		AnchorPoint = props.AnchorPoint,
		Position = props.Position,
		Size = props.Size or UDim2.fromScale(1, 1),
		LayoutOrder = props.LayoutOrder,
		ZIndex = props.ZIndex,
	}, props.Children)
end