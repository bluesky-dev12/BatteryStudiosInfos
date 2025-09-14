class wAIBot extends wAIBotBase;

var() PlayerRecord PawnSetupRecord;

function SetPawnClass(string inClass, string InCharacter)
{
    local Class<wPawn> pClass;

    // End:0x3D
    if(inClass != "")
    {
        pClass = Class<wPawn>(DynamicLoadObject(inClass, Class'Core.Class'));
        // End:0x3D
        if(pClass != none)
        {
            PawnClass = pClass;
        }
    }
    PawnSetupRecord = Class'WGame_Decompressed.wUtil'.static.FindPlayerRecord(InCharacter);
    PlayerReplicationInfo.SetCharacterName(InCharacter);
    PlayerReplicationInfo.SetCharacterEquipItem(15000, 15000, 12000, 11000, 13001);
    //return;    
}

function Possess(Pawn aPawn)
{
    SetupWeapons(aPawn);
    super(Controller).Possess(aPawn);
    aPawn.DealDamageRatio_Default = NPCParam.DamageRate;
    aPawn.DealDamageRatio_Explosive = NPCParam.ExplosionDmageRate;
    aPawn.DealDamageRatio_Melee = NPCParam.MeleeDamageRate;
    // End:0x96
    if(wPawn(aPawn) != none)
    {
        wPawn(aPawn).Setup(PawnSetupRecord);
    }
    Pawn.SetMovementPhysics();
    // End:0xCC
    if(int(Pawn.Physics) == int(1))
    {
        Pawn.SetPhysics(2);
    }
    Memory = Class'WGame_Decompressed.ShortMemory'.static.Create(self, NPCParam.ReactionTime);
    TargetSystem = Class'WGame_Decompressed.TargetingSystem'.static.Create(self);
    RotationRate.Yaw = int(NPCParam.RotationgSpeed);
    GotoState(StateOnPossess);
    //return;    
}
