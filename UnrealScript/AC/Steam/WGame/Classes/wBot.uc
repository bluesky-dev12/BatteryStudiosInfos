/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wBot.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class wBot extends Bot;

var() PlayerRecord PawnSetupRecord;

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
    super.Possess(aPawn);
    // End:0x34
    if(wPawn(aPawn) != none)
    {
        wPawn(aPawn).Setup(PawnSetupRecord);
    }
}

defaultproperties
{
    PlayerReplicationInfoClass=class'wPlayerReplicationInfo'
}