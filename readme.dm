/*

*******************************
	Author: Tafe

	Dependencies:
		Owl_Framework - v0.1 or later
		link: http://www.byond.com/developer/Tafe/Owl_Framework
*******************************

The code might seem complex, but i will narrow it down so that it becomes understandable.

INTRODUCTION

	A mob's stats are stored in an array(/mob/stats[])
	It stores a list of datum containing attributes, which is made for stats.


	EXAMPLE:
		mob/stats["strength","agility","health"]


	Datum "attribute" is set and stone, so it's variables and procedures are not something you should worry about.
	Mob already has build in proc to handle stats[attribute] and it's functions.


ADAPT IT TO YOUR PROJECT:

	LEVELCAP ?
		if you want a level cap for every stat in your project, there is a built in definition you can execute for this matter.
		The level cap is stored in definition #LEVELCAP and is something you adjust inside main.dm
		EXAMPLE
			#define LEVELCAP 200
		it's default is set to 1000

	MORE STATS?
		Stats are handled inside mob/give_stats()
		You can add more attributes to mob/stats[] by editing the code to your fitting.




DOCUMENTATION:
http://files.byondhome.com/Tafe/Documentation/attributeClass.html

*/

