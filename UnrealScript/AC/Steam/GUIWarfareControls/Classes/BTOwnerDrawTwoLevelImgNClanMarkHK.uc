/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTOwnerDrawTwoLevelImgNClanMarkHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Constants:1
 *	Properties:2
 *	Functions:3
 *
 *******************************************************************************/
class BTOwnerDrawTwoLevelImgNClanMarkHK extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

const IcnSize = 32;

var Image LevelImg[2];
var BTROClanMarkHK ClanMark[2];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local wMatchMaker MM;

    super(GUIComponent).InitComponent(MyController, myOwner);
    LevelImg[0] = class'BTCustomDrawHK'.static.MakeImage(32, 32, 0, none);
    Controller.ViewportOwner.Actor.Level.GameMgr.GetLevelImage(1, 0, LevelImg[0]);
    LevelImg[1] = class'BTCustomDrawHK'.static.MakeImage(32, 32, 0, none);
    Controller.ViewportOwner.Actor.Level.GameMgr.GetLevelImage(1, 0, LevelImg[1]);
    ClanMark[0] = new class'BTROClanMarkHK';
    ClanMark[0].Init();
    ClanMark[1] = new class'BTROClanMarkHK';
    ClanMark[1].Init();
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    ClanMark[0].SetData(Controller.ViewportOwner.Actor.Level.GameMgr, MM.kClanPattern, MM.kClanBG, MM.kClanBL, false, MM.kClanLevel);
    ClanMark[1].SetData(Controller.ViewportOwner.Actor.Level.GameMgr, MM.kClanPattern, MM.kClanBG, MM.kClanBL, false, MM.kClanLevel);
}

function Internal_OnRendered(Canvas C)
{
    local int X_1, halfwidth, QuarterWidth;

    // End:0x0e
    if(bVisible == false)
    {
        return;
    }
    halfwidth = int(AWinPos.X2 - AWinPos.X1) / 2;
    QuarterWidth = halfwidth / 2;
    C.Style = 5;
    X_1 = int(AWinPos.X1 + float(QuarterWidth) - float(32) - float(5));
    class'BTCustomDrawHK'.static.DrawImage(C, LevelImg[0], float(X_1), AWinPos.Y1, float(X_1 + 32), AWinPos.Y1 + float(32));
    X_1 = int(AWinPos.X1 + float(QuarterWidth) + float(5));
    ClanMark[0].AWinPos.X1 = float(X_1);
    ClanMark[0].AWinPos.Y1 = AWinPos.Y1;
    ClanMark[0].AWinPos.X2 = float(X_1 + 32);
    ClanMark[0].AWinPos.Y2 = AWinPos.Y1 + float(32);
    ClanMark[0].Render(C);
    X_1 = int(AWinPos.X1 + float(halfwidth) + float(QuarterWidth) - float(32) - float(5));
    class'BTCustomDrawHK'.static.DrawImage(C, LevelImg[1], float(X_1), AWinPos.Y1, float(X_1 + 32), AWinPos.Y1 + float(32));
    X_1 = int(AWinPos.X1 + float(halfwidth) + float(QuarterWidth) + float(5));
    ClanMark[1].AWinPos.X1 = float(X_1);
    ClanMark[1].AWinPos.Y1 = AWinPos.Y1;
    ClanMark[1].AWinPos.X2 = float(X_1 + 32);
    ClanMark[1].AWinPos.Y2 = AWinPos.Y1 + float(32);
    ClanMark[1].Render(C);
}

function SetData(bool bFirst, int CharLevel, int LevelMarkID, int Pattern, int BG, int BL, int ClanLevel)
{
    local int idx;

    // End:0x13
    if(bFirst)
    {
        idx = 0;
    }
    // End:0x1a
    else
    {
        idx = 1;
    }
    Controller.ViewportOwner.Actor.Level.GameMgr.GetLevelImage(CharLevel, LevelMarkID, LevelImg[idx]);
    ClanMark[idx].SetData(Controller.ViewportOwner.Actor.Level.GameMgr, Pattern, BG, BL, false, ClanLevel);
}

defaultproperties
{
    OnRendered=Internal_OnRendered
}