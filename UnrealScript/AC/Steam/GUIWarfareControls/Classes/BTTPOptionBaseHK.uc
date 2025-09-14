/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPOptionBaseHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:32
 *	Functions:8
 *
 *******************************************************************************/
class BTTPOptionBaseHK extends BTTabPanelHK
    editinlinenew
    instanced;

var localized string strRound;
var localized string strRank;
var localized string strWin;
var localized string strLose;
var localized string strKill;
var localized string strAssist;
var localized string strDeath;
var localized string strHeadShot;
var localized string strNewRank;
var localized string strNew;
var localized string strHour;
var localized string strMin;
var localized string strPoint;
var localized string strCash;
var localized string strDay;
var localized string strDiscon;
var localized string strTooltip[34];
var bool bPositionChanged;
var export editinline BTOwnerDrawImageHK BackPanel;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify int ItemWidth;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify int ItemHeight;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify int LabelWidth;
var FloatBox fbACLList;
var export editinline BTAutoImageListNew ACLList;
var FloatBox fbVisibleComponent[17];
var array<FloatBox> InternalPadding;
var array<export editinline BTOwnerDrawImageHK> Label;
var array<export editinline GUIComponent> Content;
var bool bToolTipVisible;
var BTRODecorateStringHK btToolTip;
var int WatchedIndex;
var delegate<Content_AWinPos_Changed> __Content_AWinPos_Changed__Delegate;

function PostChangeScrollBarPos();
function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    ACLList = new class'BTAutoImageListNew';
    ACLList.bUseAWinPos = true;
    ACLList.AWinPos = fbACLList;
    ACLList.InitComponent(Controller, self);
    ACLList.SetItemSize(ItemWidth, ItemHeight);
    ACLList.SetItemCountPerPage(14, 1);
    AppendComponent(ACLList);
    ACLList.BackgroundImage.BackgroundImage = class'BTUIResourcePoolHK'.default.empty;
    ACLList.ImageList.MyScrollBar.bUseAWinPos = true;
    ACLList.ImageList.MyScrollBar.AWinPos.X1 = AWinPos.X2 - float(21);
    ACLList.ImageList.MyScrollBar.AWinPos.X2 = AWinPos.X2;
    ACLList.ImageList.MyScrollBar.AWinPos.Y1 = AWinPos.Y1;
    ACLList.ImageList.MyScrollBar.AWinPos.Y2 = AWinPos.Y2;
    ACLList.ImageList.MyScrollBar.ApplyAWinPos();
    ACLList.ImageList.bNeverFocus = true;
    ACLList.ImageListBox.bNeverFocus = true;
    ACLList.bNeverFocus = true;
    ACLList.ImageList.MyScrollBar.__PositionChanged__Delegate = ACLList_PositionChanged;
    i = 0;
    J0x231:
    // End:0x2fd [While If]
    if(i < 17)
    {
        fbVisibleComponent[i].X1 = ACLList.AWinPos.X1;
        fbVisibleComponent[i].X2 = ACLList.AWinPos.X2 - float(40);
        fbVisibleComponent[i].Y1 = ACLList.AWinPos.Y1 + float(i * 33);
        fbVisibleComponent[i].Y2 = ACLList.AWinPos.Y1 + float(i * 33) + float(33);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x231;
    }
    __OnClick__Delegate = Internal_OnClick;
    __OnKeyEvent__Delegate = OptionBase_OnKeyEvent;
    btToolTip = new class'BTRODecorateStringHK';
    btToolTip.Init();
    btToolTip.OriginalString.FontDrawType = 3;
    btToolTip.InternalPadding[0] = 5;
    btToolTip.InternalPadding[1] = 5;
    btToolTip.InternalPadding[2] = 10;
    btToolTip.InternalPadding[3] = 5;
    btToolTip.bAutoWidth = true;
}

function bool OptionBase_OnKeyEvent(out byte key, out byte Action, float Delta)
{
    local Engine.Interactions.EInputKey iKey;
    local Engine.Interactions.EInputAction iAction;

    iKey = key;
    iAction = Action;
    // End:0x43
    if(iKey == 236)
    {
        ACLList.ImageList.WheelUp();
        return true;
    }
    // End:0x6d
    else
    {
        // End:0x6d
        if(iKey == 237)
        {
            ACLList.ImageList.WheelDown();
            return true;
        }
    }
    return false;
}

function bool Internal_OnClick(GUIComponent Sender)
{
    Log("BTTPOptionBaseHK::Internal_OnClick Start");
    Controller.LogControllerInfo();
    // End:0x63
    if(Content[0].MenuState != 4)
    {
        SetFocus(Content[0]);
    }
    Controller.LogControllerInfo();
    Log("BTTPOptionBaseHK::Internal_OnClick End");
    return true;
}

