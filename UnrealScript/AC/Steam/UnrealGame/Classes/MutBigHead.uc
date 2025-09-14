/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\MutBigHead.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:3
 *
 *******************************************************************************/
class MutBigHead extends Mutator
    dependson(BigHeadRules)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function PostBeginPlay()
{
    local BigHeadRules G;

    super(Actor).PostBeginPlay();
    G = Spawn(class'BigHeadRules');
    G.BigHeadMutator = self;
    // End:0x61
    if(Level.Game.GameRulesModifiers == none)
    {
        Level.Game.GameRulesModifiers = G;
    }
    // End:0x87
    else
    {
        Level.Game.GameRulesModifiers.AddGameRules(G);
    }
}

function float GetHeadScaleFor(Pawn P)
{
    local float NewScale;

    // End:0x46
    if(Abs(P.PlayerReplicationInfo.Deaths) < float(1))
    {
        NewScale = P.PlayerReplicationInfo.Score + float(1);
    }
    // End:0x86
    else
    {
        NewScale = P.PlayerReplicationInfo.Score + float(1) / P.PlayerReplicationInfo.Deaths + float(1);
    }
    return FClamp(NewScale, 0.50, 4.0);
}

function ModifyPlayer(Pawn Other)
{
    Other.SetHeadScale(GetHeadScaleFor(Other));
    // End:0x39
    if(NextMutator != none)
    {
        NextMutator.ModifyPlayer(Other);
    }
}

defaultproperties
{
    GroupName="BigHead"
    FriendlyName="???"
    Description="????? ??? ?? ?? ??? ?????"
}