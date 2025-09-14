/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\RocketCorona.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	States:2
 *
 *******************************************************************************/
class RocketCorona extends Effects;

auto state Start
{
    simulated function Tick(float dt)
    {
        SetDrawScale(FMin(DrawScale + dt * 12.0, 0.50));
        // End:0x36
        if(DrawScale >= 0.50)
        {
            GotoState('End');
        }
    }

}

state End
{
    simulated function Tick(float dt)
    {
        SetDrawScale(FMax(DrawScale - dt * 12.0, 0.30));
        // End:0x36
        if(DrawScale <= 0.30)
        {
            GotoState('None');
        }
    }

}

defaultproperties
{
    bTrailerSameRotation=true
    Physics=10
    Texture=Texture'FX_TEX.flame.RPGFlare'
    DrawScale=0.0
    DrawScale3D=(X=0.70,Y=0.350,Z=0.350)
    Skins=// Object reference not set to an instance of an object.
    
    Style=3
    Mass=13.0
}