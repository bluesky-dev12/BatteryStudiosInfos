class DestroyableObjective_SM extends DestroyableObjective
    hidecategories(Lighting,LightColor,Karma,Force);

var() StaticMesh DestroyedStaticMesh;
var StaticMesh OriginalMesh;
var StaticMesh OldStaticMesh;
var array<AntiPortalActor> AntiPortals;
var() name AntiPortalTag;

simulated function PostBeginPlay()
{
    local AntiPortalActor AntiPortalA;

    OriginalMesh = StaticMesh;
    OldStaticMesh = StaticMesh;
    // End:0x4E
    if(AntiPortalTag != 'None')
    {
        // End:0x4D
        foreach AllActors(Class'Engine.AntiPortalActor', AntiPortalA, AntiPortalTag)
        {
            AntiPortals[AntiPortals.Length] = AntiPortalA;            
        }        
    }
    super.PostBeginPlay();
    //return;    
}

simulated function AdjustAntiPortals()
{
    local int i;

    // End:0xCC
    if(AntiPortals.Length > 0)
    {
        // End:0x75
        if(StaticMesh == OriginalMesh)
        {
            i = 0;
            J0x22:

            // End:0x72 [Loop If]
            if(i < AntiPortals.Length)
            {
                // End:0x68
                if(int(AntiPortals[i].DrawType) != int(11))
                {
                    AntiPortals[i].SetDrawType(11);
                }
                i++;
                // [Loop Continue]
                goto J0x22;
            }            
        }
        else
        {
            i = 0;
            J0x7C:

            // End:0xCC [Loop If]
            if(i < AntiPortals.Length)
            {
                // End:0xC2
                if(int(AntiPortals[i].DrawType) != int(0))
                {
                    AntiPortals[i].SetDrawType(0);
                }
                i++;
                // [Loop Continue]
                goto J0x7C;
            }
        }
    }
    //return;    
}

simulated function PostNetReceive()
{
    super(GameObjective).PostNetReceive();
    // End:0x34
    if(OldStaticMesh != StaticMesh)
    {
        KSetBlockKarma(false);
        KSetBlockKarma(true);
        OldStaticMesh = StaticMesh;
        AdjustAntiPortals();
    }
    //return;    
}

function Reset()
{
    // End:0x2D
    if(DestroyedStaticMesh != none)
    {
        KSetBlockKarma(false);
        SetStaticMesh(OriginalMesh);
        KSetBlockKarma(true);
        AdjustAntiPortals();        
    }
    else
    {
        bHidden = false;
    }
    super.Reset();
    //return;    
}

function DisableObjective(Pawn Instigator)
{
    // End:0x3D
    if((!bActive || bDisabled) || !UnrealMPGameInfo(Level.Game).CanDisableObjective(self))
    {
        return;
    }
    super.DisableObjective(Instigator);
    // End:0x7F
    if(DestroyedStaticMesh != none)
    {
        KSetBlockKarma(false);
        SetStaticMesh(DestroyedStaticMesh);
        SetCollision(true, bBlockActors);
        KSetBlockKarma(true);
        AdjustAntiPortals();        
    }
    else
    {
        bHidden = true;
    }
    //return;    
}

simulated function UpdatePrecacheStaticMeshes()
{
    super(Actor).UpdatePrecacheStaticMeshes();
    // End:0x25
    if(DestroyedStaticMesh != none)
    {
        Level.AddPrecacheStaticMesh(DestroyedStaticMesh);
    }
    //return;    
}

defaultproperties
{
    DrawType=8
    StaticMesh=StaticMesh'Editor.TexPropCube'
    bHidden=false
    bStaticLighting=true
    bBlockActors=true
    bBlockKarma=true
    bBlocksTeleport=true
    bEdShouldSnap=true
}