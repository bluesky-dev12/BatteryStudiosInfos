/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\InteractionMaster.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:13
 *
 *******************************************************************************/
class InteractionMaster extends Interactions
    dependson(Interactions)
    native
    transient;

var transient Client Client;
var const transient Interaction BaseMenu;
var const transient Interaction Console;
var transient array<Interaction> GlobalInteractions;
var transient bool bRequireRawJoystick;

// Export UInteractionMaster::execTravel(FFrame&, void* const)
native function Travel(string URL);
event Interaction AddInteraction(string InteractionName, optional Player AttachTo)
{
    local Interaction NewInteraction;
    local class<Interaction> NewInteractionClass;

    NewInteractionClass = class<Interaction>(DynamicLoadObject(InteractionName, class'Class'));
    // End:0x12e
    if(NewInteractionClass != none)
    {
        NewInteraction = new NewInteractionClass;
        // End:0xf8
        if(NewInteraction != none)
        {
            // End:0xab
            if(AttachTo != none)
            {
                AttachTo.LocalInteractions.Length = AttachTo.LocalInteractions.Length + 1;
                AttachTo.LocalInteractions[AttachTo.LocalInteractions.Length - 1] = NewInteraction;
                NewInteraction.ViewportOwner = AttachTo;
            }
            // End:0xd0
            else
            {
                GlobalInteractions.Length = GlobalInteractions.Length + 1;
                GlobalInteractions[GlobalInteractions.Length - 1] = NewInteraction;
            }
            NewInteraction.Initialize();
            NewInteraction.Master = self;
            return NewInteraction;
        }
        // End:0x12b
        else
        {
            Log("Could not create interaction [" $ InteractionName $ "]", 'IMaster');
        }
    }
    // End:0x15f
    else
    {
        Log("Could not load interaction [" $ InteractionName $ "]", 'IMaster');
    }
    return none;
}

event RemoveInteraction(Interaction RemoveMe)
{
    local int Index;

    // End:0x91
    if(RemoveMe.ViewportOwner != none)
    {
        Index = 0;
        J0x1b:
        // End:0x8e [While If]
        if(Index < RemoveMe.ViewportOwner.LocalInteractions.Length)
        {
            // End:0x84
            if(RemoveMe.ViewportOwner.LocalInteractions[Index] == RemoveMe)
            {
                RemoveMe.ViewportOwner.LocalInteractions.Remove(Index, 1);
                return;
            }
            ++ Index;
            // This is an implied JumpToken; Continue!
            goto J0x1b;
        }
    }
    // End:0xd5
    else
    {
        Index = 0;
        J0x98:
        // End:0xd5 [While If]
        if(Index < GlobalInteractions.Length)
        {
            // End:0xcb
            if(GlobalInteractions[Index] == RemoveMe)
            {
                GlobalInteractions.Remove(Index, 1);
                return;
            }
            ++ Index;
            // This is an implied JumpToken; Continue!
            goto J0x98;
        }
    }
    Log("Could not remove interaction [" $ string(RemoveMe) $ "] (Not Found)", 'IMaster');
}

event SetFocusTo(Interaction Inter, optional Player ViewportOwner)
{
    local array<Interaction> InteractionArray;
    local Interaction temp;
    local int i, iIndex;

    // End:0x22
    if(ViewportOwner != none)
    {
        InteractionArray = ViewportOwner.LocalInteractions;
    }
    // End:0x2d
    else
    {
        InteractionArray = GlobalInteractions;
    }
    // End:0x6a
    if(InteractionArray.Length == 0)
    {
        Log("Attempt to SetFocus on an empty Array.", 'IMaster');
        return;
    }
    iIndex = -1;
    i = 0;
    J0x7c:
    // End:0xb9 [While If]
    if(i < InteractionArray.Length)
    {
        // End:0xaf
        if(InteractionArray[i] == Inter)
        {
            iIndex = i;
        }
        // End:0xb9
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x7c;
        }
    }
    // End:0x104
    if(iIndex < 0)
    {
        Log("Interaction " $ string(Inter) $ " is not in " $ string(ViewportOwner) $ ".", 'IMaster');
        return;
    }
    // End:0x111
    else
    {
        // End:0x111
        if(iIndex == 0)
        {
            return;
        }
    }
    temp = InteractionArray[iIndex];
    i = 0;
    J0x129:
    // End:0x15c [While If]
    if(i < iIndex)
    {
        InteractionArray[i + 1] = InteractionArray[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x129;
    }
    InteractionArray[0] = temp;
    InteractionArray[0].bActive = true;
    InteractionArray[0].bVisible = true;
}

