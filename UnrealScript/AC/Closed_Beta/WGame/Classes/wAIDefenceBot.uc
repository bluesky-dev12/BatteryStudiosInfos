class wAIDefenceBot extends wAIBot;

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
    //return;    
}

function TryCrouch()
{
    //return;    
}

function TryProne()
{
    //return;    
}

event SeePlayer(Pawn SeenPlayer)
{
    //return;    
}

function SwitchWeapon(byte f, optional bool bQuickGr)
{
    //return;    
}

defaultproperties
{
    ShortMemoryClass=Class'WGame_Decompressed.ShortMemoryDF'
    TargetingSystemClass=Class'WGame_Decompressed.TargetingSystemDF'
    PawnClass=Class'WGame_Decompressed.wAIDefencePawn'
}