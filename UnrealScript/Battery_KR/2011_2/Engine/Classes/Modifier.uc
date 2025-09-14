class Modifier extends Material
    abstract
    native
    editinlinenew
    collapsecategories
    hidecategories(Object,Material);

var() editinlineuse Material Material;

function Reset()
{
    // End:0x1A
    if(Material != none)
    {
        Material.Reset();
    }
    // End:0x34
    if(FallbackMaterial != none)
    {
        FallbackMaterial.Reset();
    }
    //return;    
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
    //return;    
}

defaultproperties
{
    MaterialType=1
}