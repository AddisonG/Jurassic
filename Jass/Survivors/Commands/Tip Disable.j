void Tip_Disable_Actions() {
	debug BJDebugMsg("Disabled tips")
	ForceRemovePlayer(TIP_PLAYERS, GetTriggerPlayer())
}

//===========================================================================
void InitTrig_Tip_Disable() {
	trigger t = CreateTrigger()
	int player_num = 0
	while (player_num < 7) {
		TriggerRegisterPlayerChatEvent(t, Player(player_num), "-notips ", true)
		player_num++
	}
	TriggerAddAction(t, function Tip_Disable_Actions)
}
