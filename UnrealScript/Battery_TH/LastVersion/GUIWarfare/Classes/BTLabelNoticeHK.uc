class BTLabelNoticeHK extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var localized string strNotice;
var export editinline BTNetMainMenu MainMenu;
var float DeltaMultiplier;
//var delegate<OnNextNotice> __OnNextNotice__Delegate;

delegate OnNextNotice(string NextNotice)
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIComponent).InitComponent(MyController, myOwner);
    CaptionDrawType = 3;
    DeltaMultiplier = 100.0000000;
    //return;    
}

function SetMainMenu(BTNetMainMenu MM)
{
    // End:0x37
    if(MM == none)
    {
        Log("BTLabelNoticeHK::SetMainMenu] mm is none");
    }
    MainMenu = MM;
    MainMenu.UpdateTimeBatteryNotice();
    //return;    
}

function Internal_OnRendered(Canvas C)
{
    local float Delta, CaptionW, CaptionHT;
    local FloatBox fbSlidingWindow;

    // End:0x0E
    if(bVisible == false)
    {
        return;
    }
    C.Style = 5;
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, Bounds[0], Bounds[1], Bounds[2], Bounds[3]);
    // End:0x293
    if(MainMenu != none)
    {
        // End:0x284
        if(MainMenu.BatteryNotice.Length > 0)
        {
            Delta = (PlayerOwner().Level.TimeSeconds - MainMenu.NoticeUITimeSeconds) * DeltaMultiplier;
            // End:0xF1
            if((MainMenu.NoticeUIPos == float(1024)) && Delta > float(0))
            {
                OnNextNotice(strNotice $ MainMenu.GetNoticeFirst());
            }
            MainMenu.NoticeUIPos -= Delta;
            fbSlidingWindow.X1 = MainMenu.NoticeUIPos + AWinPos.X1;
            fbSlidingWindow.X2 = AWinPos.X2;
            fbSlidingWindow.Y1 = AWinPos.Y1;
            fbSlidingWindow.Y2 = AWinPos.Y2;
            C.DrawColor = FontColor[int(self.MenuState)];
            C.BtrTextSize(MainMenu.GetNoticeFirst(), FontSize[int(self.MenuState)], CaptionW, CaptionHT);
            Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, MainMenu.GetNoticeFirst(), CaptionDrawType, float(FontSize[int(self.MenuState)]), fbSlidingWindow.X1, fbSlidingWindow.Y1, fbSlidingWindow.X2, fbSlidingWindow.Y2, CaptionPadding[0], CaptionPadding[1], CaptionPadding[2], CaptionPadding[3], FontShadowColor[int(self.MenuState)], 0, true);
            // End:0x284
            if(MainMenu.NoticeUIPos < -CaptionW)
            {
                MainMenu.PopNoticeQueue();
            }
        }
        MainMenu.UpdateTimeBatteryNotice();
    }
    //return;    
}

defaultproperties
{
    strNotice="???????? : "
    OnRendered=BTLabelNoticeHK.Internal_OnRendered
}