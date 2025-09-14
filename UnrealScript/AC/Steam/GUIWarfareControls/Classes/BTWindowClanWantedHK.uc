/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowClanWantedHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:2
 *
 *******************************************************************************/
class BTWindowClanWantedHK extends BTWindowHK
    editinlinenew
    instanced;

var localized string strLabel[2];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabel;
var export editinline BTMultiLineEditBoxHK Label;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    Label = BTMultiLineEditBoxHK(NewComponent(new class'BTMultiLineEditBoxHK', fbLabel));
    Label.bReadOnly = true;
    Label.bActiveCursor = false;
}

function SetData(int CurState)
{
    Label.SetText(strLabel[CurState]);
    // End:0x5b
    if(CurState == 0)
    {
        Label.AWinPos.Y1 = fbLabel.Y1 - float(5);
        Label.ApplyAWinPos();
    }
    // End:0x93
    else
    {
        // End:0x93
        if(CurState == 1)
        {
            Label.AWinPos.Y1 = fbLabel.Y1;
            Label.ApplyAWinPos();
        }
    }
}

defaultproperties
{
    strLabel[0]="Enable Find Clan? When you enable Find Clan, the Find Clan mark is displayed in place of a clan mark."
    strLabel[1]="Find Clan is currently enabled. Cancel and return to normal?"
    fbLabel=(X1=275.0,Y1=369.0,X2=760.0,Y2=400.0)
    fbBackgroundImage=(X1=245.0,Y1=304.0,X2=780.0,Y2=465.0)
    fbTopLine=(X1=265.0,Y1=324.0,X2=760.0,Y2=350.0)
    fbBottomLine=(X1=265.0,Y1=401.0,X2=760.0,Y2=445.0)
    fbButtonOK=(X1=391.0,Y1=407.0,X2=511.0,Y2=440.0)
    fbButtonCancel=(X1=515.0,Y1=407.0,X2=635.0,Y2=440.0)
    strTitle="Find Clan"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
}