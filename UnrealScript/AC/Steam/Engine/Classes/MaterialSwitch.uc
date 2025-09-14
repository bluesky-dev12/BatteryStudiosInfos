/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\MaterialSwitch.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class MaterialSwitch extends Modifier
    hidecategories(Object,Material,Modifier)
    native
    editinlinenew
    collapsecategories;

var() transient int Current;
var() editinlineuse array<editinlineuse Material> Materials;

function Reset()
{
    Current = 0;
    // End:0x23
    if(Materials.Length > 0)
    {
        Material = Materials[0];
    }
    // End:0x2a
    else
    {
        Material = none;
    }
    // End:0x44
    if(Material != none)
    {
        Material.Reset();
    }
    // End:0x5e
    if(FallbackMaterial != none)
    {
        FallbackMaterial.Reset();
    }
}

function Trigger(Actor Other, Actor EventInstigator)
{
    ++ Current;
    // End:0x1e
    if(Current >= Materials.Length)
    {
        Current = 0;
    }
    // End:0x3e
    if(Materials.Length > 0)
    {
        Material = Materials[Current];
    }
    // End:0x45
    else
    {
        Material = none;
    }
    // End:0x69
    if(Material != none)
    {
        Material.Trigger(Other, EventInstigator);
    }
    // End:0x8d
    if(FallbackMaterial != none)
    {
        FallbackMaterial.Trigger(Other, EventInstigator);
    }
}
