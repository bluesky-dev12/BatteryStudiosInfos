/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\BodyEffect.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:3
 *
 *******************************************************************************/
class BodyEffect extends Effects;

var class<DamageType> DamageType;
var Vector HitLoc;

function PostBeginPlay()
{
    local ColorModifier Alpha;
    local float frame, Rate;
    local name Seq;

    super(Actor).PostBeginPlay();
    LinkMesh(Owner.Mesh);
    Owner.GetAnimParams(0, Seq, frame, Rate);
    PlayAnim(Seq, 0.0, 0.0);
    SetAnimFrame(frame);
    StopAnimating();
    Alpha = ColorModifier(Level.ObjectPool.AllocateObject(class'ColorModifier'));
    Alpha.Material = Skins[0];
    Alpha.AlphaBlend = true;
    Alpha.RenderTwoSided = true;
    Alpha.Color.A = 128;
    Skins[0] = Alpha;
    Skins[1] = Alpha;
    Skins[2] = Alpha;
}

simulated function Tick(float DeltaTime)
{
    SetDrawScale(DrawScale * float(1) + 0.50 * DeltaTime);
    ColorModifier(Skins[0]).Color.A = byte(int(128.0 * LifeSpan / default.LifeSpan));
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
}

defaultproperties
{
    DrawType=2
    LifeSpan=0.650
}