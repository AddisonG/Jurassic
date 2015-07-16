function Trig_Mechanic_Recipie_Func001C takes nothing returns boolean
    if ( ( GetItemTypeId(GetManipulatedItem()) == 'I00Q' ) ) then
        return true
    endif
    if ( ( GetItemTypeId(GetManipulatedItem()) == 'I00R' ) ) then
        return true
    endif
    if ( ( GetItemTypeId(GetManipulatedItem()) == 'I00S' ) ) then
        return true
    endif
    if ( ( GetItemTypeId(GetManipulatedItem()) == 'I00T' ) ) then
        return true
    endif
    if ( ( GetItemTypeId(GetManipulatedItem()) == 'I00U' ) ) then
        return true
    endif
    if ( ( GetItemTypeId(GetManipulatedItem()) == 'I00V' ) ) then
        return true
    endif
    return false
endfunction

function Trig_Mechanic_Recipie_Conditions takes nothing returns boolean
    if ( not Trig_Mechanic_Recipie_Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_Mechanic_Recipie_Func002Func001Func001C takes nothing returns boolean
    if ( not ( GetForLoopIndexA() == 6 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Mechanic_Recipie_Func002Func001C takes nothing returns boolean
    if ( not ( GetItemTypeId(UnitItemInSlotBJ(GetTriggerUnit(), 1)) == udg_MECH_ENGINE_List[GetForLoopIndexA()] ) ) then
        return false
    endif
    return true
endfunction

function Trig_Mechanic_Recipie_Func003Func001Func001C takes nothing returns boolean
    if ( not ( GetForLoopIndexA() == 7 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Mechanic_Recipie_Func003Func001C takes nothing returns boolean
    if ( not ( GetItemTypeId(UnitItemInSlotBJ(GetTriggerUnit(), 2)) == udg_MECH_CHASSIS_List[GetForLoopIndexA()] ) ) then
        return false
    endif
    return true
endfunction

function Trig_Mechanic_Recipie_Func007C takes nothing returns boolean
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'I00Q' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Mechanic_Recipie_Func009C takes nothing returns boolean
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'I00R' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Mechanic_Recipie_Func011C takes nothing returns boolean
    if ( not ( udg_TEMP_Integer_1 >= 2 ) ) then
        return false
    endif
    if ( not ( udg_TEMP_Integer_2 >= 3 ) ) then
        return false
    endif
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'I00S' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Mechanic_Recipie_Func013C takes nothing returns boolean
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'I00T' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Mechanic_Recipie_Func015C takes nothing returns boolean
    if ( not ( udg_TEMP_Integer_1 >= 1 ) ) then
        return false
    endif
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'I00U' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Mechanic_Recipie_Func017C takes nothing returns boolean
    if ( not ( udg_TEMP_Integer_1 >= 2 ) ) then
        return false
    endif
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'I00V' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Mechanic_Recipie_Func019C takes nothing returns boolean
    if ( not ( udg_TEMP_Real == 0.00 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Mechanic_Recipie_Actions takes nothing returns nothing
    set bj_forLoopAIndex = 0
    set bj_forLoopAIndexEnd = 6
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        if ( Trig_Mechanic_Recipie_Func002Func001C() ) then
            set udg_TEMP_Integer_1 = GetForLoopIndexA()
            exitwhen true
        else
            if ( Trig_Mechanic_Recipie_Func002Func001Func001C() ) then
                set udg_TEMP_Player_Group = GetForceOfPlayer(GetOwningPlayer(GetTriggerUnit()))
                call DisplayTimedTextToForce( udg_TEMP_Player_Group, 3.00, "TRIGSTR_1514" )
                call DestroyForce(udg_TEMP_Player_Group)
                return
            else
            endif
        endif
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set bj_forLoopAIndex = 0
    set bj_forLoopAIndexEnd = 7
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        if ( Trig_Mechanic_Recipie_Func003Func001C() ) then
            set udg_TEMP_Integer_2 = GetForLoopIndexA()
            exitwhen true
        else
            if ( Trig_Mechanic_Recipie_Func003Func001Func001C() ) then
                set udg_TEMP_Player_Group = GetForceOfPlayer(GetOwningPlayer(GetTriggerUnit()))
                call DisplayTimedTextToForce( udg_TEMP_Player_Group, 3.00, "TRIGSTR_1515" )
                call DestroyForce(udg_TEMP_Player_Group)
                return
            else
            endif
        endif
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set udg_TEMP_Point_1 = GetUnitLoc(GetTriggerUnit())
    set udg_TEMP_Real = 0.00
    // JEEP
    if ( Trig_Mechanic_Recipie_Func007C() ) then
        call CreateNUnitsAtLoc( 1, 'h00G', GetOwningPlayer(GetTriggerUnit()), udg_TEMP_Point_1, bj_UNIT_FACING )
        call RemoveItem( GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'I00Q') )
        set udg_TEMP_Real = 1.00
    else
    endif
    // HUMVEE
    if ( Trig_Mechanic_Recipie_Func009C() ) then
        call CreateNUnitsAtLoc( 1, 'h00G', GetOwningPlayer(GetTriggerUnit()), udg_TEMP_Point_1, bj_UNIT_FACING )
        call RemoveItem( GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'I00R') )
        set udg_TEMP_Real = 1.00
    else
    endif
    // TANK
    if ( Trig_Mechanic_Recipie_Func011C() ) then
        call CreateNUnitsAtLoc( 1, 'h00H', GetOwningPlayer(GetTriggerUnit()), udg_TEMP_Point_1, bj_UNIT_FACING )
        call RemoveItem( GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'I00S') )
        set udg_TEMP_Real = 1.00
    else
    endif
    // COBRA
    if ( Trig_Mechanic_Recipie_Func013C() ) then
        call CreateNUnitsAtLoc( 1, 'n009', GetOwningPlayer(GetTriggerUnit()), udg_TEMP_Point_1, bj_UNIT_FACING )
        call RemoveItem( GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'I00T') )
        set udg_TEMP_Real = 1.00
    else
    endif
    // TRANSPORT
    if ( Trig_Mechanic_Recipie_Func015C() ) then
        call CreateNUnitsAtLoc( 1, 'n005', GetOwningPlayer(GetTriggerUnit()), udg_TEMP_Point_1, bj_UNIT_FACING )
        call RemoveItem( GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'I00U') )
        set udg_TEMP_Real = 1.00
    else
    endif
    // AH-64
    if ( Trig_Mechanic_Recipie_Func017C() ) then
        call CreateNUnitsAtLoc( 1, 'n00B', GetOwningPlayer(GetTriggerUnit()), udg_TEMP_Point_1, bj_UNIT_FACING )
        call RemoveItem( GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'I00V') )
        set udg_TEMP_Real = 1.00
    else
    endif
    call RemoveLocation(udg_TEMP_Point_1)
    if ( Trig_Mechanic_Recipie_Func019C() ) then
        set udg_TEMP_Player_Group = GetForceOfPlayer(GetOwningPlayer(GetTriggerUnit()))
        call DisplayTimedTextToForce( udg_TEMP_Player_Group, 3.00, "TRIGSTR_1512" )
        call DestroyForce(udg_TEMP_Player_Group)
        return
    else
        call RemoveItem( UnitItemInSlotBJ(GetTriggerUnit(), 1) )
        call RemoveItem( UnitItemInSlotBJ(GetTriggerUnit(), 2) )
        call UnitAddAbilityBJ( udg_MECH_ENGINE_Speed[udg_TEMP_Integer_1], GetLastCreatedUnit() )
        call UnitAddAbilityBJ( udg_MECH_ENGINE_FuelTank[udg_TEMP_Integer_1], GetLastCreatedUnit() )
        call UnitAddAbilityBJ( udg_MECH_ENGINE_Usage[udg_TEMP_Integer_1], GetLastCreatedUnit() )
        call UnitAddAbilityBJ( udg_MECH_ENGINE_Refuel[udg_TEMP_Integer_1], GetLastCreatedUnit() )
        call UnitAddAbilityBJ( udg_MECH_CHASSIS_Armour[udg_TEMP_Integer_2], GetLastCreatedUnit() )
        call UnitAddAbilityBJ( udg_MECH_CHASSIS_Health[udg_TEMP_Integer_2], GetLastCreatedUnit() )
        call UnitAddAbilityBJ( udg_MECH_CHASSIS_Speed[udg_TEMP_Integer_2], GetLastCreatedUnit() )
    endif
endfunction

//===========================================================================
function InitTrig_Mechanic_Recipie takes nothing returns nothing
    set gg_trg_Mechanic_Recipie = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Mechanic_Recipie, EVENT_PLAYER_UNIT_USE_ITEM )
    call TriggerAddCondition( gg_trg_Mechanic_Recipie, Condition( function Trig_Mechanic_Recipie_Conditions ) )
    call TriggerAddAction( gg_trg_Mechanic_Recipie, function Trig_Mechanic_Recipie_Actions )
endfunction