class BTWindowRepairItem extends BTWindow
    editinlinenew
    instanced;

var() automated GUIButton ButtonOK;
var() automated GUIButton ButtonCancel;
var() automated BTTailImage ButtonTail[2];
var() automated BTInputImage ImgTitleBG;
var() automated FloatingImage ImgTitleString;
var() automated FloatingImage ImgWnd_BG;
var() automated FloatingImage ImgWnd_Line;
var() automated FloatingImage ImgPointString;
var() automated FloatingImage ImgItem_BG[2];
var() automated FloatingImage ImgItem;
var() automated FloatingImage ImgItem_Parts[2];
var() automated BTInputImage ImgPointBG[3];
var() automated GUILabel LabelStrings[3];
var() automated GUILabel LabelPoints[3];
var() automated GUILabel LabelItemName;
var localized string CapButton_Repair;
var localized string CapButton_Cancel;
var localized string CapLabel_RepairPoint;
var localized string CapLabel_MyPoint;
var localized string CapLabel_RemainPoint;
var BtrDouble ItemUniqueID;
var int ItemID;
var int PartsGroupID;
var int RepairPoint;
//var delegate<OnOK> __OnOK__Delegate;

delegate bool OnOK(GUIComponent Sender)
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(FloatingWindow).InitComponent(MyController, myOwner);
    ButtonOK.Caption = CapButton_Repair;
    ButtonCancel.Caption = CapButton_Cancel;
    LabelStrings[0].Caption = CapLabel_RepairPoint;
    LabelStrings[1].Caption = CapLabel_MyPoint;
    LabelStrings[2].Caption = CapLabel_RemainPoint;
    //return;    
}

function SetItemIDs(BtrDouble iItemUniqueID, int iItemID, int iPartsGroupID, int iRepairPoint)
{
    ItemUniqueID = iItemUniqueID;
    ItemID = iItemID;
    PartsGroupID = iPartsGroupID;
    RepairPoint = iRepairPoint;
    ResetComponents();
    InitComponentbyItem();
    //return;    
}

function ResetComponents()
{
    ImgItem.Image = none;
    ImgItem_Parts[0].Image = none;
    ImgItem_Parts[1].Image = none;
    LabelItemName.Caption = "";
    LabelPoints[0].Caption = "0";
    LabelPoints[1].Caption = "0";
    LabelPoints[2].Caption = "0";
    //return;    
}

function InitComponentbyItem()
{
    local wGameManager GameMgr;
    local wMyPlayerStatus MyStatus;
    local wItemResourceParam resParam;
    local wPartsGroupParam PartsParam;
    local int iTemp;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    resParam = Controller.ViewportOwner.Actor.Level.GameMgr.GetItemResourceParam(ItemID);
    ImgItem.Image = Texture(DynamicLoadObject(resParam.strRes_Icon, Class'Engine.Texture'));
    // End:0xFA
    if(PartsGroupID <= 0)
    {
        PartsParam = GameMgr.GetDefaultAddPartsGroupParam(ItemID);        
    }
    else
    {
        PartsParam = GameMgr.GetAddPartsGroupParam(PartsGroupID);
    }
    ImgItem_Parts[0].Image = none;
    ImgItem_Parts[1].Image = none;
    // End:0x1D1
    if(PartsParam.iSightID > 0)
    {
        resParam = GameMgr.GetItemResourceParam(PartsParam.iSightID);
        // End:0x1D1
        if((resParam.strRes_Icon != "") && resParam.strRes_Icon != "-")
        {
            ImgItem_Parts[iTemp++].Image = Texture(DynamicLoadObject(resParam.strRes_Icon, Class'Engine.Texture'));
        }
    }
    // End:0x26A
    if(PartsParam.iSilencerID > 0)
    {
        resParam = GameMgr.GetItemResourceParam(PartsParam.iSilencerID);
        // End:0x26A
        if((resParam.strRes_Icon != "") && resParam.strRes_Icon != "-")
        {
            ImgItem_Parts[iTemp++].Image = Texture(DynamicLoadObject(resParam.strRes_Icon, Class'Engine.Texture'));
        }
    }
    LabelItemName.Caption = resParam.strResName;
    LabelPoints[0].Caption = string(RepairPoint);
    LabelPoints[1].Caption = string(MyStatus.Point);
    LabelPoints[2].Caption = string(MyStatus.Point - RepairPoint);
    //return;    
}

event Opened(GUIComponent Sender)
{
    super.Opened(Sender);
    FocusFirst(none);
    //return;    
}

function Closed(GUIComponent Sender, bool bCancelled)
{
    super.Closed(Sender, bCancelled);
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    return false;
    //return;    
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    super(FloatingWindow).InternalOnCreateComponent(NewComp, Sender);
    //return;    
}

function bool ButtonOK_OnClick(GUIComponent Sender)
{
    return OnOK(self);
    //return;    
}

function bool ButtonCancel_OnClick(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    return true;
    //return;    
}

defaultproperties
{
    CapButton_Repair="??"
    CapButton_Cancel="??"
    CapLabel_RepairPoint="?? ??"
    CapLabel_MyPoint="?? ??"
    CapLabel_RemainPoint="??"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bMoveAllowed=false
    DefaultLeft=0.3398438
    DefaultTop=0.3059896
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    bAllowedAsLast=true
    InactiveFadeColor=(R=60,G=60,B=60,A=255)
    WinTop=0.3059896
    WinLeft=0.3398438
    WinWidth=0.3203125
    WinHeight=0.3919271
}