class BTOwnerDrawMyNameMyClanHK extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var int Level;
var int ClanBG;
var Image LevelImg;
var Image ClanImg;
var Text myName;
var Text MyClan;
var BTROClanMarkHK roClanMark;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIComponent).InitComponent(MyController, myOwner);
    Level = 1;
    LevelImg = Class'Engine.BTCustomDrawHK'.static.MakeImage(32, 32, 0, none);
    Controller.ViewportOwner.Actor.Level.GameMgr.GetLevelImage(1, 0, LevelImg);
    ClanImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ex_clanmark;
    myName = Class'Engine.BTCustomDrawHK'.static.MakeText(12, 4, "");
    MyClan = Class'Engine.BTCustomDrawHK'.static.MakeText(12, 4, "");
    roClanMark = new Class'GUIWarfareControls_Decompressed.BTROClanMarkHK';
    roClanMark.Init();
    //return;    
}

function SetData(int Lv, string myName, string MyClan, int Pattern, int BG, int BL, int ClanLevel, int LevelMarkID)
{
    Level = Lv;
    Controller.ViewportOwner.Actor.Level.GameMgr.GetLevelImage(Level, 0, LevelImg);
    self.myName.Text = myName;
    // End:0x76
    if(MyClan == "none")
    {
        MyClan = "";
    }
    self.MyClan.Text = MyClan;
    roClanMark.SetData(Controller.ViewportOwner.Actor.Level.GameMgr, Pattern, BG, BL, false, ClanLevel);
    //return;    
}

function Internal_OnRendered(Canvas C)
{
    // End:0x0E
    if(bVisible == false)
    {
        return;
    }
    C.Style = 5;
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, LevelImg, 527.0000000, AWinPos.Y1, 527.0000000 + float(32), AWinPos.Y1 + float(32));
    Class'Engine.BTCustomDrawHK'.static.DrawText(C, myName, 527.0000000 + float(32), AWinPos.Y1, 765.0000000, AWinPos.Y1 + float(32));
    // End:0x187
    if(MyClan.Text != "")
    {
        roClanMark.AWinPos.X1 = 765.0000000;
        roClanMark.AWinPos.Y1 = AWinPos.Y1;
        roClanMark.AWinPos.X2 = 765.0000000 + float(32);
        roClanMark.AWinPos.Y2 = AWinPos.Y1 + float(32);
        roClanMark.Render(C);
        Class'Engine.BTCustomDrawHK'.static.DrawText(C, MyClan, 765.0000000 + float(32), AWinPos.Y1, 990.0000000, AWinPos.Y1 + float(32));
    }
    //return;    
}

defaultproperties
{
    OnRendered=BTOwnerDrawMyNameMyClanHK.Internal_OnRendered
}