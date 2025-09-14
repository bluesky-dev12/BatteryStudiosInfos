class MaterialSwitch extends Modifier
    native
    editinlinenew
    collapsecategories
    hidecategories(Object,Material,Modifier);

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
    else
    {
        Material = none;
    }
    // End:0x44
    if(Material != none)
    {
        Material.Reset();
    }
    // End:0x5E
    if(FallbackMaterial != none)
    {
        FallbackMaterial.Reset();
    }
    //return;    
}

function Trigger(Actor Other, Actor EventInstigator)
{
    Current++;
    // End:0x1E
    if(Current >= Materials.Length)
    {
        Current = 0;
    }
    // End:0x3E
    if(Materials.Length > 0)
    {
        Material = Materials[Current];        
    }
    else
    {
        Material = none;
    }
    // End:0x69
    if(Material != none)
    {
        Material.Trigger(Other, EventInstigator);
    }
    // End:0x8D
    if(FallbackMaterial != none)
    {
        FallbackMaterial.Trigger(Other, EventInstigator);
    }
    //return;    
}
