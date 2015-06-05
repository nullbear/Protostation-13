/obj/structure/plating
	name = "plating"
	desc = "a basic floor and infrastructure for building on top of."

	layer = 0.2	// Above lattice, but still very very low in the whole layers thing.

	alt_light = 0	// Does not affect light in any way.
	alt_atoms = 1	// Will stop air from flowing into space.
	alt_sound = 0	// May eventually have an effect on sound in the future, but for now, it doesnt.

///////////////////////////////////////////////////////////////////////////////////////////

/obj/structure/plating/New(var/loc, var/datum/material/mat, var/anchorage = null)
	..()

	if (anchorage)
		anchor = anchorage
	else
		for (var/obj/structure/lattice/potential_anchor in loc)
			if (!potential_anchor.overfloor)
				anchor = potential_anchor
				potential_anchor.overfloor = src
				return

		if (istype(loc, /turf/solid))
			var/turf/T = loc
			if (!T.overfloor)
				anchor = loc
				T.overfloor = src
				return
		world.note(RUNTIME, "There's nowhere to anchor [src] at [loc]: [x], [y], [z].")

///////////////////////////////////////////////////////////////////////////////////////////

