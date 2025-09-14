class BTComboCapsuleData extends GUIMultiComponent
    editinlinenew
    instanced;

var wGameManager GameMgr;
var wMatchMaker MM;
var export editinline BTOwnerDrawImageHK BackgroundComboBoxCapsule;
var export editinline BTComboBoxHK ComboBoxCapsule;
var wItemBoxHK CurrentItemInfo;
var array<int> CapsuleIDList;
var bool CapsuleFillEnd;
var localized string strCapsuleCount;
//var delegate<ChangeComboBox> __ChangeComboBox__Delegate;

delegate ChangeComboBox()
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    BackgroundComboBoxCapsule = BTOwnerDrawImageHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.5000000, self));
    BackgroundComboBoxCapsule.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Combo_New_Back_Blur;
    ComboBoxCapsule = BTComboBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 2.0000000));
    ComboBoxCapsule.FontDrawType = 4;
    ComboBoxCapsule.__OnChange__Delegate = OnChange_ComboBoxCapsule;
    //return;    
}

function InitItemData(bool inCapsuleItem)
{
    local wItemBoxInstanceHK instanceInfo;
    local int i;
    local wItemBoxHK ItemInfo;

    CapsuleFillEnd = false;
    CapsuleIDList.Length = 0;
    ComboBoxCapsule.ComboBox.Clear();
    i = 0;
    J0x2F:

    // End:0x1C9 [Loop If]
    if(i < GameMgr.InstanceItemLists.Length)
    {
        instanceInfo = GameMgr.InstanceItemLists[i];
        ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
        // End:0x1BF
        if(ItemInfo != none)
        {
            // End:0x128
            if(inCapsuleItem && ItemInfo.ItemType == int(GameMgr.37))
            {
                CapsuleIDList[CapsuleIDList.Length] = ItemInfo.ItemID;
                ComboBoxCapsule.ComboBox.AddItem(Class'Engine.BTCustomDrawHK'.static.FormatString(strCapsuleCount, ItemInfo.ItemName, string(instanceInfo.OverlapCount)), instanceInfo);
                // [Explicit Continue]
                goto J0x1BF;
            }
            // End:0x1BF
            if(!inCapsuleItem && ItemInfo.ItemType == int(GameMgr.38))
            {
                CapsuleIDList[CapsuleIDList.Length] = ItemInfo.ItemID;
                ComboBoxCapsule.ComboBox.AddItem(Class'Engine.BTCustomDrawHK'.static.FormatString(strCapsuleCount, ItemInfo.ItemName, string(instanceInfo.OverlapCount)), instanceInfo);
            }
        }
        J0x1BF:

        ++i;
        // [Loop Continue]
        goto J0x2F;
    }
    CapsuleFillEnd = true;
    //return;    
}

function SetSize(FloatBox fbComboBackground, FloatBox fbComboBox)
{
    BackgroundComboBoxCapsule.AWinPos = fbComboBackground;
    ComboBoxCapsule.AWinPos = fbComboBox;
    BackgroundComboBoxCapsule.ApplyAWinPos();
    ComboBoxCapsule.ApplyAWinPos();
    //return;    
}

function SetInitItemCount(wItemBoxHK _itemInfo, int _capsuleCount)
{
    local int i;
    local wItemBoxInstanceHK instanceInfo;

    i = 0;
    J0x07:

    // End:0xF8 [Loop If]
    if(i < CapsuleIDList.Length)
    {
        // End:0xEE
        if(_itemInfo.ItemID == CapsuleIDList[i])
        {
            instanceInfo = wItemBoxInstanceHK(ComboBoxCapsule.ComboBox.GetItemObject(i));
            instanceInfo.OverlapCount = _capsuleCount;
            ComboBoxCapsule.ComboBox.List.Replace(i, Class'Engine.BTCustomDrawHK'.static.FormatString(strCapsuleCount, _itemInfo.ItemName, string(instanceInfo.OverlapCount)), instanceInfo);
            ComboBoxCapsule.ComboBox.SetIndex(i);
            // [Explicit Break]
            goto J0xF8;
        }
        ++i;
        // [Loop Continue]
        goto J0x07;
    }
    J0xF8:

    //return;    
}

function OnChange_ComboBoxCapsule(GUIComponent Sender)
{
    local wItemBoxInstanceHK instanceInfo;
    local wItemBoxHK ItemInfo;

    // End:0x4D
    if(CapsuleFillEnd)
    {
        instanceInfo = GetCurrentSelectedInstance();
        ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
        CurrentItemInfo = ItemInfo;
        ChangeComboBox();
    }
    //return;    
}

function wItemBoxInstanceHK GetCurrentSelectedInstance()
{
    local wItemBoxInstanceHK instanceInfo;

    instanceInfo = wItemBoxInstanceHK(ComboBoxCapsule.ComboBox.GetObject());
    return instanceInfo;
    //return;    
}

defaultproperties
{
    strCapsuleCount="%0 (%1 ?????)"
}