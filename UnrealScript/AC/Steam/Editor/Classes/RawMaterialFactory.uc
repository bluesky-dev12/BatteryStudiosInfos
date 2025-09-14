/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Editor\Classes\RawMaterialFactory.uc
 * Package Imports:
 *	Editor
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class RawMaterialFactory extends MaterialFactory;

var() class<Material> MaterialClass;

function Material CreateMaterial(Object InOuter, string InPackage, string InGroup, string InName)
{
    // End:0x0d
    if(MaterialClass == none)
    {
        return none;
    }
    return new (InOuter, InName, 4 + 524288) MaterialClass;
}

defaultproperties
{
    MaterialClass=Class'Engine.Shader'
    Description="Raw Material"
}