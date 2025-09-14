class MaterialFactory extends Object
    abstract
    native;

var string Description;

event Material CreateMaterial(Object InOuter, string InPackage, string InGroup, string InName)
{
    //return;    
}

// Export UMaterialFactory::execConsoleCommand(FFrame&, void* const)
native function ConsoleCommand(string Cmd)
{
    //native.Cmd;        
}
