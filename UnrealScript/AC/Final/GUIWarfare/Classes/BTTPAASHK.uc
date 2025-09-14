class BTTPAASHK extends BTTabPanelHK
    editinlinenew
    instanced;

var export editinline BTNetMainMenu MainMenu;
var export editinline BTMultiLineEditBoxHK AAS;
var float NextAAS;
var float LastTime;
var bool bSelfTopMenuOwner;
var bool bSlidingTabPanel;
var bool bShowing;
var float SlideTime;
var float SlideMultiplier;
var FloatBox ShowAWinFrame;
var FloatBox HideAWinFrame;
//var delegate<OnNextAAS> __OnNextAAS__Delegate;

delegate OnNextAAS(string NextAAS)
{
    //return;    
}

function bool Internal_OnPreDraw(Canvas C)
{
    local float Delta;

    OnPreDraw(C);
    // End:0x19
    if(bVisible == false)
    {
        return true;
    }
    // End:0x17F
    if(MainMenu != none)
    {
        // End:0x12F
        if(MainMenu.BatteryAAS.Length > 0)
        {
            Delta = PlayerOwner().Level.TimeSeconds - MainMenu.AASUITimeSeconds;
            MainMenu.AASUIPos -= Delta;
            // End:0x102
            if(MainMenu.AASUIPos > float(0))
            {
                // End:0xFF
                if((AAS.TextStr == "") || AAS.TextStr != MainMenu.GetAASFirst())
                {
                    AAS.SetText(MainMenu.GetAASFirst());
                    OnNextAAS(MainMenu.GetAASFirst());
                }                
            }
            else
            {
                MainMenu.PopAASQueue();
            }
            AAS.bgImg.DrawColor.A = 80;            
        }
        else
        {
            // End:0x155
            if(AAS.TextStr != "")
            {
                AAS.SetText("");
            }
            AAS.bgImg.DrawColor.A = 0;
        }
        MainMenu.UpdateTimeBatteryAAS();
    }
    return true;
    //return;    
}

function SetMainMenu(BTNetMainMenu MM)
{
    // End:0x31
    if(MM == none)
    {
        Log("BTTPAASHK::SetMainMenu] mm is none");
    }
    MainMenu = MM;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    AAS = BTMultiLineEditBoxHK(NewComponent(new Class'GUIWarfareControls.BTMultiLineEditBoxHK', AWinPos));
    AAS.bAcceptsInput = false;
    AAS.bReadOnly = true;
    AAS.bActiveCursor = false;
    AAS.bgImg = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.butt_n;
    AAS.bgImg.DrawColor.A = 80;
    AAS.InitComponent(Controller, self);
    AppendComponent(AAS);
    AAS.SetFontSizeAll(8);
    AAS.SetFontColor(byte(255), 219, 53, byte(255));
    //return;    
}

defaultproperties
{
    OnPreDraw=BTTPAASHK.Internal_OnPreDraw
}