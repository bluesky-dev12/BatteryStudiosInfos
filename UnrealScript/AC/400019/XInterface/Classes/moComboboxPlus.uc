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
    // End:0x2D
    if(ExtraCompClass != "")
    {
        ExtraComp = AddComponent(ExtraCompClass);
    }
    ExtraComp.bBoundToParent = false;
    ExtraComp.bScaleToParent = false;
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    local int i;

    // End:0x81
    if(Sender != none)
    {
        i = MyComboBox.GetIndex();
        // End:0x3F
        if((i < 0) || i >= ExtraData.Length)
        {
            return;
        }
        // End:0x67
        if(Sender == ExtraComp)
        {
            SetExtraValue(i, ExtraData[i]);            
        }
        else
        {
            // End:0x81
            if(Sender == MyComboBox)
            {
                UpdateExtraValue(i);
            }
        }
    }
    //return;    
}

function SetExtraValue(int i, string Data)
{
    //return;    
}

function UpdateExtraValue(int i)
{
    //return;    
}

function AddItem(string Item, optional Object Extra, optional string str)
{
    super.AddItem(Item, Extra, str);
    ExtraData.Length = MyComboBox.ItemCount();
    //return;    
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
    if((Item >= 0) && Item <= (ExtraData.Length - Count))
    {
        ExtraData.Remove(Item, Count);
    }
    //return;    
}

function bool InternalOnPreDraw(Canvas C)
{
    local float AH, AW, NewScale;

    // End:0x0D
    if(ExtraComp == none)
    {
        return false;
    }
    AH = ActualHeight();
    AW = ActualWidth();
    // End:0xB6
    if(bVerticalLayout)
    {
        ExtraComp.WinWidth = AW;
        // End:0x5C
        if(bSquare)
        {
            ExtraComp.WinHeight = AW;            
        }
        else
        {
            ExtraComp.WinHeight = ExtraCompSize;
        }
        NewScale = AH - ExtraComp.ActualHeight();
        MyLabel.WinHeight *= NewScale;
        MyComponent.WinHeight *= NewScale;        
    }
    else
    {
        ExtraComp.WinHeight = AH;
        // End:0xEA
        if(bSquare)
        {
            ExtraComp.WinWidth = AH;            
        }
        else
        {
            ExtraComp.WinWidth = ExtraCompSize;
        }
        NewScale = AW - ExtraComp.ActualWidth();
        MyLabel.WinWidth *= NewScale;
        MyComponent.WinWidth *= NewScale;
    }
    return false;
    //return;    
}

defaultproperties
{
    ExtraCompClass="XInterface.GUICheckBox"
    bSquare=true
    OnPreDraw=moComboboxPlus.InternalOnPreDraw
}