/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\ObjectPool.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:5
 *
 *******************************************************************************/
class ObjectPool extends Object
    native;

var array<Object> Objects;
var int NewCount;

// Export UObjectPool::execPopObject(FFrame&, void* const)
native simulated function Object PopObject(Class ObjectClass);
simulated function Object AllocateObject(Class ObjectClass)
{
    local Object Result;

    Result = PopObject(ObjectClass);
    // End:0x36
    if(Result == none)
    {
        Result = new (Outer) ObjectClass;
        ++ NewCount;
    }
    return Result;
}

simulated function Object FreeObject(Object obj)
{
    // End:0x30
    if(obj != none)
    {
        Objects.Length = Objects.Length + 1;
        Objects[Objects.Length - 1] = obj;
    }
    return none;
}

// Export UObjectPool::execFreeObjectDupCheck(FFrame&, void* const)
native simulated function Object FreeObjectDupCheck(Object obj);
simulated function Shrink()
{
    // End:0x1f [While If]
    if(Objects.Length > 0)
    {
        J0x00:
        Objects.Remove(Objects.Length - 1, 1);
        // This is an implied JumpToken; Continue!
        goto J0x00;
    }
}