event bool Process_KeyType(array<Interaction> InteractionArray, out Interactions.EInputKey key, optional string Unicode)
{
    local int Index;

    Index = 0;
    J0x07:
    // End:0x7b [While If]
    if(Index < InteractionArray.Length)
    {
        // End:0x71
        if(InteractionArray[Index].bActive && !InteractionArray[Index].bNativeEvents && InteractionArray[Index].KeyType(key, Unicode))
        {
            return true;
        }
        ++ Index;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

event bool Process_KeyEvent(array<Interaction> InteractionArray, out Interactions.EInputKey key, out Interactions.EInputAction Action, float Delta)
{
    local int Index;

    Index = 0;
    J0x07:
    // End:0x80 [While If]
    if(Index < InteractionArray.Length)
    {
        // End:0x76
        if(InteractionArray[Index].bActive && !InteractionArray[Index].bNativeEvents && InteractionArray[Index].KeyEvent(key, Action, Delta))
        {
            return true;
        }
        ++ Index;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

event Process_PreRender(array<Interaction> InteractionArray, Canvas Canvas)
{
    local int Index;

    Index = InteractionArray.Length;
    J0x0c:
    // End:0x78 [While If]
    if(Index > 0)
    {
        // End:0x6e
        if(InteractionArray[Index - 1].bVisible && !InteractionArray[Index - 1].bNativeEvents)
        {
            InteractionArray[Index - 1].PreRender(Canvas);
        }
        -- Index;
        // This is an implied JumpToken; Continue!
        goto J0x0c;
    }
}

event Process_PostRender(array<Interaction> InteractionArray, Canvas Canvas)
{
    local int Index;

    Index = InteractionArray.Length;
    J0x0c:
    // End:0x78 [While If]
    if(Index > 0)
    {
        // End:0x6e
        if(InteractionArray[Index - 1].bVisible && !InteractionArray[Index - 1].bNativeEvents)
        {
            InteractionArray[Index - 1].PostRender(Canvas);
        }
        -- Index;
        // This is an implied JumpToken; Continue!
        goto J0x0c;
    }
}

event Process_Tick(array<Interaction> InteractionArray, float DeltaTime)
{
    local int Index;

    Index = 0;
    J0x07:
    // End:0x6f [While If]
    if(Index < InteractionArray.Length)
    {
        // End:0x65
        if(InteractionArray[Index].bRequiresTick && !InteractionArray[Index].bNativeEvents)
        {
            InteractionArray[Index].Tick(DeltaTime);
        }
        ++ Index;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

event Process_Message(coerce string Msg, float MsgLife, array<Interaction> InteractionArray)
{
    local int Index;

    Index = 0;
    J0x07:
    // End:0x40 [While If]
    if(Index < InteractionArray.Length)
    {
        InteractionArray[Index].Message(Msg, MsgLife);
        ++ Index;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

event NotifyLevelChange(array<Interaction> InteractionArray)
{
    local int Index;

    Index = 0;
    J0x07:
    // End:0x36 [While If]
    if(Index < InteractionArray.Length)
    {
        InteractionArray[Index].NotifyLevelChange();
        ++ Index;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

event DisableInteractions(array<Interaction> InteractionArray)
{
    local int Index;

    Index = 0;
    J0x07:
    // End:0x36 [While If]
    if(Index < InteractionArray.Length)
    {
        InteractionArray[Index].DisableInteraction();
        ++ Index;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

event EnableInteractions(array<Interaction> InteractionArray)
{
    local int Index;

    Index = 0;
    J0x07:
    // End:0x36 [While If]
    if(Index < InteractionArray.Length)
    {
        InteractionArray[Index].EnableInteraction();
        ++ Index;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}
