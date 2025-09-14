class BTWindowItemBoxHK extends BTWindowHK
    editinlinenew
    instanced;

var int BoxItemID;
var BtrDouble BoxUniqueID;
var int FromContent;
var() automated FloatBox fbTPItemList;
var export editinline BTTPItemListHK TPItemList;
var() automated FloatBox fbLabelDivider;
var export editinline BTOwnerDrawImageHK LabelDivider;
var() automated FloatBox fbInfoBox;
var export editinline BTItemInfoHorzBoxHK InfoBox;

function bool ImageListBox_OnClick(GUIComponent Sender)
{
    SelectItem(TPItemList.ItemList.SelectItemIndex);
    return false;
    //return;    
}

function bool SelectItem(int Index)
{
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    ItemList = TPItemList.ItemList;
    ItemInfo = BTROItemBoxHK(ItemList.DataList[Index]).ItemInfo;
    instanceInfo = BTROItemBoxHK(ItemList.DataList[Index]).instanceInfo;
    InfoBox.SetData(ItemInfo, instanceInfo, none, none);
    return true;
    //return;    
}

function SetFromContent(int _from)
{
    FromContent = _from;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local wMatchMaker MM;

    super.InitComponent(MyController, myOwner);
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    LabelDivider = NewLabelComponent(fbLabelDivider, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_divid_line);
    TPItemList = BTTPItemListHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPItemListHK', fbTPItemList));
    TPItemList.ItemList.ImageList.__OnClick__Delegate = ImageListBox_OnClick;
    TPItemList.MyData.myLevel = MM.kLevel;
    TPItemList.MyData.MyCash = 99999;
    TPItemList.MyData.MyPoint = 99999;
    TPItemList.ItemList.SetItemCountPerPage(3, 3);
    InfoBox = BTItemInfoHorzBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTItemInfoHorzBoxHK', fbInfoBox));
    InfoBox.Panel.BackgroundImage.Image = none;
    InfoBox.SetWindowItemBox();
    //return;    
}

function int GetLastSelectItemID()
{
    local BTROItemBoxHK Ro;

    Ro = TPItemList.ItemList.DataPool[TPItemList.ItemList.LastSelectedItemIndex];
    return Ro.ItemInfo.ItemID;
    //return;    
}

function int GetLastSelectPartID()
{
    local BTROItemBoxHK Ro;

    Ro = TPItemList.ItemList.DataPool[TPItemList.ItemList.LastSelectedItemIndex];
    return Ro.instanceInfo.Extra;
    //return;    
}

function AddItem(int ItemID, int PartID)
{
    local BTROItemBoxHK Ro;
    local wItemBoxInstanceHK instanceInfo;
    local wGameManager GameMgr;
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    Ro = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
    Ro.Init();
    instanceInfo = new Class'Engine.wItemBoxInstanceHK';
    // End:0xAA
    if(ItemID == 0)
    {
        // End:0xA5
        if(PartID != 0)
        {            
        }
        else
        {
            return;
        }        
    }
    else
    {
        Ro.ItemInfo = GameMgr.FindUIItem(ItemID);
        instanceInfo.ItemID = ItemID;
        instanceInfo.Extra = PartID;
        // End:0x175
        if((Ro.ItemInfo.CostType == 1) || Ro.ItemInfo.CostType == 4)
        {
            instanceInfo.LeftTime.Day = PartID / 24;
            instanceInfo.LeftTime.Hour = int(float(PartID) % float(24));            
        }
        else
        {
            // End:0x1DD
            if((Ro.ItemInfo.CostType == 0) || Ro.ItemInfo.CostType == 2)
            {
                instanceInfo.PartID = PartID;
                instanceInfo.Durability = 100000;                
            }
            else
            {
                // End:0x20F
                if(Ro.ItemInfo.CostType == 3)
                {
                    instanceInfo.OverlapCount = PartID;
                }
            }
        }
        // End:0x239
        if(GameMgr.FindFirstInstanceItemByItemID(ItemID) != none)
        {
            Ro.RibbonState = 1;
        }
        Ro.instanceInfo = instanceInfo;
    }
    Ro.ChangeState(12);
    Ro.MyData = TPItemList.MyData;
    Ro.SetGameManager(GameMgr);
    Ro.Update();
    Ro.CheckScrollItemName = true;
    TPItemList.ItemList.AddItem(Ro);
    TPItemList.ItemList.ShowItemAll();
    SelectItem(0);
    //return;    
}

defaultproperties
{
    fbTPItemList=(X1=267.0000000,Y1=161.0000000,X2=762.0000000,Y2=418.0000000)
    fbLabelDivider=(X1=267.0000000,Y1=422.0000000,X2=762.0000000,Y2=424.0000000)
    fbInfoBox=(X1=267.0000000,Y1=426.0000000,X2=762.0000000,Y2=596.0000000)
    fbBackgroundImage=(X1=242.0000000,Y1=110.0000000,X2=783.0000000,Y2=660.0000000)
    fbTopLine=(X1=262.0000000,Y1=130.0000000,X2=763.0000000,Y2=157.0000000)
    fbBottomLine=(X1=262.0000000,Y1=596.0000000,X2=763.0000000,Y2=640.0000000)
    fbButtonOK=(X1=391.0000000,Y1=602.0000000,X2=511.0000000,Y2=635.0000000)
    fbButtonCancel=(X1=515.0000000,Y1=602.0000000,X2=635.0000000,Y2=635.0000000)
    strTitle="Item Box"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    bUseChangeAlpha=true
}