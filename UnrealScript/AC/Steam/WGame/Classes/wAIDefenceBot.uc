/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAIDefenceBot.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:5
 *
 *******************************************************************************/
class wAIDefenceBot extends wAIBot;

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
}

function TryCrouch();
function TryProne();
event SeePlayer(Pawn SeenPlayer);
function SwitchWeapon(byte f, optional bool bQuickGr);

defaultproperties
{
    ShortMemoryClass=class'ShortMemoryDF'
    TargetingSystemClass=class'TargetingSystemDF'
    PawnClass=class'wAIDefencePawn'
}