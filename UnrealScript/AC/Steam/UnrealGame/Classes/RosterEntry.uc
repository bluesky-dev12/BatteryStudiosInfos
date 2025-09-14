/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\RosterEntry.uc
 * Package Imports:
 *	UnrealGame
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:16
 *	Functions:9
 *
 *******************************************************************************/
class RosterEntry extends Object
    dependson(CustomBotConfig)
    editinlinenew;

enum EOrders
{
    ORDERS_None,
    ORDERS_Attack,
    ORDERS_Defend,
    ORDERS_Freelance,
    ORDERS_Support,
    ORDERS_Roam
};

var() class<UnrealPawn> PawnClass;
var() string PawnClassName;
var() string PlayerName;
var() string ModifiedPlayerName;
var() string VoiceTypeName;
var() RosterEntry.EOrders Orders;
var() bool bTaken;
var() class<wWeapon> FavoriteWeapon;
var() float Aggressiveness;
var() float Accuracy;
var() float CombatStyle;
var() float StrafingAbility;
var() float Tactics;
var() float ReactionTime;
var() float Jumpiness;
var bool bJumpy;

function Init()
{
    // End:0x27
    if(PawnClassName != "")
    {
        PawnClass = class<UnrealPawn>(DynamicLoadObject(PawnClassName, class'Class'));
    }
}

function PrecacheRosterFor(UnrealTeamInfo t);
function SetOrders(Engine.GameProfile.EPlayerPos Position)
{
    switch(Position)
    {
        // End:0x17
        case 1:
            Orders = 2;
            // End:0x4a
            break;
        // End:0x27
        case 2:
            Orders = 1;
            // End:0x4a
            break;
        // End:0x37
        case 3:
            Orders = 3;
            // End:0x4a
            break;
        // End:0x47
        case 4:
            Orders = 4;
            // End:0x4a
            break;
        // End:0xffff
        default:
}

function bool RecommendSupport()
{
    return Orders == 4;
}

function bool NoRecommendation()
{
    return Orders == 0;
}

function bool RecommendDefense()
{
    return Orders == 2;
}

function bool RecommendFreelance()
{
    return Orders == 3;
}

function bool RecommendAttack()
{
    return Orders == 1;
}

function InitBot(Bot B)
{
    class'CustomBotConfig'.static.Customize(self);
    B.FavoriteWeapon = FavoriteWeapon;
    B.Aggressiveness = FClamp(Aggressiveness, 0.0, 1.0);
    B.BaseAggressiveness = B.Aggressiveness;
    B.Accuracy = FClamp(Accuracy, -5.0, 5.0);
    B.StrafingAbility = FClamp(StrafingAbility, -5.0, 5.0);
    B.CombatStyle = FClamp(CombatStyle, 0.0, 1.0);
    B.Tactics = FClamp(Tactics, -5.0, 5.0);
    B.ReactionTime = FClamp(ReactionTime, -5.0, 5.0);
    B.Jumpiness = Jumpiness;
}

defaultproperties
{
    Aggressiveness=0.30
    CombatStyle=0.20
}