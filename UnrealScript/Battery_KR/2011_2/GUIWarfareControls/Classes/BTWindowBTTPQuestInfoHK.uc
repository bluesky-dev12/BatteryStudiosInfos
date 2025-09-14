class BTWindowBTTPQuestInfoHK extends BTWindowHK
    editinlinenew
    instanced;

var export editinline BTTPQuestInfoHK QuestInfo;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local wMatchMaker MM;

    super.InitComponent(MyController, myOwner);
    QuestInfo = BTTPQuestInfoHK(self.NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPQuestInfoHK', Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(136.0000000, 178.0000000, 887.0000000, 589.0000000), 0.0100000));
    QuestInfo.ButtonClose.AWinPos = fbButtonOK;
    QuestInfo.ButtonClose.Caption = strOK;
    QuestInfo.ButtonClose.ApplyAWinPos();
    QuestInfo.ButtonClose.__OnClick__Delegate = ButtonOK_OnClick;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    QuestInfo.SetMatchMaker(MM);
    BackgroundImage.SetVisibility(false);
    TopLine.SetVisibility(false);
    BottomLine.SetVisibility(false);
    ButtonCancel.SetVisibility(false);
    ButtonCancel.bAcceptsInput = false;
    ButtonOK.SetVisibility(false);
    ButtonOK.bAcceptsInput = false;
    //return;    
}

defaultproperties
{
    fbButtonOK=(X1=452.0000000,Y1=551.0000000,X2=572.0000000,Y2=583.0000000)
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
}