void Tip_Enable_Actions() {
	debug BJDebugMsg("Enabled tips")
	ForceAddPlayer(TIP_PLAYERS, GetTriggerPlayer())
}

//===========================================================================
void InitTrig_Tip_Enable() {
	trigger t = CreateTrigger()
	int player_num = 0
	while (player_num < 7) {
		// Opt in to tips by default
		ForceAddPlayer(TIP_PLAYERS, Player(player_num))
		TriggerRegisterPlayerChatEvent(t, Player(player_num), "-tips ", true)
		player_num++
	}
	TriggerAddAction(t, function Tip_Enable_Actions)
}
