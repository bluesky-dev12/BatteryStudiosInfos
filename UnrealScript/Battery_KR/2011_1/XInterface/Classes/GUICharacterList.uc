class GUICharacterList extends GUICircularList
    native
    editinlinenew
    instanced;

var() array<PlayerRecord> PlayerList;
var() bool bLocked;
var() Material DefaultPortrait;
var() array<PlayerRecord> SelectedElements;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    InitList();
    //return;    
}

function InitList()
{
    local int i;
    local array<PlayerRecord> AllPlayerList;

    Class'WGame.wUtil'.static.GetPlayerList(AllPlayerList);
    i = 0;
    J0x18:

    // End:0x64 [Loop If]
    if(i < AllPlayerList.Length)
    {
        // End:0x5A
        if(AllPlayerList[i].Menu != "DUP")
        {
            PlayerList[PlayerList.Length] = AllPlayerList[i];
        }
        i++;
        // [Loop Continue]
        goto J0x18;
    }
    ItemCount = PlayerList.Length;
    //return;    
}

function string SelectedText()
{
    // End:0x2D
    if((Index >= 0) && Index < ItemCount)
    {
        return PlayerList[Index].DefaultName;
    }
    return "";
    //return;    
}

function bool ValidIndex(int i)
{
    return (i >= 0) && i < PlayerList.Length;
    //return;    
}

function Add(string NewItem, optional Object obj)
{
    return;
    //return;    
}

function Remove(int i, optional int Count)
{
    return;
    //return;    
}

function Clear()
{
    return;
    //return;    
}

function Find(string Text, optional bool bExact)
{
    local int i;

    i = 0;
    J0x07:

    // End:0xA6 [Loop If]
    if(i < ItemCount)
    {
        // End:0x5F
        if(bExact)
        {
            // End:0x5C
            if(Text == PlayerList[i].DefaultName)
            {
                Index = i;
                Top = i;
                OnChange(self);
                return;
            }
            // [Explicit Continue]
            goto J0x9C;
        }
        // End:0x9C
        if(Text ~= PlayerList[i].DefaultName)
        {
            Index = i;
            Top = i;
            OnChange(self);
            return;
        }
        J0x9C:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function Material GetPortrait()
{
    return PlayerList[Index].Portrait;
    //return;    
}

function Material GetPortraitAt(int i)
{
    // End:0x1F
    if(ValidIndex(i))
    {
        return PlayerList[i].Portrait;
    }
    return none;
    //return;    
}

function string GetName()
{
    return PlayerList[Index].DefaultName;
    //return;    
}

function string GetNameAt(int i)
{
    // End:0x1F
    if(ValidIndex(i))
    {
        return PlayerList[i].DefaultName;
    }
    return "";
    //return;    
}

function string GetGender()
{
    return PlayerList[Index].Sex;
    //return;    
}

function string GetGenderAt(int i)
{
    // End:0x1F
    if(ValidIndex(i))
    {
        return PlayerList[i].Sex;
    }
    return "";
    //return;    
}

function PlayerRecord GetRecord()
{
    return PlayerList[Index];
    //return;    
}

function PlayerRecord GetRecordAt(int i)
{
    local PlayerRecord Rec;

    // End:0x1F
    if(ValidIndex(i))
    {
        Rec = PlayerList[i];
    }
    return Rec;
    //return;    
}

function string GetDecoText()
{
    return GetDecoTextAt(Index);
    //return;    
}

function string GetDecoTextAt(int AtIndex)
{
    local string S;

    // End:0x24
    if(ValidIndex(AtIndex))
    {
        S = PlayerList[AtIndex].TextName;
    }
    return S;
    //return;    
}

function Sound GetSound()
{
    local Sound NameSound;
    local string soundName;

    soundName = "AnnouncerNames." $ Repl(PlayerList[Index].DefaultName, ".", "_");
    NameSound = Sound(DynamicLoadObject(soundName, Class'Engine.Sound'));
    // End:0x93
    if(NameSound == none)
    {
        Log("Could not find player name sound for: " $ PlayerList[Index].DefaultName);
    }
    return NameSound;
    //return;    
}

function Sound GetSoundAt(int i)
{
    local Sound NameSound;
    local string soundName;

    // End:0xA0
    if(ValidIndex(i))
    {
        soundName = "AnnouncerNames." $ Repl(PlayerList[i].DefaultName, ".", "_");
        NameSound = Sound(DynamicLoadObject(soundName, Class'Engine.Sound'));
        // End:0xA0
        if(NameSound == none)
        {
            Log("Could not find player name sound for:" @ PlayerList[i].DefaultName);
        }
    }
    return NameSound;
    //return;    
}

function ScrollRight()
{
    MoveRight();
    //return;    
}

function ScrollLeft()
{
    MoveLeft();
    //return;    
}

function bool MoveLeft()
{
    // End:0x2B
    if(bLocked)
    {
        // End:0x26
        if(Index > 0)
        {
            Index--;
            OnChange(self);
        }
        return true;        
    }
    else
    {
        return super.MoveLeft();
    }
    //return;    
}

function bool MoveRight()
{
    // End:0x32
    if(bLocked)
    {
        // End:0x2D
        if(Index < (ItemsPerPage - 1))
        {
            Index++;
            OnChange(self);
        }
        return true;        
    }
    else
    {
        return super.MoveRight();
    }
    //return;    
}

function End()
{
    // End:0x25
    if(bLocked)
    {
        Index = ItemsPerPage - 1;
        OnChange(self);        
    }
    else
    {
        super.End();
    }
    //return;    
}

function ClearPendingElements()
{
    super(GUIListBase).ClearPendingElements();
    // End:0x1F
    if(SelectedItems.Length == 0)
    {
        SelectedElements.Remove(0, SelectedElements.Length);
    }
    //return;    
}

function array<PlayerRecord> GetPendingElements(optional bool bGuarantee)
{
    local int i;

    // End:0xC0
    if(((int(DropState) == int(1)) && Controller.DropSource == self) || bGuarantee)
    {
        // End:0xBA
        if(SelectedElements.Length == 0)
        {
            i = 0;
            J0x44:

            // End:0x90 [Loop If]
            if(i < SelectedItems.Length)
            {
                // End:0x86
                if(ValidIndex(SelectedItems[i]))
                {
                    SelectedElements[SelectedElements.Length] = PlayerList[SelectedItems[i]];
                }
                i++;
                // [Loop Continue]
                goto J0x44;
            }
            // End:0xBA
            if((SelectedElements.Length == 0) && IsValid())
            {
                SelectedElements[0] = PlayerList[Index];
            }
        }
        return SelectedElements;
    }
    //return;    
}

function bool InternalOnBeginDrag(GUIComponent Sender)
{
    // End:0x1C
    if(super(GUIListBase).InternalOnBeginDrag(Sender))
    {
        SelectedElements = GetPendingElements();
        return true;
    }
    return false;
    //return;    
}

function InternalOnEndDrag(GUIComponent Accepting, bool bAccepted)
{
    // End:0x1E
    if(bAccepted && Accepting != none)
    {
        bRepeatClick = false;
    }
    // End:0x31
    if(Accepting == none)
    {
        bRepeatClick = true;
    }
    SetOutlineAlpha(255);
    // End:0x4D
    if(bNotify)
    {
        CheckLinkedObjects(self);
    }
    //return;    
}

function bool InternalOnDragDrop(GUIComponent Sender)
{
    InternalOnMouseRelease(Sender);
    return false;
    //return;    
}
