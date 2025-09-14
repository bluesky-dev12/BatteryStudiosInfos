class BTWindowDefenceReward extends BTWindowHK
    editinlinenew
    instanced;

const DIFFICULT_COUNT = 4;

var FloatBox fbDifficultTabButtons[4];
var export editinline BTOwnerDrawCaptionButtonHK DifficultTabButtons[4];
var FloatBox fbRewardTabButtons[5];
var export editinline BTOwnerDrawCaptionButtonHK RewardTabButtons[5];
var() automated FloatBox fbTPItemList;
var export editinline BTTPItemListHK TPItemList;
var localized string strBotDifficulty[4];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local wMatchMaker MM;

    super.InitComponent(MyController, myOwner);
    MM = PlayerOwner().Level.GetMatchMaker();
    BackgroundImage.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Popup_Defence_Reward;
    TopLine.BackgroundImage.Image = none;
    TopLine.CaptionDrawType = 4;
    TopLine.SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite());
    TPItemList = BTTPItemListHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPItemListHK', fbTPItemList));
    TPItemList.MyData.myLevel = MM.kLevel;
    TPItemList.ItemList.SetItemCountPerPage(2, 3);
    TPItemList.ItemList.SetItemSize(169, 86);
    TPItemList.ItemList.bSortAdd = false;
    i = 0;
    J0x12B:

    // End:0x276 [Loop If]
    if(i < 4)
    {
        DifficultTabButtons[i] = NewButtonComponent(fbDifficultTabButtons[i]);
        DifficultTabButtons[i].SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.newButtonPressed());
        DifficultTabButtons[i].CaptionDrawType = 4;
        DifficultTabButtons[i].Caption = strBotDifficulty[i];
        DifficultTabButtons[i].ButtonID = i;
        DifficultTabButtons[i].CaptionPadding[1] = 2;
        DifficultTabButtons[i].SetMidTabButtonImage();
        DifficultTabButtons[i].SetDefaultTabButtonFontColor();
        DifficultTabButtons[i].__OnClick__Delegate = InternalOnClick_Difficult;
        DifficultTabButtons[i].__OnKeyEvent__Delegate = None;
        DifficultTabButtons[i].CaptionScroll = true;
        DifficultTabButtons[i].EnableMe();
        ++i;
        // [Loop Continue]
        goto J0x12B;
    }
    i = 0;
    J0x27D:

    // End:0x38E [Loop If]
    if(i < 5)
    {
        RewardTabButtons[i] = NewButtonComponent(fbRewardTabButtons[i]);
        RewardTabButtons[i].SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.newButtonPressed());
        RewardTabButtons[i].CaptionDrawType = 4;
        RewardTabButtons[i].CaptionPadding[1] = 2;
        RewardTabButtons[i].SetMidTabButtonImage();
        RewardTabButtons[i].SetDefaultTabButtonFontColor();
        RewardTabButtons[i].__OnClick__Delegate = InternalOnClick;
        RewardTabButtons[i].__OnKeyEvent__Delegate = None;
        RewardTabButtons[i].CaptionScroll = true;
        RewardTabButtons[i].Hide();
        ++i;
        // [Loop Continue]
        goto J0x27D;
    }
    ButtonOK.__OnKeyEvent__Delegate = None;
    ButtonCancel.DisableMe();
    //return;    
}

event Opened(GUIComponent Sender)
{
    super.Opened(Sender);
    DesiredFade = byte(255);
    //return;    
}

function FadeOut(optional bool bTranslate, optional bool bChangeAlpha)
{
    super(PopupPageBase).FadeOut(bTranslate, bChangeAlpha);
    StartFade = byte(255);
    //return;    
}

