local beautiful = require('beautiful')
local gears = require('gears')
local awful = require('awful')
local wibox = require('wibox')
local dpi = require('beautiful').xresources.apply_dpi


local slider = {}


vol_slider = wibox.widget {
	bar_shape           = gears.shape.rounded_rect,
	bar_height          = dpi(5),
	bar_color           = '#ffffff20',
	bar_active_color	= '#f2f2f2EE',
	handle_color        = '#ffffff',
	handle_shape        = gears.shape.circle,
	handle_width        = dpi(15),
	handle_border_color = '#00000012',
	handle_border_width = dpi(1),
	maximum				= 100,
	widget              = wibox.widget.slider,
}


slider.vol_slider = vol_slider


return slider

