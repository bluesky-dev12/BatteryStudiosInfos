/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\DMMutator.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:1
 *	Properties:5
 *	Functions:3
 *
 *******************************************************************************/
class DMMutator extends Mutator
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config()
    hidedropdown;

const PROPNUM = 2;

var() globalconfig bool bMegaSpeed;
var() globalconfig float AirControl;
var() globalconfig bool bBrightSkins;
var localized string DMMutPropsDisplayText[2];
var localized string DMMutDescText[2];

function bool MutatorIsAllowed()
{
    return true;
}

function bool AlwaysKeep(Actor Other)
{
    // End:0x20
    if(NextMutator != none)
    {
        return NextMutator.AlwaysKeep(Other);
    }
    return false;
}

function GetServerDetails(out ServerResponseLine ServerState);

defaultproperties
{
    AirControl=0.350
    bBrightSkins=true
    DMMutPropsDisplayText[0]="?? ???"
    DMMutPropsDisplayText[1]="?? ???"
    DMMutDescText[0]="?? ??? ?? ?????"
    DMMutDescText[1]="??? ???? ?? ???? ?????"
}