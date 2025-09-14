class RawMaterialFactory extends MaterialFactory;

var() Class<Material> MaterialClass;

function Material CreateMaterial(Object InOuter, string InPackage, string InGroup, string InName)
{
    // End:0x0D
    if(MaterialClass == none)
    {
        return none;
    }
    return new (InOuter, InName, 4 + 524288) MaterialClass;
    //return;    
}

defaultproperties
{
    MaterialClass=Class'Engine.Shader'
    Description="Raw Material"
}