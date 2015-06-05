/obj/item
	name = "item"
	icon = 'icons/obj/items.dmi'
	var/item_state = null
	var/lefthand_file
	var/righthand_file
	var/hitsound = null
	var/throwhitsound = null

	alt_atoms = 1	// Items cannot be thrown through walls.

	var/size = 3				// Replaces W_Class. Makes more sense to just say size now that we have mass.
	var/list/damtype = new/list("brute" = 1, "edge" = 0, "sharp" = 0)	// A complexified damtype variable. A multiplier for certain damages.

	var/obj/item/master = null

	var/list/attack_verb = list() 	//Used in attackby() to say how something was attacked "[x] has been [z.attack_verb] by [y] with [z]"

/obj/item/proc/suicide_act(mob/user)
	return

/obj/item/examine(mob/user) //This might be spammy. Remove?
	..()
	var/dsize
	switch(src.size)
		if(1.0)
			dsize = "tiny"
		if(2.0)
			dsize = "small"
		if(3.0)
			dsize = "normal-sized"
		if(4.0)
			dsize = "bulky"
		if(5.0)
			dsize = "huge"
		if(6.0)
			dsize = "gigantic"
		else

	var/pronoun
	if(src.gender == PLURAL)
		pronoun = "They are"
	else
		pronoun = "It is"

	user << "[pronoun] a [dsize] item." //e.g. They are a small item. or It is a bulky item.