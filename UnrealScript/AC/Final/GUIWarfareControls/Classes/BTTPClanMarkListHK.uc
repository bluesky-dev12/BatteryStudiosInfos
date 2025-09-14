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
    // End:0xA1
    if(ClanMarkList.bUseAWinPos)
    {
        ClanMarkList.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(OutLineHorzBorder), AWinPos.Y1 + float(OutLineVertBorder), AWinPos.X2 - float(OutLineHorzBorder), AWinPos.Y2 - float(OutLineVertBorder));
        ClanMarkList.ApplyAWinPos();
    }
    //return;    
}

function AddItem(int clanmarkid, int clanmarktype1, int clanmarktype2, int selltype, int DisplayOrder, string clanmarkresource32, string clanmarkresource128)
{
    local BTROCreateClanMarkHK ro;

    ro = new Class'GUIWarfareControls_Decompressed.BTROCreateClanMarkHK';
    ro.SetData(0, clanmarkid, clanmarktype1, clanmarktype2, selltype, DisplayOrder, clanmarkresource32, clanmarkresource128);
    ro.SetClanMarkSize128();
    ro.bUseSellMark = true;
    ClanMarkList.AddItem(ro);
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    ClanMarkList = new Class'GUIWarfareControls_Decompressed.BTClanMarkImageListHK';
    ClanMarkList.bUseAWinPos = true;
    ClanMarkList.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(OutLineHorzBorder), AWinPos.Y1 + float(OutLineVertBorder), AWinPos.X2 - float(OutLineHorzBorder), AWinPos.Y2 - float(OutLineVertBorder));
    ClanMarkList.RenderWeight = 0.7000000;
    ClanMarkList.InitComponent(Controller, self);
    AppendComponent(ClanMarkList);
    ClanMarkList.SetItemSize(85, 85);
    ClanMarkList.SetItemCountPerPage(2, 6);
    SetOutlineBorder(6, 6);
    //return;    
}

defaultproperties
{
    bAcceptsInput=true
}