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
native function addResult(ResultData Data)
{
    //native.Data;        
}

event getResult(out ResultData Data, int Index)
{
    // End:0x20
    if((Index >= TraceResultArray.Length) || Index < 0)
    {        
    }
    else
    {
        Data = TraceResultArray[Index];
    }
    //return;    
}

event clearResultArray()
{
    local int i;

    i = TraceResultArray.Length - 1;
    J0x0F:

    // End:0x30 [Loop If]
    if(i >= 0)
    {
        TraceResultArray.Remove(i, 1);
        i--;
        // [Loop Continue]
        goto J0x0F;
    }
    //return;    
}
