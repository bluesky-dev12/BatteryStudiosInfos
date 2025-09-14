/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPClanMarkListHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:3
 *
 *******************************************************************************/
class BTTPClanMarkListHK extends GUITabPanel
    editinlinenew
    instanced;

var int OutLineHorzBorder;
var int OutLineVertBorder;
var export editinline BTClanMarkImageListHK ClanMarkList;

function SetOutlineBorder(int horz, int vert)
{
    OutLineHorzBorder = horz;
    OutLineVertBorder = vert;
    // End:0xa1
    if(ClanMarkList.bUseAWinPos)
    {
        ClanMarkList.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(OutLineHorzBorder), AWinPos.Y1 + float(OutLineVertBorder), AWinPos.X2 - float(OutLineHorzBorder), AWinPos.Y2 - float(OutLineVertBorder));
        ClanMarkList.ApplyAWinPos();
    }
}

function AddItem(int clanmarkid, int clanmarktype1, int clanmarktype2, int selltype, int DisplayOrder, string clanmarkresource32, string clanmarkresource128)
{
    local BTROCreateClanMarkHK ro;

    ro = new class'BTROCreateClanMarkHK';
    ro.SetData(0, clanmarkid, clanmarktype1, clanmarktype2, selltype, DisplayOrder, clanmarkresource32, clanmarkresource128);
    ro.SetClanMarkSize128();
    ro.bUseSellMark = true;
    ClanMarkList.AddItem(ro);
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    ClanMarkList = new class'BTClanMarkImageListHK';
    ClanMarkList.bUseAWinPos = true;
    ClanMarkList.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(OutLineHorzBorder), AWinPos.Y1 + float(OutLineVertBorder), AWinPos.X2 - float(OutLineHorzBorder), AWinPos.Y2 - float(OutLineVertBorder));
    ClanMarkList.RenderWeight = 0.70;
    ClanMarkList.InitComponent(Controller, self);
    AppendComponent(ClanMarkList);
    ClanMarkList.SetItemSize(85, 85);
    ClanMarkList.SetItemCountPerPage(2, 6);
    SetOutlineBorder(6, 6);
}

defaultproperties
{
    bAcceptsInput=true
}