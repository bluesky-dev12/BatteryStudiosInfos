class InteractionMaster extends Interactions
    transient
    native;

var transient Client Client;
var const transient Interaction BaseMenu;
var const transient Interaction Console;
var transient array<Interaction> GlobalInteractions;
var transient bool bRequireRawJoystick;

// Export UInteractionMaster::execTravel(FFrame&, void* const)
native function Travel(string URL)
{
    //native.URL;        
}

event Interaction AddInteraction(string InteractionName, optional Player AttachTo)
{
    local Interaction NewInteraction;
    local Class<Interaction> NewInteractionClass;

    NewInteractionClass = Class<Interaction>(DynamicLoadObject(InteractionName, Class'Core.Class'));
    // End:0x12E
    if(NewInteractionClass != none)
    {
        NewInteraction = new NewInteractionClass;
        // End:0xF8
        if(NewInteraction != none)
        {
            // End:0xAB
            if(AttachTo != none)
            {
                AttachTo.LocalInteractions.Length = AttachTo.LocalInteractions.Length + 1;
                AttachTo.LocalInteractions[AttachTo.LocalInteractions.Length - 1] = NewInteraction;
                NewInteraction.ViewportOwner = AttachTo;                
            }
            else
            {
                GlobalInteractions.Length = GlobalInteractions.Length + 1;
                GlobalInteractions[GlobalInteractions.Length - 1] = NewInteraction;
            }
            NewInteraction.Initialize();
            NewInteraction.Master = self;
            return NewInteraction;            
        }
        else
        {
            Log(("Could not create interaction [" $ InteractionName) $ "]", 'IMaster');
        }        
    }
    else
    {
        Log(("Could not load interaction [" $ InteractionName) $ "]", 'IMaster');
    }
    return none;
    //return;    
}

event RemoveInteraction(Interaction RemoveMe)
{
    local int Index;

    // End:0x91
    if(RemoveMe.ViewportOwner != none)
    {
        Index = 0;
        J0x1B:

        // End:0x8E [Loop If]
        if(Index < RemoveMe.ViewportOwner.LocalInteractions.Length)
        {
            // End:0x84
            if(RemoveMe.ViewportOwner.LocalInteractions[Index] == RemoveMe)
            {
                RemoveMe.ViewportOwner.LocalInteractions.Remove(Index, 1);
                return;
            }
            Index++;
            // [Loop Continue]
            goto J0x1B;
        }        
    }
    else
    {
        Index = 0;
        J0x98:

        // End:0xD5 [Loop If]
        if(Index < GlobalInteractions.Length)
        {
            // End:0xCB
            if(GlobalInteractions[Index] == RemoveMe)
            {
                GlobalInteractions.Remove(Index, 1);
                return;
            }
            Index++;
            // [Loop Continue]
            goto J0x98;
        }
    }
    Log(("Could not remove interaction [" $ string(RemoveMe)) $ "] (Not Found)", 'IMaster');
    //return;    
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
    else
    {
        InteractionArray = GlobalInteractions;
    }
    // End:0x6A
    if(InteractionArray.Length == 0)
    {
        Log("Attempt to SetFocus on an empty Array.", 'IMaster');
        return;
    }
    iIndex = -1;
    i = 0;
    J0x7C:

    // End:0xB9 [Loop If]
    if(i < InteractionArray.Length)
    {
        // End:0xAF
        if(InteractionArray[i] == Inter)
        {
            iIndex = i;
            // [Explicit Break]
            goto J0xB9;
        }
        i++;
        // [Loop Continue]
        goto J0x7C;
    }
    J0xB9:

    // End:0x104
    if(iIndex < 0)
    {
        Log(((("Interaction " $ string(Inter)) $ " is not in ") $ string(ViewportOwner)) $ ".", 'IMaster');
        return;        
    }
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

    // End:0x15C [Loop If]
    if(i < iIndex)
    {
        InteractionArray[i + 1] = InteractionArray[i];
        i++;
        // [Loop Continue]
        goto J0x129;
    }
    InteractionArray[0] = temp;
    InteractionArray[0].bActive = true;
    InteractionArray[0].bVisible = true;
    //return;    
}

