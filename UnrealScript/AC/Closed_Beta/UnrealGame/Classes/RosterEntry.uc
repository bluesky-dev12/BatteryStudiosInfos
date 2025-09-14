class RosterEntry extends Object
    editinlinenew;

enum EOrders
{
    ORDERS_None,                    // 0
    ORDERS_Attack,                  // 1
    ORDERS_Defend,                  // 2
    ORDERS_Freelance,               // 3
    ORDERS_Support,                 // 4
    ORDERS_Roam                     // 5
};

var() Class<UnrealPawn> PawnClass;
var() string PawnClassName;
var() string PlayerName;
var() string ModifiedPlayerName;
var() string VoiceTypeName;
var() RosterEntry.EOrders Orders;
var() bool bTaken;
var() Class<wWeapon> FavoriteWeapon;
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
        PawnClass = Class<UnrealPawn>(DynamicLoadObject(PawnClassName, Class'Core.Class'));
    }
    //return;    
}

function PrecacheRosterFor(UnrealTeamInfo t)
{
    //return;    
}

function SetOrders(GameProfile.EPlayerPos Position)
{
    switch(Position)
    {
        // End:0x17
        case 1:
            Orders = 2;
            // End:0x4A
            break;
        // End:0x27
        case 2:
            Orders = 1;
            // End:0x4A
            break;
        // End:0x37
        case 3:
            Orders = 3;
            // End:0x4A
            break;
        // End:0x47
        case 4:
            Orders = 4;
            // End:0x4A
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function bool RecommendSupport()
{
    return int(Orders) == int(4);
    //return;    
}

function bool NoRecommendation()
{
    return int(Orders) == int(0);
    //return;    
}

function bool RecommendDefense()
{
    return int(Orders) == int(2);
    //return;    
}

function bool RecommendFreelance()
{
    return int(Orders) == int(3);
    //return;    
}

function bool RecommendAttack()
{
    return int(Orders) == int(1);
    //return;    
}

function InitBot(Bot B)
{
    Class'UnrealGame_Decompressed.CustomBotConfig'.static.Customize(self);
    B.FavoriteWeapon = FavoriteWeapon;
    B.Aggressiveness = FClamp(Aggressiveness, 0.0000000, 1.0000000);
    B.BaseAggressiveness = B.Aggressiveness;
    B.Accuracy = FClamp(Accuracy, -5.0000000, 5.0000000);
    B.StrafingAbility = FClamp(StrafingAbility, -5.0000000, 5.0000000);
    B.CombatStyle = FClamp(CombatStyle, 0.0000000, 1.0000000);
    B.Tactics = FClamp(Tactics, -5.0000000, 5.0000000);
    B.ReactionTime = FClamp(ReactionTime, -5.0000000, 5.0000000);
    B.Jumpiness = Jumpiness;
    //return;    
}

defaultproperties
{
    Aggressiveness=0.3000000
    CombatStyle=0.2000000
}