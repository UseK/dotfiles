hs.window.animationDuration = 0
units = {
  right30       = { x = 0.70, y = 0.00, w = 0.30, h = 1.00 },
  right50       = { x = 0.50, y = 0.00, w = 0.50, h = 1.00 },
  right70       = { x = 0.30, y = 0.00, w = 0.70, h = 1.00 },
  left70        = { x = 0.00, y = 0.00, w = 0.70, h = 1.00 },
  left50        = { x = 0.00, y = 0.00, w = 0.50, h = 1.00 },
  left30        = { x = 0.00, y = 0.00, w = 0.30, h = 1.00 },
  top50         = { x = 0.00, y = 0.00, w = 1.00, h = 0.50 },
  bot50         = { x = 0.00, y = 0.50, w = 1.00, h = 0.50 },
  bottomright   = { x = 0.50, y = 0.50, w = 0.50, h = 0.50 },
  topright      = { x = 0.50, y = 0.00, w = 0.50, h = 0.50 },
  bottomleft    = { x = 0.00, y = 0.50, w = 0.50, h = 0.50 },
  topleft       = { x = 0.00, y = 0.00, w = 0.50, h = 0.50 },
  maximum       = { x = 0.00, y = 0.00, w = 1.00, h = 1.00 },
  centered      = { x = 0.25, y = 0.00, w = 0.50, h = 1.00 }
}

--mash = { 'shift', 'alt', 'cmd' }
mash = { 'alt' }

hs.hotkey.bind(mash, 'right', function() hs.window.focusedWindow():move(units.right50,    nil, true) end)
hs.hotkey.bind(mash, 'left', function() hs.window.focusedWindow():move(units.left50,     nil, true) end)
-- hs.hotkey.bind(mash, 'up', function() hs.window.focusedWindow():move(units.top50,      nil, true) end)
-- hs.hotkey.bind(mash, 'down', function() hs.window.focusedWindow():move(units.bot50,      nil, true) end)

-- hs.hotkey.bind(mash, '1', function() hs.window.focusedWindow():move(units.topleft,    nil, true) end)
-- hs.hotkey.bind(mash, '2', function() hs.window.focusedWindow():move(units.topright,     nil, true) end)
-- hs.hotkey.bind(mash, '3', function() hs.window.focusedWindow():move(units.bottomleft,      nil, true) end)
-- hs.hotkey.bind(mash, '4', function() hs.window.focusedWindow():move(units.bottomright,      nil, true) end)

hs.hotkey.bind(mash, 'c', function() hs.window.focusedWindow():move(units.centered,      nil, true) end)
-- window sometimes do NOT move miximu with move method, miximize method is perfect!!
-- hs.hotkey.bind(mash, 'up', function() hs.window.focusedWindow():move(units.maximum,    nil, true) end)
hs.hotkey.bind(mash, 'up', function() hs.window.focusedWindow():maximize(nil) end)
