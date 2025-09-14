class ObjectPool extends Object
    native;

var array<Object> Objects;
var int NewCount;

// Export UObjectPool::execPopObject(FFrame&, void* const)
native simulated function Object PopObject(Class ObjectClass)
{
    //native.ObjectClass;        
}

simulated function Object AllocateObject(Class ObjectClass)
{
    local Object Result;

    Result = PopObject(ObjectClass);
    // End:0x36
    if(Result == none)
    {
        Result = new (Outer) ObjectClass;
        NewCount++;
    }
    return Result;
    //return;    
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
    //return;    
}

// Export UObjectPool::execFreeObjectDupCheck(FFrame&, void* const)
native simulated function Object FreeObjectDupCheck(Object obj)
{
    //native.obj;        
}

simulated function Shrink()
{
    J0x00:
    // End:0x1F [Loop If]
    if(Objects.Length > 0)
    {
        Objects.Remove(Objects.Length - 1, 1);
        // [Loop Continue]
        goto J0x00;
    }
    //return;    
}
