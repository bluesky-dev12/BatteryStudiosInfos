class BTWindowBTTPQuestInfoHK extends BTWindowHK
    editinlinenew
    instanced;

var export editinline BTTPQuestInfoHK QuestInfo;
var export editinline BTOwnerDrawCaptionButtonHK ButtonClose;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local wMatchMaker MM;

    super.InitComponent(MyController, myOwner);
    QuestInfo = BTTPQuestInfoHK(self.NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPQuestInfoHK', Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(26.0000000, 8.0000000, 997.0000000, 759.0000000), 0.0100000));
    QuestInfo.DailyQuest.ButtonClose.Caption = strOK;
    QuestInfo.AttendCheck.ButtonClose.Caption = strOK;
    QuestInfo.SpecialQuest.ButtonClose.Caption = strOK;
    QuestInfo.DailyQuest.ButtonClose.__OnClick__Delegate = ButtonClose_OnClick;
    QuestInfo.AttendCheck.ButtonClose.__OnClick__Delegate = ButtonClose_OnClick;
    QuestInfo.SpecialQuest.ButtonClose.__OnClick__Delegate = ButtonClose_OnClick;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    QuestInfo.SetMatchMaker(MM);
    QuestInfo.DailyQuest.ACLQuest.SetVisibleQuestType(2);
    QuestInfo.DailyQuest.SetLabelQuestDesc(0);
    BackgroundImage.SetVisibility(false);
    TopLine.SetVisibility(false);
    BottomLine.SetVisibility(false);
    ButtonCancel.SetVisibility(false);
    ButtonCancel.bAcceptsInput = false;
    ButtonOK.SetVisibility(false);
    ButtonOK.bAcceptsInput = false;
    //return;    
}

function SetQuestList(wMatchMaker MM)
{
    QuestInfo.SetMatchMaker(MM);
    //return;    
}

function bool ButtonClose_OnClick(GUIComponent Sender)
{
    Hide();
    FadeOut(false, true);
    return true;
    //return;    
}

defaultproperties
{
    fbButtonOK=(X1=836.0000000,Y1=713.0000000,X2=960.0000000,Y2=750.0000000)
    CloseWeb=true
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
}