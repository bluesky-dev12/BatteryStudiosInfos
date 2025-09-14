/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAIBot.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:2
 *
 *******************************************************************************/
class wAIBot extends wAIBotBase;

var() PlayerRecord PawnSetupRecord;
var class<ShortMemory> ShortMemoryClass;
var class<TargetingSystem> TargetingSystemClass;

function SetPawnClass(string inClass, string InCharacter)
{
    local class<wPawn> pClass;

    // End:0x3d
    if(inClass != "")
    {
        pClass = class<wPawn>(DynamicLoadObject(inClass, class'Class'));
        // End:0x3d
        if(pClass != none)
        {
            PawnClass = pClass;
        }
    }
    PawnSetupRecord = class'wUtil'.static.FindPlayerRecord(InCharacter);
    PlayerReplicationInfo.SetCharacterName(InCharacter);
    PlayerReplicationInfo.SetCharacterEquipItem(15000, 15000, 12000, 11000, 13001);
}

function Possess(Pawn aPawn)
{
    aPawn.wMyParam.RunSpeed = float(NPCParam.DefaultRunSpeed);
    SetupWeapons(aPawn);
    super(Controller).Possess(aPawn);
    aPawn.DealDamageRatio_Default = NPCParam.DamageRate;
    aPawn.DealDamageRatio_Explosive = NPCParam.ExplosionDmageRate;
    aPawn.DealDamageRatio_Melee = NPCParam.MeleeDamageRate;
    // End:0xbe
    if(wPawn(aPawn) != none)
    {
        wPawn(aPawn).Setup(PawnSetupRecord);
    }
    Pawn.SetMovementPhysics();
    // End:0xf4
    if(Pawn.Physics == 1)
    {
        Pawn.SetPhysics(2);
    }
    Memory = ShortMemoryClass.static.Create(self, NPCParam.ReactionTime);
    TargetSystem = TargetingSystemClass.static.Create(self);
    RotationRate.Yaw = int(NPCParam.RotationgSpeed);
    GotoState(StateOnPossess);
}

defaultproperties
{
    ShortMemoryClass=class'ShortMemory'
    TargetingSystemClass=class'TargetingSystem'
}