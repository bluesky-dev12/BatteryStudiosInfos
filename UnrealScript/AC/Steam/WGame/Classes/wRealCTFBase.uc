/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wRealCTFBase.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:3
 *
 *******************************************************************************/
class wRealCTFBase extends CTFBase
    hidecategories(Lighting,LightColor,Karma,Force)
    abstract;

var GameReplicationInfo GRI;
var() Vector BaseOffset;

simulated function UpdateForTeam();
simulated function SetGRI(GameReplicationInfo NewGRI)
{
    GRI = NewGRI;
    UpdateForTeam();
}

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x2c
    if(Level.NetMode != 1)
    {
        LoopAnim('flag', 0.80);
    }
    // End:0x5d
    if(Level.Game != none)
    {
        SetGRI(Level.Game.GameReplicationInfo);
    }
}

defaultproperties
{
    BaseOffset=(X=2.0,Y=0.0,Z=-18.0)
    bHidden=true
    DrawScale=1.20
    CollisionHeight=80.0
    bNetNotify=true
}