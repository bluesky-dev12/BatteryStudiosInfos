/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\moComboboxPlus.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:7
 *
 *******************************************************************************/
class moComboboxPlus extends moComboBox
    editinlinenew
    instanced;

var string ExtraCompClass;
var export editinline GUIComponent ExtraComp;
var float ExtraCompSize;
var array<string> ExtraData;

function InitComponent(GUIController InController, GUIComponent inOwner)
{
    super.InitComponent(InController, inOwner);
    // End:0x2d
    if(ExtraCompClass != "")
    {
        ExtraComp = AddComponent(ExtraCompClass);
    }
    ExtraComp.bBoundToParent = false;
    ExtraComp.bScaleToParent = false;
}

function InternalOnChange(GUIComponent Sender)
{
    local int i;

    // End:0x81
    if(Sender != none)
    {
        i = MyComboBox.GetIndex();
        // End:0x3f
        if(i < 0 || i >= ExtraData.Length)
        {
            return;
        }
        // End:0x67
        if(Sender == ExtraComp)
        {
            SetExtraValue(i, ExtraData[i]);
        }
        // End:0x81
        else
        {
            // End:0x81
            if(Sender == MyComboBox)
            {
                UpdateExtraValue(i);
            }
        }
    }
}

function SetExtraValue(int i, string Data);
function UpdateExtraValue(int i);
function AddItem(string Item, optional Object Extra, optional string str)
{
    super.AddItem(Item, Extra, str);
    ExtraData.Length = MyComboBox.ItemCount();
}

function RemoveItem(int Item, optional int Count)
{
    super.RemoveItem(Item, Count);
    // End:0x22
    if(Count == 0)
    {
        Count = 1;
    }
    // End:0x56
    if(Item >= 0 && Item <= ExtraData.Length - Count)
    {
        ExtraData.Remove(Item, Count);
    }
}

function bool InternalOnPreDraw(Canvas C)
{
    local float AH, AW, NewScale;

    // End:0x0d
    if(ExtraComp == none)
    {
        return false;
    }
    AH = ActualHeight();
    AW = ActualWidth();
    // End:0xb6
    if(bVerticalLayout)
    {
        ExtraComp.WinWidth = AW;
        // End:0x5c
        if(bSquare)
        {
            ExtraComp.WinHeight = AW;
        }
        // End:0x70
        else
        {
            ExtraComp.WinHeight = ExtraCompSize;
        }
        NewScale = AH - ExtraComp.ActualHeight();
        MyLabel.WinHeight *= NewScale;
        MyComponent.WinHeight *= NewScale;
    }
    // End:0x141
    else
    {
        ExtraComp.WinHeight = AH;
        // End:0xea
        if(bSquare)
        {
            ExtraComp.WinWidth = AH;
        }
        // End:0xfe
        else
        {
            ExtraComp.WinWidth = ExtraCompSize;
        }
        NewScale = AW - ExtraComp.ActualWidth();
        MyLabel.WinWidth *= NewScale;
        MyComponent.WinWidth *= NewScale;
    }
    return false;
}

defaultproperties
{
    ExtraCompClass="XInterface.GUICheckBox"
    bSquare=true
    OnPreDraw=InternalOnPreDraw
}