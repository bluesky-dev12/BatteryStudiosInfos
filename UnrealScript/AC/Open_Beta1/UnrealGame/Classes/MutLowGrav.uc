class MutLowGrav extends Mutator
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var float GravityZ;

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    Level.DefaultGravity = GravityZ;
    //return;    
}

function bool MutatorIsAllowed()
{
    return true;
    //return;    
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
    local PhysicsVolume PV;
    local Vector XYDir;
    local float ZDiff, Time;
    local JumpPad j;

    PV = PhysicsVolume(Other);
    // End:0x88
    if(PV != none)
    {
        PV.Gravity.Z = FMax(PV.Gravity.Z, GravityZ);
        PV.BACKUP_Gravity = PV.Gravity;
        PV.bAlwaysRelevant = true;
        PV.RemoteRole = ROLE_DumbProxy;
    }
    j = JumpPad(Other);
    // End:0x15D
    if(j != none)
    {
        XYDir = j.JumpTarget.Location - j.Location;
        ZDiff = XYDir.Z;
        Time = (2.5000000 * j.JumpZModifier) * Sqrt(Abs(ZDiff / GravityZ));
        j.JumpVelocity = XYDir / Time;
        j.JumpVelocity.Z = (ZDiff / Time) - ((0.5000000 * GravityZ) * Time);
    }
    // End:0x1C0
    if((Vehicle(Other) != none) && KarmaParams(Other.KParams) != none)
    {
        KarmaParams(Other.KParams).KActorGravScale *= (Class'Engine.PhysicsVolume'.default.Gravity.Z / GravityZ);
    }
    return true;
    //return;    
}

defaultproperties
{
    GravityZ=-300.0000000
    GroupName="Gravity"
    FriendlyName="?? ??"
    Description="??? ????"
}