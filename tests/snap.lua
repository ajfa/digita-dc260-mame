-- Take one snapshot at SNAP_AT emulated seconds, then quit.
local at = tonumber(os.getenv("SNAP_AT") or "60")
local done = false
emu.register_periodic(function()
	if not done and manager.machine.time:as_double() >= at then
		done = true
		manager.machine.video:snapshot()
		manager.machine:exit()
	end
end)
