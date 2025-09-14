class BTItemBoxButtonHK extends BTOwnerDrawCaptionButtonHK
    editinlinenew
    instanced;

const TOTAL_EFFECT_TIME = 2;

var BTROItemBoxHK itemBox;
var int DefaultSlotItemID;
var BtrDouble DefaultSlotUniqueID;
var string DefaultSlotName[3];
var Plane DefaultSlotModulate;
var Image DefaultSlotImage;
var int SlotName3Padding[4];
var FloatBox fbExtraString;
var Text ExtraString;
var float EffectCalcTime;
var Image DefaultSlotImageEffect;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    itemBox = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
    itemBox.Init();
    itemBox.CheckScrollItemName = true;
    itemBox.SetMatchMaker(PlayerOwner().Level.GetMatchMaker());
    itemBox.SetGameManager(PlayerOwner().Level.GameMgr);
    OnClickSound = 9;
    ExtraString = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 8, "");
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
    local Color prevDrawColor;
    local float lerpValue, GapTime;
    local int prevImgAlpha, effectAlpha;

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
    // End:0x3F9
    if(itemBox.ItemInfo == none)
    {
        CanvasModulateValue = C.ColorModulate;
        C.ColorModulate = DefaultSlotModulate;
        Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, DefaultSlotImage, RWinPos.X1, RWinPos.Y1, RWinPos.X2, RWinPos.Y2);
        C.ColorModulate = CanvasModulateValue;
        // End:0x28E
        if(DefaultSlotImageEffect.Image != none)
        {
            EffectCalcTime += Controller.RenderDelta;
            // End:0x1F5
            if(EffectCalcTime < float(2))
            {
                lerpValue = Sin(3.1415927 * (EffectCalcTime / float(2)));
                effectAlpha = int(Lerp(lerpValue, 128.0000000, 0.0000000));                
            }
            else
            {
                EffectCalcTime = 0.0000000;
                effectAlpha = 128;
            }
            prevImgAlpha = int(DefaultSlotImageEffect.DrawColor.A);
            DefaultSlotImageEffect.DrawColor.A = byte(effectAlpha);
            Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, DefaultSlotImageEffect, RWinPos.X1, RWinPos.Y1, RWinPos.X2, RWinPos.Y2);
            DefaultSlotImageEffect.DrawColor.A = byte(prevImgAlpha);
        }
        prevDrawColor = C.DrawColor;
        C.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite();
        Class'Engine.BTCustomDrawHK'.static.DrawStringRatio(C, DefaultSlotName[0], 0, 9.0000000, (RWinPos.X1 + float(3)) + float(2), (RWinPos.Y1 + float(3)) + float(2), RWinPos.X2, RWinPos.Y2);
        Class'Engine.BTCustomDrawHK'.static.DrawStringRatio(C, DefaultSlotName[1], 4, 9.0000000, RWinPos.X1, RWinPos.Y1, RWinPos.X2, RWinPos.Y2);
        Class'Engine.BTCustomDrawHK'.static.DrawStringRatio(C, DefaultSlotName[2], 1, 9.0000000, RWinPos.X1 + float(SlotName3Padding[0]), RWinPos.Y1 + float(SlotName3Padding[1]), RWinPos.X2 + float(SlotName3Padding[2]), RWinPos.Y2 + float(SlotName3Padding[3]));
        C.DrawColor = prevDrawColor;
    }
    // End:0x47B
    if(ExtraString.Text != "")
    {
        Class'Engine.BTCustomDrawHK'.static.DrawText(C, ExtraString, AWinPos.X1 + fbExtraString.X1, AWinPos.Y1 + fbExtraString.Y1, AWinPos.X2 + fbExtraString.X2, AWinPos.Y2 + fbExtraString.Y2);
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