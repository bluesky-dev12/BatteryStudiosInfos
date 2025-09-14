/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Editor\Classes\MaterialFactory.uc
 * Package Imports:
 *	Editor
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class MaterialFactory extends Object
    native
    abstract;

var string Description;

event Material CreateMaterial(Object InOuter, string InPackage, string InGroup, string InName);
// Export UMaterialFactory::execConsoleCommand(FFrame&, void* const)
native function ConsoleCommand(string Cmd);
