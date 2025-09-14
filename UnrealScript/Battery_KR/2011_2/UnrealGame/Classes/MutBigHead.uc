class MutBigHead extends Mutator
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function PostBeginPlay()
{
    local BigHeadRules G;

    super(Actor).PostBeginPlay();
    G = Spawn(Class'UnrealGame_Decompressed.BigHeadRules');
    G.BigHeadMutator = self;
    // End:0x61
    if(Level.Game.GameRulesModifiers == none)
    {
        Level.Game.GameRulesModifiers = G;        
    }
    else
    {
        Level.Game.GameRulesModifiers.AddGameRules(G);
    }
    //return;    
}

function float GetHeadScaleFor(Pawn P)
{
    local float NewScale;

    // End:0x46
    if(Abs(P.PlayerReplicationInfo.Deaths) < float(1))
    {
        NewScale = P.PlayerReplicationInfo.Score + float(1);        
    }
    else
    {
        NewScale = (P.PlayerReplicationInfo.Score + float(1)) / (P.PlayerReplicationInfo.Deaths + float(1));
    }
    return FClamp(NewScale, 0.5000000, 4.0000000);
    //return;    
}

function ModifyPlayer(Pawn Other)
{
    Other.SetHeadScale(GetHeadScaleFor(Other));
    // End:0x39
    if(NextMutator != none)
    {
        NextMutator.ModifyPlayer(Other);
    }
    //return;    
}

defaultproperties
{
    GroupName="BigHead"
    FriendlyName="???"
    Description="????? ??? ?? ?? ??? ?????"
}