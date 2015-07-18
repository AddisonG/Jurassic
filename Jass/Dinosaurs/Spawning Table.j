/*
This is a picture of how the spawning table works: http://i.imgur.com/Rgoxtn0.png
The values in the first column (0) MUST be at least 100,
or there will be bad times, as I don't think I added any failsafes.
*/

nothing Setup_Spawning_Table() {
	// LEVEL 1
	integer VAL = 0
	integer KEY = 1
	hashtable temp = InitHashtable()
	SaveInteger(temp, 0, VAL, 32)
	SaveInteger(temp, 1, VAL, 40)
	SaveInteger(temp, 2, VAL, 14)
	SaveInteger(temp, 3, VAL, 14)
	SaveInteger(temp, 0, KEY, 'd0_0') // Baby Raptor
	SaveInteger(temp, 1, KEY, 'd0_1') // Stegasaurus
	SaveInteger(temp, 2, KEY, 'd0_2') // Bat
	SaveInteger(temp, 3, KEY, 'd0_3') // Flies
	DINOSAURS[0] = temp
	
	// LEVEL 2
	temp = InitHashtable()
	SaveInteger(temp, 0, VAL, 32)
	SaveInteger(temp, 1, VAL, 32)
	SaveInteger(temp, 2, VAL, 18)
	SaveInteger(temp, 3, VAL, 18)
	SaveInteger(temp, 0, KEY, 'd1_0') // Therizinosaurus
	SaveInteger(temp, 1, KEY, 'd1_1') // Triceratops
	SaveInteger(temp, 2, KEY, 'd1_2') // Vampire Bat
	SaveInteger(temp, 3, KEY, 'd1_3') // Fly Swarm
	DINOSAURS[1] = temp
	
	// LEVEL 3
	temp = InitHashtable()
	SaveInteger(temp, 0, VAL, 32)
	SaveInteger(temp, 1, VAL, 32)
	SaveInteger(temp, 2, VAL, 18)
	SaveInteger(temp, 3, VAL, 18)
	SaveInteger(temp, 0, KEY, 'd2_0') // Alpha Therizinosaurus
	SaveInteger(temp, 1, KEY, 'd2_1') // Armoured Triceratops
	SaveInteger(temp, 2, KEY, 'd2_2') // Archaeopteryx
	SaveInteger(temp, 3, KEY, 'd2_3') // Flesh Flies
	DINOSAURS[2] = temp
	
	// LEVEL 4
	temp = InitHashtable()
	SaveInteger(temp, 0, VAL, 30)
	SaveInteger(temp, 1, VAL, 25)
	SaveInteger(temp, 2, VAL, 25)
	SaveInteger(temp, 3, VAL, 20)
	SaveInteger(temp, 0, KEY, 'd3_0') // Velociraptor
	SaveInteger(temp, 1, KEY, 'd3_1') // Wooly Rhino
	SaveInteger(temp, 2, KEY, 'd3_2') // Ancient Archaeopteryx
	SaveInteger(temp, 3, KEY, 'd3_3') // Giant Hornet
	DINOSAURS[3] = temp
	
	temp = null
}

//===========================================================================
nothing InitTrig_Spawning_Table() {
	TriggerAddAction(CreateTrigger(), function Setup_Spawning_Table)
}