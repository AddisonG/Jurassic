scope firearm {
	globals
		constant int PISTOL_ITEM = 'P_I0'
		constant int PISTOL_ABILITY = 'BANG'

		constant int PISTOL_TRAINING = '????'
	endglobals
	public struct firearm {
		private item firearm_item
		private int ammo

		public static firearm create() {
			debug BJDebugMsg("Firearm Create")
			firearm data = firearm.allocate()

			trigger t = CreateTrigger()
			TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_USE_ITEM)
			TriggerAddCondition(t, Condition(function firearm.conditions))
			TriggerAddAction(t, function firearm.fire)

			return data
		}

		// This trigger is just for using the item (no target!)
		public static bool condition_item() {
			debug BJDebugMsg("Pulled trigger!")
			return GetItemTypeId(GetManipulatedItem()) == PISTOL_ITEM
		}

		// This trigger is for the spell the item casts (has a target)
		public static bool condition_spell_target() {
			debug BJDebugMsg("Firearm Condition")
			return GetItemTypeId(GetManipulatedItem()) == PISTOL_ITEM
		}

		public static void fire() {
			debug BJDebugMsg("Firearm Fire")
			unit gunslinger = GetTriggerUnit()

			unit target = GetEventTargetUnit()
			debug_unit(target)
			target = GetSpellTargetUnit()
			debug_unit(target)
			target = GetOrderTargetUnit()
			debug_unit(target)

			if (GetUnitTypeId(gunslinger) != SURVIVOR_UNIT_TYPE) {
				TextTag_UnitColor(gunslinger, "Only survivors may shoot guns", 255, 0, 0)
				return
			}
			// if (this.ammo == 0) {
			// 	TextTag_UnitColor(gunslinger, "No ammo", 255, 0, 0)
			// 	return
			// }
			// this.ammo--

			TextTag_UnitColor(gunslinger, "Bang!", 255, 0, 0)
			TextTag_UnitColor(target, "Ouch!", 255, 0, 0)
			debug BJDebugMsg("Firing")
			gunslinger = null
		}

		public static void jam() {
			debug BJDebugMsg("Firearm Jam")
			//
		}

		public static void reload() {
			debug BJDebugMsg("Firearm Reload")
			//
		}
	}
}

//===========================================================================
void InitTrig_Firearm () {
	trigger t1 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(t1, EVENT_PLAYER_UNIT_PICKUP_ITEM)
	TriggerRegisterAnyUnitEventBJ(t1, EVENT_PLAYER_UNIT_PAWN_ITEM)
	TriggerAddCondition(t1, Condition(function firearm_firearm.conditions))
	TriggerAddAction(t1, function firearm_firearm.create)

	trigger t2 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(t2, EVENT_PLAYER_UNIT_DROP_ITEM)
	TriggerRegisterAnyUnitEventBJ(t2, EVENT_PLAYER_UNIT_SELL_ITEM)
	TriggerAddCondition(t2, Condition(function firearm_firearm.conditions))
	TriggerAddAction(t2, function firearm_firearm.jam)

	trigger t3 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(t3, EVENT_PLAYER_UNIT_USE_ITEM)
	TriggerAddCondition(t3, Condition(function firearm_firearm.conditions))
	TriggerAddAction(t3, function firearm_firearm.fire)
}
