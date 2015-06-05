#define CENTER 0

var/global

var/list/cardinal = list(NORTH, SOUTH, EAST, WEST)

var

	skipupdate = 0

	diary = null
	station_name = null
	game_version = "Goon Dev Station 13"

	host = null

	shuttle_z = 2	//default

	list/alldirs = list(NORTH, SOUTH, EAST, WEST, NORTHEAST, NORTHWEST, SOUTHEAST, SOUTHWEST)

	join_motd = null
	auth_motd = null
	rules = null
	no_auth_motd = null

	const/SPEED_OF_LIGHT = 3e8 //not exact but hey!
	const/SPEED_OF_LIGHT_SQ = 9e+16
	const/FIRE_DAMAGE_MODIFIER = 0.0215 //Higher values result in more external fire damage to the skin (default 0.0215)
	const/AIR_DAMAGE_MODIFIER = 2.025 //More means less damage from hot air scalding lungs, less = more damage. (default 2.025)
	const/INFINITY = 1e31 //closer then enough

	//Don't set this very much higher then 1024 unless you like inviting people in to dos your server with message spam
	const/MAX_MESSAGE_LEN = 1024

	const/shuttle_time_in_station = 1800 // 3 minutes in the station
	const/shuttle_time_to_arrive = 6000 // 10 minutes to arrive
