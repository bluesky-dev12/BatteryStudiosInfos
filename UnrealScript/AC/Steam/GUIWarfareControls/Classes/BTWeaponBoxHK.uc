/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWeaponBoxHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	Core
 *
 * Stats:
 *	Properties:16
 *	Functions:2
 *
 *******************************************************************************/
class BTWeaponBoxHK extends RenderObject;

var Text WeaponName;
var bool bSkill;
var bool bSilence;
var bool bScope;
var bool bDotSight;
var bool bPointItem;
var bool bEndurance;
var int CurEndurance;
var int MaxEndurance;
var bool bCashItem;
var bool bNeverUsed;
var string strLimitDates;
var bool bAdNew;
var bool bAdBest;
var bool bAdHot;
var int LeveRestriction;

function Init()
{
    bSkill = true;
    bSilence = false;
    bScope = true;
    bDotSight = false;
    WeaponName = class'BTCustomDrawHK'.static.MakeText(9, 0, "CheyTac LRRS");
    WeaponName.DrawColor = class'Canvas'.static.MakeColor(222, byte(255), 100, byte(255));
}

function bool Render(Canvas C, optional float Delta)
{
    local FloatBox fb;

    // End:0x13
    if(super.Render(C) == false)
    {
        return false;
    }
    class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.list_item_n, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    fb.X2 = AWinPos.X2 - float(2);
    fb.Y1 = AWinPos.Y1 + float(2);
    fb.X1 = AWinPos.X2 - float(2) - float(22);
    fb.Y2 = AWinPos.Y1 + float(2) + float(22);
    class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.list_item_non, AWinPos.X1, AWinPos.Y1 + float(25), AWinPos.X2, AWinPos.Y2);
    class'BTCustomDrawHK'.static.DrawText(C, WeaponName, AWinPos.X1 + float(3), AWinPos.Y1 + float(3), AWinPos.X2, AWinPos.Y2);
    return true;
}
