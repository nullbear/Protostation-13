/* Structures are the new replacement for the common turf tiles.
Turfs are effectively "ground tiles that can never be removed."
Structures are effectively "tiles that cannot overlap, but can be placed and removed from individual turfs."
You should be able to build a base on the asteroid, but never destroy the asteroid itself, only the base.
Each structure type has its own layer. There can be up to one of each structure for each layer.
Most structures will completely hide objects that are below them, such as cables, and the structures below them.

*/
/obj/structure
	name = "structure"
	desc = "a strange structure."
	height = 0
	mass = 0
	aero = 0