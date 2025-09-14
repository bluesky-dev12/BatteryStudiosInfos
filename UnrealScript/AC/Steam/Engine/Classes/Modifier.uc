/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Modifier.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class Modifier extends Material
    hidecategories(Object,Material)
    native
    editinlinenew
    collapsecategories
    abstract;

var() editinlineuse Material Material;

function Reset()
{
    // End:0x1a
    if(Material != none)
    {
        Material.Reset();
    }
    // End:0x34
    if(FallbackMaterial != none)
    {
        FallbackMaterial.Reset();
    }
}

function Trigger(Actor Other, Actor EventInstigator)
{
    // End:0x24
    if(Material != none)
    {
        Material.Trigger(Other, EventInstigator);
    }
    // End:0x48
    if(FallbackMaterial != none)
    {
        FallbackMaterial.Trigger(Other, EventInstigator);
    }
}

defaultproperties
{
    MaterialType=1
}