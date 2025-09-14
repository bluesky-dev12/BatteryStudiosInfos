/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUICharacterList.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:30
 *
 *******************************************************************************/
class GUICharacterList extends GUICircularList
    dependson(GUICircularList)
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
}

function InitList()
{
    local int i;
    local array<PlayerRecord> AllPlayerList;

    class'wUtil'.static.GetPlayerList(AllPlayerList);
    i = 0;
    J0x18:
    // End:0x64 [While If]
    if(i < AllPlayerList.Length)
    {
        // End:0x5a
        if(AllPlayerList[i].Menu != "DUP")
        {
            PlayerList[PlayerList.Length] = AllPlayerList[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x18;
    }
    ItemCount = PlayerList.Length;
}

function string SelectedText()
{
    // End:0x2d
    if(Index >= 0 && Index < ItemCount)
    {
        return PlayerList[Index].DefaultName;
    }
    return "";
}

function bool ValidIndex(int i)
{
    return i >= 0 && i < PlayerList.Length;
}

function Add(string NewItem, optional Object obj)
{
    return;
}

function Remove(int i, optional int Count)
{
    return;
}

function Clear()
{
    return;
}

function Find(string Text, optional bool bExact)
{
    local int i;

    i = 0;
    J0x07:
    // End:0xa6 [While If]
    if(i < ItemCount)
    {
        // End:0x5f
        if(bExact)
        {
            // End:0x5c
            if(Text == PlayerList[i].DefaultName)
            {
                Index = i;
                Top = i;
                OnChange(self);
                return;
            }
        }
        // End:0x9c
        else
        {
            // End:0x9c
            if(Text ~= PlayerList[i].DefaultName)
            {
                Index = i;
                Top = i;
                OnChange(self);
                return;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function Material GetPortrait()
{
    return PlayerList[Index].Portrait;
}

function Material GetPortraitAt(int i)
{
    // End:0x1f
    if(ValidIndex(i))
    {
        return PlayerList[i].Portrait;
    }
    return none;
}

function string GetName()
{
    return PlayerList[Index].DefaultName;
}

function string GetNameAt(int i)
{
    // End:0x1f
    if(ValidIndex(i))
    {
        return PlayerList[i].DefaultName;
    }
    return "";
}

function string GetGender()
{
    return PlayerList[Index].Sex;
}

function string GetGenderAt(int i)
{
    // End:0x1f
    if(ValidIndex(i))
    {
        return PlayerList[i].Sex;
    }
    return "";
}

function PlayerRecord GetRecord()
{
    return PlayerList[Index];
}

function PlayerRecord GetRecordAt(int i)
{
    local PlayerRecord Rec;

    // End:0x1f
    if(ValidIndex(i))
    {
        Rec = PlayerList[i];
    }
    return Rec;
}

function string GetDecoText()
{
    return GetDecoTextAt(Index);
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
}

function Sound GetSound()
{
    local Sound NameSound;
    local string soundName;

    soundName = "AnnouncerNames." $ Repl(PlayerList[Index].DefaultName, ".", "_");
    NameSound = Sound(DynamicLoadObject(soundName, class'Sound'));
    // End:0x93
    if(NameSound == none)
    {
        Log("Could not find player name sound for: " $ PlayerList[Index].DefaultName);
    }
    return NameSound;
}

function Sound GetSoundAt(int i)
{
    local Sound NameSound;
    local string soundName;

    // End:0xa0
    if(ValidIndex(i))
    {
        soundName = "AnnouncerNames." $ Repl(PlayerList[i].DefaultName, ".", "_");
        NameSound = Sound(DynamicLoadObject(soundName, class'Sound'));
        // End:0xa0
        if(NameSound == none)
        {
            Log("Could not find player name sound for:" @ PlayerList[i].DefaultName);
        }
    }
    return NameSound;
}

function ScrollRight()
{
    MoveRight();
}

function ScrollLeft()
{
    MoveLeft();
}

function bool MoveLeft()
{
    // End:0x2b
    if(bLocked)
    {
        // End:0x26
        if(Index > 0)
        {
            -- Index;
            OnChange(self);
        }
        return true;
    }
    // End:0x32
    else
    {
        return super.MoveLeft();
    }
}

function bool MoveRight()
{
    // End:0x32
    if(bLocked)
    {
        // End:0x2d
        if(Index < ItemsPerPage - 1)
        {
            ++ Index;
            OnChange(self);
        }
        return true;
    }
    // End:0x39
    else
    {
        return super.MoveRight();
    }
}

function End()
{
    // End:0x25
    if(bLocked)
    {
        Index = ItemsPerPage - 1;
        OnChange(self);
    }
    // End:0x2b
    else
    {
        super.End();
    }
}

function ClearPendingElements()
{
    super(GUIListBase).ClearPendingElements();
    // End:0x1f
    if(SelectedItems.Length == 0)
    {
        SelectedElements.Remove(0, SelectedElements.Length);
    }
}

function array<PlayerRecord> GetPendingElements(optional bool bGuarantee)
{
    local int i;

    // End:0xc0
    if(DropState == 1 && Controller.DropSource == self || bGuarantee)
    {
        // End:0xba
        if(SelectedElements.Length == 0)
        {
            i = 0;
            J0x44:
            // End:0x90 [While If]
            if(i < SelectedItems.Length)
            {
                // End:0x86
                if(ValidIndex(SelectedItems[i]))
                {
                    SelectedElements[SelectedElements.Length] = PlayerList[SelectedItems[i]];
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x44;
            }
            // End:0xba
            if(SelectedElements.Length == 0 && IsValid())
            {
                SelectedElements[0] = PlayerList[Index];
            }
        }
        return SelectedElements;
    }
}

function bool InternalOnBeginDrag(GUIComponent Sender)
{
    // End:0x1c
    if(super(GUIListBase).InternalOnBeginDrag(Sender))
    {
        SelectedElements = GetPendingElements();
        return true;
    }
    return false;
}

function InternalOnEndDrag(GUIComponent Accepting, bool bAccepted)
{
    // End:0x1e
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
    // End:0x4d
    if(bNotify)
    {
        CheckLinkedObjects(self);
    }
}

function bool InternalOnDragDrop(GUIComponent Sender)
{
    InternalOnMouseRelease(Sender);
    return false;
}
