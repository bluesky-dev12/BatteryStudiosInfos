/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTItemBoxButtonHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:3
 *
 *******************************************************************************/
class BTItemBoxButtonHK extends BTOwnerDrawCaptionButtonHK
    editinlinenew
    instanced;

var BTROItemBoxHK itemBox;
var int DefaultSlotItemID;
var BtrDouble DefaultSlotUniqueID;
var string DefaultSlotName[2];
var Plane DefaultSlotModulate;
var Image DefaultSlotImage;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    itemBox = new class'BTROItemBoxHK';
    itemBox.Init();
    itemBox.SetMatchMaker(PlayerOwner().Level.GetMatchMaker());
    itemBox.SetGameManager(PlayerOwner().Level.GameMgr);
    OnClickSound = 9;
}

function SetData(wItemBoxHK ItemInfo, wItemBoxInstanceHK instanceInfo)
{
    itemBox.ItemInfo = ItemInfo;
    itemBox.instanceInfo = instanceInfo;
    itemBox.Update();
}

function bool Internal_OnDraw(Canvas C)
{
    local Plane CanvasModulateValue;

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
    itemBox.Render(C);
    // End:0x20e
    if(itemBox.ItemInfo == none)
    {
        CanvasModulateValue = C.ColorModulate;
        C.ColorModulate = DefaultSlotModulate;
        class'BTCustomDrawHK'.static.DrawImage(C, DefaultSlotImage, RWinPos.X1, RWinPos.Y1, RWinPos.X2, RWinPos.Y2);
        C.ColorModulate = CanvasModulateValue;
        class'BTCustomDrawHK'.static.DrawString(C, DefaultSlotName[0], 0, 9.0, RWinPos.X1 + float(3) + float(2), RWinPos.Y1 + float(3) + float(2), RWinPos.X2, RWinPos.Y2);
        class'BTCustomDrawHK'.static.DrawString(C, DefaultSlotName[1], 4, 9.0, RWinPos.X1, RWinPos.Y1, RWinPos.X2, RWinPos.Y2);
    }
    return true;
}

defaultproperties
{
    DefaultSlotModulate=(X=0.0,Y=0.0,Z=0.0,W=0.0)
    CaptionPadding[1]=4
    OnDraw=Internal_OnDraw
}