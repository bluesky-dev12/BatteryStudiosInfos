class wActionContainer extends Object;

var wAIBotBase Owner;
var wAction Action;
var array<wActionContainer> SubActionContainers;
var int SubActionContainersLength;

function wActionContainer Init(wAIBotBase inOwner)
{
    Owner = inOwner;
    Action = none;
    SubActionContainersLength = 0;
    return self;
    //return;    
}

function ClearReferences()
{
    Log("[wActionContainer::ClearReferences]");
    Owner = none;
    Action = none;
    //return;    
}

function wActionContainer AddSubContainer(wAction inAction)
{
    local wActionContainer Sub;

    Sub = wActionContainer(Owner.AILevel.PoolActionContainer.AllocateObject(Class'WGame_Decompressed.wActionContainer')).Init(Owner);
    SubActionContainers[SubActionContainersLength] = Sub;
    Sub.Action = inAction;
    SubActionContainersLength++;
    return Sub;
    //return;    
}

function bool Includes(wAction testAction)
{
    local int lp1;

    // End:0x14
    if(Action == testAction)
    {
        return true;        
    }
    else
    {
        lp1 = 0;
        J0x1B:

        // End:0x53 [Loop If]
        if(lp1 < SubActionContainersLength)
        {
            // End:0x49
            if(SubActionContainers[lp1].Includes(testAction))
            {
                return true;
            }
            lp1++;
            // [Loop Continue]
            goto J0x1B;
        }
        return false;
    }
    //return;    
}

function WriteFutureState(out wFutureState fs)
{
    local int lp1;

    Action.WriteFutureState(fs);
    lp1 = 0;
    J0x1B:

    // End:0x4E [Loop If]
    if(lp1 < SubActionContainersLength)
    {
        SubActionContainers[lp1].WriteFutureState(fs);
        lp1++;
        // [Loop Continue]
        goto J0x1B;
    }
    //return;    
}

function FreeAll()
{
    FreeActions();
    FreeActionContainers();
    //return;    
}

function FreeActions()
{
    local int lp1;

    Owner.AILevel.PoolAction.FreeObjectDupCheck(Action);
    lp1 = 0;
    J0x2D:

    // End:0x5B [Loop If]
    if(lp1 < SubActionContainersLength)
    {
        SubActionContainers[lp1].FreeActions();
        lp1++;
        // [Loop Continue]
        goto J0x2D;
    }
    //return;    
}

function FreeActionContainers()
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x35 [Loop If]
    if(lp1 < SubActionContainersLength)
    {
        SubActionContainers[lp1].FreeActionContainers();
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    Owner.AILevel.PoolActionContainer.FreeObjectDupCheck(self);
    SubActionContainersLength = 0;
    //return;    
}

function string ToString()
{
    local int lp1;
    local string str;

    str = Action.ActionName;
    // End:0x90
    if(SubActionContainersLength > 0)
    {
        str = str $ "[";
        lp1 = 0;
        J0x36:

        // End:0x84 [Loop If]
        if(lp1 < SubActionContainersLength)
        {
            // End:0x5C
            if(lp1 > 0)
            {
                str $= "/";
            }
            str $= SubActionContainers[lp1].ToString();
            lp1++;
            // [Loop Continue]
            goto J0x36;
        }
        str $= "]";
    }
    return str;
    //return;    
}
