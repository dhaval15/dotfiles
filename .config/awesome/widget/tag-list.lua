local awful = require('awful')
local wibox = require('wibox')
local modkey = require('configuration.keys.mod').modKey
local gears = require('gears')

local taglist_buttons = 	awful.util.table.join(
			awful.button(
				{},
				1,
				function(t)
					t:view_only()
				end
			),
			awful.button(
				{modkey},
				1,
				function(t)
					if _G.client.focus then
						_G.client.focus:move_to_tag(t)
						t:view_only()
					end
				end
			),
			awful.button({}, 3, awful.tag.viewtoggle),
			awful.button(
				{modkey},
				3,
				function(t)
					if _G.client.focus then
						_G.client.focus:toggle_tag(t)
					end
				end
			),
			awful.button(
				{},
				4,
				function(t)
					awful.tag.viewprev(t.screen)
				end
			),
			awful.button(
				{},
				5,
				function(t)
					awful.tag.viewnext(t.screen)
				end
			)
		)


local mytaglist = function(s) 
	return awful.widget.taglist {
                screen  = s,
                filter  = awful.widget.taglist.filter.all,
                style   = {
                },
                layout   = {
                    layout  = wibox.layout.fixed.horizontal
                },
                widget_template = {
                    {
                        {
                            {
                                id     = 'text_role',
                                widget = wibox.widget.textbox,
                            },
                            layout = wibox.layout.fixed.horizontal,
                        },
                        margins=8,
                        widget = wibox.container.margin
                    },
                    id     = 'background_role',
                    widget = wibox.container.background,
                    -- Add support for hover colors and an index label
                    create_callback = function(self, c3, index, objects) --luacheck: no unused args
                        -- self:get_children_by_id('index_role')[1].markup = '<b> '..index..' </b>'
                    end,
                    update_callback = function(self, c3, index, objects) --luacheck: no unused args
                        -- self:get_children_by_id('index_role')[1].markup = '<b> '..index..' </b>'
                    end,
                },
                buttons = taglist_buttons
        }
	end
return mytaglist
