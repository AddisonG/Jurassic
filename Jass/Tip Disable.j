void Tip_Disable_Actions() {
	ForceRemovePlayer(TIP_PLAYERS, GetTriggerPlayer())
}

//===========================================================================
void InitTrig_Tip_Disable() {
	trigger t = CreateTrigger()
	TriggerRegisterPlayerChatEvent(t, Player(0), "-notips", true)
	TriggerRegisterPlayerChatEvent(t, Player(1), "-notips", true)
	TriggerRegisterPlayerChatEvent(t, Player(2), "-notips", true)
	TriggerRegisterPlayerChatEvent(t, Player(3), "-notips", true)
	TriggerRegisterPlayerChatEvent(t, Player(4), "-notips", true)
	TriggerRegisterPlayerChatEvent(t, Player(5), "-notips", true)
	TriggerRegisterPlayerChatEvent(t, Player(6), "-notips", true)
	TriggerAddAction(t, function Tip_Disable_Actions)
}