function getName()
	return "SEcond Ice 02"
end

function onMapLoaded()
end

function initMap()
	-- get the current map context
	local map = Map.get()
	map:addTile("tile-background-ice-03", 0, 0)
	map:addTile("tile-background-ice-03", 0, 1)
	map:addTile("tile-background-ice-02", 0, 2)
	map:addTile("tile-background-ice-big-01", 0, 3)
	map:addTile("tile-background-ice-04", 0, 5)
	map:addTile("tile-background-ice-05", 0, 6)
	map:addTile("tile-background-ice-05", 0, 7)
	map:addTile("tile-rock-slope-ice-right-01", 0, 8)
	map:addTile("tile-rock-ice-03", 0, 9)
	map:addTile("tile-rock-ice-big-01", 0, 10)
	map:addTile("tile-background-ice-04", 1, 0)
	map:addTile("tile-background-ice-07", 1, 1)
	map:addTile("tile-background-ice-03", 1, 2)
	map:addTile("tile-background-ice-07", 1, 5)
	map:addTile("tile-background-ice-07", 1, 6)
	map:addTile("tile-background-ice-01", 1, 7)
	map:addTile("tile-background-ice-04", 1, 8)
	map:addTile("tile-rock-slope-ice-right-01", 1, 9)
	map:addTile("tile-background-ice-03", 2, 0)
	map:addTile("tile-background-ice-big-01", 2, 1)
	map:addTile("tile-background-ice-04", 2, 3)
	map:addTile("tile-background-ice-01", 2, 4)
	map:addTile("tile-background-ice-07", 2, 5)
	map:addTile("tile-background-ice-01", 2, 6)
	map:addTile("tile-background-ice-01", 2, 7)
	map:addTile("tile-background-ice-02", 2, 8)
	map:addTile("tile-background-ice-04", 2, 9)
	map:addTile("tile-packagetarget-ice-01-idle", 2, 10)
	map:addTile("tile-rock-ice-03", 2, 11)
	map:addTile("tile-background-ice-04", 3, 0)
	map:addTile("tile-background-ice-02", 3, 3)
	map:addTile("tile-background-ice-01", 3, 4)
	map:addTile("tile-background-ice-03", 3, 5)
	map:addTile("tile-background-ice-07", 3, 6)
	map:addTile("tile-ground-ice-03", 3, 7)
	map:addTile("tile-rock-ice-big-01", 3, 8)
	map:addTile("tile-rock-ice-big-01", 3, 10)
	map:addTile("tile-background-ice-cave-art-01", 4, 0)
	map:addTile("tile-background-ice-03", 4, 1)
	map:addTile("tile-background-ice-05", 4, 2)
	map:addTile("tile-background-ice-02", 4, 3)
	map:addTile("tile-background-ice-cave-art-01", 4, 4)
	map:addTile("tile-background-ice-07", 4, 5)
	map:addTile("tile-ground-ice-04", 4, 7)
	map:addTile("tile-background-ice-04", 5, 0)
	map:addTile("tile-background-ice-03", 5, 1)
	map:addTile("tile-background-ice-03", 5, 2)
	map:addTile("tile-ground-ledge-ice-left-02", 5, 3)
	map:addTile("tile-background-ice-05", 5, 4)
	map:addTile("tile-background-ice-05", 5, 5)
	map:addTile("tile-background-ice-window-02", 5, 6)
	map:addTile("tile-ground-ice-02", 5, 7)
	map:addTile("tile-rock-ice-02", 5, 8)
	map:addTile("tile-rock-ice-01", 5, 9)
	map:addTile("tile-rock-ice-02", 5, 10)
	map:addTile("tile-rock-ice-02", 5, 11)
	map:addTile("tile-background-ice-01", 6, 0)
	map:addTile("tile-background-ice-05", 6, 1)
	map:addTile("tile-background-ice-03", 6, 2)
	map:addTile("tile-ground-ice-02", 6, 3)
	map:addTile("tile-rock-ice-03", 6, 4)
	map:addTile("tile-rock-slope-ice-left-02", 6, 5)
	map:addTile("tile-background-ice-cave-art-01", 6, 6)
	map:addTile("tile-ground-ice-02", 6, 7)
	map:addTile("tile-rock-ice-01", 6, 8)
	map:addTile("tile-rock-ice-03", 6, 9)
	map:addTile("tile-rock-ice-01", 6, 10)
	map:addTile("tile-rock-ice-01", 6, 11)
	map:addTile("tile-background-ice-06", 7, 0)
	map:addTile("tile-background-ice-big-01", 7, 1)
	map:addTile("tile-ground-ice-01", 7, 3)
	map:addTile("tile-rock-ice-01", 7, 4)
	map:addTile("tile-rock-ice-02", 7, 5)
	map:addTile("tile-rock-ice-big-01", 7, 6)
	map:addTile("tile-rock-ice-03", 7, 8)
	map:addTile("tile-rock-ice-01", 7, 9)
	map:addTile("tile-rock-ice-03", 7, 10)
	map:addTile("tile-rock-ice-03", 7, 11)
	map:addTile("tile-background-ice-07", 8, 0)
	map:addTile("tile-ground-ice-02", 8, 3)
	map:addTile("tile-rock-ice-02", 8, 4)
	map:addTile("tile-rock-ice-01", 8, 5)
	map:addTile("tile-rock-ice-03", 8, 8)
	map:addTile("tile-rock-ice-big-01", 8, 9)
	map:addTile("tile-rock-ice-01", 8, 11)
	map:addTile("tile-background-ice-04", 9, 0)
	map:addTile("tile-background-ice-big-01", 9, 1)
	map:addTile("tile-background-ice-06", 9, 3)
	map:addTile("tile-background-ice-04", 9, 4)
	map:addTile("tile-background-ice-05", 9, 5)
	map:addTile("tile-background-ice-cave-art-01", 9, 6)
	map:addTile("tile-background-ice-05", 9, 7)
	map:addTile("tile-ground-ice-04", 9, 8)
	map:addTile("tile-rock-ice-01", 9, 11)
	map:addTile("tile-background-ice-04", 10, 0)
	map:addTile("tile-background-ice-big-01", 10, 3)
	map:addTile("tile-background-ice-04", 10, 5)
	map:addTile("tile-background-ice-cave-art-01", 10, 6)
	map:addTile("tile-background-ice-window-01", 10, 7)
	map:addTile("tile-ground-ice-04", 10, 8)
	map:addTile("tile-rock-ice-01", 10, 9)
	map:addTile("tile-rock-ice-01", 10, 10)
	map:addTile("tile-rock-ice-03", 10, 11)
	map:addTile("tile-background-ice-big-01", 11, 0)
	map:addTile("tile-background-ice-01", 11, 2)
	map:addTile("tile-background-ice-cave-art-01", 11, 5)
	map:addTile("tile-background-ice-03", 11, 6)
	map:addTile("tile-ground-ice-02", 11, 8)
	map:addTile("tile-rock-ice-01", 11, 9)
	map:addTile("tile-rock-ice-big-01", 11, 10)
	map:addTile("tile-background-ice-cave-art-01", 12, 2)
	map:addTile("tile-background-ice-05", 12, 3)
	map:addTile("tile-background-ice-01", 12, 4)
	map:addTile("tile-background-ice-03", 12, 5)
	map:addTile("tile-background-ice-cave-art-01", 12, 6)
	map:addTile("tile-background-ice-05", 12, 7)
	map:addTile("tile-ground-ice-02", 12, 8)
	map:addTile("tile-rock-ice-01", 12, 9)
	map:addTile("tile-rock-slope-ice-left-02", 13, 0)
	map:addTile("tile-background-ice-03", 13, 1)
	map:addTile("tile-background-ice-02", 13, 2)
	map:addTile("tile-background-ice-01", 13, 3)
	map:addTile("tile-background-ice-big-01", 13, 4)
	map:addTile("tile-background-ice-01", 13, 6)
	map:addTile("tile-background-ice-05", 13, 7)
	map:addTile("tile-rock-ice-02", 13, 8)
	map:addTile("tile-rock-ice-02", 13, 9)
	map:addTile("tile-rock-ice-01", 13, 10)
	map:addTile("tile-rock-slope-ice-right-02", 13, 11)
	map:addTile("tile-rock-ice-01", 14, 0)
	map:addTile("tile-rock-slope-ice-left-02", 14, 1)
	map:addTile("tile-background-ice-03", 14, 2)
	map:addTile("tile-background-ice-02", 14, 3)
	map:addTile("tile-background-ice-04", 14, 6)
	map:addTile("tile-background-ice-05", 14, 7)
	map:addTile("tile-ground-ice-02", 14, 8)
	map:addTile("tile-rock-ice-01", 14, 9)
	map:addTile("tile-rock-ice-big-01", 14, 10)
	map:addTile("tile-rock-ice-02", 15, 0)
	map:addTile("tile-rock-ice-01", 15, 1)
	map:addTile("tile-rock-slope-ice-left-02", 15, 2)
	map:addTile("tile-background-ice-06", 15, 3)
	map:addTile("tile-background-ice-01", 15, 4)
	map:addTile("tile-background-ice-04", 15, 5)
	map:addTile("tile-background-ice-06", 15, 6)
	map:addTile("tile-background-ice-02", 15, 7)
	map:addTile("tile-ground-ice-04", 15, 8)
	map:addTile("tile-rock-ice-03", 15, 9)

	map:addCave("tile-cave-ice-01", 4, 6, "none", 1000)
	map:addCave("tile-cave-ice-02", 11, 7, "none", 1000)

	map:addEmitter("item-package-ice", 2.1, 1, 1, 0, "")
	map:addEmitter("item-stone", 6.5, 2, 1, 0, "")
	map:addEmitter("tree", 13, 6, 1, 0, "")
	map:addEmitter("npc-walking", 14, 7, 1, 0, "right=false")

	map:setSetting("width", "16")
	map:setSetting("height", "12")
	map:setSetting("fishnpc", "false")
	map:setSetting("flyingnpc", "false")
	map:setSetting("gravity", "9.81")
	map:setSetting("packagetransfercount", "3")
	map:addStartPosition("2", "0")
	map:setSetting("points", "100")
	map:setSetting("referencetime", "30")
	map:setSetting("theme", "ice")
	map:setSetting("waterchangespeed", "0.2")
	map:setSetting("waterfallingdelay", "10000")
	map:setSetting("waterheight", "1.6")
	map:setSetting("waterrisingdelay", "0")
	map:setSetting("wind", "0.0")
end
