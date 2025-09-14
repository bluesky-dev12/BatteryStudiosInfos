/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTAniItemBoxButtonHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:3
 *
 *******************************************************************************/
class BTAniItemBoxButtonHK extends BTOwnerDrawCaptionButtonHK
    dependson(BTROAniItemBoxHK)
    editinlinenew
    instanced;

var BTROAniItemBoxHK itemBox;
var string DefaultSlotName[2];
var Plane DefaultSlotModulate;
var Image DefaultSlotImage;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    itemBox = new class'BTROAniItemBoxHK';
    itemBox.Init();
    itemBox.SetGameManager(PlayerOwner().Level.GameMgr);
}

function SetData(wItemBoxHK ItemInfo, wItemBoxInstanceHK instanceInfo)
{
    itemBox.ItemInfo = ItemInfo;
    itemBox.instanceInfo = instanceInfo;
    itemBox.Update();
}

function bool Internal_OnDraw(Canvas C)
{
    local float Delta;

    itemBox.bVisible = self.bVisible;
    itemBox.AWinPos = self.RWinPos;
    // End:0x7e
    if(itemBox.CheckIn(float(int(Controller.MouseX)), float(int(Controller.MouseY))))
    {
        itemBox.bMouseOn = true;
    }
    // End:0x8f
    else
    {
        itemBox.bMouseOn = false;
    }
    // End:0xac
    if(bSelect)
    {
        itemBox.bFocused = true;
    }
    // End:0xbd
    else
    {
        itemBox.bFocused = false;
    }
    Delta = Controller.RenderDelta;
    // End:0xe9
    if(Delta == float(0))
    {
        Delta = 0.050;
    }
    itemBox.Render(C, Delta);
    // End:0x21b
    if(itemBox.ItemInfo == none)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, DefaultSlotImage, RWinPos.X1 + float(2), RWinPos.Y1 + float(2) + float(15), RWinPos.X2 - float(2), RWinPos.Y2 - float(2) - float(14));
        class'BTCustomDrawHK'.static.DrawString(C, DefaultSlotName[0], 0, 9.0, RWinPos.X1 + float(3), RWinPos.Y1 + float(3), RWinPos.X2, RWinPos.Y2);
        class'BTCustomDrawHK'.static.DrawString(C, DefaultSlotName[1], 4, 9.0, RWinPos.X1, RWinPos.Y1, RWinPos.X2, RWinPos.Y2);
    }
    return true;
}

defaultproperties
{
    DefaultSlotModulate=(X=0.0,Y=0.0,Z=0.0,W=0.0)
    OnDraw=Internal_OnDraw
}