function InitializeReward(int difficult)
{
    local int i, k, ButtonCount;
    local wItemBoxHK ItemInfo;
    local wDefenceRewardParam tempParam;
    local bool added;
    local wGameManager GameMgr;

    GameMgr = PlayerOwner().Level.GameMgr;
    i = 0;
    J0x22:

    // End:0x63 [Loop If]
    if(i < 5)
    {
        RewardTabButtons[i].ButtonID = 0;
        RewardTabButtons[i].Hide();
        ++i;
        // [Loop Continue]
        goto J0x22;
    }
    i = 0;
    J0x6A:

    // End:0x1A9 [Loop If]
    if(i < GameMgr.DefenceRewardParams.Length)
    {
        tempParam = GameMgr.DefenceRewardParams[i];
        // End:0x19F
        if(int(tempParam.nDifficulty) == difficult)
        {
            added = false;
            k = 0;
            J0xC6:

            // End:0x10E [Loop If]
            if(k < 5)
            {
                // End:0x104
                if(RewardTabButtons[k].ButtonID == tempParam.nRewardItemID)
                {
                    added = true;
                    // [Explicit Break]
                    goto J0x10E;
                }
                ++k;
                // [Loop Continue]
                goto J0xC6;
            }
            J0x10E:

            // End:0x11A
            if(added)
            {
                // [Explicit Continue]
                goto J0x19F;
            }
            ItemInfo = GameMgr.FindUIItem(tempParam.nRewardItemID);
            RewardTabButtons[ButtonCount].Show();
            RewardTabButtons[ButtonCount].ButtonID = tempParam.nRewardItemID;
            RewardTabButtons[ButtonCount].Caption = ItemInfo.ItemName;
            ++ButtonCount;
        }
        J0x19F:

        i++;
        // [Loop Continue]
        goto J0x6A;
    }
    DifficultTabButtons[difficult - 1].DisableMe();
    InternalOnClick(RewardTabButtons[0]);
    //return;    
}

