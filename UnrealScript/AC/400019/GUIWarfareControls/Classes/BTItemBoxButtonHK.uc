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
    itemBox = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
    itemBox.Init();
    itemBox.CheckScrollItemName = true;
    itemBox.SetMatchMaker(PlayerOwner().Level.GetMatchMaker());
    itemBox.SetGameManager(PlayerOwner().Level.GameMgr);
    OnClickSound = 9;
    //return;    
}

function SetData(wItemBoxHK ItemInfo, wItemBoxInstanceHK instanceInfo)
{
    itemBox.ItemInfo = ItemInfo;
    itemBox.instanceInfo = instanceInfo;
    itemBox.Update();
    //return;    
}

function bool Internal_OnDraw(Canvas C)
{
    local Plane CanvasModulateValue;

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
    itemBox.Render(C, Controller.RenderDelta);
    // End:0x238
    if(itemBox.ItemInfo == none)
    {
        CanvasModulateValue = C.ColorModulate;
        C.ColorModulate = DefaultSlotModulate;
        Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, DefaultSlotImage, RWinPos.X1, RWinPos.Y1, RWinPos.X2, RWinPos.Y2);
        C.ColorModulate = CanvasModulateValue;
        Class'Engine.BTCustomDrawHK'.static.DrawStringRatio(C, DefaultSlotName[0], 0, 9.0000000, (RWinPos.X1 + float(3)) + float(2), (RWinPos.Y1 + float(3)) + float(2), RWinPos.X2, RWinPos.Y2);
        Class'Engine.BTCustomDrawHK'.static.DrawStringRatio(C, DefaultSlotName[1], 4, 9.0000000, RWinPos.X1, RWinPos.Y1, RWinPos.X2, RWinPos.Y2);
    }
    return true;
    //return;    
}

defaultproperties
{
    DefaultSlotModulate=(W=1.0000000,X=1.0000000,Y=1.0000000,Z=1.0000000)
    CaptionPadding[1]=4
    OnDraw=BTItemBoxButtonHK.Internal_OnDraw
}