globals
//globals from TextTag:
constant real MEAN_CHAR_WIDTH=5.5
constant real MAX_TEXT_SHIFT=200
constant real DEFAULT_HEIGHT=16
constant real SIGN_SHIFT=16
constant real FONT_SIZE=0.024
constant string MISS="miss"
//endglobals from TextTag
rect gg_rct_Cave_East=null
rect gg_rct_Cave_West=null
rect gg_rct_Frozen_Lands=null
rect gg_rct_Frozen_Lands_Heavy=null
rect gg_rct_Frozen_Lands_Light_1=null
rect gg_rct_Frozen_Lands_Light_2=null
rect gg_rct_Frozen_Lands_Medium_1=null
rect gg_rct_Frozen_Lands_Medium_2=null
rect gg_rct_Lost_Woods=null
rect gg_rct_Sunlight_01=null
rect gg_rct_Sunlight_02=null
rect gg_rct_Sunlight_03=null
rect gg_rct_Sunlight_04=null
rect gg_rct_Sunlight_05=null
rect gg_rct_Sunlight_06=null
rect gg_rct_Sunlight_07=null
rect gg_rct_Sunlight_08=null
rect gg_rct_Sunlight_09=null
rect gg_rct_Sunlight_10=null
rect gg_rct_Sunlight_11=null
rect gg_rct_Sunlight_12=null
rect gg_rct_Swamp_1=null
rect gg_rct_Swamp_2=null
rect gg_rct_Swamp_3=null
rect gg_rct_Swamp_Lands=null
rect gg_rct_Tropical_Lands=null
rect gg_rct_Mountain_Lands=null
sound gg_snd_Welcome=null
string gg_snd_Storm_Earth_Fire
trigger gg_trg_TextTag=null
trigger gg_trg_Mountain_Cave=null
trigger gg_trg_Pickup_Drop_Tools=null
trigger gg_trg_Ping_Base=null
trigger gg_trg_Part_Share=null
trigger gg_trg_Full_Share=null
trigger gg_trg_Unshare=null
trigger gg_trg_Survivor=null
trigger gg_trg_Survivor_Death=null
trigger gg_trg_Begin_Spawn=null
trigger gg_trg_Anger_Loop=null
trigger gg_trg_Level_Loop=null
trigger gg_trg_Spawn_Loop=null
trigger gg_trg_Move_Loop=null
trigger gg_trg_Item_Scatter=null
trigger gg_trg_Spawning_Table=null
trigger gg_trg_Init=null
trigger gg_trg_Game_Start=null
trigger gg_trg_Dinosaur=null
trigger gg_trg_Scout_Tower=null
trigger gg_trg_Scout_Tower_Stop=null
trigger gg_trg_Tent_Init=null
trigger gg_trg_MineSite_Blight=null
trigger gg_trg_DMineSite_Blight=null
trigger gg_trg_MineSite_Stop=null
trigger gg_trg_Mechanic_Init=null
trigger gg_trg_Mechanic_Recipe=null
trigger gg_trg_Pistol=null
trigger gg_trg_Tip_Init=null
trigger gg_trg_Tip_Timer=null
trigger gg_trg_Tip_Enable=null
trigger gg_trg_Tip_Disable=null
trigger gg_trg_Mechanic=null
location SpawnLoop__spawn_point
location SpawnLoop__survivor_location
real DIST_MULT=0.3
integer RAND_RADIUS=1000
integer MOVE_FREQUENCY=10
unit survivor
unit dino
force PLAYERS=CreateForce()
group SURVIVORS=CreateGroup()
group array DINOSAUR_GROUPS
rect WHOLE_MAP
timer START_TIMER=CreateTimer()
timer END_TIMER=CreateTimer()
trigger SPAWN_TRIGGER
trigger MOVE_TRIGGER
// processed: hashtable array DINO_TABLE[10]
location MAP_CENTER
integer DIFFICULTY
timer ANGER_TIMER=CreateTimer()
timer LEVEL_TIMER=CreateTimer()
integer DINO_ANGER
integer DINO_LEVEL
real SPAWN_MAX_DIST
real SPAWN_MIN_DIST
dialog DIFFICULTY_MENU=DialogCreate()
button array DIFFICULTY_BUTTONS
hashtable FOGMODS=InitHashtable()
constant integer SURVIVOR_UNIT_TYPE=0x68303030
constant attacktype AMMUNITION=ATTACK_TYPE_HERO
constant attacktype SPIT=ATTACK_TYPE_MAGIC
constant attacktype FIRE=ATTACK_TYPE_SIEGE
constant attacktype BITE=ATTACK_TYPE_CHAOS
constant attacktype CLAW=ATTACK_TYPE_MELEE
constant attacktype ELECTRIC=ATTACK_TYPE_PIERCE
constant attacktype BLUNT=ATTACK_TYPE_NORMAL
constant integer ENGINE_NUM=7
string array ENGINE_NAME
integer array ENGINE_LIST
integer array ENGINE_FUELTANK
integer array ENGINE_REFUEL
integer array ENGINE_SPEED
integer array ENGINE_USAGE
constant integer CHASSIS_NUM=8
string array CHASSIS_NAME
integer array CHASSIS_LIST
integer array CHASSIS_ARMOUR
integer array CHASSIS_HEALTH
integer array CHASSIS_SPEED
constant integer BLUEPRINTS_JEEP=0x49303051
constant integer BLUEPRINTS_HUMVEE=0x49303052
constant integer BLUEPRINTS_TANK=0x49303053
constant integer BLUEPRINTS_COBRA=0x49303054
constant integer BLUEPRINTS_TRANSPORT=0x49303055
constant integer BLUEPRINTS_AAHELI=0x49303056
constant integer VEHICLE_JEEP=0x68303047
constant integer VEHICLE_HUMVEE=0x68303047
constant integer VEHICLE_TANK=0x68303048
constant integer VEHICLE_COBRA=0x6E303039
constant integer VEHICLE_TRANSPORT=0x6E303035
constant integer VEHICLE_AAHELI=0x6E303042
constant integer PISTOL_DAMAGE=60
constant integer PISTOL_RANGE=500
constant integer PISTOL_RELOAD=1000
constant integer PISTOL_JAM_TIME=5
constant integer PISTOL_TRAINED_JAM_CHANCE=10
constant integer PISTOL_UNTRAINED_JAM_CHANCE=25
constant integer PISTOL_TRAINED_ACCURACY=100
constant integer PISTOL_UNTRAINED_ACCURACY=80
constant integer PISTOL_ITEM=0x505F4930
constant integer PISTOL_ABILITY=0x505F4130
timer TIP_TIMER=CreateTimer()
force TIP_PLAYERS=CreateForce()
integer TIP_NUM=16
string array TIPS
constant integer mechanic__VEHICLE_CAP=3


//JASSHelper struct globals:
constant integer si__survivor_survivor=1
integer si__survivor_survivor_F=0
integer si__survivor_survivor_I=0
integer array si__survivor_survivor_V
unit array s__survivor_survivor_surv
location array s__survivor_survivor_pos
mechanic array s__survivor_survivor_mech
integer array s__survivor_survivor_killCounter
constant integer si__dinosaur_dinosaur=2
integer si__dinosaur_dinosaur_F=0
integer si__dinosaur_dinosaur_I=0
integer array si__dinosaur_dinosaur_V
unit array s__dinosaur_dinosaur_s
location array s__dinosaur_dinosaur_pos
constant integer si__mechanic_mechanic=3
integer si__mechanic_mechanic_F=0
integer si__mechanic_mechanic_I=0
integer array si__mechanic_mechanic_V
integer array s__mechanic_mechanic_vehicleCount
hashtable array s__DINO_TABLE

endglobals


//Generated allocator of survivor_survivor
function s__survivor_survivor__allocate takes nothing returns integer
 local integer this=si__survivor_survivor_F
    if (this!=0) then
        set si__survivor_survivor_F=si__survivor_survivor_V[this]
    else
        set si__survivor_survivor_I=si__survivor_survivor_I+1
        set this=si__survivor_survivor_I
    endif
    if (this>8190) then
        return 0
    endif

   set s__survivor_survivor_surv[this]=null
   set s__survivor_survivor_pos[this]=null
    set si__survivor_survivor_V[this]=-1
 return this
endfunction

//Generated destructor of survivor_survivor
function s__survivor_survivor_destroy takes integer this returns nothing
    if this==null then
        return
    elseif (si__survivor_survivor_V[this]!=-1) then
        return
    endif
    set si__survivor_survivor_V[this]=si__survivor_survivor_F
    set si__survivor_survivor_F=this
endfunction

//Generated allocator of mechanic_mechanic
function s__mechanic_mechanic__allocate takes nothing returns integer
 local integer this=si__mechanic_mechanic_F
    if (this!=0) then
        set si__mechanic_mechanic_F=si__mechanic_mechanic_V[this]
    else
        set si__mechanic_mechanic_I=si__mechanic_mechanic_I+1
        set this=si__mechanic_mechanic_I
    endif
    if (this>8190) then
        return 0
    endif

    set si__mechanic_mechanic_V[this]=-1
 return this
endfunction

//Generated destructor of mechanic_mechanic
function s__mechanic_mechanic_destroy takes integer this returns nothing
    if this==null then
        return
    elseif (si__mechanic_mechanic_V[this]!=-1) then
        return
    endif
    set si__mechanic_mechanic_V[this]=si__mechanic_mechanic_F
    set si__mechanic_mechanic_F=this
endfunction

//Generated allocator of dinosaur_dinosaur
function s__dinosaur_dinosaur__allocate takes nothing returns integer
 local integer this=si__dinosaur_dinosaur_F
    if (this!=0) then
        set si__dinosaur_dinosaur_F=si__dinosaur_dinosaur_V[this]
    else
        set si__dinosaur_dinosaur_I=si__dinosaur_dinosaur_I+1
        set this=si__dinosaur_dinosaur_I
    endif
    if (this>8190) then
        return 0
    endif

   set s__dinosaur_dinosaur_s[this]=null
   set s__dinosaur_dinosaur_pos[this]=null
    set si__dinosaur_dinosaur_V[this]=-1
 return this
endfunction

//Generated destructor of dinosaur_dinosaur
function s__dinosaur_dinosaur_destroy takes integer this returns nothing
    if this==null then
        return
    elseif (si__dinosaur_dinosaur_V[this]!=-1) then
        return
    endif
    set si__dinosaur_dinosaur_V[this]=si__dinosaur_dinosaur_F
    set si__dinosaur_dinosaur_F=this
endfunction

//library TextTag:
function TextTag_XY takes real x,real y,string text,string color returns nothing
local texttag tt=CreateTextTag()
local real shift=RMinBJ(StringLength(text) * MEAN_CHAR_WIDTH , MAX_TEXT_SHIFT)
call SetTextTagText(tt , color + text , FONT_SIZE)
call SetTextTagPos(tt , x - shift , y , DEFAULT_HEIGHT)
call SetTextTagVelocity(tt , 0 , 0.04)
call SetTextTagVisibility(tt , true)
call SetTextTagFadepoint(tt , 2.5)
call SetTextTagLifespan(tt , 4)
call SetTextTagPermanent(tt , false)
set tt = null
endfunction
function TextTag_Unit takes unit whichUnit,string text,string color returns nothing
local texttag tt=CreateTextTag()
local real shift=RMinBJ(StringLength(text) * MEAN_CHAR_WIDTH , MAX_TEXT_SHIFT)
call SetTextTagText(tt , color + text , FONT_SIZE)
call SetTextTagPos(tt , GetUnitX(whichUnit) - shift , GetUnitY(whichUnit) , DEFAULT_HEIGHT)
call SetTextTagVelocity(tt , 0 , 0.04)
call SetTextTagVisibility(tt , true)
call SetTextTagFadepoint(tt , 2.5)
call SetTextTagLifespan(tt , 4)
call SetTextTagPermanent(tt , false)
set tt = null
endfunction
function TextTag_UnitColor takes unit whichUnit,string text,integer red,integer green,integer blue returns nothing
local texttag tt=CreateTextTag()
local real shift=RMinBJ(StringLength(text) * MEAN_CHAR_WIDTH , MAX_TEXT_SHIFT)
call SetTextTagText(tt , text , FONT_SIZE)
call SetTextTagColor(tt , red , green , blue , 255)
call SetTextTagPos(tt , GetUnitX(whichUnit) - shift , GetUnitY(whichUnit) , DEFAULT_HEIGHT)
call SetTextTagVelocity(tt , 0 , 0.04)
call SetTextTagVisibility(tt , true)
call SetTextTagFadepoint(tt , 2.5)
call SetTextTagLifespan(tt , 4)
call SetTextTagPermanent(tt , false)
set tt = null
endfunction
function TextTag_GoldBounty takes unit whichUnit,integer bounty,player killer returns nothing
local texttag tt=CreateTextTag()
local string text="+" + I2S(bounty)
call SetTextTagText(tt , text , FONT_SIZE)
call SetTextTagPos(tt , GetUnitX(whichUnit) - SIGN_SHIFT , GetUnitY(whichUnit) , 0)
call SetTextTagColor(tt , 255 , 220 , 0 , 255)
call SetTextTagVelocity(tt , 0 , 0.03)
call SetTextTagVisibility(tt , GetLocalPlayer() == killer)
call SetTextTagFadepoint(tt , 2)
call SetTextTagLifespan(tt , 3)
call SetTextTagPermanent(tt , false)
set text = null
set tt = null
endfunction
function TextTag_LumberBounty takes unit whichUnit,integer bounty,player killer returns nothing
local texttag tt=CreateTextTag()
local string text="+" + I2S(bounty)
call SetTextTagText(tt , text , FONT_SIZE)
call SetTextTagPos(tt , GetUnitX(whichUnit) - SIGN_SHIFT , GetUnitY(whichUnit) , 0)
call SetTextTagColor(tt , 0 , 200 , 80 , 255)
call SetTextTagVelocity(tt , 0 , 0.03)
call SetTextTagVisibility(tt , GetLocalPlayer() == killer)
call SetTextTagFadepoint(tt , 2)
call SetTextTagLifespan(tt , 3)
call SetTextTagPermanent(tt , false)
set text = null
set tt = null
endfunction
function TextTag_Miss takes unit whichUnit returns nothing
local texttag tt=CreateTextTag()
call SetTextTagText(tt , MISS , FONT_SIZE)
call SetTextTagPos(tt , GetUnitX(whichUnit) , GetUnitY(whichUnit) , 0)
call SetTextTagColor(tt , 255 , 0 , 0 , 255)
call SetTextTagVelocity(tt , 0 , 0.03)
call SetTextTagVisibility(tt , true)
call SetTextTagFadepoint(tt , 1)
call SetTextTagLifespan(tt , 3)
call SetTextTagPermanent(tt , false)
set tt = null
endfunction
function TextTag_Firearm takes unit whichUnit,integer hitChance returns nothing
local texttag tt=CreateTextTag()
local string text=I2S(hitChance) + "%"
if ( hitChance > 80 ) then
call SetTextTagColor(tt , 0 , 255 , 0 , 255)
elseif ( hitChance > 60 ) then
call SetTextTagColor(tt , 210 , 255 , 0 , 255)
elseif ( hitChance > 40 ) then
call SetTextTagColor(tt , 255 , 240 , 0 , 255)
elseif ( hitChance > 20 ) then
call SetTextTagColor(tt , 255 , 180 , 0 , 255)
else
call SetTextTagColor(tt , 255 , 0 , 0 , 255)
endif
call SetTextTagText(tt , text , FONT_SIZE)
call SetTextTagPos(tt , GetUnitX(whichUnit) , GetUnitY(whichUnit) , 0)
call SetTextTagVelocity(tt , 0 , 0)
call SetTextTagVisibility(tt , GetLocalPlayer() == whichUnit)
call SetTextTagFadepoint(tt , 0.3)
call SetTextTagLifespan(tt , 0.5)
call SetTextTagPermanent(tt , false)
set text = null
set tt = null
endfunction

