/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTROLevelHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:4
 *
 *******************************************************************************/
class BTROLevelHK extends RenderObject;

var int Level;
var Image Background;
var Image LevelImg;

function Init();
function SetData(wGameManager GameMgr, int Level, int LevelMarkID)
{
    self.Level = Level;
    self.LevelImg = class'BTCustomDrawHK'.static.MakeImage(32, 32, 28, none);
    GameMgr.GetLevelImage(Level, LevelMarkID, LevelImg);
}

function Update(optional Canvas C, optional float Delta);
function bool Render(Canvas C, optional float Delta)
{
    // End:0xab
    if(bVisible)
    {
        // End:0x5a
        if(Background.Image != none)
        {
            class'BTCustomDrawHK'.static.DrawImage(C, Background, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
        }
        // End:0xab
        if(LevelImg.Image != none)
        {
            class'BTCustomDrawHK'.static.DrawImage(C, LevelImg, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
        }
    }
    return true;
}
