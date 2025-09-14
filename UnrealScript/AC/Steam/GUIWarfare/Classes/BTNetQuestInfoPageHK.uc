/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTNetQuestInfoPageHK.uc
 * Package Imports:
 *	GUIWarfare
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:5
 *
 *******************************************************************************/
class BTNetQuestInfoPageHK extends BTNetGUIPageHK
    editinlinenew
    instanced;

var export editinline BTTPQuestInfoHK QuestInfo;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    TPTopMenu.Quest.__OnClick__Delegate = TPTopMenu_Quest_OnClick;
    QuestInfo = BTTPQuestInfoHK(self.NewComponent(new class'BTTPQuestInfoHK', class'BTCustomDrawHK'.static.MakeFloatBox(0.0, 91.0, 756.0, 515.0), 0.9990));
    QuestInfo.SetSlideTabPanel();
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
}

function InternalOnReOpen()
{
    // End:0x3c
    if(page_Main.rMM.kInterfaceGuideStep == 4)
    {
        TPTopMenu.Quest.SetFlicker(true);
    }
    // End:0x55
    else
    {
        TPTopMenu.Quest.SetFlicker(false);
    }
    // End:0x91
    if(page_Main.rMM.kInterfaceGuideStep == 3)
    {
        TPTopMenu.Inventory.SetFlicker(true);
    }
    // End:0xaa
    else
    {
        TPTopMenu.Inventory.SetFlicker(false);
    }
}

function InternalOnOpen()
{
    local BtrDouble CurrentTime;
    local BtrTime tCurr;
    local float fTimerInterval;

    CurrentTime = GameMgr.GetClientTime(true);
    BtrDoubleToBtrTime(CurrentTime, tCurr);
    // End:0x8f
    if(tCurr.Hour < 7)
    {
        fTimerInterval = 6.0 - float(tCurr.Hour) * float(3600) + float(59 - tCurr.Minute * 60) + float(60 - tCurr.Second);
        SetTimer(fTimerInterval, false, 'NotifyDailyQuestReset');
    }
    // End:0xcb
    if(page_Main.rMM.kInterfaceGuideStep == 4)
    {
        TPTopMenu.Quest.SetFlicker(true);
    }
    // End:0xe4
    else
    {
        TPTopMenu.Quest.SetFlicker(false);
    }
    // End:0x120
    if(page_Main.rMM.kInterfaceGuideStep == 3)
    {
        TPTopMenu.Inventory.SetFlicker(true);
    }
    // End:0x139
    else
    {
        TPTopMenu.Inventory.SetFlicker(false);
    }
}

function NotifyDailyQuestReset()
{
    // End:0x4f
    if(page_Main.IsGameReadyOrPlaying() && MM.InGamePlaying == false)
    {
        page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(142), 5, true);
    }
    // End:0x65
    else
    {
        class'BTWindowDefineARHK'.static.ShowInfo(Controller, 27);
    }
}

function bool TPTopMenu_Quest_OnClick(GUIComponent Sender)
{
    QuestInfo.SetMatchMaker(MM);
    QuestInfo.Show();
    // End:0x76
    if(page_Main.rMM.kInterfaceGuideStep == 4)
    {
        page_Main.rMM.kInterfaceGuideStep = 0;
        TPTopMenu.Quest.SetFlicker(false);
    }
    return true;
}