//library TextTag ends
function InitGlobals takes nothing returns nothing
endfunction
function ItemTable000000_DropItems takes nothing returns nothing
local widget trigWidget=null
local unit trigUnit=null
local integer itemID=0
local boolean canDrop=true
set trigWidget = bj_lastDyingWidget
if ( trigWidget == null ) then
set trigUnit = GetTriggerUnit()
endif
if ( trigUnit != null ) then
set canDrop = not IsUnitHidden(trigUnit)
if ( canDrop and GetChangingUnit() != null ) then
set canDrop = ( GetChangingUnitPrevOwner() == Player(PLAYER_NEUTRAL_AGGRESSIVE) )
endif
endif
if ( canDrop ) then
call RandomDistReset()
call RandomDistAddItem(0x49303031 , 15)
call RandomDistAddItem(0x49303030 , 15)
call RandomDistAddItem(0x49303033 , 5)
call RandomDistAddItem(- 1 , 65)
set itemID = RandomDistChoose()
if ( trigUnit != null ) then
call UnitDropItem(trigUnit , itemID)
else
call WidgetDropItem(trigWidget , itemID)
endif
endif
set bj_lastDyingWidget = null
call DestroyTrigger(GetTriggeringTrigger())
endfunction
function ItemTable000001_DropItems takes nothing returns nothing
local widget trigWidget=null
local unit trigUnit=null
local integer itemID=0
local boolean canDrop=true
set trigWidget = bj_lastDyingWidget
if ( trigWidget == null ) then
set trigUnit = GetTriggerUnit()
endif
if ( trigUnit != null ) then
set canDrop = not IsUnitHidden(trigUnit)
if ( canDrop and GetChangingUnit() != null ) then
set canDrop = ( GetChangingUnitPrevOwner() == Player(PLAYER_NEUTRAL_AGGRESSIVE) )
endif
endif
if ( canDrop ) then
call RandomDistReset()
call RandomDistAddItem(0x49303031 , 30)
call RandomDistAddItem(- 1 , 70)
set itemID = RandomDistChoose()
if ( trigUnit != null ) then
call UnitDropItem(trigUnit , itemID)
else
call WidgetDropItem(trigWidget , itemID)
endif
endif
set bj_lastDyingWidget = null
call DestroyTrigger(GetTriggeringTrigger())
endfunction
function InitSounds takes nothing returns nothing
set gg_snd_Welcome = CreateSound("war3mapImported\\Welcome.mp3" , false , false , false , 10 , 10 , "DefaultEAXON")
call SetSoundDuration(gg_snd_Welcome , 34220)
call SetSoundChannel(gg_snd_Welcome , 0)
call SetSoundVolume(gg_snd_Welcome , 127)
call SetSoundPitch(gg_snd_Welcome , 1.0)
set gg_snd_Storm_Earth_Fire = "Sound\\Music\\mp3Music\\PH1.mp3"
endfunction
function CreateAllDestructables takes nothing returns nothing
local destructable d
local trigger t
local real life
set d = CreateDestructable(0x44547263 , 12928.0 , 9216.0 , 57.000 , 1.000 , 0)
set t = CreateTrigger()
call TriggerRegisterDeathEvent(t , d)
call TriggerAddAction(t , function SaveDyingWidget)
call TriggerAddAction(t , function ItemTable000001_DropItems)
set d = CreateDestructable(0x44547263 , 9792.0 , 6912.0 , 9.000 , 1.000 , 5)
set t = CreateTrigger()
call TriggerRegisterDeathEvent(t , d)
call TriggerAddAction(t , function SaveDyingWidget)
call TriggerAddAction(t , function ItemTable000001_DropItems)
set d = CreateDestructable(0x44547263 , 10304.0 , 7168.0 , 331.000 , 1.000 , 0)
set t = CreateTrigger()
call TriggerRegisterDeathEvent(t , d)
call TriggerAddAction(t , function SaveDyingWidget)
call TriggerAddAction(t , function ItemTable000001_DropItems)
set d = CreateDestructable(0x44547263 , 12544.0 , 7936.0 , 202.000 , 1.000 , 5)
set t = CreateTrigger()
call TriggerRegisterDeathEvent(t , d)
call TriggerAddAction(t , function SaveDyingWidget)
call TriggerAddAction(t , function ItemTable000001_DropItems)
set d = CreateDestructable(0x44547263 , 12800.0 , 8384.0 , 163.453 , 1.000 , 2)
set t = CreateTrigger()
call TriggerRegisterDeathEvent(t , d)
call TriggerAddAction(t , function SaveDyingWidget)
call TriggerAddAction(t , function ItemTable000001_DropItems)
set d = CreateDestructable(0x44547263 , 13504.0 , 9856.0 , 72.720 , 1.000 , 1)
set t = CreateTrigger()
call TriggerRegisterDeathEvent(t , d)
call TriggerAddAction(t , function SaveDyingWidget)
call TriggerAddAction(t , function ItemTable000001_DropItems)
set d = CreateDestructable(0x44547263 , 13504.0 , 10176.0 , 47.000 , 1.000 , 0)
set t = CreateTrigger()
call TriggerRegisterDeathEvent(t , d)
call TriggerAddAction(t , function SaveDyingWidget)
call TriggerAddAction(t , function ItemTable000001_DropItems)
set d = CreateDestructable(0x44547263 , 12416.0 , 5440.0 , 163.378 , 1.000 , 4)
set t = CreateTrigger()
call TriggerRegisterDeathEvent(t , d)
call TriggerAddAction(t , function SaveDyingWidget)
call TriggerAddAction(t , function ItemTable000001_DropItems)
set d = CreateDestructable(0x44547263 , 12288.0 , 9344.0 , 155.000 , 1.000 , 5)
set t = CreateTrigger()
call TriggerRegisterDeathEvent(t , d)
call TriggerAddAction(t , function SaveDyingWidget)
call TriggerAddAction(t , function ItemTable000001_DropItems)
set d = CreateDestructable(0x44547263 , 12096.0 , 9088.0 , 291.000 , 1.000 , 1)
set t = CreateTrigger()
call TriggerRegisterDeathEvent(t , d)
call TriggerAddAction(t , function SaveDyingWidget)
call TriggerAddAction(t , function ItemTable000001_DropItems)
set d = CreateDestructable(0x4C547263 , 12672.0 , 9728.0 , 252.820 , 1.000 , 5)
set t = CreateTrigger()
call TriggerRegisterDeathEvent(t , d)
call TriggerAddAction(t , function SaveDyingWidget)
call TriggerAddAction(t , function ItemTable000001_DropItems)
set d = CreateDestructable(0x4C547263 , 8960.0 , 8704.0 , 58.783 , 1.000 , 4)
set t = CreateTrigger()
call TriggerRegisterDeathEvent(t , d)
call TriggerAddAction(t , function SaveDyingWidget)
call TriggerAddAction(t , function ItemTable000001_DropItems)
set d = CreateDestructable(0x4C547263 , 13248.0 , 8320.0 , 104.000 , 1.000 , 2)
set t = CreateTrigger()
call TriggerRegisterDeathEvent(t , d)
call TriggerAddAction(t , function SaveDyingWidget)
call TriggerAddAction(t , function ItemTable000001_DropItems)
set d = CreateDestructable(0x4C547263 , 11584.0 , 7296.0 , 355.346 , 1.000 , 2)
set t = CreateTrigger()
call TriggerRegisterDeathEvent(t , d)
call TriggerAddAction(t , function SaveDyingWidget)
call TriggerAddAction(t , function ItemTable000001_DropItems)
set d = CreateDestructable(0x4C547263 , 12416.0 , 8768.0 , 134.000 , 1.000 , 2)
set t = CreateTrigger()
call TriggerRegisterDeathEvent(t , d)
call TriggerAddAction(t , function SaveDyingWidget)
call TriggerAddAction(t , function ItemTable000001_DropItems)
endfunction
function CreateAllItems takes nothing returns nothing
local integer itemID
call CreateItem(0x49303034 , 177.8 , 375.0)
call CreateItem(0x49303034 , 216.5 , 408.9)
call CreateItem(0x49303034 , 174.0 , 408.0)
call CreateItem(0x49303034 , 212.5 , 376.0)
call CreateItem(0x49303035 , - 408.4 , 529.8)
call CreateItem(0x49303035 , - 370.7 , 532.8)
call CreateItem(0x49303036 , - 284.0 , 534.6)
call CreateItem(0x49303036 , - 252.1 , 537.7)
call CreateItem(0x49303037 , - 160.6 , 543.4)
call CreateItem(0x49303037 , - 128.4 , 542.6)
call CreateItem(0x49303038 , - 8.8 , 541.5)
call CreateItem(0x49303038 , - 41.0 , 538.3)
call CreateItem(0x49303039 , 106.1 , 534.6)
call CreateItem(0x49303039 , 72.2 , 531.4)
call CreateItem(0x49303041 , 195.7 , 542.3)
call CreateItem(0x49303041 , 228.4 , 545.5)
call CreateItem(0x49303042 , 318.7 , 539.2)
call CreateItem(0x49303042 , 355.8 , 540.3)
call CreateItem(0x49303044 , 78.7 , 380.4)
call CreateItem(0x49303044 , 116.2 , 378.1)
call CreateItem(0x49303044 , 79.8 , 414.6)
call CreateItem(0x49303044 , 112.4 , 413.5)
call CreateItem(0x49303045 , - 14.5 , 407.8)
call CreateItem(0x49303045 , 19.0 , 406.8)
call CreateItem(0x49303045 , - 11.3 , 375.2)
call CreateItem(0x49303045 , 21.9 , 374.5)
call CreateItem(0x49303048 , 292.1 , 383.3)
call CreateItem(0x49303048 , 324.1 , 414.4)
call CreateItem(0x49303048 , 290.5 , 418.5)
call CreateItem(0x49303048 , 324.4 , 382.3)
call CreateItem(0x49303049 , - 404.0 , 648.6)
call CreateItem(0x49303049 , - 368.1 , 649.8)
call CreateItem(0x4930304A , - 283.6 , 651.8)
call CreateItem(0x4930304A , - 247.5 , 646.7)
call CreateItem(0x4930304B , - 128.3 , 647.8)
call CreateItem(0x4930304B , - 161.3 , 646.6)
call CreateItem(0x4930304C , - 1.5 , 650.9)
call CreateItem(0x4930304C , - 36.1 , 649.7)
call CreateItem(0x4930304D , 84.1 , 659.2)
call CreateItem(0x4930304D , 117.1 , 658.4)
call CreateItem(0x4930304E , 357.8 , 657.6)
call CreateItem(0x4930304E , 325.1 , 651.8)
call CreateItem(0x4930304F , 207.9 , 653.7)
call CreateItem(0x4930304F , 243.7 , 652.8)
call CreateItem(0x49303050 , 442.2 , 659.9)
call CreateItem(0x49303050 , 474.5 , 659.0)
call CreateItem(0x49303051 , - 212.3 , 261.9)
call CreateItem(0x49303051 , - 189.9 , 293.7)
call CreateItem(0x49303052 , - 307.8 , 298.4)
call CreateItem(0x49303052 , - 326.8 , 270.9)
call CreateItem(0x49303053 , - 199.5 , 386.4)
call CreateItem(0x49303053 , - 177.7 , 418.6)
call CreateItem(0x49303054 , - 430.6 , 269.3)
call CreateItem(0x49303054 , - 408.5 , 293.5)
call CreateItem(0x49303055 , - 292.0 , 409.1)
call CreateItem(0x49303055 , - 312.4 , 383.4)
call CreateItem(0x49303056 , - 423.7 , 395.7)
call CreateItem(0x49303056 , - 400.8 , 419.3)
endfunction
function CreateUnitsForPlayer0 takes nothing returns nothing
local player p=Player(0)
local unit u
local integer unitID
local trigger t
local real life
set u = CreateUnit(p , 0x64305F33 , 2495.3 , 820.9 , 270.000)
set u = CreateUnit(p , 0x6830304C , - 342.4 , 872.2 , 305.041)
set u = CreateUnit(p , 0x64315F30 , 1956.1 , 517.9 , 270.000)
set u = CreateUnit(p , 0x64305F30 , 1961.3 , 814.8 , 270.000)
set u = CreateUnit(p , 0x64315F31 , 2168.8 , 520.2 , 270.000)
call SetUnitState(u , UNIT_STATE_MANA , 0)
set u = CreateUnit(p , 0x64305F32 , 2361.3 , 827.8 , 270.000)
call SetUnitColor(u , ConvertPlayerColor(12))
set u = CreateUnit(p , 0x64305F31 , 2175.0 , 814.3 , 270.000)
set u = CreateUnit(p , 0x64315F32 , 2357.6 , 534.5 , 270.000)
call SetUnitColor(u , ConvertPlayerColor(0))
set u = CreateUnit(p , 0x64315F33 , 2511.4 , 535.4 , 270.000)
set u = CreateUnit(p , 0x64335F30 , 1938.3 , - 161.3 , 270.000)
set u = CreateUnit(p , 0x64335F33 , 2533.5 , - 158.7 , 270.000)
set u = CreateUnit(p , 0x68303048 , 659.8 , 477.2 , 306.079)
set u = CreateUnit(p , 0x64325F30 , 1948.1 , 181.9 , 270.000)
set u = CreateUnit(p , 0x64325F31 , 2170.7 , 176.3 , 270.000)
set u = CreateUnit(p , 0x64325F32 , 2367.5 , - 155.9 , 270.000)
set u = CreateUnit(p , 0x64325F33 , 2519.0 , 187.2 , 270.000)
set u = CreateUnit(p , 0x6830304D , - 238.0 , 910.6 , 295.035)
set u = CreateUnit(p , 0x6830304E , - 133.9 , 920.3 , 285.468)
set u = CreateUnit(p , 0x68303044 , - 13.1 , 933.0 , 273.633)
set u = CreateUnit(p , 0x6830304F , 91.5 , 928.9 , 263.352)
set u = CreateUnit(p , 0x68303045 , 194.5 , 926.0 , 253.516)
set u = CreateUnit(p , 0x6830304A , 302.6 , 909.3 , 243.534)
set u = CreateUnit(p , 0x6830304B , 398.3 , 864.8 , 233.997)
set u = CreateUnit(p , 0x64335F32 , 2358.5 , 182.8 , 270.000)
set u = CreateUnit(p , 0x64335F31 , 2173.3 , - 152.6 , 270.000)
endfunction
function CreateUnitsForPlayer11 takes nothing returns nothing
local player p=Player(11)
local unit u
local integer unitID
local trigger t
local real life
set u = CreateUnit(p , 0x6E747267 , - 3815.1 , - 15236.9 , 350.420)
call IssueImmediateOrder(u , "Thornyshield")
set u = CreateUnit(p , 0x6E303041 , - 0.0 , 0.0 , 0.000)
call IssueImmediateOrder(u , "")
set u = CreateUnit(p , 0x64345F30 , 1941.6 , - 500.2 , 270.000)
set u = CreateUnit(p , 0x64345F33 , 2542.0 , - 477.7 , 166.909)
endfunction
function CreatePlayerBuildings takes nothing returns nothing
endfunction
function CreatePlayerUnits takes nothing returns nothing
call CreateUnitsForPlayer0()
call CreateUnitsForPlayer11()
endfunction
function CreateAllUnits takes nothing returns nothing
call CreatePlayerBuildings()
call CreatePlayerUnits()
endfunction
function CreateRegions takes nothing returns nothing
local weathereffect we
set gg_rct_Cave_East = Rect(13792.0 , 5760.0 , 13856.0 , 5920.0)
set gg_rct_Cave_West = Rect(13152.0 , 5632.0 , 13216.0 , 5792.0)
set gg_rct_Frozen_Lands = Rect(- 16384.0 , 2336.0 , - 2240.0 , 16384.0)
set gg_rct_Frozen_Lands_Heavy = Rect(- 16384.0 , 9184.0 , - 9184.0 , 16384.0)
set we = AddWeatherEffect(gg_rct_Frozen_Lands_Heavy , 0x534E6273)
call EnableWeatherEffect(we , true)
set gg_rct_Frozen_Lands_Light_1 = Rect(- 16384.0 , 448.0 , - 4416.0 , 4448.0)
set we = AddWeatherEffect(gg_rct_Frozen_Lands_Light_1 , 0x534E6C73)
call EnableWeatherEffect(we , true)
set gg_rct_Frozen_Lands_Light_2 = Rect(- 4448.0 , 4416.0 , - 448.0 , 16384.0)
set we = AddWeatherEffect(gg_rct_Frozen_Lands_Light_2 , 0x534E6C73)
call EnableWeatherEffect(we , true)
set gg_rct_Frozen_Lands_Medium_1 = Rect(- 16384.0 , 4416.0 , - 4416.0 , 9216.0)
set we = AddWeatherEffect(gg_rct_Frozen_Lands_Medium_1 , 0x534E6873)
call EnableWeatherEffect(we , true)
set gg_rct_Frozen_Lands_Medium_2 = Rect(- 9216.0 , 9184.0 , - 4416.0 , 16384.0)
set we = AddWeatherEffect(gg_rct_Frozen_Lands_Medium_2 , 0x534E6873)
call EnableWeatherEffect(we , true)
set gg_rct_Lost_Woods = Rect(- 10688.0 , - 11200.0 , - 6656.0 , - 7712.0)
set we = AddWeatherEffect(gg_rct_Lost_Woods , 0x4644776C)
call EnableWeatherEffect(we , true)
set gg_rct_Sunlight_01 = Rect(- 4544.0 , - 2912.0 , - 4352.0 , - 2720.0)
set we = AddWeatherEffect(gg_rct_Sunlight_01 , 0x4C526161)
call EnableWeatherEffect(we , true)
set gg_rct_Sunlight_02 = Rect(- 14592.0 , - 13696.0 , - 14400.0 , - 13504.0)
set we = AddWeatherEffect(gg_rct_Sunlight_02 , 0x4C526161)
call EnableWeatherEffect(we , true)
set gg_rct_Sunlight_03 = Rect(- 9760.0 , - 13632.0 , - 9568.0 , - 13440.0)
set we = AddWeatherEffect(gg_rct_Sunlight_03 , 0x4C526161)
call EnableWeatherEffect(we , true)
set gg_rct_Sunlight_04 = Rect(- 15136.0 , - 9344.0 , - 15008.0 , - 9216.0)
set we = AddWeatherEffect(gg_rct_Sunlight_04 , 0x4C526161)
call EnableWeatherEffect(we , true)
set gg_rct_Sunlight_05 = Rect(- 11424.0 , - 10976.0 , - 11264.0 , - 10816.0)
set we = AddWeatherEffect(gg_rct_Sunlight_05 , 0x4C526161)
call EnableWeatherEffect(we , true)
set gg_rct_Sunlight_06 = Rect(- 5088.0 , - 14784.0 , - 4832.0 , - 14496.0)
set we = AddWeatherEffect(gg_rct_Sunlight_06 , 0x4C526161)
call EnableWeatherEffect(we , true)
set gg_rct_Sunlight_07 = Rect(- 7232.0 , - 12640.0 , - 7072.0 , - 12480.0)
set we = AddWeatherEffect(gg_rct_Sunlight_07 , 0x4C526161)
call EnableWeatherEffect(we , true)
set gg_rct_Sunlight_08 = Rect(- 7680.0 , - 6656.0 , - 7488.0 , - 6464.0)
set we = AddWeatherEffect(gg_rct_Sunlight_08 , 0x4C526161)
call EnableWeatherEffect(we , true)
set gg_rct_Sunlight_09 = Rect(- 5088.0 , - 9248.0 , - 4928.0 , - 9088.0)
set we = AddWeatherEffect(gg_rct_Sunlight_09 , 0x4C526161)
call EnableWeatherEffect(we , true)
set gg_rct_Sunlight_10 = Rect(- 1920.0 , - 6720.0 , - 1760.0 , - 6560.0)
set we = AddWeatherEffect(gg_rct_Sunlight_10 , 0x4C526161)
call EnableWeatherEffect(we , true)
set gg_rct_Sunlight_11 = Rect(- 2240.0 , - 14656.0 , - 2112.0 , - 14528.0)
set we = AddWeatherEffect(gg_rct_Sunlight_11 , 0x4C526161)
call EnableWeatherEffect(we , true)
set gg_rct_Sunlight_12 = Rect(- 12768.0 , - 4512.0 , - 12672.0 , - 4416.0)
set we = AddWeatherEffect(gg_rct_Sunlight_12 , 0x4C526161)
call EnableWeatherEffect(we , true)
set gg_rct_Swamp_1 = Rect(2560.0 , - 8320.0 , 6624.0 , - 5664.0)
set we = AddWeatherEffect(gg_rct_Swamp_1 , 0x46446768)
call EnableWeatherEffect(we , true)
set gg_rct_Swamp_2 = Rect(2048.0 , - 7104.0 , 4064.0 , - 4640.0)
set we = AddWeatherEffect(gg_rct_Swamp_2 , 0x46446768)
call EnableWeatherEffect(we , true)
set gg_rct_Swamp_3 = Rect(5824.0 , - 6592.0 , 8384.0 , - 5152.0)
set we = AddWeatherEffect(gg_rct_Swamp_3 , 0x46446768)
call EnableWeatherEffect(we , true)
set gg_rct_Swamp_Lands = Rect(352.0 , - 16384.0 , 16384.0 , - 2944.0)
set gg_rct_Tropical_Lands = Rect(- 16000.0 , - 16384.0 , - 192.0 , - 832.0)
set gg_rct_Mountain_Lands = Rect(3168.0 , - 2752.0 , 16384.0 , 16384.0)
endfunction
function Sharing_Conditions takes nothing returns boolean
local string message=GetEventPlayerChatString()
local integer targeted_player_index=S2I(SubString(message , StringLength(message) , StringLength(message)))
if ( StringLength(GetEventPlayerChatString()) <= 10 ) then
return false
endif
if ( targeted_player_index + 1 == GetPlayerId(GetTriggerPlayer()) ) then
return false
endif
if ( targeted_player_index < 1 or targeted_player_index > 7 ) then
return false
endif
return true
endfunction
function Hit_Chance takes real distance,integer effectiveRange,integer accuracy returns real
if ( distance <= effectiveRange ) then
return accuracy
endif
if ( distance >= effectiveRange * 2 ) then
return 0
endif
return Cos(( distance - effectiveRange ) / ( effectiveRange * bj_PI / 10 )) * ( accuracy / 2 ) + ( accuracy / 2 )
endfunction
function Trig_Mountain_Cave_Conditions takes nothing returns boolean
return IsUnitType(GetTriggerUnit() , UNIT_TYPE_GROUND)
endfunction
function Trig_Mountain_Cave_Actions takes nothing returns nothing
local location temp
call TriggerSleepAction(0.30)
call ShowUnit(GetTriggerUnit() , false)
call TriggerSleepAction(1.20)
call ShowUnit(GetTriggerUnit() , true)
if ( RectContainsLoc(gg_rct_Cave_West , GetUnitLoc(GetTriggerUnit())) ) then
set temp = Location(GetRectCenterX(gg_rct_Cave_East) + 150 , GetRectCenterY(gg_rct_Cave_East))
call SetUnitPositionLocFacingBJ(GetTriggerUnit() , temp , 350)
else
set temp = Location(GetRectCenterX(gg_rct_Cave_West) - 150 , GetRectCenterY(gg_rct_Cave_West))
call SetUnitPositionLocFacingBJ(GetTriggerUnit() , temp , 200)
endif
call SelectUnitForPlayerSingle(GetTriggerUnit() , GetOwningPlayer(GetTriggerUnit()))
call RemoveLocation(temp)
set temp = null
endfunction
function InitTrig_Mountain_Cave takes nothing returns nothing
local trigger t=CreateTrigger()
call TriggerRegisterEnterRectSimple(t , gg_rct_Cave_West)
call TriggerRegisterEnterRectSimple(t , gg_rct_Cave_East)
call TriggerAddCondition(t , Condition(function Trig_Mountain_Cave_Conditions))
call TriggerAddAction(t , function Trig_Mountain_Cave_Actions)
endfunction
function Drop_Tools takes nothing returns nothing
if ( GetOwningPlayer(GetEnumUnit()) == GetTriggerPlayer() ) then
call UnitRemoveAbility(GetEnumUnit() , 0x41303039)
call DisplayTimedTextToPlayer(GetLocalPlayer() , 0 , 0 , 3 , "Dropped tools. Type -pickup or -tools to pick them up again.")
endif
endfunction
function Pickup_Tools takes nothing returns nothing
if ( GetOwningPlayer(GetEnumUnit()) == GetTriggerPlayer() ) then
call UnitAddAbility(GetEnumUnit() , 0x41303039)
call DisplayTimedTextToPlayer(GetLocalPlayer() , 0 , 0 , 3 , "Picked up tools. Type -drop to drop them again.")
endif
endfunction
function Pickup_Drop_Tools_Actions takes nothing returns nothing
local string message=GetEventPlayerChatString()
if ( message == "-drop" ) then
call ForGroup(SURVIVORS , function Drop_Tools)
else
call ForGroup(SURVIVORS , function Pickup_Tools)
endif
endfunction
function InitTrig_Pickup_Drop_Tools takes nothing returns nothing
local trigger t=CreateTrigger()
call TriggerRegisterPlayerChatEvent(t , Player(0) , "-pickup" , true)
call TriggerRegisterPlayerChatEvent(t , Player(1) , "-pickup" , true)
call TriggerRegisterPlayerChatEvent(t , Player(2) , "-pickup" , true)
call TriggerRegisterPlayerChatEvent(t , Player(3) , "-pickup" , true)
call TriggerRegisterPlayerChatEvent(t , Player(4) , "-pickup" , true)
call TriggerRegisterPlayerChatEvent(t , Player(5) , "-pickup" , true)
call TriggerRegisterPlayerChatEvent(t , Player(6) , "-pickup" , true)
call TriggerRegisterPlayerChatEvent(t , Player(0) , "-tools" , true)
call TriggerRegisterPlayerChatEvent(t , Player(1) , "-tools" , true)
call TriggerRegisterPlayerChatEvent(t , Player(2) , "-tools" , true)
call TriggerRegisterPlayerChatEvent(t , Player(3) , "-tools" , true)
call TriggerRegisterPlayerChatEvent(t , Player(4) , "-tools" , true)
call TriggerRegisterPlayerChatEvent(t , Player(5) , "-tools" , true)
call TriggerRegisterPlayerChatEvent(t , Player(6) , "-tools" , true)
call TriggerRegisterPlayerChatEvent(t , Player(0) , "-drop" , true)
call TriggerRegisterPlayerChatEvent(t , Player(1) , "-drop" , true)
call TriggerRegisterPlayerChatEvent(t , Player(2) , "-drop" , true)
call TriggerRegisterPlayerChatEvent(t , Player(3) , "-drop" , true)
call TriggerRegisterPlayerChatEvent(t , Player(4) , "-drop" , true)
call TriggerRegisterPlayerChatEvent(t , Player(5) , "-drop" , true)
call TriggerRegisterPlayerChatEvent(t , Player(6) , "-drop" , true)
call TriggerAddAction(t , function Pickup_Drop_Tools_Actions)
endfunction
function pingTriggeringPlayerMap takes real x,real y returns nothing
if ( GetTriggerPlayer() == GetLocalPlayer() ) then
call PingMinimap(GetLocationX(MAP_CENTER) + x , GetLocationY(MAP_CENTER) + y , 10)
endif
endfunction
function Trig_Ping_Base_Actions takes nothing returns nothing
call pingTriggeringPlayerMap(- 12700 , - 15150)
call pingTriggeringPlayerMap(- 14000 , - 11250)
call pingTriggeringPlayerMap(- 14800 , - 9800)
call pingTriggeringPlayerMap(- 8500 , - 14200)
call pingTriggeringPlayerMap(- 3000 , - 9000)
call pingTriggeringPlayerMap(- 3000 , - 13800)
call pingTriggeringPlayerMap(- 7000 , - 3800)
call pingTriggeringPlayerMap(- 3800 , - 700)
call pingTriggeringPlayerMap(10000 , 7000)
call pingTriggeringPlayerMap(13050 , 9050)
call pingTriggeringPlayerMap(12500 , 5500)
call pingTriggeringPlayerMap(14500 , 2600)
call pingTriggeringPlayerMap(14000 , - 1500)
call pingTriggeringPlayerMap(10800 , - 200)
call pingTriggeringPlayerMap(600 , - 7000)
call pingTriggeringPlayerMap(1700 , - 11000)
endfunction
function InitTrig_Ping_Base takes nothing returns nothing
local trigger t=CreateTrigger()
call TriggerRegisterPlayerChatEvent(t , Player(0) , "-base" , true)
call TriggerRegisterPlayerChatEvent(t , Player(1) , "-base" , true)
call TriggerRegisterPlayerChatEvent(t , Player(2) , "-base" , true)
call TriggerRegisterPlayerChatEvent(t , Player(3) , "-base" , true)
call TriggerRegisterPlayerChatEvent(t , Player(4) , "-base" , true)
call TriggerRegisterPlayerChatEvent(t , Player(5) , "-base" , true)
call TriggerRegisterPlayerChatEvent(t , Player(6) , "-base" , true)
call TriggerAddAction(t , function Trig_Ping_Base_Actions)
endfunction
function Part_Share_Actions takes nothing returns nothing
local string message=GetEventPlayerChatString()
local player targeted_player=Player(S2I(SubString(message , StringLength(message) , StringLength(message))) - 1)
local player triggering_player=GetTriggerPlayer()
call SetPlayerAlliance(triggering_player , targeted_player , ALLIANCE_SHARED_CONTROL , true)
call SetPlayerAlliance(triggering_player , targeted_player , ALLIANCE_SHARED_ADVANCED_CONTROL , false)
call DisplayTimedTextToPlayer(triggering_player , 0 , 0 , 5 , "Partial unit sharing privileges granted to " + GetPlayerName(targeted_player) + ".")
call DisplayTimedTextToPlayer(targeted_player , 0 , 0 , 5 , GetPlayerName(triggering_player) + " has granted you partial unit sharing privileges.")
endfunction
function InitTrig_Part_Share takes nothing returns nothing
local trigger t=CreateTrigger()
local integer player_num=0
loop
exitwhen not ( player_num < 7 )
call TriggerRegisterPlayerChatEvent(t , Player(player_num) , "-share " , false)
call TriggerRegisterPlayerChatEvent(t , Player(player_num) , "-pshare " , false)
set player_num = player_num + 1
endloop
call TriggerAddCondition(t , Condition(function Sharing_Conditions))
call TriggerAddAction(t , function Part_Share_Actions)
endfunction
function Full_Share_Actions takes nothing returns nothing
local string message=GetEventPlayerChatString()
local player targeted_player=Player(S2I(SubString(message , StringLength(message) , StringLength(message))) - 1)
local player triggering_player=GetTriggerPlayer()
call SetPlayerAlliance(triggering_player , targeted_player , ALLIANCE_SHARED_CONTROL , true)
call SetPlayerAlliance(triggering_player , targeted_player , ALLIANCE_SHARED_ADVANCED_CONTROL , true)
call DisplayTimedTextToPlayer(triggering_player , 0 , 0 , 5.00 , "Full unit sharing privileges granted to " + GetPlayerName(targeted_player) + ".")
call DisplayTimedTextToPlayer(targeted_player , 0 , 0 , 5.00 , GetPlayerName(triggering_player) + " has granted you full unit sharing privileges.")
endfunction
function InitTrig_Full_Share takes nothing returns nothing
local trigger t=CreateTrigger()
local integer player_num=0
loop
exitwhen not ( player_num < 7 )
call TriggerRegisterPlayerChatEvent(t , Player(player_num) , "-fshare " , false)
set player_num = player_num + 1
endloop
call TriggerAddCondition(t , Condition(function Sharing_Conditions))
call TriggerAddAction(t , function Full_Share_Actions)
endfunction
function Unshare_Actions takes nothing returns nothing
local string message=GetEventPlayerChatString()
local player targeted_player=Player(S2I(SubString(message , StringLength(message) , StringLength(message))) - 1)
local player triggering_player=GetTriggerPlayer()
call SetPlayerAlliance(triggering_player , targeted_player , ALLIANCE_SHARED_CONTROL , false)
call SetPlayerAlliance(triggering_player , targeted_player , ALLIANCE_SHARED_ADVANCED_CONTROL , false)
call DisplayTimedTextToPlayer(triggering_player , 0 , 0 , 5.00 , "Unit sharing privileges withdrawn from " + GetPlayerName(targeted_player) + ".")
call DisplayTimedTextToPlayer(targeted_player , 0 , 0 , 5.00 , GetPlayerName(triggering_player) + " has withdrawn your unit sharing privileges.")
endfunction
function InitTrig_Unshare takes nothing returns nothing
local trigger t=CreateTrigger()
local integer player_num=0
loop
exitwhen not ( player_num < 7 )
call TriggerRegisterPlayerChatEvent(t , Player(player_num) , "-unshare " , false)
set player_num = player_num + 1
endloop
call TriggerAddCondition(t , Condition(function Sharing_Conditions))
call TriggerAddAction(t , function Unshare_Actions)
endfunction
// scope survivor begins
function s__survivor_survivor_create takes unit u returns integer
local integer data=s__survivor_survivor__allocate()
set s__survivor_survivor_surv[data]=u
set s__survivor_survivor_killCounter[data]=0
return data
endfunction
function s__survivor_survivor_killedUnit takes integer this returns nothing
set s__survivor_survivor_killCounter[this]=s__survivor_survivor_killCounter[this] + 1
endfunction
// scope survivor ends
function Survivor_Death_Conditions takes nothing returns boolean
return GetUnitTypeId(GetTriggerUnit()) == SURVIVOR_UNIT_TYPE
endfunction
function Survivor_Death_Actions takes nothing returns nothing
call GroupRemoveUnit(SURVIVORS , GetTriggerUnit())
if ( IsUnitGroupEmptyBJ(SURVIVORS) ) then
call DisplayTimedTextToPlayer(GetLocalPlayer() , 0 , 0 , 20 , "Everybody loose.")
call PauseTimer(ANGER_TIMER)
call PauseTimer(LEVEL_TIMER)
call PauseTimer(END_TIMER)
call FogEnable(false)
call FogMaskEnable(false)
else
call DisplayTimedTextToPlayer(GetLocalPlayer() , 0 , 0 , 10 , GetPlayerName(GetOwningPlayer(GetTriggerUnit())) + " loost.")
endif
endfunction
function InitTrig_Survivor_Death takes nothing returns nothing
local trigger t=CreateTrigger()
call TriggerRegisterPlayerUnitEvent(t , Player(0) , EVENT_PLAYER_UNIT_DEATH , null)
call TriggerRegisterPlayerUnitEvent(t , Player(1) , EVENT_PLAYER_UNIT_DEATH , null)
call TriggerRegisterPlayerUnitEvent(t , Player(2) , EVENT_PLAYER_UNIT_DEATH , null)
call TriggerRegisterPlayerUnitEvent(t , Player(3) , EVENT_PLAYER_UNIT_DEATH , null)
call TriggerRegisterPlayerUnitEvent(t , Player(4) , EVENT_PLAYER_UNIT_DEATH , null)
call TriggerRegisterPlayerUnitEvent(t , Player(5) , EVENT_PLAYER_UNIT_DEATH , null)
call TriggerRegisterPlayerUnitEvent(t , Player(6) , EVENT_PLAYER_UNIT_DEATH , null)
call TriggerAddCondition(t , Condition(function Survivor_Death_Conditions))
call TriggerAddAction(t , function Survivor_Death_Actions)
endfunction
function Begin_Spawn_Actions takes nothing returns nothing
set DINO_LEVEL = 0
set DINO_ANGER = 0
call DisplayTimedTextToPlayer(GetLocalPlayer() , 0 , 0 , 5 , "The dinosaurs approach...")
call EnableTrigger(SPAWN_TRIGGER)
call EnableTrigger(MOVE_TRIGGER)
call TimerStart(LEVEL_TIMER , 180 + ( 20 * DIFFICULTY ) , true , null)
call TimerStart(ANGER_TIMER , 115 + ( 15 * DIFFICULTY ) , true , null)
call DestroyTrigger(GetTriggeringTrigger())
endfunction
function InitTrig_Begin_Spawn takes nothing returns nothing
local trigger t=CreateTrigger()
call TriggerRegisterTimerExpireEvent(t , START_TIMER)
call TriggerAddAction(t , function Begin_Spawn_Actions)
endfunction
function Anger_Loop_Actions takes nothing returns nothing
set DINO_ANGER = DINO_ANGER + 1
call DisplayTimedTextToPlayer(GetLocalPlayer() , 0 , 0 , 5 , "The dinosaurs have grown more ferocious... (Ferocity " + I2S(DINO_ANGER) + ")")
endfunction
function InitTrig_Anger_Loop takes nothing returns nothing
local trigger t=CreateTrigger()
call TriggerRegisterTimerExpireEvent(t , ANGER_TIMER)
call TriggerAddAction(t , function Anger_Loop_Actions)
endfunction
function Level_Loop_Actions takes nothing returns nothing
set DINO_LEVEL = DINO_LEVEL + 1
call DisplayTimedTextToPlayer(GetLocalPlayer() , 0 , 0 , 5 , "Larger dinosaurs are approaching... (Level " + I2S(DINO_LEVEL) + ")")
endfunction
function InitTrig_Level_Loop takes nothing returns nothing
local trigger t=CreateTrigger()
call TriggerRegisterTimerExpireEvent(t , LEVEL_TIMER)
call TriggerAddAction(t , function Level_Loop_Actions)
endfunction
// scope SpawnLoop begins
function Proximity_Check takes nothing returns boolean
local real x_diff_sqrd=Pow(GetLocationX(SpawnLoop__spawn_point) - GetLocationX(SpawnLoop__survivor_location) , 2)
local real y_diff_sqrd=Pow(GetLocationY(SpawnLoop__spawn_point) - GetLocationY(SpawnLoop__survivor_location) , 2)
return SquareRoot(x_diff_sqrd + y_diff_sqrd) >= SPAWN_MIN_DIST
endfunction
function Verify_Point takes nothing returns nothing
if ( SpawnLoop__spawn_point != null and not Proximity_Check() ) then
set SPAWN_MAX_DIST = SPAWN_MAX_DIST * 0.96 + 200
call RemoveLocation(SpawnLoop__spawn_point)
set SpawnLoop__spawn_point = null
endif
endfunction
function Spawn_Dinosaur takes nothing returns nothing
local boolean pathable
local integer dino_type=GetRandomInt(1 , 100)
local integer i=0
local unit dino
set SpawnLoop__survivor_location = GetUnitLoc(GetEnumUnit())
set SPAWN_MAX_DIST = SPAWN_MIN_DIST + 3000
loop
set SpawnLoop__spawn_point = PolarProjectionBJ(SpawnLoop__survivor_location , GetRandomReal(SPAWN_MIN_DIST , SPAWN_MAX_DIST) , GetRandomReal(0 , 359))
set pathable = IsTerrainPathable(GetLocationX(SpawnLoop__spawn_point) , GetLocationY(SpawnLoop__spawn_point) , PATHING_TYPE_WALKABILITY)
set pathable = pathable and RectContainsCoords(WHOLE_MAP , GetLocationX(SpawnLoop__spawn_point) , GetLocationY(SpawnLoop__spawn_point))
if ( pathable ) then
call ForGroup(SURVIVORS , function Verify_Point)
exitwhen SpawnLoop__spawn_point != null
endif
set SPAWN_MAX_DIST = SPAWN_MAX_DIST * 0.96 + 200
endloop
call RemoveLocation(SpawnLoop__survivor_location)
set SpawnLoop__survivor_location = null
loop
exitwhen not ( dino_type > LoadInteger(s__DINO_TABLE[DINO_LEVEL] , i , 0) )
set dino_type = dino_type - ( LoadInteger(s__DINO_TABLE[DINO_LEVEL] , i , 0) )
set i = i + 1
endloop
set dino = CreateUnitAtLoc(Player(11) , LoadInteger(s__DINO_TABLE[DINO_LEVEL] , i , 1) , SpawnLoop__spawn_point , GetRandomReal(0 , 360))
call RemoveGuardPosition(dino)
call GroupAddUnit(DINOSAUR_GROUPS[GetPlayerId(GetOwningPlayer(GetEnumUnit()))] , dino)
set dino = null
call RemoveLocation(SpawnLoop__spawn_point)
set SpawnLoop__spawn_point = null
endfunction
function Spawn_Loop_Actions takes nothing returns nothing
call ForGroup(SURVIVORS , function Spawn_Dinosaur)
endfunction
// scope SpawnLoop ends
function InitTrig_Spawn_Loop takes nothing returns nothing
set SPAWN_TRIGGER = CreateTrigger()
call DisableTrigger(SPAWN_TRIGGER)
call TriggerRegisterTimerEvent(SPAWN_TRIGGER , 5 , true)
call TriggerAddAction(SPAWN_TRIGGER , function Spawn_Loop_Actions)
endfunction
// scope MoveLoop begins
function Move_Dinosaur takes nothing returns nothing
local location survivor_location
local location dino_location
local real distance
local location destination
set dino = GetEnumUnit()
set survivor_location = GetUnitLoc(survivor)
set dino_location = GetUnitLoc(dino)
set distance = DistanceBetweenPoints(dino_location , survivor_location)
set destination = PolarProjectionBJ(dino_location , distance * DIST_MULT , AngleBetweenPoints(dino_location , survivor_location))
set destination = PolarProjectionBJ(destination , RAND_RADIUS , GetRandomInt(0 , 360))
call IssuePointOrderLoc(dino , "attack" , destination)
call RemoveLocation(survivor_location)
call RemoveLocation(dino_location)
call RemoveLocation(destination)
set survivor_location = null
set dino_location = null
set destination = null
endfunction
function Move_Survivors_Dinosaurs takes nothing returns nothing
local group dinosaurs
set survivor = GetEnumUnit()
set dinosaurs = DINOSAUR_GROUPS[GetPlayerId(GetOwningPlayer(survivor))]
call ForGroup(dinosaurs , function Move_Dinosaur)
endfunction
function Move_All_Dinosaurs takes nothing returns nothing
call ForGroup(SURVIVORS , function Move_Survivors_Dinosaurs)
endfunction
function InitTrig_Move_Loop takes nothing returns nothing
set MOVE_TRIGGER = CreateTrigger()
call DisableTrigger(MOVE_TRIGGER)
call TriggerRegisterTimerEvent(MOVE_TRIGGER , MOVE_FREQUENCY , true)
call TriggerAddAction(MOVE_TRIGGER , function Move_All_Dinosaurs)
endfunction
// scope MoveLoop ends
function Item_Scatter_Actions takes nothing returns nothing
local location temp
local integer i=0
loop
exitwhen not ( i < 100 )
set temp = GetRandomLocInRect(WHOLE_MAP)
call CreateItemLoc(0x49303031 , temp)
call RemoveLocation(temp)
set i = i + 1
endloop
set i = 0
loop
exitwhen not ( i < 100 )
set temp = GetRandomLocInRect(WHOLE_MAP)
call CreateItem(0x49303030 , GetLocationX(temp) , GetLocationY(temp))
call RemoveLocation(temp)
set i = i + 1
endloop
set temp = null
call DestroyTrigger(GetTriggeringTrigger())
endfunction
function InitTrig_Item_Scatter takes nothing returns nothing
local trigger t=CreateTrigger()
call TriggerRegisterTimerEvent(t , 0.01 , false)
call TriggerAddAction(t , function Item_Scatter_Actions)
endfunction
function Setup_Spawning_Table takes nothing returns nothing
local integer VAL=0
local integer KEY=1
local hashtable temp=InitHashtable()
call SaveInteger(temp , 0 , VAL , 32)
call SaveInteger(temp , 1 , VAL , 40)
call SaveInteger(temp , 2 , VAL , 14)
call SaveInteger(temp , 3 , VAL , 14)
call SaveInteger(temp , 0 , KEY , 0x64305F30)
call SaveInteger(temp , 1 , KEY , 0x64305F31)
call SaveInteger(temp , 2 , KEY , 0x64305F32)
call SaveInteger(temp , 3 , KEY , 0x64305F33)
set s__DINO_TABLE[0]= temp
set temp = InitHashtable()
call SaveInteger(temp , 0 , VAL , 32)
call SaveInteger(temp , 1 , VAL , 32)
call SaveInteger(temp , 2 , VAL , 18)
call SaveInteger(temp , 3 , VAL , 18)
call SaveInteger(temp , 0 , KEY , 0x64315F30)
call SaveInteger(temp , 1 , KEY , 0x64315F31)
call SaveInteger(temp , 2 , KEY , 0x64315F32)
call SaveInteger(temp , 3 , KEY , 0x64315F33)
set s__DINO_TABLE[1]= temp
set temp = InitHashtable()
call SaveInteger(temp , 0 , VAL , 32)
call SaveInteger(temp , 1 , VAL , 32)
call SaveInteger(temp , 2 , VAL , 18)
call SaveInteger(temp , 3 , VAL , 18)
call SaveInteger(temp , 0 , KEY , 0x64325F30)
call SaveInteger(temp , 1 , KEY , 0x64325F31)
call SaveInteger(temp , 2 , KEY , 0x64325F32)
call SaveInteger(temp , 3 , KEY , 0x64325F33)
set s__DINO_TABLE[2]= temp
set temp = InitHashtable()
call SaveInteger(temp , 0 , VAL , 30)
call SaveInteger(temp , 1 , VAL , 25)
call SaveInteger(temp , 2 , VAL , 25)
call SaveInteger(temp , 3 , VAL , 20)
call SaveInteger(temp , 0 , KEY , 0x64335F30)
call SaveInteger(temp , 1 , KEY , 0x64335F31)
call SaveInteger(temp , 2 , KEY , 0x64335F32)
call SaveInteger(temp , 3 , KEY , 0x64335F33)
set s__DINO_TABLE[3]= temp
set temp = InitHashtable()
call SaveInteger(temp , 0 , VAL , 25)
call SaveInteger(temp , 1 , VAL , 25)
call SaveInteger(temp , 2 , VAL , 25)
call SaveInteger(temp , 3 , VAL , 25)
call SaveInteger(temp , 0 , KEY , 0x64345F30)
call SaveInteger(temp , 1 , KEY , 0x64345F31)
call SaveInteger(temp , 2 , KEY , 0x64345F32)
call SaveInteger(temp , 3 , KEY , 0x64345F33)
set s__DINO_TABLE[4]= temp
set temp = null
endfunction
function InitTrig_Spawning_Table takes nothing returns nothing
local trigger t=CreateTrigger()
call TriggerAddAction(t , function Setup_Spawning_Table)
call TriggerRegisterTimerEvent(t , 0 , false)
endfunction
function Player_Definition takes nothing returns boolean
return ( GetPlayerController(GetFilterPlayer()) == MAP_CONTROL_USER ) and ( GetPlayerSlotState(GetFilterPlayer()) == PLAYER_SLOT_STATE_PLAYING )
endfunction
function Player_Setup takes nothing returns nothing
local location spawnpoint=PolarProjectionBJ(MAP_CENTER , GetRandomInt(0 , 300) , GetRandomInt(0 , 360))
local unit survivor=CreateUnitAtLoc(GetEnumPlayer() , SURVIVOR_UNIT_TYPE , spawnpoint , GetRandomInt(0 , 360))
call RemoveLocation(spawnpoint)
set spawnpoint = null
call GroupAddUnit(SURVIVORS , survivor)
if ( GetLocalPlayer() == GetEnumPlayer() ) then
call ClearSelection()
call SelectUnit(survivor , true)
endif
set survivor = null
set DINOSAUR_GROUPS[GetPlayerId(GetEnumPlayer())]=CreateGroup()
call SetPlayerState(GetEnumPlayer() , PLAYER_STATE_GOLD_GATHERED , 1000)
call SetPlayerState(GetEnumPlayer() , PLAYER_STATE_LUMBER_GATHERED , 1000)
endfunction
function Init_Actions takes nothing returns nothing
local boolexpr conditions
call StopMusic(false)
call PauseGame(true)
set conditions = Condition(function Player_Definition)
call ForceEnumPlayers(PLAYERS , conditions)
call DestroyBoolExpr(conditions)
set conditions = null
set WHOLE_MAP = bj_mapInitialPlayableArea
set MAP_CENTER = Location(GetRectCenterX(WHOLE_MAP) , GetRectCenterY(WHOLE_MAP))
call SetPlayerState(Player(11) , PLAYER_STATE_GIVES_BOUNTY , 1)
call ForForce(PLAYERS , function Player_Setup)
call DisplayTimedTextToPlayer(GetLocalPlayer() , 0 , 0 , 1 , "Red is deciding on difficulty...")
call DialogSetMessage(DIFFICULTY_MENU , "- |c00ff0000Select Difficulty|r -")
set DIFFICULTY_BUTTONS[0]=DialogAddButton(DIFFICULTY_MENU , "|c0066ff33EASY|r" , 0)
set DIFFICULTY_BUTTONS[1]=DialogAddButton(DIFFICULTY_MENU , "|c00ffff00MEDIUM|r" , 0)
set DIFFICULTY_BUTTONS[2]=DialogAddButton(DIFFICULTY_MENU , "|c00ff9900HARD|r" , 0)
set DIFFICULTY_BUTTONS[3]=DialogAddButton(DIFFICULTY_MENU , "|c00ff0000JURASSIC|r" , 0)
call DialogDisplay(Player(0) , DIFFICULTY_MENU , true)
call DestroyTrigger(GetTriggeringTrigger())
endfunction
function InitTrig_Init takes nothing returns nothing
local trigger t=CreateTrigger()
call TriggerAddAction(t , function Init_Actions)
call TriggerRegisterTimerEvent(t , 0 , false)
endfunction
function Game_Start_Actions takes nothing returns nothing
local integer difficulty_num=4
local integer i=0
local location temp
local unit helicopter
local timerdialog timerdiag
loop
exitwhen not ( i <= difficulty_num )
if ( GetClickedButton() == DIFFICULTY_BUTTONS[i] ) then
set DIFFICULTY = i
set DIFFICULTY_BUTTONS[i]=null
endif
set i = i + 1
endloop
call DialogDestroy(DIFFICULTY_MENU)
set DIFFICULTY_MENU = null
call PauseGame(false)
set temp = Location(GetLocationX(MAP_CENTER) , GetLocationY(MAP_CENTER) + 50)
set helicopter = CreateUnitAtLoc(Player(PLAYER_NEUTRAL_PASSIVE) , 0x6E303039 , temp , 0)
call KillUnit(helicopter)
call RemoveLocation(temp)
set helicopter = null
set temp = null
call StartSound(gg_snd_Welcome)
if ( GetRandomInt(1 , 100) <= 5 ) then
call SetSoundPitch(gg_snd_Welcome , 0.7)
endif
set SPAWN_MIN_DIST = 1000 - 150 * DIFFICULTY
call DisplayTimedTextToPlayer(GetLocalPlayer() , 0 , 0 , 10 , "Game Difficulty: " + I2S(DIFFICULTY + 1) + "/" + I2S(difficulty_num))
call DisplayTimedTextToPlayer(GetLocalPlayer() , 0 , 0 , 10 , "Time to Survive: " + I2S(30 + 10 * DIFFICULTY) + " minutes")
call DisplayTimedTextToPlayer(GetLocalPlayer() , 0 , 0 , 10 , "Period of Grace: " + I2S(60 - 12 * DIFFICULTY) + " seconds")
call DisplayTimedTextToPlayer(GetLocalPlayer() , 0 , 0 , 10 , "Min Dino Spawn Distance: " + R2S(SPAWN_MIN_DIST) + " units")
call TimerStart(END_TIMER , 1800 + 600 * DIFFICULTY , false , null)
set timerdiag = CreateTimerDialog(END_TIMER)
call TimerDialogSetTitle(timerdiag , "Time until rescue")
call TimerDialogDisplay(timerdiag , true)
set timerdiag = null
call TimerStart(START_TIMER , 60 - 12 * DIFFICULTY , false , null)
call DestroyTrigger(GetTriggeringTrigger())
endfunction
function InitTrig_Game_Start takes nothing returns nothing
local trigger t=CreateTrigger()
call TriggerRegisterDialogEvent(t , DIFFICULTY_MENU)
call TriggerAddAction(t , function Game_Start_Actions)
endfunction
// scope dinosaur begins
function s__dinosaur_dinosaur_init takes integer this returns nothing
endfunction
function s__dinosaur_dinosaur_move takes integer this returns nothing
endfunction
function s__dinosaur_dinosaur_getLocation takes integer this returns location
set s__dinosaur_dinosaur_pos[this]=GetUnitLoc(s__dinosaur_dinosaur_s[this])
return s__dinosaur_dinosaur_pos[this]
endfunction
// scope dinosaur ends
function Scout_Tower_Conditions takes nothing returns boolean
return GetUnitTypeId(GetTriggerUnit()) == 0x68303033
endfunction
function Scout_Tower_Actions takes nothing returns nothing
local unit triggering_unit=GetTriggerUnit()
local location vis_location
local fogmodifier fogmod
local integer i=0
local integer j=0
loop
exitwhen not ( i <= 11 )
call TriggerSleepAction(0.1)
loop
exitwhen not ( j <= 10 )
call DestroyFogModifier(LoadFogModifierHandle(FOGMODS , GetHandleId(triggering_unit) , j))
set vis_location = PolarProjectionBJ(GetUnitLoc(triggering_unit) , 80 * j , GetUnitFacing(triggering_unit))
set fogmod = CreateFogModifierRadiusLoc(GetOwningPlayer(triggering_unit) , FOG_OF_WAR_VISIBLE , vis_location , 275 + j * 15 , true , false)
call FogModifierStart(fogmod)
call SaveFogModifierHandle(FOGMODS , GetHandleId(triggering_unit) , j , fogmod)
call RemoveLocation(vis_location)
set j = j + 1
endloop
set i = i + 1
endloop
set triggering_unit = null
set vis_location = null
set fogmod = null
endfunction
function InitTrig_Scout_Tower takes nothing returns nothing
local trigger t=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(t , EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER)
call TriggerRegisterAnyUnitEventBJ(t , EVENT_PLAYER_UNIT_CONSTRUCT_FINISH)
call TriggerAddCondition(t , Condition(function Scout_Tower_Conditions))
call TriggerAddAction(t , function Scout_Tower_Actions)
endfunction
function Scout_Tower_Stop_Conditions takes nothing returns boolean
local integer triggering_unit_ID=GetUnitTypeId(GetTriggerUnit())
if ( triggering_unit_ID == 0x68303033 or triggering_unit_ID == 0x68303034 ) then
return true
endif
return false
endfunction
function Scout_Tower_Stop_Actions takes nothing returns nothing
local integer i=0
loop
exitwhen not ( i <= 10 )
call DestroyFogModifier(LoadFogModifierHandle(FOGMODS , GetHandleId(GetTriggerUnit()) , i))
set i = i + 1
endloop
endfunction
function InitTrig_Scout_Tower_Stop takes nothing returns nothing
local trigger t=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(t , EVENT_PLAYER_UNIT_UPGRADE_FINISH)
call TriggerRegisterAnyUnitEventBJ(t , EVENT_PLAYER_UNIT_DEATH)
call TriggerAddCondition(t , Condition(function Scout_Tower_Stop_Conditions))
call TriggerAddAction(t , function Scout_Tower_Stop_Actions)
endfunction
function Tent_Init_Conditions takes nothing returns boolean
return GetUnitTypeId(GetTriggerUnit()) == 0x6E303032
endfunction
function Tent_Init_Actions takes nothing returns nothing
if ( RectContainsCoords(gg_rct_Frozen_Lands , GetUnitX(GetTriggerUnit()) , GetUnitY(GetTriggerUnit())) ) then
call ReplaceUnitBJ(GetTriggerUnit() , 0x6E303037 , bj_UNIT_STATE_METHOD_ABSOLUTE)
call UnitAddAbility(bj_lastReplacedUnit , 0x4172676C)
else
call UnitAddAbility(GetTriggerUnit() , 0x4172676C)
endif
endfunction
function InitTrig_Tent_Init takes nothing returns nothing
local trigger t=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(t , EVENT_PLAYER_UNIT_CONSTRUCT_FINISH)
call TriggerAddCondition(t , Condition(function Tent_Init_Conditions))
call TriggerAddAction(t , function Tent_Init_Actions)
endfunction
function MineSite_Blight_Conditions takes nothing returns boolean
return GetUnitTypeId(GetTriggerUnit()) == 0x6E303033
endfunction
function MineSite_Blight_Actions takes nothing returns nothing
local location tempLocation=GetUnitLoc(GetTriggerUnit())
local rect tempRect=RectFromCenterSizeBJ(tempLocation , 256 , 256)
call SetBlightRect(GetOwningPlayer(GetTriggerUnit()) , tempRect , true)
call RemoveRect(tempRect)
call RemoveLocation(tempLocation)
set tempRect = null
set tempLocation = null
endfunction
function InitTrig_MineSite_Blight takes nothing returns nothing
local trigger t=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(t , EVENT_PLAYER_UNIT_CONSTRUCT_FINISH)
call TriggerAddCondition(t , Condition(function MineSite_Blight_Conditions))
call TriggerAddAction(t , function MineSite_Blight_Actions)
endfunction
function DMineSite_Blight_Conditions takes nothing returns boolean
return GetUnitTypeId(GetTriggerUnit()) == 0x6E303034
endfunction
function DMineSite_Blight_Actions takes nothing returns nothing
local location tempLocation=OffsetLocation(GetUnitLoc(GetTriggerUnit()) , 64 , - 64)
local rect tempRect=RectFromCenterSizeBJ(tempLocation , 384 , 384)
call SetBlightRect(GetOwningPlayer(GetTriggerUnit()) , tempRect , true)
call RemoveRect(tempRect)
call RemoveLocation(tempLocation)
set tempRect = null
set tempLocation = null
endfunction
function InitTrig_DMineSite_Blight takes nothing returns nothing
local trigger t=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(t , EVENT_PLAYER_UNIT_UPGRADE_FINISH)
call TriggerAddCondition(t , Condition(function DMineSite_Blight_Conditions))
call TriggerAddAction(t , function DMineSite_Blight_Actions)
endfunction
function MineSite_Stop_Conditions takes nothing returns boolean
return ( GetUnitTypeId(GetTriggerUnit()) == 0x6E303033 and GetSpellAbilityId() == 0x4130304C )
endfunction
function MineSite_Stop_Actions takes nothing returns nothing
call UnitRemoveAbility(GetTriggerUnit() , 0x41303042)
call TriggerSleepAction(2.50)
call UnitAddAbility(GetTriggerUnit() , 0x41303042)
endfunction
function InitTrig_MineSite_Stop takes nothing returns nothing
local trigger t=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(t , EVENT_PLAYER_UNIT_SPELL_EFFECT)
call TriggerAddCondition(t , Condition(function MineSite_Stop_Conditions))
call TriggerAddAction(t , function MineSite_Stop_Actions)
endfunction
function Setup_Mechanic takes nothing returns nothing
set ENGINE_NAME[0]="Heat"
set ENGINE_LIST[0]=0x49303035
set ENGINE_FUELTANK[0]=0x4130304D
set ENGINE_REFUEL[0]=0x41303133
set ENGINE_SPEED[0]=0x41303053
set ENGINE_USAGE[0]=0x4130305A
set ENGINE_NAME[1]="Steam"
set ENGINE_LIST[1]=0x49303036
set ENGINE_FUELTANK[1]=0x4130304E
set ENGINE_REFUEL[1]=0x4130314F
set ENGINE_SPEED[1]=0x41303054
set ENGINE_USAGE[1]=0x4130305A
set ENGINE_NAME[2]="Diesel"
set ENGINE_LIST[2]=0x49303037
set ENGINE_FUELTANK[2]=0x4130304F
set ENGINE_REFUEL[2]=0x41303150
set ENGINE_SPEED[2]=0x41303055
set ENGINE_USAGE[2]=0x41303130
set ENGINE_NAME[3]="Gas"
set ENGINE_LIST[3]=0x49303038
set ENGINE_FUELTANK[3]=0x4130304F
set ENGINE_REFUEL[3]=0x41303151
set ENGINE_SPEED[3]=0x41303056
set ENGINE_USAGE[3]=0x4130305A
set ENGINE_NAME[4]="Electric"
set ENGINE_LIST[4]=0x49303039
set ENGINE_FUELTANK[4]=0x41303050
set ENGINE_REFUEL[4]=0x41303152
set ENGINE_SPEED[4]=0x41303057
set ENGINE_USAGE[4]=0x41303131
set ENGINE_NAME[5]="Hybrid"
set ENGINE_LIST[5]=0x49303041
set ENGINE_FUELTANK[5]=0x41303051
set ENGINE_REFUEL[5]=0x41303153
set ENGINE_SPEED[5]=0x41303058
set ENGINE_USAGE[5]=0x41303131
set ENGINE_NAME[6]="Reactor"
set ENGINE_LIST[6]=0x49303042
set ENGINE_FUELTANK[6]=0x41303052
set ENGINE_REFUEL[6]=0x41303153
set ENGINE_SPEED[6]=0x41303059
set ENGINE_USAGE[6]=0x41303132
set CHASSIS_NAME[0]="Wooden"
set CHASSIS_LIST[0]=0x49303049
set CHASSIS_ARMOUR[0]=0x41303142
set CHASSIS_HEALTH[0]=0x41303149
set CHASSIS_SPEED[0]=0x41303134
set CHASSIS_NAME[1]="Copper"
set CHASSIS_LIST[1]=0x4930304A
set CHASSIS_ARMOUR[1]=0x41303143
set CHASSIS_HEALTH[1]=0x4130314A
set CHASSIS_SPEED[1]=0x41303135
set CHASSIS_NAME[2]="Iron"
set CHASSIS_LIST[2]=0x4930304B
set CHASSIS_ARMOUR[2]=0x41303144
set CHASSIS_HEALTH[2]=0x4130314B
set CHASSIS_SPEED[2]=0x41303136
set CHASSIS_NAME[3]="Steel"
set CHASSIS_LIST[3]=0x4930304C
set CHASSIS_ARMOUR[3]=0x41303145
set CHASSIS_HEALTH[3]=0x4130314B
set CHASSIS_SPEED[3]=0x41303137
set CHASSIS_NAME[4]="Aluminium"
set CHASSIS_LIST[4]=0x4930304D
set CHASSIS_ARMOUR[4]=0x41303146
set CHASSIS_HEALTH[4]=0x4130314C
set CHASSIS_SPEED[4]=0x41303135
set CHASSIS_NAME[5]="Titanium"
set CHASSIS_LIST[5]=0x4930304E
set CHASSIS_ARMOUR[5]=0x41303147
set CHASSIS_HEALTH[5]=0x4130314D
set CHASSIS_SPEED[5]=0x41303138
set CHASSIS_NAME[6]="Fibreglass"
set CHASSIS_LIST[6]=0x4930304F
set CHASSIS_ARMOUR[6]=0x41303144
set CHASSIS_HEALTH[6]=0x4130314C
set CHASSIS_SPEED[6]=0x41303139
set CHASSIS_NAME[7]="Reinforced"
set CHASSIS_LIST[7]=0x49303050
set CHASSIS_ARMOUR[7]=0x41303148
set CHASSIS_HEALTH[7]=0x4130314E
set CHASSIS_SPEED[7]=0x41303141
endfunction
function InitTrig_Mechanic_Init takes nothing returns nothing
local trigger t=CreateTrigger()
call TriggerAddAction(t , function Setup_Mechanic)
call TriggerRegisterTimerEvent(t , 0.01 , false)
endfunction
function Mechanic_Recipe_Conditions takes nothing returns boolean
local integer recipe=GetItemTypeId(GetManipulatedItem())
return GetUnitTypeId(GetTriggerUnit()) == 0x68303030 and ( recipe == BLUEPRINTS_JEEP or recipe == BLUEPRINTS_HUMVEE or recipe == BLUEPRINTS_TANK or recipe == BLUEPRINTS_COBRA or recipe == BLUEPRINTS_TRANSPORT or recipe == BLUEPRINTS_AAHELI )
endfunction
function checkEngineAndChassis takes integer engine_index,integer min_engine,integer chassis_index,integer min_chassis returns boolean
local player owner=GetOwningPlayer(GetTriggerUnit())
local boolean retval=true
if ( engine_index < min_engine ) then
call DisplayTimedTextToPlayer(owner , 0 , 0 , 3 , "Engine is too weak. Must be at least " + ENGINE_NAME[min_engine])
set retval = false
endif
if ( chassis_index < min_chassis ) then
call DisplayTimedTextToPlayer(owner , 0 , 0 , 3 , "Chassis is too weak. Must be at least " + CHASSIS_NAME[min_chassis])
set retval = false
endif
set owner = null
return retval
endfunction
function Mechanic_Recipe_Actions takes nothing returns nothing
local player owner=GetOwningPlayer(GetTriggerUnit())
local integer recipe=GetItemTypeId(GetManipulatedItem())
local integer chassis_index=- 1
local integer engine_index=- 1
local integer vehicle=0
local integer i
local location point
set i = 0
loop
exitwhen not ( i < ENGINE_NUM )
if ( GetItemTypeId(UnitItemInSlot(GetTriggerUnit() , 0)) == ENGINE_LIST[i] or GetItemTypeId(UnitItemInSlot(GetTriggerUnit() , 1)) == ENGINE_LIST[i] ) then
set engine_index = i
exitwhen true
endif
set i = i + 1
endloop
set i = 0
loop
exitwhen not ( i < CHASSIS_NUM )
if ( GetItemTypeId(UnitItemInSlot(GetTriggerUnit() , 0)) == CHASSIS_LIST[i] or GetItemTypeId(UnitItemInSlot(GetTriggerUnit() , 1)) == CHASSIS_LIST[i] ) then
set chassis_index = i
exitwhen true
endif
set i = i + 1
endloop
if ( engine_index < 0 or chassis_index < 0 ) then
call DisplayTimedTextToPlayer(owner , 0 , 0 , 3 , "Ensure a chassis and engine are in the top two slots.")
return 
endif
set point = GetUnitLoc(GetTriggerUnit())
if ( recipe == BLUEPRINTS_JEEP ) then
call CreateUnitAtLoc(owner , VEHICLE_JEEP , point , bj_UNIT_FACING)
elseif ( recipe == BLUEPRINTS_HUMVEE ) then
call CreateUnitAtLoc(owner , VEHICLE_HUMVEE , point , bj_UNIT_FACING)
elseif ( recipe == BLUEPRINTS_TANK ) then
if ( not checkEngineAndChassis(engine_index , 1 , chassis_index , 2) ) then
return 
endif
call CreateUnitAtLoc(owner , VEHICLE_TANK , point , bj_UNIT_FACING)
elseif ( recipe == BLUEPRINTS_COBRA ) then
call CreateUnitAtLoc(owner , VEHICLE_COBRA , point , bj_UNIT_FACING)
elseif ( recipe == BLUEPRINTS_TRANSPORT ) then
if ( not checkEngineAndChassis(engine_index , 1 , chassis_index , 0) ) then
return 
endif
call CreateUnitAtLoc(owner , VEHICLE_TRANSPORT , point , bj_UNIT_FACING)
elseif ( recipe == BLUEPRINTS_AAHELI ) then
if ( not checkEngineAndChassis(engine_index , 2 , chassis_index , 0) ) then
return 
endif
call CreateUnitAtLoc(owner , VEHICLE_AAHELI , point , bj_UNIT_FACING)
endif
call RemoveLocation(point)
set point = null
set owner = null
call RemoveItem(GetItemOfTypeFromUnitBJ(GetTriggerUnit() , GetItemTypeId(GetManipulatedItem())))
call RemoveItem(UnitItemInSlot(GetTriggerUnit() , 0))
call RemoveItem(UnitItemInSlot(GetTriggerUnit() , 1))
call UnitAddAbility(bj_lastCreatedUnit , ENGINE_SPEED[engine_index])
call UnitAddAbility(bj_lastCreatedUnit , ENGINE_FUELTANK[engine_index])
call UnitAddAbility(bj_lastCreatedUnit , ENGINE_USAGE[engine_index])
call UnitAddAbility(bj_lastCreatedUnit , ENGINE_REFUEL[engine_index])
call UnitAddAbility(bj_lastCreatedUnit , CHASSIS_ARMOUR[chassis_index])
call UnitAddAbility(bj_lastCreatedUnit , CHASSIS_HEALTH[chassis_index])
endfunction
function InitTrig_Mechanic_Recipe takes nothing returns nothing
local trigger t=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(t , EVENT_PLAYER_UNIT_USE_ITEM)
call TriggerAddCondition(t , Condition(function Mechanic_Recipe_Conditions))
call TriggerAddAction(t , function Mechanic_Recipe_Actions)
endfunction
function Pistol_Conditions takes nothing returns boolean
return GetItemTypeId(GetManipulatedItem()) == PISTOL_ITEM and GetUnitTypeId(GetTriggerUnit()) == SURVIVOR_UNIT_TYPE
endfunction
function Pistol_Actions takes nothing returns nothing
local unit survivor=GetTriggerUnit()
local unit target=GetEventTargetUnit()
local location survivor_location=GetUnitLoc(survivor)
local location target_location=GetUnitLoc(target)
local real distance=DistanceBetweenPoints(target_location , survivor_location)
local real hitChance
local integer jamChance
call RemoveLocation(survivor_location)
call RemoveLocation(target_location)
set survivor_location = null
set target_location = null
if ( GetUnitAbilityLevel(survivor , PISTOL_ABILITY) >= 1 ) then
set hitChance = Hit_Chance(distance , PISTOL_RANGE , PISTOL_TRAINED_ACCURACY)
set jamChance = PISTOL_TRAINED_JAM_CHANCE
else
set hitChance = Hit_Chance(distance , PISTOL_RANGE , PISTOL_UNTRAINED_ACCURACY)
set jamChance = PISTOL_UNTRAINED_JAM_CHANCE
endif
if ( jamChance >= GetRandomInt(1 , 100) ) then
call TextTag_UnitColor(survivor , "Jammed!" , 255 , 0 , 0)
return 
endif
call TextTag_Firearm(survivor , R2I(hitChance))
if ( hitChance < GetRandomInt(1 , 100) ) then
call TextTag_Miss(target)
return 
endif
call UnitDamageTarget(survivor , target , PISTOL_DAMAGE , false , true , AMMUNITION , DAMAGE_TYPE_NORMAL , WEAPON_TYPE_WHOKNOWS)
endfunction
function InitTrig_Pistol takes nothing returns nothing
local trigger t=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(t , EVENT_PLAYER_UNIT_USE_ITEM)
call TriggerAddCondition(t , Condition(function Pistol_Conditions))
call TriggerAddAction(t , function Pistol_Actions)
endfunction
function Show_Tip takes nothing returns nothing
call DisplayTimedTextToForce(TIP_PLAYERS , 5 , TIPS[GetRandomInt(0 , TIP_NUM)])
endfunction
function Tip_Init_Actions takes nothing returns nothing
set TIPS[0]="Type \"-base\" to show prospective places to set up at."
set TIPS[1]="Type \"-share X\" to partially share units with player X. This allows them to get in your vehicles, tent, etc."
set TIPS[2]="Type \"-fshare X\" to fully share units with player X. This allows them to control all of your units."
set TIPS[3]="Type \"-unshare X\" to stop sharing units with player X."
set TIPS[4]="type \"-drop\" to remove the ability to harvest, and \"-pickup\" to gain it again, Good for running through trees."
set TIPS[5]="Mining sites can always be walked around, from all sides. However, the gap is very small."
set TIPS[6]="Large dinosaurs deal cleave damage. This won't affect buildings much, but will eventually destroy trees."
set TIPS[7]="Bigger dinosaurs spawn every " + I2S(180 + ( 20 * DIFFICULTY )) + " seconds. They get more fiece every " + I2S(115 + ( 15 * DIFFICULTY )) + " seconds."
set TIPS[8]="Tents have a moderate range to get in and out of them (just like in the original). Useful for jumping over barricades/cliffs."
set TIPS[9]="Scout towers aren't always worth upgrading. No other building or unit provides comparable vision."
set TIPS[10]="Bases usually can't sustain a team more than 15 minutes. Resources are limited, so moving bases is neccesary (and risky)."
set TIPS[11]="When moving base, plan the journey beforehand, and organize who will barricade each entrance of the new base."
set TIPS[12]="Dinosaurs, for the most part, spawn close to survivors, and move in their general direction."
set TIPS[13]="More powerful \"Roaming\" dinosaurs spawn all across the map. They pose a major threat to lone survivors, and bases they encounter."
set TIPS[14]="By mining a site as much as possible before upgrading it, its value is maximized. There's profit to be had."
set TIPS[15]="Type \"-notips\" or \"-tips\" to enable/disable tips."
call TimerStart(TIP_TIMER , 90 , true , function Show_Tip)
endfunction
function InitTrig_Tip_Init takes nothing returns nothing
local trigger t=CreateTrigger()
call TriggerRegisterTimerEvent(t , 0 , false)
call TriggerAddAction(t , function Tip_Init_Actions)
endfunction
function Tip_Timer_Actions takes nothing returns nothing
call DisplayTimedTextToForce(TIP_PLAYERS , 5 , TIPS[GetRandomInt(0 , TIP_NUM)])
endfunction
function InitTrig_Tip_Timer takes nothing returns nothing
local trigger t=CreateTrigger()
call TriggerRegisterTimerExpireEvent(t , TIP_TIMER)
call TriggerAddAction(t , function Tip_Timer_Actions)
endfunction
function Tip_Enable_Actions takes nothing returns nothing
call ForceAddPlayer(TIP_PLAYERS , GetTriggerPlayer())
endfunction
function InitTrig_Tip_Enable takes nothing returns nothing
local trigger t=CreateTrigger()
call TriggerRegisterPlayerChatEvent(t , Player(0) , "-tips" , true)
call TriggerRegisterPlayerChatEvent(t , Player(1) , "-tips" , true)
call TriggerRegisterPlayerChatEvent(t , Player(2) , "-tips" , true)
call TriggerRegisterPlayerChatEvent(t , Player(3) , "-tips" , true)
call TriggerRegisterPlayerChatEvent(t , Player(4) , "-tips" , true)
call TriggerRegisterPlayerChatEvent(t , Player(5) , "-tips" , true)
call TriggerRegisterPlayerChatEvent(t , Player(6) , "-tips" , true)
call TriggerAddAction(t , function Tip_Enable_Actions)
endfunction
function Tip_Disable_Actions takes nothing returns nothing
call ForceRemovePlayer(TIP_PLAYERS , GetTriggerPlayer())
endfunction
function InitTrig_Tip_Disable takes nothing returns nothing
local trigger t=CreateTrigger()
call TriggerRegisterPlayerChatEvent(t , Player(0) , "-notips" , true)
call TriggerRegisterPlayerChatEvent(t , Player(1) , "-notips" , true)
call TriggerRegisterPlayerChatEvent(t , Player(2) , "-notips" , true)
call TriggerRegisterPlayerChatEvent(t , Player(3) , "-notips" , true)
call TriggerRegisterPlayerChatEvent(t , Player(4) , "-notips" , true)
call TriggerRegisterPlayerChatEvent(t , Player(5) , "-notips" , true)
call TriggerRegisterPlayerChatEvent(t , Player(6) , "-notips" , true)
call TriggerAddAction(t , function Tip_Disable_Actions)
endfunction
// scope mechanic begins
function s__mechanic_mechanic_create takes nothing returns integer
local integer data=s__mechanic_mechanic__allocate()
set s__mechanic_mechanic_vehicleCount[data]=0
return data
endfunction
function s__mechanic_mechanic_buildVehicle takes integer this,unit survivor,unittype vehicle returns nothing
if ( s__mechanic_mechanic_vehicleCount[this] >= mechanic__VEHICLE_CAP ) then
return 
endif
set s__mechanic_mechanic_vehicleCount[this]=s__mechanic_mechanic_vehicleCount[this] + 1
endfunction
function s__mechanic_mechanic_destroyVehicle takes integer this,unit vehicle returns nothing
if ( s__mechanic_mechanic_vehicleCount[this] > 0 ) then
set s__mechanic_mechanic_vehicleCount[this]=s__mechanic_mechanic_vehicleCount[this] - 1
endif
endfunction
function s__mechanic_mechanic_mechanicSkill takes unit survivor,unit target returns nothing
endfunction
function s__mechanic_mechanic_isTrained takes player owner returns boolean
return GetPlayerTechCount(owner , 0x30303030 , true) >= 1
endfunction
// scope mechanic ends
function InitCustomTriggers takes nothing returns nothing
//Function not found: call InitTrig_TextTag()
call InitTrig_Mountain_Cave()
call InitTrig_Pickup_Drop_Tools()
call InitTrig_Ping_Base()
call InitTrig_Part_Share()
call InitTrig_Full_Share()
call InitTrig_Unshare()
//Function not found: call InitTrig_Survivor()
call InitTrig_Survivor_Death()
call InitTrig_Begin_Spawn()
call InitTrig_Anger_Loop()
call InitTrig_Level_Loop()
call InitTrig_Spawn_Loop()
call InitTrig_Move_Loop()
call InitTrig_Item_Scatter()
call InitTrig_Spawning_Table()
call InitTrig_Init()
call InitTrig_Game_Start()
//Function not found: call InitTrig_Dinosaur()
call InitTrig_Scout_Tower()
call InitTrig_Scout_Tower_Stop()
call InitTrig_Tent_Init()
call InitTrig_MineSite_Blight()
call InitTrig_DMineSite_Blight()
call InitTrig_MineSite_Stop()
call InitTrig_Mechanic_Init()
call InitTrig_Mechanic_Recipe()
call InitTrig_Pistol()
call InitTrig_Tip_Init()
call InitTrig_Tip_Timer()
call InitTrig_Tip_Enable()
call InitTrig_Tip_Disable()
//Function not found: call InitTrig_Mechanic()
endfunction
function InitCustomPlayerSlots takes nothing returns nothing
call SetPlayerStartLocation(Player(0) , 0)
call ForcePlayerStartLocation(Player(0) , 0)
call SetPlayerColor(Player(0) , ConvertPlayerColor(0))
call SetPlayerRacePreference(Player(0) , RACE_PREF_HUMAN)
call SetPlayerRaceSelectable(Player(0) , false)
call SetPlayerController(Player(0) , MAP_CONTROL_USER)
call SetPlayerStartLocation(Player(1) , 1)
call ForcePlayerStartLocation(Player(1) , 1)
call SetPlayerColor(Player(1) , ConvertPlayerColor(1))
call SetPlayerRacePreference(Player(1) , RACE_PREF_HUMAN)
call SetPlayerRaceSelectable(Player(1) , false)
call SetPlayerController(Player(1) , MAP_CONTROL_USER)
call SetPlayerStartLocation(Player(2) , 2)
call ForcePlayerStartLocation(Player(2) , 2)
call SetPlayerColor(Player(2) , ConvertPlayerColor(2))
call SetPlayerRacePreference(Player(2) , RACE_PREF_HUMAN)
call SetPlayerRaceSelectable(Player(2) , false)
call SetPlayerController(Player(2) , MAP_CONTROL_USER)
call SetPlayerStartLocation(Player(3) , 3)
call ForcePlayerStartLocation(Player(3) , 3)
call SetPlayerColor(Player(3) , ConvertPlayerColor(3))
call SetPlayerRacePreference(Player(3) , RACE_PREF_HUMAN)
call SetPlayerRaceSelectable(Player(3) , false)
call SetPlayerController(Player(3) , MAP_CONTROL_USER)
call SetPlayerStartLocation(Player(4) , 4)
call ForcePlayerStartLocation(Player(4) , 4)
call SetPlayerColor(Player(4) , ConvertPlayerColor(4))
call SetPlayerRacePreference(Player(4) , RACE_PREF_HUMAN)
call SetPlayerRaceSelectable(Player(4) , false)
call SetPlayerController(Player(4) , MAP_CONTROL_USER)
call SetPlayerStartLocation(Player(5) , 5)
call ForcePlayerStartLocation(Player(5) , 5)
call SetPlayerColor(Player(5) , ConvertPlayerColor(5))
call SetPlayerRacePreference(Player(5) , RACE_PREF_HUMAN)
call SetPlayerRaceSelectable(Player(5) , false)
call SetPlayerController(Player(5) , MAP_CONTROL_USER)
call SetPlayerStartLocation(Player(6) , 6)
call ForcePlayerStartLocation(Player(6) , 6)
call SetPlayerColor(Player(6) , ConvertPlayerColor(6))
call SetPlayerRacePreference(Player(6) , RACE_PREF_HUMAN)
call SetPlayerRaceSelectable(Player(6) , false)
call SetPlayerController(Player(6) , MAP_CONTROL_USER)
call SetPlayerStartLocation(Player(11) , 7)
call SetPlayerColor(Player(11) , ConvertPlayerColor(11))
call SetPlayerRacePreference(Player(11) , RACE_PREF_ORC)
call SetPlayerRaceSelectable(Player(11) , false)
call SetPlayerController(Player(11) , MAP_CONTROL_COMPUTER)
endfunction
function InitCustomTeams takes nothing returns nothing
call SetPlayerTeam(Player(0) , 0)
call SetPlayerState(Player(0) , PLAYER_STATE_ALLIED_VICTORY , 1)
call SetPlayerTeam(Player(1) , 0)
call SetPlayerState(Player(1) , PLAYER_STATE_ALLIED_VICTORY , 1)
call SetPlayerTeam(Player(2) , 0)
call SetPlayerState(Player(2) , PLAYER_STATE_ALLIED_VICTORY , 1)
call SetPlayerTeam(Player(3) , 0)
call SetPlayerState(Player(3) , PLAYER_STATE_ALLIED_VICTORY , 1)
call SetPlayerTeam(Player(4) , 0)
call SetPlayerState(Player(4) , PLAYER_STATE_ALLIED_VICTORY , 1)
call SetPlayerTeam(Player(5) , 0)
call SetPlayerState(Player(5) , PLAYER_STATE_ALLIED_VICTORY , 1)
call SetPlayerTeam(Player(6) , 0)
call SetPlayerState(Player(6) , PLAYER_STATE_ALLIED_VICTORY , 1)
call SetPlayerAllianceStateAllyBJ(Player(0) , Player(1) , true)
call SetPlayerAllianceStateAllyBJ(Player(0) , Player(2) , true)
call SetPlayerAllianceStateAllyBJ(Player(0) , Player(3) , true)
call SetPlayerAllianceStateAllyBJ(Player(0) , Player(4) , true)
call SetPlayerAllianceStateAllyBJ(Player(0) , Player(5) , true)
call SetPlayerAllianceStateAllyBJ(Player(0) , Player(6) , true)
call SetPlayerAllianceStateAllyBJ(Player(1) , Player(0) , true)
call SetPlayerAllianceStateAllyBJ(Player(1) , Player(2) , true)
call SetPlayerAllianceStateAllyBJ(Player(1) , Player(3) , true)
call SetPlayerAllianceStateAllyBJ(Player(1) , Player(4) , true)
call SetPlayerAllianceStateAllyBJ(Player(1) , Player(5) , true)
call SetPlayerAllianceStateAllyBJ(Player(1) , Player(6) , true)
call SetPlayerAllianceStateAllyBJ(Player(2) , Player(0) , true)
call SetPlayerAllianceStateAllyBJ(Player(2) , Player(1) , true)
call SetPlayerAllianceStateAllyBJ(Player(2) , Player(3) , true)
call SetPlayerAllianceStateAllyBJ(Player(2) , Player(4) , true)
call SetPlayerAllianceStateAllyBJ(Player(2) , Player(5) , true)
call SetPlayerAllianceStateAllyBJ(Player(2) , Player(6) , true)
call SetPlayerAllianceStateAllyBJ(Player(3) , Player(0) , true)
call SetPlayerAllianceStateAllyBJ(Player(3) , Player(1) , true)
call SetPlayerAllianceStateAllyBJ(Player(3) , Player(2) , true)
call SetPlayerAllianceStateAllyBJ(Player(3) , Player(4) , true)
call SetPlayerAllianceStateAllyBJ(Player(3) , Player(5) , true)
call SetPlayerAllianceStateAllyBJ(Player(3) , Player(6) , true)
call SetPlayerAllianceStateAllyBJ(Player(4) , Player(0) , true)
call SetPlayerAllianceStateAllyBJ(Player(4) , Player(1) , true)
call SetPlayerAllianceStateAllyBJ(Player(4) , Player(2) , true)
call SetPlayerAllianceStateAllyBJ(Player(4) , Player(3) , true)
call SetPlayerAllianceStateAllyBJ(Player(4) , Player(5) , true)
call SetPlayerAllianceStateAllyBJ(Player(4) , Player(6) , true)
call SetPlayerAllianceStateAllyBJ(Player(5) , Player(0) , true)
call SetPlayerAllianceStateAllyBJ(Player(5) , Player(1) , true)
call SetPlayerAllianceStateAllyBJ(Player(5) , Player(2) , true)
call SetPlayerAllianceStateAllyBJ(Player(5) , Player(3) , true)
call SetPlayerAllianceStateAllyBJ(Player(5) , Player(4) , true)
call SetPlayerAllianceStateAllyBJ(Player(5) , Player(6) , true)
call SetPlayerAllianceStateAllyBJ(Player(6) , Player(0) , true)
call SetPlayerAllianceStateAllyBJ(Player(6) , Player(1) , true)
call SetPlayerAllianceStateAllyBJ(Player(6) , Player(2) , true)
call SetPlayerAllianceStateAllyBJ(Player(6) , Player(3) , true)
call SetPlayerAllianceStateAllyBJ(Player(6) , Player(4) , true)
call SetPlayerAllianceStateAllyBJ(Player(6) , Player(5) , true)
call SetPlayerAllianceStateVisionBJ(Player(0) , Player(1) , true)
call SetPlayerAllianceStateVisionBJ(Player(0) , Player(2) , true)
call SetPlayerAllianceStateVisionBJ(Player(0) , Player(3) , true)
call SetPlayerAllianceStateVisionBJ(Player(0) , Player(4) , true)
call SetPlayerAllianceStateVisionBJ(Player(0) , Player(5) , true)
call SetPlayerAllianceStateVisionBJ(Player(0) , Player(6) , true)
call SetPlayerAllianceStateVisionBJ(Player(1) , Player(0) , true)
call SetPlayerAllianceStateVisionBJ(Player(1) , Player(2) , true)
call SetPlayerAllianceStateVisionBJ(Player(1) , Player(3) , true)
call SetPlayerAllianceStateVisionBJ(Player(1) , Player(4) , true)
call SetPlayerAllianceStateVisionBJ(Player(1) , Player(5) , true)
call SetPlayerAllianceStateVisionBJ(Player(1) , Player(6) , true)
call SetPlayerAllianceStateVisionBJ(Player(2) , Player(0) , true)
call SetPlayerAllianceStateVisionBJ(Player(2) , Player(1) , true)
call SetPlayerAllianceStateVisionBJ(Player(2) , Player(3) , true)
call SetPlayerAllianceStateVisionBJ(Player(2) , Player(4) , true)
call SetPlayerAllianceStateVisionBJ(Player(2) , Player(5) , true)
call SetPlayerAllianceStateVisionBJ(Player(2) , Player(6) , true)
call SetPlayerAllianceStateVisionBJ(Player(3) , Player(0) , true)
call SetPlayerAllianceStateVisionBJ(Player(3) , Player(1) , true)
call SetPlayerAllianceStateVisionBJ(Player(3) , Player(2) , true)
call SetPlayerAllianceStateVisionBJ(Player(3) , Player(4) , true)
call SetPlayerAllianceStateVisionBJ(Player(3) , Player(5) , true)
call SetPlayerAllianceStateVisionBJ(Player(3) , Player(6) , true)
call SetPlayerAllianceStateVisionBJ(Player(4) , Player(0) , true)
call SetPlayerAllianceStateVisionBJ(Player(4) , Player(1) , true)
call SetPlayerAllianceStateVisionBJ(Player(4) , Player(2) , true)
call SetPlayerAllianceStateVisionBJ(Player(4) , Player(3) , true)
call SetPlayerAllianceStateVisionBJ(Player(4) , Player(5) , true)
call SetPlayerAllianceStateVisionBJ(Player(4) , Player(6) , true)
call SetPlayerAllianceStateVisionBJ(Player(5) , Player(0) , true)
call SetPlayerAllianceStateVisionBJ(Player(5) , Player(1) , true)
call SetPlayerAllianceStateVisionBJ(Player(5) , Player(2) , true)
call SetPlayerAllianceStateVisionBJ(Player(5) , Player(3) , true)
call SetPlayerAllianceStateVisionBJ(Player(5) , Player(4) , true)
call SetPlayerAllianceStateVisionBJ(Player(5) , Player(6) , true)
call SetPlayerAllianceStateVisionBJ(Player(6) , Player(0) , true)
call SetPlayerAllianceStateVisionBJ(Player(6) , Player(1) , true)
call SetPlayerAllianceStateVisionBJ(Player(6) , Player(2) , true)
call SetPlayerAllianceStateVisionBJ(Player(6) , Player(3) , true)
call SetPlayerAllianceStateVisionBJ(Player(6) , Player(4) , true)
call SetPlayerAllianceStateVisionBJ(Player(6) , Player(5) , true)
call SetPlayerTeam(Player(11) , 1)
endfunction
function InitAllyPriorities takes nothing returns nothing
call SetStartLocPrioCount(0 , 6)
call SetStartLocPrio(0 , 0 , 1 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(0 , 1 , 2 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(0 , 2 , 3 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(0 , 3 , 4 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(0 , 4 , 5 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(0 , 5 , 6 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrioCount(1 , 6)
call SetStartLocPrio(1 , 0 , 0 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(1 , 1 , 2 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(1 , 2 , 3 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(1 , 3 , 4 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(1 , 4 , 5 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(1 , 5 , 6 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrioCount(2 , 6)
call SetStartLocPrio(2 , 0 , 0 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(2 , 1 , 1 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(2 , 2 , 3 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(2 , 3 , 4 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(2 , 4 , 5 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(2 , 5 , 6 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrioCount(3 , 6)
call SetStartLocPrio(3 , 0 , 0 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(3 , 1 , 1 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(3 , 2 , 2 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(3 , 3 , 4 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(3 , 4 , 5 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(3 , 5 , 6 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrioCount(4 , 6)
call SetStartLocPrio(4 , 0 , 0 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(4 , 1 , 1 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(4 , 2 , 2 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(4 , 3 , 3 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(4 , 4 , 5 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(4 , 5 , 6 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrioCount(5 , 6)
call SetStartLocPrio(5 , 0 , 0 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(5 , 1 , 1 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(5 , 2 , 2 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(5 , 3 , 3 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(5 , 4 , 4 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(5 , 5 , 6 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrioCount(6 , 6)
call SetStartLocPrio(6 , 0 , 0 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(6 , 1 , 1 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(6 , 2 , 2 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(6 , 3 , 3 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(6 , 4 , 4 , MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(6 , 5 , 5 , MAP_LOC_PRIO_HIGH)
endfunction
function main takes nothing returns nothing
call SetCameraBounds(- 15616.0 + GetCameraMargin(CAMERA_MARGIN_LEFT) , - 15872.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM) , 15616.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT) , 15360.0 - GetCameraMargin(CAMERA_MARGIN_TOP) , - 15616.0 + GetCameraMargin(CAMERA_MARGIN_LEFT) , 15360.0 - GetCameraMargin(CAMERA_MARGIN_TOP) , 15616.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT) , - 15872.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl" , "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
call NewSoundEnvironment("Default")
call SetAmbientDaySound("SunkenRuinsDay")
call SetAmbientNightSound("SunkenRuinsNight")
call SetMapMusic("Music" , true , 0)
call InitSounds()
call CreateRegions()
call CreateAllDestructables()
call CreateAllItems()
call CreateAllUnits()
call InitBlizzard()

call ExecuteFunc("jasshelper__initstructs24100984")

call InitGlobals()
call InitCustomTriggers()
endfunction
function config takes nothing returns nothing
call SetMapName("TRIGSTR_001")
call SetMapDescription("TRIGSTR_003")
call SetPlayers(8)
call SetTeams(8)
call SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER)
call DefineStartLocation(0 , 0.0 , 0.0)
call DefineStartLocation(1 , 0.0 , 0.0)
call DefineStartLocation(2 , 0.0 , 0.0)
call DefineStartLocation(3 , 0.0 , 0.0)
call DefineStartLocation(4 , 0.0 , 0.0)
call DefineStartLocation(5 , 0.0 , 0.0)
call DefineStartLocation(6 , 0.0 , 0.0)
call DefineStartLocation(7 , 0.0 , 0.0)
call InitCustomPlayerSlots()
call InitCustomTeams()
call InitAllyPriorities()
endfunction


//Struct method generated initializers/callers:

//Functions for BigArrays:

function jasshelper__initstructs24100984 takes nothing returns nothing

endfunction

