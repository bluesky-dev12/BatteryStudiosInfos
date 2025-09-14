class BTTPQuestInfoHK extends BTTabPanelHK
    editinlinenew
    instanced;

var export editinline TabControlMocker TabControl;
var export editinline BTOwnerDrawImageHK BackgroundImage;
var array<export editinline BTOwnerDrawCaptionButtonHK> ButtonCategory;
var export editinline BTACLQuestHK ACLQuest;
var export editinline BTLabelQuestDescHK LabelQuestDesc;
var export editinline BTOwnerDrawCaptionButtonHK ButtonTab[6];
var export editinline BTOwnerDrawCaptionButtonHK ButtonClose;
var localized string strButtonTab[6];
var localized string strButtonClose;
var bool bSelfTopMenuOwner;
var bool bSlidingTabPanel;
var bool bShowing;
var float SlideTime;
var float SlideMultiplier;
var FloatBox ShowAWinFrame;
var FloatBox HideAWinFrame;
var export editinline BTAttendQuest AttendCheck;
var export editinline BTDailyQuest DailyQuest;
var export editinline BTSpecialQuest SpecialQuest;
var wMatchMaker MM;
var wGameManager GameMgr;

function bool ButtonTab_OnClick(GUIComponent Sender)
{
    local int lp1;
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    lp1 = 0;
    J0x17:

    // End:0xCD [Loop If]
    if(lp1 < TabControl.Buttons.Length)
    {
        // End:0xC3
        if(TabControl.Buttons[lp1] == Sender)
        {
            TabControl.SetVisiblePanel(lp1);
            // End:0x96
            if(lp1 == 0)
            {
                DailyQuest.ACLQuest.SetVisibleQuestType(2);
                DailyQuest.SetVisiblePuzzlePiece();
            }
            // End:0xB0
            if(lp1 == 1)
            {
                AttendCheck.RefreshBtnList();
            }
            DailyQuest.SetLabelQuestDesc(0);
            // [Explicit Break]
            goto J0xCD;
        }
        lp1++;
        // [Loop Continue]
        goto J0x17;
    }
    J0xCD:

    return true;
    //return;    
}

function SetVisiblePuzzlePice(int nIndex)
{
    DailyQuest.puzzelPice[nIndex].bVisible = true;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local FloatBox fb;

    super(GUIPanel).InitComponent(MyController, myOwner);
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    fb.X1 = AWinPos.X1;
    fb.X2 = AWinPos.X2;
    fb.Y1 = AWinPos.Y1;
    fb.Y2 = AWinPos.Y2;
    BackgroundImage = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Quest_Info_BG);
    fb.X1 = AWinPos.X1;
    fb.Y1 = AWinPos.Y1 + float(42);
    fb.X2 = AWinPos.X2;
    fb.Y2 = AWinPos.Y2;
    DailyQuest = BTDailyQuest(NewComponent(new Class'GUIWarfareControls_Decompressed.BTDailyQuest', fb));
    DailyQuest.InitPuzzlePiece();
    fb.X1 = AWinPos.X1;
    fb.Y1 = AWinPos.Y1 + float(42);
    fb.X2 = AWinPos.X2;
    fb.Y2 = AWinPos.Y2;
    AttendCheck = BTAttendQuest(NewComponent(new Class'GUIWarfareControls_Decompressed.BTAttendQuest', fb));
    fb.X1 = AWinPos.X1;
    fb.Y1 = AWinPos.Y1 + float(42);
    fb.X2 = AWinPos.X2;
    fb.Y2 = AWinPos.Y2;
    SpecialQuest = BTSpecialQuest(NewComponent(new Class'GUIWarfareControls_Decompressed.BTSpecialQuest', fb));
    i = 0;
    J0x234:

    // End:0x44D [Loop If]
    if(i < 3)
    {
        fb.X1 = 148.0000000 + float(i * 104);
        fb.Y1 = 18.0000000;
        fb.X2 = 251.0000000 + float(i * 104);
        fb.Y2 = 50.0000000;
        ButtonTab[i] = NewButtonComponent(fb);
        ButtonTab[i].CaptionDrawType = 4;
        ButtonTab[i].CaptionPadding[1] = 2;
        ButtonTab[i].SetTabButtonFontColor();
        ButtonTab[i].SetBigTabButtonImage();
        ButtonTab[i].Caption = strButtonTab[i];
        // End:0x358
        if(i == 0)
        {
            TabControl.BindTabButtonAndPanel(ButtonTab[i], DailyQuest);            
        }
        else
        {
            // End:0x385
            if(i == 1)
            {
                TabControl.BindTabButtonAndPanel(ButtonTab[i], AttendCheck);                
            }
            else
            {
                TabControl.BindTabButtonAndPanel(ButtonTab[i], SpecialQuest);
            }
        }
        ButtonTab[i].__OnClick__Delegate = ButtonTab_OnClick;
        ButtonTab[i].CanvasStyle = 2;
        ButtonTab[i].ButtonID = i;
        TabControl.SetVisiblePanel(0);
        // End:0x424
        if(i == 0)
        {
            DailyQuest.ACLQuest.SetVisibleQuestType(2);
        }
        DailyQuest.SetLabelQuestDesc(0);
        ButtonClose.EnableMe();
        i++;
        // [Loop Continue]
        goto J0x234;
    }
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    DailyQuest.SetVisiblePuzzlePiece();
    //return;    
}

function ReceiveItem()
{
    AttendCheck.RefreshBtnList();
    //return;    
}

