class BTROLevelHK extends RenderObject;

var int Level;
var Image Background;
var Image LevelImg;

function Init()
{
    //return;    
}

function SetData(wGameManager GameMgr, int Level, int LevelMarkID)
{
    self.Level = Level;
    self.LevelImg = Class'Engine.BTCustomDrawHK'.static.MakeImage(32, 32, 28, none);
    GameMgr.GetLevelImage(Level, LevelMarkID, LevelImg);
    //return;    
}

function Update(optional Canvas C, optional float Delta)
{
    //return;    
}

function bool Render(Canvas C, optional float Delta)
{
    // End:0xAB
    if(bVisible)
    {
        // End:0x5A
        if(Background.Image != none)
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Background, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
        }
        // End:0xAB
        if(LevelImg.Image != none)
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, LevelImg, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
        }
    }
    return true;
    //return;    
}
