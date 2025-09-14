/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTCashBoxHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:2
 *
 *******************************************************************************/
class BTCashBoxHK extends FloatingImage
    editinlinenew
    instanced;

var int imgW;
var Text SavePoint;
var localized string strCash;

function SetData(BtrDouble Point)
{
    local string strBDPoint;

    strBDPoint = string(int(UnresolvedNativeFunction_99(Point)));
    SavePoint = class'BTCustomDrawHK'.static.MakeText(12, 3, " " $ class'BTCustomDrawHK'.static.ToWonString(strBDPoint) $ strCash);
    SavePoint.DrawColor = class'BTUIColorPoolHK'.static.Cash();
    imgW = int(class'BTUIResourcePoolHK'.default.img_point_b.width);
}

function Internal_OnRendered(Canvas C)
{
    local float W, HT, SaveX;

    // End:0x0e
    if(bVisible == false)
    {
        return;
    }
    C.BtrTextSize(SavePoint.Text, SavePoint.FontSize, W, HT);
    SaveX = AWinPos.X2 - AWinPos.X1 - float(imgW) + W / float(2);
    class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.panel_1, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.img_point_b, AWinPos.X1 + SaveX, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    class'BTCustomDrawHK'.static.DrawText(C, SavePoint, AWinPos.X1 + SaveX + float(imgW), AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
}

defaultproperties
{
    strCash="Cash"
    OnRendered=Internal_OnRendered
}