private function AddIncludeItem(int ItemID, int PartID, array<int> BestItemIDs)
{
    local BTROItemBoxHK Ro;
    local wItemBoxInstanceHK instanceInfo;
    local wGameManager GameMgr;
    local int i;
    local bool bBestItem;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    Ro = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
    Ro.Init();
    instanceInfo = new Class'Engine.wItemBoxInstanceHK';
    Ro.CheckScrollItemName = true;
    // End:0x8B
    if(ItemID == 0)
    {
        // End:0x86
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
        instanceInfo.SetExtraValue(Ro.ItemInfo, PartID);
        bBestItem = false;
        i = 0;
        J0x107:

        // End:0x141 [Loop If]
        if(i < BestItemIDs.Length)
        {
            // End:0x137
            if(ItemID == BestItemIDs[i])
            {
                bBestItem = true;
                // [Explicit Break]
                goto J0x141;
            }
            ++i;
            // [Loop Continue]
            goto J0x107;
        }
        J0x141:

        // End:0x15E
        if(bBestItem)
        {
            Ro.RibbonState = 5;            
        }
        else
        {
            // End:0x188
            if(GameMgr.FindFirstInstanceItemByItemID(ItemID) != none)
            {
                Ro.RibbonState = 1;
            }
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
    //return;    
}

function bool InternalOnClick_Difficult(GUIComponent Sender)
{
    local int i;
    local export editinline BTOwnerDrawCaptionButtonHK clickedButton;

    clickedButton = BTOwnerDrawCaptionButtonHK(Sender);
    i = 0;
    J0x17:

    // End:0x42 [Loop If]
    if(i < 4)
    {
        DifficultTabButtons[i].EnableMe();
        ++i;
        // [Loop Continue]
        goto J0x17;
    }
    DifficultTabButtons[clickedButton.ButtonID].DisableMe();
    InitializeReward(clickedButton.ButtonID + 1);
    return true;
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK clickedButton;
    local int i, k, RewardItemID, randBoxCount, itemBoxCount;

    local array<int> ItemIDs, PartIDs, BestItemIDs;
    local wItemBoxHK ItemInfo;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    i = 0;
    J0x36:

    // End:0x8E [Loop If]
    if(i < 5)
    {
        // End:0x6F
        if(RewardTabButtons[i] == Sender)
        {
            RewardTabButtons[i].DisableMe();
            // [Explicit Continue]
            goto J0x84;
        }
        RewardTabButtons[i].EnableMe();
        J0x84:

        ++i;
        // [Loop Continue]
        goto J0x36;
    }
    clickedButton = BTOwnerDrawCaptionButtonHK(Sender);
    RewardItemID = clickedButton.ButtonID;
    TPItemList.ItemList.ClearItem();
    ItemInfo = GameMgr.FindUIItem(RewardItemID);
    // End:0x1D0
    if(GameMgr.CheckRandBoxItem(ItemInfo.ItemType) || GameMgr.CheckCapsuleItem(ItemInfo.ItemType))
    {
        randBoxCount = GameMgr.GetRandBoxItemsCount(RewardItemID);
        i = 0;
        J0x147:

        // End:0x1CD [Loop If]
        if(i < randBoxCount)
        {
            GameMgr.GetRandBoxItems(RewardItemID, i + 1, ItemIDs, PartIDs, BestItemIDs);
            k = 0;
            J0x188:

            // End:0x1C3 [Loop If]
            if(k < ItemIDs.Length)
            {
                AddIncludeItem(ItemIDs[k], PartIDs[k], BestItemIDs);
                k++;
                // [Loop Continue]
                goto J0x188;
            }
            i++;
            // [Loop Continue]
            goto J0x147;
        }        
    }
    else
    {
        // End:0x29A
        if(GameMgr.CheckItemBox(ItemInfo.ItemType))
        {
            itemBoxCount = GameMgr.GetItemBoxItemsCount(RewardItemID);
            i = 0;
            J0x211:

            // End:0x297 [Loop If]
            if(i < itemBoxCount)
            {
                GameMgr.GetItemBoxItems(RewardItemID, i + 1, ItemIDs, PartIDs, BestItemIDs);
                k = 0;
                J0x252:

                // End:0x28D [Loop If]
                if(k < ItemIDs.Length)
                {
                    AddIncludeItem(ItemIDs[k], PartIDs[k], BestItemIDs);
                    k++;
                    // [Loop Continue]
                    goto J0x252;
                }
                i++;
                // [Loop Continue]
                goto J0x211;
            }            
        }
        else
        {
            BestItemIDs.Length = 0;
            AddIncludeItem(RewardItemID, 0, BestItemIDs);
        }
    }
    return true;
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    return false;
    //return;    
}

defaultproperties
{
    fbDifficultTabButtons[0]=(X1=113.0000000,Y1=400.0000000,X2=216.0000000,Y2=432.0000000)
    fbDifficultTabButtons[1]=(X1=217.0000000,Y1=400.0000000,X2=320.0000000,Y2=432.0000000)
    fbDifficultTabButtons[2]=(X1=321.0000000,Y1=400.0000000,X2=424.0000000,Y2=432.0000000)
    fbDifficultTabButtons[3]=(X1=425.0000000,Y1=400.0000000,X2=528.0000000,Y2=432.0000000)
    fbRewardTabButtons[0]=(X1=113.0000000,Y1=432.0000000,X2=216.0000000,Y2=464.0000000)
    fbRewardTabButtons[1]=(X1=217.0000000,Y1=432.0000000,X2=320.0000000,Y2=464.0000000)
    fbRewardTabButtons[2]=(X1=321.0000000,Y1=432.0000000,X2=424.0000000,Y2=464.0000000)
    fbRewardTabButtons[3]=(X1=425.0000000,Y1=432.0000000,X2=528.0000000,Y2=464.0000000)
    fbRewardTabButtons[4]=(X1=529.0000000,Y1=432.0000000,X2=632.0000000,Y2=464.0000000)
    fbTPItemList=(X1=116.0000000,Y1=471.0000000,X2=635.0000000,Y2=645.0000000)
    strBotDifficulty[0]="Easy"
    strBotDifficulty[1]="Normal"
    strBotDifficulty[2]="Hard"
    strBotDifficulty[3]="Very Hard"
    fbBackgroundImage=(X1=38.0000000,Y1=361.0000000,X2=707.0000000,Y2=705.0000000)
    fbTopLine=(X1=263.0000000,Y1=367.0000000,X2=481.0000000,Y2=382.0000000)
    fbButtonOK=(X1=310.0000000,Y1=658.0000000,X2=434.0000000,Y2=695.0000000)
    strTitle="Defense Mode Rewards"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    bUseChangeAlpha=true
    bCaptureInput=false
    bAcceptsInput=false
}