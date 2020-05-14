local awful = require('awful')
local gears = require('gears')

require('awful.autofocus')

local modkey = require('configuration.keys.mod').modKey
local altkey = require('configuration.keys.mod').altKey
local shiftkey = require('configuration.keys.mod').shiftKey
local altkey = require('configuration.keys.mod').altKey

local dpi = require('beautiful').xresources.apply_dpi

local clientKeys =
	awful.util.table.join(
	
	-- toggle fullscreen
	awful.key(
		{modkey},
		'f',
		function(c)
			-- Toggle fullscreen
			c.fullscreen = not c.fullscreen
			c:raise()
		end,
		{description = 'toggle fullscreen', group = 'client'}
	),

	-- close client
	awful.key(
		{modkey, shiftkey},
		'q',
		function(c)
			c:kill()
		end,
		{description = 'close', group = 'client'}
	),
	-- Default client focus
	awful.key({ modkey }, "a",
        function()
            awful.client.focus.bydirection("left")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus left", group = "client"}),
    awful.key({ modkey }, "d",
        function()
            awful.client.focus.bydirection("right")
            if client.focus then client.focus:raise() end
        end,
		{description = "focus right", group = "client"}),
	awful.key({ modkey }, "s",
        function()
            awful.client.focus.bydirection("down")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus down", group = "client"}),
    awful.key({ modkey }, "w",
        function()
            awful.client.focus.bydirection("up")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus up", group = "client"}),
	awful.key(
		{ modkey, "Shift"  },
		"d",
		function ()
			awful.client.swap.byidx(1)
		end,
		{description = "swap with next client by index", group = "client"}
	),
	awful.key(
		{ modkey, "Shift" },
		"a",
		function ()
			awful.client.swap.byidx(-1)
		end,
		{description = "swap with next client by index", group = "client"}
	),

	awful.key(
		{modkey}, 
		'u', 
		awful.client.urgent.jumpto, 
		{description = 'jump to urgent client', group = 'client'}
	),
    awful.key(
        {modkey},
        'n',
        function(c)
            c.minimized = true
        end,
        {description = "minimize client", group = 'client'}
    ),
	-- move floating client to center
	awful.key(
		{ modkey, "Shift" }, 
		"c", 
		function(c)
			local focused = awful.screen.focused()

			awful.placement.centered(c, {
				honor_workarea = true
			})
		end,
		{description = 'align a client to the center of the focused screen.', group = "client"}
	),

    	awful.key(
       		 {modkey}, 
       		 'm',
       		 function(c)
			c.screen.top_panel.visibility = not c.fullscreen
			c.maximized = not c.maximized
       		 end,
       		 {description = "Maximize the client", group = 'client'}
   	 ),
	-- toggle client floating mode
	awful.key(
		{modkey},
		'c',
		function(c)
			c.fullscreen = false
			c.maximized = false
			c.floating = not c.floating
			c:raise()
		end,
		{description = 'toggle floating', group = 'client'}
	),

	awful.key(
		{modkey},
		'p',
		function(c)
			if c.pinned then
				c.floating = false
				c.sticky = false
				c.ontop = false
				c.pinned = false
			else
				c.floating = true
				c.sticky = true
				c.ontop = true
				c.pinned = true
			end
		end,
		{description = 'toggle floating', group = 'client'}
	),
	-- move client position
	awful.key(
		{modkey},
		'Up',
		function(c)
			if c.floating then
				c:relative_move(0, dpi(-10), 0, 0)
			end
		end,
		{description = 'move floating client up by 10 px', group = 'client'}
	),
	awful.key(
		{modkey},
		'Down',
		function(c)
			if c.floating then
				c:relative_move(0, dpi(10), 0, 0)
			end
		end,
		{description = 'move floating client down by 10 px', group = 'client'}
	),
	awful.key(
		{modkey},
		'Left',
		function(c)
			if c.floating then
				c:relative_move(dpi(-10), 0, 0, 0)
			end
		end,
		{description = 'move floating client to the left by 10 px', group = 'client'}
	),
	awful.key(
		{modkey},
		'Right',
		function(c)
			if c.floating then
				c:relative_move(dpi(10), 0, 0, 0)
			end
		end,
		{description = 'move floating client to the right by 10 px', group = 'client'}
	),

	-- Increasing floating client size
	awful.key({ modkey, shiftkey   }, "Down",   function (c) c:relative_move(  0,  20,   0,   0) end),
    	awful.key({ modkey, shiftkey   }, "Up",     function (c) c:relative_move(  0, -20,   0,   0) end),
    	awful.key({ modkey, shiftkey   }, "Left",   function (c) c:relative_move(-20,   0,   0,   0) end),
    	awful.key({ modkey, shiftkey   }, "Right",  function (c) c:relative_move( 20,   0,   0,   0) end),
	-- Decreasing floating client size
	awful.key(
		{modkey, 'Control'},
		'Up',
		function(c)
			if c.floating and c.height > 10 then
				c:relative_move(0, 0, 0, dpi(-10))
			end
		end,
		{description = 'decrease floating client size vertically by 10 px up', group = 'client'}
	),
	awful.key(
		{modkey, 'Control'},
		'Down',
		function(c)
			 if c.floating and c.height > 10 then
                                c:relative_move(0, 0, 0, dpi(10))
                         end
		end,
		{description = 'decrease floating client size vertically by 10 px down', group = 'client'}
	),
	awful.key(
		{modkey, 'Control'},
		'Left',
		function(c)
			local current_layout = awful.layout.getname(awful.layout.get(awful.screen.focused()))
        		-- Floating: resize client
        		if current_layout == "floating" or c.floating == true then
          			c:relative_move(  0,  0, dpi(-10), 0)
        		else
          			awful.tag.incmwfact(-0.03)
        		end
		end,
		{description = 'decrease floating client size horizontally by 10 px left', group = 'client'}
	),
	awful.key(
		{modkey, 'Control'},
		'Right',
		function(c)
			local current_layout = awful.layout.getname(awful.layout.get(awful.screen.focused()))
        		-- Floating: resize client
        		if current_layout == "floating" or c.floating == true then
          			c:relative_move(  0,  0,  dpi(10), 0)
        		else
          			awful.tag.incmwfact( 0.03)
        		end
		end,
		{description = 'decrease floating client size horizontally by 10 px right', group = 'client'}
	)
)

return clientKeys
