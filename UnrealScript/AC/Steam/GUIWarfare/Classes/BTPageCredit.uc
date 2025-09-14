/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTPageCredit.uc
 * Package Imports:
 *	GUIWarfare
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:5
 *
 *******************************************************************************/
class BTPageCredit extends BTNetGUIPageHK
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelCredit;
var export editinline BTLabelCreditAnimationHK LabelCredit;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    TPTopMenu.SetVisibility(false);
    LabelTopLine.SetVisibility(false);
    LabelBottomLine.SetVisibility(false);
    LabelRoomName.SetVisibility(false);
    LabelLeftTopRoll.SetVisibility(false);
    LabelCredit = BTLabelCreditAnimationHK(NewComponent(new class'BTLabelCreditAnimationHK', fbLabelCredit, 0.990));
    LabelCredit.__OnEndCredit__Delegate = LabelCredit_OnEndCredit;
}

function LabelCredit_OnEndCredit()
{
    PlayerOwner().Player.Console.SetOneBGM(page_Main.LastMainPageBGM);
    page_Main.SetPage(1, true);
}

function bool Internal_KeyEvent(out byte key, out byte Action, float Delta)
{
    local Engine.Interactions.EInputKey iKey;
    local Engine.Interactions.EInputAction iAction;

    Log("[BTPageCredit::Internal_KeyEvent]");
    iKey = key;
    iAction = Action;
    // End:0x105
    if(iAction == 1)
    {
        // End:0x7f
        if(iKey == 1 || iKey == 237)
        {
            LabelCredit.DecreaseDelta();
        }
        // End:0x105
        else
        {
            // End:0xb3
            if(iKey == 2 || iKey == 236)
            {
                LabelCredit.IncreaseDelta();
            }
            // End:0x105
            else
            {
                // End:0xc6
                if(iKey == 4)
                {
                }
                // End:0x105
                else
                {
                    PlayerOwner().Player.Console.SetOneBGM(page_Main.LastMainPageBGM);
                    page_Main.SetPage(1, true);
                }
            }
        }
    }
    return true;
}

function InternalOnOpen()
{
    UnresolvedNativeFunction_97("BTPageCredit::InternalOnOpen()");
    Log("[BTPageCredit::InternalOnOpen] Start");
    PlayerOwner().Player.Console.SetOneBGM(currentBGM);
    Log("[BTPageCredit::InternalOnOpen] End");
}

function InternalOnClose(optional bool bCanceled)
{
    UnresolvedNativeFunction_97("BTPageCredit::InternalOnClose()");
    Log("[BTPageCredit::InternalOnClose]");
    OnClose(bCanceled);
}

defaultproperties
{
    fbLabelCredit=(X1=0.0,Y1=0.0,X2=1024.0,Y2=768.0)
    currentBGM="bgm_maintheme_part1"
    bPersistent=true
    OnOpen=InternalOnOpen
    OnClose=InternalOnClose
    OnKeyEvent=Internal_KeyEvent
}