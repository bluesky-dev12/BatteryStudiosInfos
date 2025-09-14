/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\BtrTraceResult.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:1
 *	Functions:3
 *
 *******************************************************************************/
class BtrTraceResult extends Object
    native
    exportstructs;

struct ResultData
{
    var Actor HitActor;
    var Vector HitLocation;
    var Vector HitNormal;
    var Actor.CollisionPartsType CollisionPart;
    var Material HitMaterial;
};

var array<ResultData> TraceResultArray;

// Export UBtrTraceResult::execaddResult(FFrame&, void* const)
native function addResult(ResultData Data);
event getResult(out ResultData Data, int Index)
{
    // End:0x20
    if(Index >= TraceResultArray.Length || Index < 0)
    {
    }
    // End:0x31
    else
    {
        Data = TraceResultArray[Index];
    }
}

event clearResultArray()
{
    local int i;

    i = TraceResultArray.Length - 1;
    J0x0f:
    // End:0x30 [While If]
    if(i >= 0)
    {
        TraceResultArray.Remove(i, 1);
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0x0f;
    }
}
