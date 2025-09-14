/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\DestroyableObjective_SM.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:6
 *
 *******************************************************************************/
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
    // End:0x4e
    if(AntiPortalTag != 'None')
    {
        // End:0x4d
        foreach AllActors(class'AntiPortalActor', AntiPortalA, AntiPortalTag)
        {
            AntiPortals[AntiPortals.Length] = AntiPortalA;                        
        }
    }
    super.PostBeginPlay();
}

simulated function AdjustAntiPortals()
{
    local int i;

    // End:0xcc
    if(AntiPortals.Length > 0)
    {
        // End:0x75
        if(StaticMesh == OriginalMesh)
        {
            i = 0;
            J0x22:
            // End:0x72 [While If]
            if(i < AntiPortals.Length)
            {
                // End:0x68
                if(AntiPortals[i].DrawType != 11)
                {
                    AntiPortals[i].SetDrawType(11);
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x22;
            }
        }
        // End:0xcc
        else
        {
            i = 0;
            J0x7c:
            // End:0xcc [While If]
            if(i < AntiPortals.Length)
            {
                // End:0xc2
                if(AntiPortals[i].DrawType != 0)
                {
                    AntiPortals[i].SetDrawType(0);
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x7c;
            }
        }
    }
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
}

function Reset()
{
    // End:0x2d
    if(DestroyedStaticMesh != none)
    {
        KSetBlockKarma(false);
        SetStaticMesh(OriginalMesh);
        KSetBlockKarma(true);
        AdjustAntiPortals();
    }
    // End:0x35
    else
    {
        bHidden = false;
    }
    super.Reset();
}

function DisableObjective(Pawn Instigator)
{
    // End:0x3d
    if(!bActive || bDisabled || !UnrealMPGameInfo(Level.Game).CanDisableObjective(self))
    {
        return;
    }
    super.DisableObjective(Instigator);
    // End:0x7f
    if(DestroyedStaticMesh != none)
    {
        KSetBlockKarma(false);
        SetStaticMesh(DestroyedStaticMesh);
        SetCollision(true, bBlockActors);
        KSetBlockKarma(true);
        AdjustAntiPortals();
    }
    // End:0x87
    else
    {
        bHidden = true;
    }
}

simulated function UpdatePrecacheStaticMeshes()
{
    super(Actor).UpdatePrecacheStaticMeshes();
    // End:0x25
    if(DestroyedStaticMesh != none)
    {
        Level.AddPrecacheStaticMesh(DestroyedStaticMesh);
    }
}

defaultproperties
{
    DrawType=8
    StaticMesh=StaticMesh'Editor.TexPropCube'
    bHidden=true
    bStaticLighting=true
    bBlockActors=true
    bBlockKarma=true
    bBlocksTeleport=true
    bEdShouldSnap=true
}