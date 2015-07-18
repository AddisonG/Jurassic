void Tip_Enable_Actions() {
	ForceAddPlayer(TIP_PLAYERS, GetTriggerPlayer())
}

//===========================================================================
void InitTrig_Tip_Enable() {
	trigger t = CreateTrigger()
	TriggerRegisterPlayerChatEvent(t, Player(0), "-tips", true)
	TriggerRegisterPlayerChatEvent(t, Player(1), "-tips", true)
	TriggerRegisterPlayerChatEvent(t, Player(2), "-tips", true)
	TriggerRegisterPlayerChatEvent(t, Player(3), "-tips", true)
	TriggerRegisterPlayerChatEvent(t, Player(4), "-tips", true)
	TriggerRegisterPlayerChatEvent(t, Player(5), "-tips", true)
	TriggerRegisterPlayerChatEvent(t, Player(6), "-tips", true)
	TriggerAddAction(t, function Tip_Enable_Actions)
}