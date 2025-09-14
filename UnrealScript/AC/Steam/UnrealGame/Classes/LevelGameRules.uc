/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\LevelGameRules.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class LevelGameRules extends Info
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() array< class<Mutator> > MapMutator;

function PreBeginPlay();
function UpdateGame(GameInfo G)
{
    local int i;

    // End:0x49
    if(MapMutator.Length > 0)
    {
        i = 0;
        J0x13:
        // End:0x49 [While If]
        if(i < MapMutator.Length)
        {
            G.AddMutator(string(MapMutator[i]));
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x13;
        }
    }
}
