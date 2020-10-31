/**
 * Creates a ping for the triggering player at the location, offset from the centre of the map.
 */
void pingTriggeringPlayerMap(real x, real y) {
	if (GetTriggerPlayer() == GetLocalPlayer()) {
		PingMinimap(GetLocationX(MAP_CENTER) + x, GetLocationY(MAP_CENTER) + y, 10)
		//StartSound(bj_pingMinimapSound)
	}
}

void Trig_Ping_Base_Actions() {
	// TROPICAL LANDS
	pingTriggeringPlayerMap(-12700, -15150) // Bottom left, by water, on broken wall
	pingTriggeringPlayerMap(-14400, -6800) // Left, above triangle walls
	pingTriggeringPlayerMap(-14000, -11250) // Left, below triangle walls
	pingTriggeringPlayerMap(-14800, -9800) // Left, inside triangle walls
	pingTriggeringPlayerMap(-8500, -14200) // Bottom, ruins
	pingTriggeringPlayerMap(-3000, -9000) // Right, sunken ruins
	pingTriggeringPlayerMap(-3000, -13800) // Bottom right, island
	pingTriggeringPlayerMap(-7000, -3800) // Top, mountainous ruins
	pingTriggeringPlayerMap(-3800, -700) // Top right, triple ruins

	// MOUNTAIN LANDS
	pingTriggeringPlayerMap(10000, 7000) // Center, crater of mounain
	pingTriggeringPlayerMap(13050, 9050) // Right, entire mountain
	pingTriggeringPlayerMap(12500, 5500) // Right, below bridge
	pingTriggeringPlayerMap(14500, 2600) // Right, ruins by base of mountain
	pingTriggeringPlayerMap(14000, -1500) // Bottom right, ruins by river
	pingTriggeringPlayerMap(10800, -200) // Bottom, sunken area
	pingTriggeringPlayerMap(6800, 900) // Bottom right, raised plateau

	// SWAMP LANDS
	pingTriggeringPlayerMap(7600, -9200) // Middle, pocket by the stone path
	pingTriggeringPlayerMap(600, -7000) // Left, raised area by paths
	pingTriggeringPlayerMap(1700, -11000) // Bottom left, left of shipwreck
	pingTriggeringPlayerMap(4750, -12900) // Bottom, below shipwreck

	// FROZEN LANDS
}

//===========================================================================
void InitTrig_Ping_Base() {
	trigger t = CreateTrigger()
	int player_num = 0
	while (player_num < 7) {
		TriggerRegisterPlayerChatEvent(t, Player(player_num), "-base ", true)
		player_num++
	}
	TriggerAddAction(t, function Trig_Ping_Base_Actions)
}
