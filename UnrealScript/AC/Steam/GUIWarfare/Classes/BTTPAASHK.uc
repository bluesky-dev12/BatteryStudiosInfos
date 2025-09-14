/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTTPAASHK.uc
 * Package Imports:
 *	GUIWarfare
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:12
 *	Functions:4
 *
 *******************************************************************************/
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
var delegate<OnNextAAS> __OnNextAAS__Delegate;

delegate OnNextAAS(string NextAAS);
function bool Internal_OnPreDraw(Canvas C)
{
    local float Delta;

    OnPreDraw(C);
    // End:0x19
    if(bVisible == false)
    {
        return true;
    }
    // End:0x17f
    if(MainMenu != none)
    {
        // End:0x12f
        if(MainMenu.BatteryAAS.Length > 0)
        {
            Delta = PlayerOwner().Level.TimeSeconds - MainMenu.AASUITimeSeconds;
            MainMenu.AASUIPos -= Delta;
            // End:0x102
            if(MainMenu.AASUIPos > float(0))
            {
                // End:0xff
                if(AAS.TextStr == "" || AAS.TextStr != MainMenu.GetAASFirst())
                {
                    AAS.SetText(MainMenu.GetAASFirst());
                    OnNextAAS(MainMenu.GetAASFirst());
                }
            }
            // End:0x111
            else
            {
                MainMenu.PopAASQueue();
            }
            AAS.bgImg.DrawColor.A = 80;
        }
        // End:0x170
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
}

function SetMainMenu(BTNetMainMenu MM)
{
    // End:0x31
    if(MM == none)
    {
        Log("BTTPAASHK::SetMainMenu] mm is none");
    }
    MainMenu = MM;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    AAS = BTMultiLineEditBoxHK(NewComponent(new class'BTMultiLineEditBoxHK', AWinPos));
    AAS.bAcceptsInput = false;
    AAS.bReadOnly = true;
    AAS.bActiveCursor = false;
    AAS.bgImg = class'BTUIResourcePoolHK'.default.butt_n;
    AAS.bgImg.DrawColor.A = 80;
    AAS.InitComponent(Controller, self);
    AppendComponent(AAS);
    AAS.SetFontSizeAll(8);
    AAS.SetFontColor(byte(255), 219, 53, byte(255));
}

defaultproperties
{
    OnPreDraw=Internal_OnPreDraw
}