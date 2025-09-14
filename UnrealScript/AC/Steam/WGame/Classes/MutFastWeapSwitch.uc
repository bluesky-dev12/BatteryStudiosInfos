/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\MutFastWeapSwitch.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	States:1
 *
 *******************************************************************************/
class MutFastWeapSwitch extends Mutator
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

auto state StartUp
{
    function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
    {
        bSuperRelevant = 0;
        // End:0x35
        if(GameReplicationInfo(Other) != none)
        {
            GameReplicationInfo(Other).bFastWeaponSwitching = true;
            GotoState('None');
        }
        // End:0x5b
        if(wPawn(Other) != none)
        {
            wPawn(Other).bCanBoostDodge = true;
        }
        return true;
    }

}

defaultproperties
{
    GroupName="WeapSwitch"
    FriendlyName="?? ?? ??"
    Description="UT2003 ????? ??? ??? ??? ? ????."
}