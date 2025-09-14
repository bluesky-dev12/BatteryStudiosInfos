class BTUIList extends GUIMultiColumnListBox
    editinlinenew
    instanced;

var() float ScrollHeight;
var array<export editinline GUIComponent> Comps;
var array<float> CompsOriginalWinTop;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    List.__GetItemHeight__Delegate = GetItemHeight;
    List.__OnDrawItem__Delegate = InternalOnDrawItem;
    SetScrollBarStyle(true, new Class'GUIWarfareStyles.STY2WarfareScrollZone', true, new Class'GUIWarfareStyles.STY2WarfareScrollIncreaseButton', true, none, true, new Class'GUIWarfareStyles.STY2WarfareScrollDecreaseButton', true, none, true, new Class'GUIWarfareStyles.STY2WarfareScrollGripButton');
    //return;    
}

function InternalOnDrawItem(Canvas Canvas, int Item, float X, float Y, float W, float HT, bool bSelected, bool bPending)
{
    //return;    
}

function float GetItemHeight(Canvas C)
{
    return ScrollHeight * C.ClipY;
    //return;    
}

function bool OnPreDraw(Canvas C)
{
    local int lp1;
    local float AT, AH, boundTop, boundBottom, cat, cah,
	    compOriginalWinTop;

    local export editinline GUIComponent Comp;
    local bool Visible;
    local float calcedScrollHeight;

    // End:0x16
    if(List.ItemsPerPage == 0)
    {
        return false;
    }
    LoseFocus(none);
    // End:0x1CA
    if(bVisible)
    {
        calcedScrollHeight = ScrollHeight * C.ClipY;
        AT = ActualTop();
        AH = ActualHeight();
        boundTop = AT + (float(List.Top) * calcedScrollHeight);
        boundBottom = boundTop + (calcedScrollHeight * float(List.ItemsPerPage));
        lp1 = 0;
        J0xA2:

        // End:0xF2 [Loop If]
        if(lp1 < Comps.Length)
        {
            Comp = Comps[lp1];
            compOriginalWinTop = CompsOriginalWinTop[lp1];
            Comp.WinTop = compOriginalWinTop;
            lp1++;
            // [Loop Continue]
            goto J0xA2;
        }
        lp1 = 0;
        J0xF9:

        // End:0x1C7 [Loop If]
        if(lp1 < Comps.Length)
        {
            Comp = Comps[lp1];
            cat = Comp.ActualTop();
            cah = Comp.ActualHeight();
            Visible = (boundTop <= cat) && (cat + cah) <= boundBottom;
            Comp.bVisible = Visible;
            compOriginalWinTop = CompsOriginalWinTop[lp1];
            Comp.WinTop = compOriginalWinTop - (float(List.Top) * ScrollHeight);
            lp1++;
            // [Loop Continue]
            goto J0xF9;
        }        
    }
    else
    {
        lp1 = 0;
        J0x1D1:

        // End:0x202 [Loop If]
        if(lp1 < Comps.Length)
        {
            Comps[lp1].bVisible = false;
            lp1++;
            // [Loop Continue]
            goto J0x1D1;
        }
    }
    //return;    
}

function OnRendered(Canvas Canvas)
{
    //return;    
}

function AddUIComponent(GUIComponent Comp)
{
    Comps[Comps.Length] = Comp;
    CompsOriginalWinTop[CompsOriginalWinTop.Length] = Comp.WinTop;
    Comp.bVisible = bVisible;
    //return;    
}

function AddLineBreaker()
{
    List.AddedItem();
    //return;    
}

function Clear()
{
    Comps.Length = 0;
    List.Clear();
    //return;    
}

defaultproperties
{
    ScrollHeight=0.0390625
    bDisplayHeader=false
    HeaderColumnPerc=/* Array type was not detected. */
    ColumnHeadings=/* Array type was not detected. */
    RenderWeight=0.0000000
    OnPreDraw=BTUIList.OnPreDraw
    OnRendered=BTUIList.OnRendered
}