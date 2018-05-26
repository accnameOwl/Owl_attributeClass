

#ifndef OWL_ATTRIBUTECLASS
	#define OWL_ATTRIBUTECLASS
//Level cap
#ifndef LEVELCAP
	#define LEVELCAP 100

attribute
	var/name
	var/value = 0
	var/limit = 0   // max is a built-in proc, so don't use it as a var name
	var/level = 1
	var/xp = 0
	var/xp_next = 100 // xp for next level
	var/xp_total = 0
	var/limit_gain_rate = 1.9
	var/xp_gain_rate = 1.12

	New(name,value=0,level=1,xp_next=100,limit_gain_rate=1.5, xp_gain_rate=1.04)
		src.name = name
		src.value = value
		src.limit = value
		src.level = level
		src.xp_next = xp_next
		src.limit_gain_rate = limit_gain_rate
		src.xp_gain_rate = xp_gain_rate


	proc/gain_xp(_xp)
		xp += _xp
		xp_total +=_xp
		. = level
		while(xp >= xp_next && level < LEVELCAP)
			limit += round(level * limit_gain_rate)
			value = limit
			++level
			xp -= xp_next
			xp_next = round(xp_next * xp_gain_rate, 1)

	//you can call procs directly from the datum.
	//attribute.proc()
	proc // gets
		name() 	return name
		value() return value
		limit() return limit
		level() return level
		xp() 	return xp 
		xp_next() 			return xp_next 
		limit_gain_rate() 	return limit_gain_rate
		xp_gain_rate() 		return xp_gain_rate

	proc // sets
		setName(val)
			if(val) name = val
			else throw EXCEPTION("Expecting argument: setName(val)")
		setValue(val)
			if(val) value = val
			else throw EXCEPTION("Expecting argument: setValue(val)")
		setLimit(val)
			if(val) limit = val
			else throw EXCEPTION("Expecting argument: setLimit(val)")
		setLevel(val)
			if(val) level = val
			else throw EXCEPTION("Expecting argument: setLevel(val)")
		setXp(val)
			if(val) xp = val
			else throw EXCEPTION("Expecting argument: setXp(val)")
		setXp_next(val)
			if(val) xp_next = val
			else throw EXCEPTION("Expecting argument: setXp_next(val)")
		setLimit_gain_rate(val)
			if(val) limit_gain_rate = val
			else throw EXCEPTION("Expecting argument: setLimit_gain_rate(val)")
		setXp_gain_rate(val)
			if(val) xp_gain_rate = val
			else throw EXCEPTION("Expecting argument: setXp_gain_rate(val)")


mob

	//could be used to store multiple attributes
	var/list/stats = list()

	//how to assign attributes to a list
	proc/give_stats()
		stats = list(\
			"example1" 	= new/attribute("example1",	10,	10,	1,	100,	22.3),
			"example2" 	= new/attribute("example2",	1,	1,	1,	100,	2.9),)

	//Procs, required pre build-512.
	proc

		get_stats(name, variable)
			if(stats[name]) return stats[name].variable
		set_stats_name(name, value)
			if(stats[name]) stats[name].name = value
		set_stats_value(name, value)
			if(stats[name]) stats[name].value = value
		set_stats_limit(name, value)
			if(stats[name]) stats[name].limit = value
		set_stats_level(name, value)
			if(stats[name]) stats[name].level = value
		set_stats_xp(name, value)
			if(stats[name]) stats[name].xp = value
		set_stats_xpnext(name, value)
			if(stats[name]) stats[name].xp_next = value
		set_stats_limitgainrate(name, value)
			if(stats[name]) stats[name].limit_gain_rate = value
		set_stats_xpgainrate(name, value)
			if(stats[name]) stats[name].xp_gain_rate = value
		gain_xp(attr, amount)
			var/attribute/A = stats && stats[attr]
			if(A)	A.gain_xp(amount, src)
			else	throw EXCEPTION("invalid /list: [A]")