function bool Internal_OnPreDraw(Canvas C)
{
    local int i;

    WatchedIndex = -1;
    // End:0x19
    if(bVisible == false)
    {
        return false;
    }
    // End:0x429
    if(bPositionChanged)
    {
        i = 0;
        J0x29:
        // End:0x421 [While If]
        if(i < Label.Length)
        {
            // End:0xc5
            if(i < ACLList.ImageList.Top || i >= ACLList.ImageList.Top + ACLList.ImageList.NoVisibleRows)
            {
                Label[i].SetVisibility(false);
                Content[i].SetVisibility(false);
            }
            // End:0x417
            else
            {
                Label[i].SetVisibility(true);
                // End:0x102
                if(Content[i] != none)
                {
                    Content[i].SetVisibility(true);
                }
                Label[i].AWinPos = fbVisibleComponent[i - ACLList.ImageList.Top];
                // End:0x1f7
                if(i < InternalPadding.Length)
                {
                    Label[i].AWinPos.X1 += InternalPadding[i].X1;
                    Label[i].AWinPos.Y1 += InternalPadding[i].Y1;
                    Label[i].AWinPos.X2 -= InternalPadding[i].X2;
                    Label[i].AWinPos.Y2 -= InternalPadding[i].Y2;
                }
                Label[i].AWinPos.X2 = Label[i].AWinPos.X1 + float(LabelWidth);
                Label[i].ApplyAWinPos();
                // End:0x2ce
                if(Content[i] != none)
                {
                    Content[i].AWinPos = fbVisibleComponent[i - ACLList.ImageList.Top];
                    Content[i].AWinPos.X1 = Content[i].AWinPos.X1 + float(LabelWidth);
                }
                // End:0x39b
                if(i < InternalPadding.Length)
                {
                    // End:0x39b
                    if(Content[i] != none)
                    {
                        Content[i].AWinPos.X1 += InternalPadding[i].X1;
                        Content[i].AWinPos.Y1 += InternalPadding[i].Y1;
                        Content[i].AWinPos.X2 -= InternalPadding[i].X2;
                        Content[i].AWinPos.Y2 -= InternalPadding[i].Y2;
                    }
                }
                // End:0x417
                if(Content[i] != none)
                {
                    Content[i].AWinPos = Content_AWinPos_Changed(i, i - ACLList.ImageList.Top, Content[i].AWinPos);
                    Content[i].ApplyAWinPos();
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x29;
        }
        bPositionChanged = false;
    }
    // End:0x546
    if(bToolTipVisible == true && Controller.TopPage() == PageOwner)
    {
        i = 0;
        J0x457:
        // End:0x546 [While If]
        if(i < Label.Length)
        {
            // End:0x53c
            if(Content[i] != none)
            {
                // End:0x53c
                if(Content[i].AWinPos.X1 < Controller.MouseX && Content[i].AWinPos.X2 > Controller.MouseX && Content[i].AWinPos.Y1 < Controller.MouseY && Content[i].AWinPos.Y2 > Controller.MouseY)
                {
                    WatchedIndex = i;
                }
                // End:0x546
                else
                {
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x457;
            }
        }
    }
    return false;
}

function Internal_OnRendered(Canvas Canvas)
{
    // End:0x7e
    if(WatchedIndex != -1 && strTooltip[WatchedIndex] != "")
    {
        btToolTip.OriginalString.Text = strTooltip[WatchedIndex];
        btToolTip.AWinPos = GetTooltipPos(0, 0);
        btToolTip.bNeedUpdate = true;
        btToolTip.Render(Canvas);
    }
}

delegate FloatBox Content_AWinPos_Changed(int contentindex, int visiblecomponentindex, FloatBox fb)
{
    return fb;
}

function ACLList_PositionChanged(int NewPos)
{
    bPositionChanged = true;
}

defaultproperties
{
    strRound="Games"
    strRank=" "
    strWin="Wins"
    strLose="Losses"
    strKill="Kills"
    strAssist="Assists"
    strDeath="Deaths"
    strHeadShot="Headshots"
    strNewRank="Enter"
    strHour="h"
    strMin="m"
    strPoint="Points"
    strCash="Cash"
    strDay="d"
    strDiscon="Times"
    ItemWidth=345
    ItemHeight=35
    LabelWidth=122
    fbACLList=(X1=255.0,Y1=141.0,X2=781.0,Y2=605.0)
    bToolTipVisible=true
    PropagateVisibility=true
    OnPreDraw=Internal_OnPreDraw
    OnRendered=Internal_OnRendered
}