/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\MaterialTrigger.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class MaterialTrigger extends Triggers
    placeable;

var() array<Material> MaterialsToTrigger;

function PostBeginPlay()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x47 [While If]
    if(i < MaterialsToTrigger.Length)
    {
        // End:0x3d
        if(MaterialsToTrigger[i] != none)
        {
            MaterialsToTrigger[i].Reset();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    local int i;

    // End:0x12
    if(Other == none)
    {
        Other = self;
    }
    i = 0;
    J0x19:
    // End:0x63 [While If]
    if(i < MaterialsToTrigger.Length)
    {
        // End:0x59
        if(MaterialsToTrigger[i] != none)
        {
            MaterialsToTrigger[i].Trigger(Other, EventInstigator);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x19;
    }
    // End:0xde
    if(Level.GetMatchMaker().BotTutorial)
    {
        // End:0xde
        if(Other == none || EventInstigator == none)
        {
            i = 0;
            J0x9e:
            // End:0xde [While If]
            if(i < MaterialsToTrigger.Length)
            {
                // End:0xd4
                if(MaterialsToTrigger[i] != none)
                {
                    MaterialsToTrigger[i].Reset();
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x9e;
            }
        }
    }
}

defaultproperties
{
    Texture=Texture'S_MaterialTrigger'
    bCollideActors=true
}