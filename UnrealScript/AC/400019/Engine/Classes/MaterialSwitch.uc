class MaterialSwitch extends Modifier
    native
    editinlinenew
    collapsecategories
    hidecategories(Object,Material,Modifier);

var() transient int current;
var() editinlineuse array<editinlineuse Material> Materials;

function Reset()
{
    current = 0;
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
    current++;
    // End:0x1E
    if(current >= Materials.Length)
    {
        current = 0;
    }
    // End:0x3E
    if(Materials.Length > 0)
    {
        Material = Materials[current];        
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
