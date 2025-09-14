class BodyEffect extends Effects;

var Class<DamageType> DamageType;
var Vector HitLoc;

function PostBeginPlay()
{
    local ColorModifier Alpha;
    local float frame, Rate;
    local name Seq;

    super(Actor).PostBeginPlay();
    LinkMesh(Owner.Mesh);
    Owner.GetAnimParams(0, Seq, frame, Rate);
    PlayAnim(Seq, 0.0000000, 0.0000000);
    SetAnimFrame(frame);
    StopAnimating();
    Alpha = ColorModifier(Level.ObjectPool.AllocateObject(Class'Engine.ColorModifier'));
    Alpha.Material = Skins[0];
    Alpha.AlphaBlend = true;
    Alpha.RenderTwoSided = true;
    Alpha.Color.A = 128;
    Skins[0] = Alpha;
    Skins[1] = Alpha;
    Skins[2] = Alpha;
    //return;    
}

simulated function Tick(float DeltaTime)
{
    SetDrawScale(DrawScale * (float(1) + (0.5000000 * DeltaTime)));
    ColorModifier(Skins[0]).Color.A = byte(int(128.0000000 * (LifeSpan / default.LifeSpan)));
    //return;    
}

simulated function Destroyed()
{
    // End:0x44
    if(wPawn(Owner) != none)
    {
        wPawn(Owner).bFrozenBody = false;
        wPawn(Owner).PlayDyingAnimation(DamageType, HitLoc);
    }
    Level.ObjectPool.FreeObject(Skins[0]);
    Skins[0] = none;
    Skins[1] = none;
    Skins[2] = none;
    super(Actor).Destroyed();
    //return;    
}

defaultproperties
{
    DrawType=2
    LifeSpan=0.6500000
}