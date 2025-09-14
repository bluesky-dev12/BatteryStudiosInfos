/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wActionContainer.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:9
 *
 *******************************************************************************/
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
}

function ClearReferences()
{
    Log("[wActionContainer::ClearReferences]");
    Owner = none;
    Action = none;
}

function wActionContainer AddSubContainer(wAction inAction)
{
    local wActionContainer Sub;

    Sub = wActionContainer(Owner.AILevel.PoolActionContainer.AllocateObject(class'wActionContainer')).Init(Owner);
    SubActionContainers[SubActionContainersLength] = Sub;
    Sub.Action = inAction;
    ++ SubActionContainersLength;
    return Sub;
}

function bool Includes(wAction testAction)
{
    local int lp1;

    // End:0x14
    if(Action == testAction)
    {
        return true;
    }
    // End:0x55
    else
    {
        lp1 = 0;
        J0x1b:
        // End:0x53 [While If]
        if(lp1 < SubActionContainersLength)
        {
            // End:0x49
            if(SubActionContainers[lp1].Includes(testAction))
            {
                return true;
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x1b;
        }
        return false;
    }
}

function WriteFutureState(out wFutureState fs)
{
    local int lp1;

    Action.WriteFutureState(fs);
    lp1 = 0;
    J0x1b:
    // End:0x4e [While If]
    if(lp1 < SubActionContainersLength)
    {
        SubActionContainers[lp1].WriteFutureState(fs);
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x1b;
    }
}

function FreeAll()
{
    FreeActions();
    FreeActionContainers();
}

function FreeActions()
{
    local int lp1;

    Owner.AILevel.PoolAction.FreeObjectDupCheck(Action);
    lp1 = 0;
    J0x2d:
    // End:0x5b [While If]
    if(lp1 < SubActionContainersLength)
    {
        SubActionContainers[lp1].FreeActions();
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x2d;
    }
}

function FreeActionContainers()
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x35 [While If]
    if(lp1 < SubActionContainersLength)
    {
        SubActionContainers[lp1].FreeActionContainers();
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    Owner.AILevel.PoolActionContainer.FreeObjectDupCheck(self);
    SubActionContainersLength = 0;
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
        // End:0x84 [While If]
        if(lp1 < SubActionContainersLength)
        {
            // End:0x5c
            if(lp1 > 0)
            {
                str $= "/";
            }
            str $= SubActionContainers[lp1].ToString();
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x36;
        }
        str $= "]";
    }
    return str;
}
