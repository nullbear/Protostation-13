/obj/structure/lattice
	name = "lattice"
	desc = "a structural support lattice for building infrastructures in open space."

	layer = 0.1 // Above space and turfs, but underneath of everything else.

	alt_light = 0
	alt_atoms = 0
	alt_sound = 0

	var/obj/structure/overfloor

///////////////////////////////////////////////////////////////////////////////////////////

/obj/structure/lattice/New()
	..()

	update_icon()

	for (var/dir in cardinal)
		var/obj/structure/lattice/L
		if(locate(/obj/structure/lattice, get_step(src, dir)))
			L = locate(/obj/structure/lattice, get_step(src, dir))
			L.update_icon()

///////////////////////////////////////////////////////////////////////////////////////////

/obj/structure/lattice/update_icon()
	..()

	var/dir_sum = 0
	for (var/direction in cardinal)
		if(locate(/obj/structure/lattice, get_step(src, direction)))
			dir_sum += direction
		else
			if(!(istype(get_step(src, direction), /turf/space)))
				dir_sum += direction

	icon_state = "[name][dir_sum]"
	return .

///////////////////////////////////////////////////////////////////////////////////////////

/obj/structure/lattice/attackby(obj/item/I as obj, mob/user as mob)
	if (istype(I, /obj/item/sheet))
		make_plating(I, user)
		return 0
	if (istype(I, /obj/item/rod))
		make_catwalk(I, user)
		return 0
	if (istype(I, /obj/item/welder))
		cut_lattice(I, user)
		return 0

///////////////////////////////////////////////////////////////////////////////////////////

/obj/structure/lattice/proc/make_plating(var/obj/item/sheet/S, var/mob/user)
	for (var/obj/structure/T in loc)
		if (T.anchor == src)
			user << "There is already something anchored here."
			return 0
	if (user.able_to(TOUCHABLE|USEABLE|THINKABLE))
		new /obj/structure/plating(loc, S.material, src)
		S.use()
		return 1
	return 0

///////////////////////////////////////////////////////////////////////////////////////////

/obj/structure/lattice/proc/make_catwalk(var/obj/item/rod/R, var/mob/user)
	for (var/obj/structure/T in loc)
		if (T.anchor == src)
			user << "There is already something anchored here."
			return 0
	if (user.able_to(TOUCHABLE|USEABLE|THINKABLE))
		new /obj/structure/catwalk(loc, R.material, src)
		R.use()
		return 1
	return 0

///////////////////////////////////////////////////////////////////////////////////////////

/obj/structure/lattice/proc/cut_lattice(var/obj/item/welder/W, var/mob/user)
	for (var/obj/structure/T in loc)
		if (T.anchor == src)
			user << "There is a structure anchored here. Report this to the bugtracker."
			return 0
	if (user.able_to(TOUCHABLE|USEABLE|THINKABLE) && W.weld(2))
		new /obj/item/rod(loc, material)
		Destroy()
		return 1
	return 0

///////////////////////////////////////////////////////////////////////////////////////////

