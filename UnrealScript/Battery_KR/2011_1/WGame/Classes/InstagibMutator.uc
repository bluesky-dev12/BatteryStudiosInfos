class InstagibMutator extends MutZoomInstagib
    config
    hidedropdown
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var float GravityZ;
var bool bLowGrav;

function PostBeginPlay()
{
    // End:0x1B
    if(InstagibCTF(Level.Game) == none)
    {
        return;
    }
    // End:0x8E
    if(InstagibCTF(Level.Game).bZoomInstagib)
    {
        WeaponName = 'ZoomSuperShockRifle';
        WeaponString = "xWeapons.ZoomSuperShockRifle";
        DefaultWeaponName = "xWeapons.ZoomSuperShockRifle";
    }
    bAllowTranslocator = InstagibCTF(Level.Game).bAllowTrans;
    bAllowBoost = InstagibCTF(Level.Game).bAllowBoost;
    // End:0x112
    if(InstagibCTF(Level.Game).bLowGrav)
    {
        bLowGrav = true;
        Level.DefaultGravity = GravityZ;
    }
    super(MutInstaGib).PostBeginPlay();
    //return;    
}

function bool MutatorIsAllowed()
{
    return true;
    //return;    
}

function bool AlwaysKeep(Actor Other)
{
    // End:0x20
    if(NextMutator != none)
    {
        return NextMutator.AlwaysKeep(Other);
    }
    return false;
    //return;    
}

function GetServerDetails(out ServerResponseLine ServerState)
{
    //return;    
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
    //return;    
}

static event string GetDescriptionText(string PropName)
{
    return "";
    //return;    
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
    local PhysicsVolume PV;
    local Vector XYDir;
    local float ZDiff, Time;
    local JumpPad j;

    // End:0x1AC
    if(bLowGrav)
    {
        PV = PhysicsVolume(Other);
        // End:0x74
        if(PV != none)
        {
            PV.Gravity.Z = FMax(PV.Gravity.Z, GravityZ);
            PV.bAlwaysRelevant = true;
            PV.RemoteRole = ROLE_DumbProxy;
        }
        j = JumpPad(Other);
        // End:0x149
        if(j != none)
        {
            XYDir = j.JumpTarget.Location - j.Location;
            ZDiff = XYDir.Z;
            Time = (2.5000000 * j.JumpZModifier) * Sqrt(Abs(ZDiff / GravityZ));
            j.JumpVelocity = XYDir / Time;
            j.JumpVelocity.Z = (ZDiff / Time) - ((0.5000000 * GravityZ) * Time);
        }
        // End:0x1AC
        if((Vehicle(Other) != none) && KarmaParams(Other.KParams) != none)
        {
            KarmaParams(Other.KParams).KActorGravScale *= (Class'Engine.PhysicsVolume'.default.Gravity.Z / GravityZ);
        }
    }
    return super(MutInstaGib).CheckReplacement(Other, bSuperRelevant);
    //return;    
}

defaultproperties
{
    GravityZ=-300.0000000
    WeaponName="SuperShockRifle"
    WeaponString="xWeapons.SuperShockRifle"
    DefaultWeaponName="xWeapons.SuperShockRifle"
}