void Quest_Actions() {
	string title, desc, icon, alert

	TriggerSleepAction(10)

	// Building a basic base
	title = "Building a basic base"
	desc = "Type '-base' to find good locations to set up a base. You'll " + \
	"need to put down a tent, campfire, mining site, and power plant to start."
	icon = "ReplaceableTextures\\CommandButtons\\BTNGenericCreepBuilding.blp"
	alert = "You should build a base. See quests (F9) for more info."
    CreateQuestBJ(bj_QUESTTYPE_REQ_DISCOVERED, title, desc, icon)
	FlashQuestDialogButton()
	DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 5, alert)

	TriggerSleepAction(60)

	// Harvesting materials
	title = "Harvesting materials"
	desc = "TODO"
	icon = "ReplaceableTextures\\CommandButtons\\BTNBundleOfLumber.blp"
	alert = "You should try and gather wood and metal. See quests (F9) for more info."
    CreateQuestBJ(bj_QUESTTYPE_REQ_DISCOVERED, title, desc, icon)
	FlashQuestDialogButton()
	DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 5, alert)

	TriggerSleepAction(120)

	// Building a basic defence
	// TODO

	// Getting a qualification
	title = "Getting a qualification"
	desc = "TODO"
	icon = "ReplaceableTextures\\CommandButtons\\BTNBookOfTheDead.blp"
	alert = "You should soon consider getting a qualification. See quests (F9) for more info."
    CreateQuestBJ(bj_QUESTTYPE_REQ_DISCOVERED, title, desc, icon)
	FlashQuestDialogButton()
	DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 5, alert)

	TriggerSleepAction(300)

	// Text commands
	title = "Text commands"
	desc = "TODO"
	icon = "ReplaceableTextures\\CommandButtons\\BTNSorceressAdept.blp"
	alert = "There are several powerful text-commands for sharing/etc. See quests (F9) for more info."
    CreateQuestBJ(bj_QUESTTYPE_REQ_DISCOVERED, title, desc, icon)
	FlashQuestDialogButton()
	DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 5, alert)

	TriggerSleepAction(600)

	// Finishing the game
	title = "Finishing the game"
	desc = "TODO"
	icon = "ReplaceableTextures\\CommandButtons\\BTNUnsummonBuilding.blp"
	alert = "Don't forget that you have to eventually escape! See quests (F9) for more info."
    CreateQuestBJ(bj_QUESTTYPE_REQ_DISCOVERED, title, desc, icon)
	FlashQuestDialogButton()
	DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 5, alert)

	DestroyTrigger(GetTriggeringTrigger())

	TriggerSleepAction(300)

	// Credits
	title = "Credits"
	desc = "Broiler - The original creator of the original Jurassic mod. This man made it all possible.|n \
SaMmM & qwerty - The creators of the a more polished version of Jurassic that inspired me.|n \
Olofmoleman - The vast majority of dinosaur models and icons."
	icon = "ReplaceableTextures\\WorldEditUI\\Doodad-Cinematic.blp"
	alert = "Kudos to Broiler, and the others who made this possible! See quests (F9) for more info."
    CreateQuestBJ(bj_QUESTTYPE_REQ_DISCOVERED, title, desc, icon)
	FlashQuestDialogButton()
	DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 5, alert)

	DestroyTrigger(GetTriggeringTrigger())
}

//===========================================================================
void InitTrig_Quests() {
	trigger t = CreateTrigger()
	TriggerRegisterTimerEvent(t, 5, false)
	TriggerAddAction(t, function Quest_Actions)
}
