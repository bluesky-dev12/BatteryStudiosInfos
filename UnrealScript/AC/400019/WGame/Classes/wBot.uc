class wBot extends Bot;

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
    super.Possess(aPawn);
    // End:0x34
    if(wPawn(aPawn) != none)
    {
        wPawn(aPawn).Setup(PawnSetupRecord);
    }
    //return;    
}

defaultproperties
{
    PlayerReplicationInfoClass=Class'WGame_Decompressed.wPlayerReplicationInfo'
}