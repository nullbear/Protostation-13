var/global/datum/controller/game_controller/master_controller //Set in world.New()

datum/controller/game_controller
	var/processing = 1

	proc
		setup()

	setup()
		if(master_controller && (master_controller != src))
			del(src)
			//There can be only one master.