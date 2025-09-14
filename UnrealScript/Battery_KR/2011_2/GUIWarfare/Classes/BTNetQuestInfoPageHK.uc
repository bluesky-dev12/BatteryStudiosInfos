class BTNetQuestInfoPageHK extends BTNetGUIPageHK
    editinlinenew
    instanced;

var export editinline BTTPQuestInfoHK QuestInfo;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    TPTopMenu.Quest.__OnClick__Delegate = TPTopMenu_Quest_OnClick;
    QuestInfo = BTTPQuestInfoHK(self.NewComponent(new Class'GUIWarfareControls.BTTPQuestInfoHK', Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(10.0000000, 87.0000000, 761.0000000, 498.0000000), 0.9990000));
    QuestInfo.SetSlideTabPanel();
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    //return;    
}

function InternalOnOpen()
{
    local BtrDouble CurrentTime;
    local BtrTime tCurr;
    local float fTimerInterval;

    CurrentTime = GameMgr.GetClientTime(true);
    BtrDoubleToBtrTime(CurrentTime, tCurr);
    // End:0x8F
    if(tCurr.Hour < 7)
    {
        fTimerInterval = (((6.0000000 - float(tCurr.Hour)) * float(3600)) + float((59 - tCurr.Minute) * 60)) + float(60 - tCurr.Second);
        SetTimer(fTimerInterval, false, 'NotifyDailyQuestReset');
    }
    //return;    
}

function NotifyDailyQuestReset()
{
    // End:0x4F
    if(page_Main.IsGameReadyOrPlaying() && MM.InGamePlaying == false)
    {
        page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(142), 5, true);        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 27);
    }
    //return;    
}

function bool TPTopMenu_Quest_OnClick(GUIComponent Sender)
{
    QuestInfo.SetMatchMaker(MM);
    QuestInfo.Show();
    return true;
    //return;    
}
