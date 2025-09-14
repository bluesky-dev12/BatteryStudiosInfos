class BTAniItemBoxButtonHK extends BTOwnerDrawCaptionButtonHK
    editinlinenew
    instanced;

var BTROAniItemBoxHK itemBox;
var string DefaultSlotName[2];
var Plane DefaultSlotModulate;
var Image DefaultSlotImage;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    itemBox = new Class'GUIWarfareControls_Decompressed.BTROAniItemBoxHK';
    itemBox.Init();
    itemBox.SetGameManager(PlayerOwner().Level.GameMgr);
    //return;    
}

function SetData(wItemBoxHK ItemInfo, wItemBoxInstanceHK instanceInfo, bool bestItem)
{
    itemBox.ItemInfo = ItemInfo;
    itemBox.instanceInfo = instanceInfo;
    itemBox.bestItem = bestItem;
    itemBox.Update();
    //return;    
}

function bool Internal_OnDraw(Canvas C)
{
    local float Delta;

    itemBox.bVisible = self.bVisible;
    itemBox.AWinPos = self.RWinPos;
    // End:0x9A
    if(itemBox.CheckIn(float(int(Controller.MouseX)), float(int(Controller.MouseY)), 1.0000000, float(Controller.ResY) / 768.0000000))
    {
        itemBox.bMouseOn = true;        
    }
    else
    {
        itemBox.bMouseOn = false;
    }
    // End:0xC8
    if(bSelect)
    {
        itemBox.bFocused = true;        
    }
    else
    {
        itemBox.bFocused = false;
    }
    Delta = Controller.RenderDelta;
    // End:0x105
    if(Delta == float(0))
    {
        Delta = 0.0500000;
    }
    itemBox.Render(C, Delta);
    // End:0x237
    if(itemBox.ItemInfo == none)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, DefaultSlotImage, RWinPos.X1 + float(2), (RWinPos.Y1 + float(2)) + float(15), RWinPos.X2 - float(2), (RWinPos.Y2 - float(2)) - float(14));
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, DefaultSlotName[0], 0, 9.0000000, RWinPos.X1 + float(3), RWinPos.Y1 + float(3), RWinPos.X2, RWinPos.Y2);
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, DefaultSlotName[1], 4, 9.0000000, RWinPos.X1, RWinPos.Y1, RWinPos.X2, RWinPos.Y2);
    }
    return true;
    //return;    
}

defaultproperties
{
    DefaultSlotModulate=(W=1.0000000,X=1.0000000,Y=1.0000000,Z=1.0000000)
    OnDraw=BTAniItemBoxButtonHK.Internal_OnDraw
}