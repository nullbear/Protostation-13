// Log types :D

#define RUNTIME 0	// Used for debugging, and finding mapping and code errors.
#define GENERIC 1	// Used for a bunch of generic stuff.
#define ACTION 2	// Used for high-risk actions and whatever. Stuff like building bombs.
#define COMBAT 3	// Used specifically for combat actions. Stuff like hitting someone with a crowbar.
#define ADMIN 4	// Used for adminbuse detection, bans, etcetera.

world
	mob = /mob/dead/observer
	turf = /turf/space
	area = /area
	view = "15x15"
	cache_lifespan = 0

world/proc/note(var/type = GENERIC, var/content = "")
	switch(type)
		if (0)
			runtime_log << "[timestamp()]: [content]"
		if (1)
			generic_log << "[timestamp()]: [content]"
		if (2)
			action_log << "[timestamp()]: [content]"
		if (3)
			combat_log << "[timestamp()]: [content]"
		if (4)
			admin_log << "[timestamp()]: [content]"

world/proc/timestamp()
	return world.timeofday
