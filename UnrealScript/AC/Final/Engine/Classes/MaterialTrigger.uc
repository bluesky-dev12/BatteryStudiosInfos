class MaterialTrigger extends Triggers
    placeable;

var() array<Material> MaterialsToTrigger;

function PostBeginPlay()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x47 [Loop If]
    if(i < MaterialsToTrigger.Length)
    {
        // End:0x3D
        if(MaterialsToTrigger[i] != none)
        {
            MaterialsToTrigger[i].Reset();
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
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

    // End:0x63 [Loop If]
    if(i < MaterialsToTrigger.Length)
    {
        // End:0x59
        if(MaterialsToTrigger[i] != none)
        {
            MaterialsToTrigger[i].Trigger(Other, EventInstigator);
        }
        i++;
        // [Loop Continue]
        goto J0x19;
    }
    // End:0xDE
    if(Level.GetMatchMaker().BotTutorial)
    {
        // End:0xDE
        if((Other == none) || EventInstigator == none)
        {
            i = 0;
            J0x9E:

            // End:0xDE [Loop If]
            if(i < MaterialsToTrigger.Length)
            {
                // End:0xD4
                if(MaterialsToTrigger[i] != none)
                {
                    MaterialsToTrigger[i].Reset();
                }
                i++;
                // [Loop Continue]
                goto J0x9E;
            }
        }
    }
    //return;    
}

defaultproperties
{
    Texture=Texture'Engine_Decompressed.S_MaterialTrigger'
    bCollideActors=false
}