local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi

local tags = {
	{
		text_icon = '',
		type = 'terminal',
		screen = 1
	},
	{
		type = 'browsing',
		text_icon ='',
		screen = 1
	},
	{
		type = 'development',
		text_icon  = '',
		screen = 1
	},
	{
		type = 'files',
		text_icon  = '',
		screen = 1
	},
	{
		type = 'writing',
		text_icon  = '',
		screen = 1
	},
	{
		type = 'media',
		text_icon  ='',
		screen = 1
	},
	{
		type = 'art',
		text_icon  ='',
		screen = 1
	},
}


tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
		awful.layout.suit.floating,
		awful.layout.suit.tile,
		awful.layout.suit.max,
    })
end)


screen.connect_signal("request::desktop_decoration", function(s)
	for i, tag in pairs(tags) do
		awful.tag.add(
			tag.text_icon,
			{
				icon_only = false,
				layout = awful.layout.suit.tile,
				gap_single_client = false,
				gap = beautiful.useless_gap,
				screen = s,
				default_app = tag.default_app,
				selected = i == 1
			}
		)
	end
end)


tag.connect_signal(
	'property::layout',
	function(t)
		local currentLayout = awful.tag.getproperty(t, 'layout')
		if (currentLayout == awful.layout.suit.max.fullscreen) then
			t.screen.top_panel.visible = false
		else
			t.screen.top_panel.visible = true
		end
		if (currentLayout == awful.layout.suit.max) then
			t.gap = 0
		else
			t.gap = beautiful.useless_gap
		end
	end
)