function SetSlideTabPanel()
{
    bSelfTopMenuOwner = true;
    ShowAWinFrame = AWinFrame;
    HideAWinFrame = AWinFrame;
    HideAWinFrame.X1 -= AWinPos.X2;
    HideAWinFrame.X2 -= AWinPos.X2;
    AWinFrame = HideAWinFrame;
    TraversalApplyAWinPos();
    SetVisibility(false);
    //return;    
}

function GUIComponent GetTopMenuOwner()
{
    // End:0x1B
    if(bSelfTopMenuOwner || MenuOwner == none)
    {
        return self;        
    }
    else
    {
        return MenuOwner.GetTopMenuOwner();
    }
    //return;    
}

function bool Internal_OnPreDraw(Canvas C)
{
    OnPreDraw(C);
    // End:0x18B
    if(bSlidingTabPanel)
    {
        SlideTime -= (Controller.RenderDelta * (1.0000000 + ((float(1) - SlideTime) * SlideMultiplier)));
        // End:0xA9
        if(SlideTime <= float(0))
        {
            SlideTime = 0.0000000;
            bSlidingTabPanel = false;
            SetVisibility(bShowing);
            TabControl.SetVisiblePanel(0);
            DailyQuest.ACLQuest.SetVisibleQuestType(2);
            DailyQuest.SetLabelQuestDesc(0);
        }
        // End:0x11D
        if(bShowing)
        {
            AWinFrame.X1 = (HideAWinFrame.X1 * SlideTime) + (ShowAWinFrame.X1 * (float(1) - SlideTime));
            AWinFrame.X2 = (HideAWinFrame.X2 * SlideTime) + (ShowAWinFrame.X2 * (float(1) - SlideTime));            
        }
        else
        {
            AWinFrame.X1 = (ShowAWinFrame.X1 * SlideTime) + (HideAWinFrame.X1 * (float(1) - SlideTime));
            AWinFrame.X2 = (ShowAWinFrame.X2 * SlideTime) + (HideAWinFrame.X2 * (float(1) - SlideTime));
        }
        TraversalApplyAWinPos();
    }
    return true;
    //return;    
}

function OnRendered(Canvas C)
{
    // End:0x33
    if(TabControl.GetVisiblePanelIndex() == 2)
    {
        SpecialQuest.expbar.Render(C);
    }
    //return;    
}

function SetMatchMaker(wMatchMaker MM)
{
    local int i, questindex;
    local wQuestParam q;

    DailyQuest.ACLQuest.RemovePool();
    DailyQuest.ACLQuest.RemoveAll();
    MM.SortQuestList(Controller.ViewportOwner.Actor.Level.GameMgr);
    i = 0;
    J0x6F:

    // End:0x1D4 [Loop If]
    if(i < MM.QuestList.Length)
    {
        questindex = GameMgr.GetQuestInfoIndex(MM.QuestList[i].QuestID);
        // End:0xC4
        if(questindex < 0)
        {
            // [Explicit Continue]
            goto J0x1CA;
        }
        q = GameMgr.GetQuestInfoFromIndex(questindex);
        // End:0x15A
        if(GameMgr.GetDailyQuestType(MM.QuestList[i].QuestID) != 7)
        {
            DailyQuest.ACLQuest.AddQuestInfo(MM.QuestList[i].QuestID, MM.QuestList[i].CurrentProgress);
            // [Explicit Continue]
            goto J0x1CA;
        }
        // End:0x1CA
        if(GameMgr.GetDailyQuestType(MM.QuestList[i].QuestID) == 7)
        {
            SpecialQuest.AddQuestInfo(MM.QuestList[i].QuestID, MM.QuestList[i].CurrentProgress);
        }
        J0x1CA:

        i++;
        // [Loop Continue]
        goto J0x6F;
    }
    DailyQuest.LabelQuestDesc.SetData("", "", "", "", "", "", "");
    // End:0x21F
    if(MM.QuestList.Length > 0)
    {
        DailyQuest.SetLabelQuestDesc(0);
    }
    //return;    
}

function Show()
{
    // End:0x16
    if(bVisible || bSlidingTabPanel)
    {
        return;
    }
    SlideTime = 1.0000000;
    bShowing = true;
    bSlidingTabPanel = true;
    SetVisibility(true);
    TabControl.SetVisiblePanel(0);
    DailyQuest.ACLQuest.SetVisibleQuestType(2);
    DailyQuest.SetLabelQuestDesc(0);
    PlayerOwner().FmodClientPlaySound("Warfare_Sound_UI/Window/open",,, 6);
    //return;    
}

function Hide()
{
    // End:0x19
    if((bVisible == false) || bSlidingTabPanel)
    {
        return;
    }
    SlideTime = 1.0000000;
    bShowing = false;
    bSlidingTabPanel = true;
    PlayerOwner().FmodClientPlaySound("Warfare_Sound_UI/Window/close",,, 6);
    //return;    
}

defaultproperties
{
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTTPQuestInfoHK.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl
    strButtonTab[0]="???????"
    strButtonTab[1]="??????????"
    strButtonTab[2]="???????"
    strButtonTab[3]="??????"
    strButtonTab[4]="??????"
    strButtonTab[5]="??????????"
    strButtonClose="???"
    SlideMultiplier=4.0000000
    bAcceptsInput=true
    OnPreDraw=BTTPQuestInfoHK.Internal_OnPreDraw
    OnRendered=BTTPQuestInfoHK.OnRendered
}