event bool Process_KeyType(array<Interaction> InteractionArray, out Interactions.EInputKey key, optional string Unicode)
{
    local int Index;

    Index = 0;
    J0x07:

    // End:0x7B [Loop If]
    if(Index < InteractionArray.Length)
    {
        // End:0x71
        if((InteractionArray[Index].bActive && !InteractionArray[Index].bNativeEvents) && InteractionArray[Index].KeyType(key, Unicode))
        {
            return true;
        }
        Index++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

event bool Process_KeyEvent(array<Interaction> InteractionArray, out Interactions.EInputKey key, out Interactions.EInputAction Action, float Delta)
{
    local int Index;

    Index = 0;
    J0x07:

    // End:0x80 [Loop If]
    if(Index < InteractionArray.Length)
    {
        // End:0x76
        if((InteractionArray[Index].bActive && !InteractionArray[Index].bNativeEvents) && InteractionArray[Index].KeyEvent(key, Action, Delta))
        {
            return true;
        }
        Index++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

event Process_PreRender(array<Interaction> InteractionArray, Canvas Canvas)
{
    local int Index;

    Index = InteractionArray.Length;
    J0x0C:

    // End:0x78 [Loop If]
    if(Index > 0)
    {
        // End:0x6E
        if(InteractionArray[Index - 1].bVisible && !InteractionArray[Index - 1].bNativeEvents)
        {
            InteractionArray[Index - 1].PreRender(Canvas);
        }
        Index--;
        // [Loop Continue]
        goto J0x0C;
    }
    //return;    
}

event Process_PostRender(array<Interaction> InteractionArray, Canvas Canvas)
{
    local int Index;

    Index = InteractionArray.Length;
    J0x0C:

    // End:0x78 [Loop If]
    if(Index > 0)
    {
        // End:0x6E
        if(InteractionArray[Index - 1].bVisible && !InteractionArray[Index - 1].bNativeEvents)
        {
            InteractionArray[Index - 1].PostRender(Canvas);
        }
        Index--;
        // [Loop Continue]
        goto J0x0C;
    }
    //return;    
}

event Process_Tick(array<Interaction> InteractionArray, float DeltaTime)
{
    local int Index;

    Index = 0;
    J0x07:

    // End:0x6F [Loop If]
    if(Index < InteractionArray.Length)
    {
        // End:0x65
        if(InteractionArray[Index].bRequiresTick && !InteractionArray[Index].bNativeEvents)
        {
            InteractionArray[Index].Tick(DeltaTime);
        }
        Index++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

event Process_Message(coerce string Msg, float MsgLife, array<Interaction> InteractionArray)
{
    local int Index;

    Index = 0;
    J0x07:

    // End:0x40 [Loop If]
    if(Index < InteractionArray.Length)
    {
        InteractionArray[Index].Message(Msg, MsgLife);
        Index++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

event NotifyLevelChange(array<Interaction> InteractionArray)
{
    local int Index;

    Index = 0;
    J0x07:

    // End:0x36 [Loop If]
    if(Index < InteractionArray.Length)
    {
        InteractionArray[Index].NotifyLevelChange();
        Index++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

event DisableInteractions(array<Interaction> InteractionArray)
{
    local int Index;

    Index = 0;
    J0x07:

    // End:0x36 [Loop If]
    if(Index < InteractionArray.Length)
    {
        InteractionArray[Index].DisableInteraction();
        Index++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

event EnableInteractions(array<Interaction> InteractionArray)
{
    local int Index;

    Index = 0;
    J0x07:

    // End:0x36 [Loop If]
    if(Index < InteractionArray.Length)
    {
        InteractionArray[Index].EnableInteraction();
        Index++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}
