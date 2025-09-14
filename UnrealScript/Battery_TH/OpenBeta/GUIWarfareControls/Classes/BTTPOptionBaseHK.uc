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
var() automated int ItemWidth;
var() automated int ItemHeight;
var() automated int LabelWidth;
var FloatBox fbACLList;
var export editinline BTAutoImageListHK ACLList;
var FloatBox fbVisibleComponent[17];
var array<FloatBox> InternalPadding;
var array<export editinline BTOwnerDrawImageHK> Label;
var array<export editinline GUIComponent> Content;
var bool bToolTipVisible;
var BTRODecorateStringHK btToolTip;
var int WatchedIndex;
//var delegate<Content_AWinPos_Changed> __Content_AWinPos_Changed__Delegate;

function PostChangeScrollBarPos()
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    ACLList = new Class'GUIWarfareControls_Decompressed.BTAutoImageListHK';
    ACLList.bUseAWinPos = true;
    ACLList.AWinPos = fbACLList;
    ACLList.InitComponent(Controller, self);
    ACLList.SetItemSize(ItemWidth, ItemHeight);
    ACLList.SetItemCountPerPage(16, 1);
    AppendComponent(ACLList);
    ACLList.BackgroundImage.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
    ACLList.ImageList.bNeverFocus = true;
    ACLList.ImageListBox.bNeverFocus = true;
    ACLList.bNeverFocus = true;
    ACLList.ImageList.MyScrollBar.__PositionChanged__Delegate = ACLList_PositionChanged;
    i = 0;
    J0x127:

    // End:0x1F3 [Loop If]
    if(i < 17)
    {
        fbVisibleComponent[i].X1 = ACLList.AWinPos.X1;
        fbVisibleComponent[i].X2 = ACLList.AWinPos.X2 - float(15);
        fbVisibleComponent[i].Y1 = ACLList.AWinPos.Y1 + float(i * 34);
        fbVisibleComponent[i].Y2 = (ACLList.AWinPos.Y1 + float(i * 34)) + float(34);
        i++;
        // [Loop Continue]
        goto J0x127;
    }
    __OnClick__Delegate = Internal_OnClick;
    btToolTip = new Class'GUIWarfareControls_Decompressed.BTRODecorateStringHK';
    btToolTip.Init();
    btToolTip.OriginalString.FontDrawType = 3;
    btToolTip.InternalPadding[0] = 5;
    btToolTip.InternalPadding[1] = 5;
    btToolTip.InternalPadding[2] = 10;
    btToolTip.InternalPadding[3] = 5;
    btToolTip.bAutoWidth = true;
    //return;    
}

function bool Internal_OnClick(GUIComponent Sender)
{
    Log("BTTPOptionBaseHK::Internal_OnClick Start");
    Controller.LogControllerInfo();
    // End:0x68
    if(int(Content[0].MenuState) != int(4))
    {
        Content[0].FocusFirst(none);
    }
    Controller.LogControllerInfo();
    Log("BTTPOptionBaseHK::Internal_OnClick End");
    return true;
    //return;    
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

        // End:0x421 [Loop If]
        if(i < Label.Length)
        {
            // End:0xC5
            if((i < ACLList.ImageList.Top) || i >= (ACLList.ImageList.Top + ACLList.ImageList.NoVisibleRows))
            {
                Label[i].SetVisibility(false);
                Content[i].SetVisibility(false);
                // [Explicit Continue]
                goto J0x417;
            }
            Label[i].SetVisibility(true);
            // End:0x102
            if(Content[i] != none)
            {
                Content[i].SetVisibility(true);
            }
            Label[i].AWinPos = fbVisibleComponent[i - ACLList.ImageList.Top];
            // End:0x1F7
            if(i < InternalPadding.Length)
            {
                Label[i].AWinPos.X1 += InternalPadding[i].X1;
                Label[i].AWinPos.Y1 += InternalPadding[i].Y1;
                Label[i].AWinPos.X2 -= InternalPadding[i].X2;
                Label[i].AWinPos.Y2 -= InternalPadding[i].Y2;
            }
            Label[i].AWinPos.X2 = Label[i].AWinPos.X1 + float(LabelWidth);
            Label[i].ApplyAWinPos();
            // End:0x2CE
            if(Content[i] != none)
            {
                Content[i].AWinPos = fbVisibleComponent[i - ACLList.ImageList.Top];
                Content[i].AWinPos.X1 = Content[i].AWinPos.X1 + float(LabelWidth);
            }
            // End:0x39B
            if(i < InternalPadding.Length)
            {
                // End:0x39B
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
            J0x417:

            i++;
            // [Loop Continue]
            goto J0x29;
        }
        bPositionChanged = false;
    }
    // End:0x546
    if((bToolTipVisible == true) && Controller.TopPage() == PageOwner)
    {
        i = 0;
        J0x457:

        // End:0x546 [Loop If]
        if(i < Label.Length)
        {
            // End:0x53C
            if(Content[i] != none)
            {
                // End:0x53C
                if((((Content[i].AWinPos.X1 < Controller.MouseX) && Content[i].AWinPos.X2 > Controller.MouseX) && Content[i].AWinPos.Y1 < Controller.MouseY) && Content[i].AWinPos.Y2 > Controller.MouseY)
                {
                    WatchedIndex = i;
                    // [Explicit Break]
                    goto J0x546;
                }
            }
            i++;
            // [Loop Continue]
            goto J0x457;
        }
    }
    J0x546:

    return false;
    //return;    
}

function Internal_OnRendered(Canvas Canvas)
{
    // End:0x7E
    if((WatchedIndex != -1) && strTooltip[WatchedIndex] != "")
    {
        btToolTip.OriginalString.Text = strTooltip[WatchedIndex];
        btToolTip.AWinPos = GetTooltipPos(0, 0);
        btToolTip.bNeedUpdate = true;
        btToolTip.Render(Canvas);
    }
    //return;    
}

delegate FloatBox Content_AWinPos_Changed(int contentindex, int visiblecomponentindex, FloatBox fb)
{
    return fb;
    //return;    
}

function ACLList_PositionChanged(int NewPos)
{
    bPositionChanged = true;
    //return;    
}

defaultproperties
{
    strRound="????"
    strRank="????? "
    strWin="???"
    strLose="???"
    strKill="???"
    strAssist="?????????"
    strDeath="???"
    strHeadShot="???????"
    strNewRank="????????"
    strHour="????"
    strMin="????"
    strPoint="BP"
    strCash="DE"
    strDay="???"
    strDiscon="?????"
    ItemWidth=550
    ItemHeight=34
    LabelWidth=104
    fbACLList=(X1=283.0000000,Y1=106.0000000,X2=748.0000000,Y2=650.0000000)
    bToolTipVisible=true
    PropagateVisibility=false
    OnPreDraw=BTTPOptionBaseHK.Internal_OnPreDraw
    OnRendered=BTTPOptionBaseHK.Internal_OnRendered
}