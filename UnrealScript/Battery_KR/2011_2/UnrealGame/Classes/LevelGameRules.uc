class LevelGameRules extends Info
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() array< Class<Mutator> > MapMutator;

function PreBeginPlay()
{
    //return;    
}

function UpdateGame(GameInfo G)
{
    local int i;

    // End:0x49
    if(MapMutator.Length > 0)
    {
        i = 0;
        J0x13:

        // End:0x49 [Loop If]
        if(i < MapMutator.Length)
        {
            G.AddMutator(string(MapMutator[i]));
            i++;
            // [Loop Continue]
            goto J0x13;
        }
    }
    //return;    
}
