// A bunch of flags for the ABLE_TO procedure.

#define TOUCHABLE 1	// Whether the mob is able to manipulate objects physically. Used for pushing buttons and pulling stuff.
#define USEABLE 2		// Whether the mob is able to manipulate objects with dexterity. Used for building and deconstructing stuff.
#define THINKABLE 4	// Whether the mob is intelligent enough to think logically. Used for using avanced objects, tools, and machines.
#define SEEABLE 8		// Whether the mob is able to see or sense objects optically. Used for using digital interfaces and reading statistics.


/mob
	name = "mob"

	var/ability = 0	// This is a calculation of what a character is able to do. It uses ABLE_TO flags.

///////////////////////////////////////////////////////////////////////////////////

/mob/proc/able_to(var/need = 0) // This proc returns true if the mob in question is able to do something or not. Replaces handcuffs and species checks for stuff.
	return 0