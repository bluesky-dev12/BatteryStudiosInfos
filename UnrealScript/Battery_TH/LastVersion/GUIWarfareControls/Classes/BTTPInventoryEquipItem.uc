class BTTPInventoryEquipItem extends BTTabPanelHK
    editinlinenew
    instanced;

var() automated ButtonGroups InvenGroup;
var export editinline BTItemBoxButtonHK EquipItemSlot[8];
var() automated FloatBox fbEquipItemSlot[8];
var localized string strEquipItemSlot[8];
var BTTcpLink_Channel TcpChannel;
var bool bVisibleAFModel;
var localized string strAF;
var localized string strRSA;
var export editinline BTModelHK UIModel;
var BTROModelNew CharacterModel;
var export editinline BTOwnerDrawImageHK EdgeLine;
var export editinline BTOwnerDrawImageHK AFTeamBG;
var export editinline BTOwnerDrawImageHK RSATeamBG;
var export editinline BTOwnerDrawCaptionButtonHK ButtonAF;
var export editinline BTOwnerDrawCaptionButtonHK ButtonRSA;
var bool bLRMousePressed;
var export editinline BTOwnerDrawCaptionButtonHK ButtonLR;
var bool bRRMousePressed;
var export editinline BTOwnerDrawCaptionButtonHK ButtonRR;
var export editinline BTAutoScrollListHK ChatBox;
var int nOldMouseX;
var int nOffsetMouseDis;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0x135 [Loop If]
    if(i < 8)
    {
        EquipItemSlot[i] = new Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK';
        EquipItemSlot[i].bUseAWinPos = true;
        EquipItemSlot[i].AWinPos = fbEquipItemSlot[i];
        EquipItemSlot[i].DefaultSlotName[0] = strEquipItemSlot[i];
        EquipItemSlot[i].InitComponent(MyController, self);
        AppendComponent(EquipItemSlot[i]);
        EquipItemSlot[i].itemBox.ChangeState(19);
        EquipItemSlot[i].ButtonID = i;
        InvenGroup.AddButton(EquipItemSlot[i]);
        EquipItemSlot[i].__OnClick__Delegate = ButtonWeapon_OnClick;
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    EquipItemSlot[0].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_hlmt;
    EquipItemSlot[1].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_face;
    EquipItemSlot[2].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_BackPack;
    EquipItemSlot[3].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_clth_af;
    EquipItemSlot[4].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_clth_rsa;
    EquipItemSlot[5].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_class;
    EquipItemSlot[6].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_Pouch;
    EquipItemSlot[7].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_Camouflage;
    Initialize();
    //return;    
}

function Initialize()
{
    bVisibleAFModel = true;
    ButtonAF = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(11.0000000, 97.0000000, 114.0000000, 129.0000000), 0.8000000);
    ButtonAF.SetTabButtonFontColor();
    ButtonAF.bSelect = true;
    ButtonAF.bSelectHighlight = true;
    ButtonAF.SetMidTabButtonImage();
    ButtonAF.Caption = strAF;
    ButtonAF.__OnClick__Delegate = ButtonAF_OnClick;
    ButtonRSA = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(115.0000000, 97.0000000, 218.0000000, 129.0000000), 0.8000000);
    ButtonRSA.SetTabButtonFontColor();
    ButtonRSA.SetMidTabButtonImage();
    ButtonRSA.Caption = strRSA;
    ButtonRSA.__OnClick__Delegate = ButtonRSA_OnClick;
    ButtonLR = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(213.0000000, 599.0000000, 264.0000000, 630.0000000), 0.8000000);
    ButtonLR.SetDefaultLRotateButtonImage();
    ButtonLR.__OnMousePressed__Delegate = ButtonLR_OnPressed;
    ButtonLR.__OnMouseRelease__Delegate = ButtonLR_OnRelease;
    ButtonRR = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(11.0000000, 599.0000000, 62.0000000, 630.0000000), 0.8000000);
    ButtonRR.SetDefaultRRotateButtonImage();
    ButtonRR.__OnMousePressed__Delegate = ButtonRR_OnPressed;
    ButtonRR.__OnMouseRelease__Delegate = ButtonRR_OnRelease;
    ChatBox = new Class'GUIWarfareControls_Decompressed.BTAutoScrollListHK';
    ChatBox.bUseAWinPos = true;
    ChatBox.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(22.0000000, 666.0000000 + float(18), 324.0000000, 720.0000000);
    ChatBox.RenderWeight = 0.7100000;
    ChatBox.InitComponent(Controller, self);
    AppendComponent(ChatBox);
    ChatBox.MultiColumnList.MyScrollBar.AWinPos.X1 = 0.0000000;
    ChatBox.MultiColumnList.MyScrollBar.AWinPos.Y1 = 0.0000000;
    ChatBox.MultiColumnList.MyScrollBar.AWinPos.X2 = 0.0000000;
    ChatBox.MultiColumnList.MyScrollBar.AWinPos.Y2 = 0.0000000;
    ChatBox.MultiColumnList.MyScrollBar.ApplyAWinPos();
    ChatBox.DisableMe();
    CharacterModel = Controller.ViewportOwner.Actor.Level.Spawn(Class'GUIWarfareControls_Decompressed.BTROModelNew');
    CharacterModel.Init();
    CharacterModel.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(17.0000000, 117.0000000, 330.0000000, 500.0000000);
    CharacterModel.cameraPos.X = -340.0000000;
    CharacterModel.cameraPos.Y = 15.0000000;
    CharacterModel.cameraPos.Z = 2.5000000;
    UIModel = new Class'GUIWarfareControls_Decompressed.BTModelHK';
    UIModel.bUseAWinPos = true;
    UIModel.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(5.0000000, 147.0000000, 324.0000000, 620.0000000);
    UIModel.RenderWeight = 1.0000000;
    UIModel.InitComponent(Controller, self);
    AppendComponent(UIModel);
    // End:0x4E1
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        UIModel.bAcceptsInput = true;
    }
    //return;    
}

function bool ButtonWeapon_OnClick(GUIComponent Sender)
{
    local export editinline BTItemBoxButtonHK btn;

    btn = BTItemBoxButtonHK(Sender);
    ChatBox.FocusFirst(none);
    UnequipItem(btn.ButtonID);
    return true;
    //return;    
}

function ButtonLR_OnPressed(GUIComponent Sender, bool bRepeat)
{
    bLRMousePressed = true;
    //return;    
}

function ButtonLR_OnRelease(GUIComponent Sender)
{
    bLRMousePressed = false;
    //return;    
}

function ButtonRR_OnPressed(GUIComponent Sender, bool bRepeat)
{
    bRRMousePressed = true;
    //return;    
}

function ButtonRR_OnRelease(GUIComponent Sender)
{
    bRRMousePressed = false;
    //return;    
}

function UnequipItem(int ButtonID)
{
    local export editinline BTItemBoxButtonHK ib;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ib = EquipItemSlot[ButtonID];
    // End:0x11A
    if(ib.itemBox.instanceInfo != none)
    {
        // End:0xC9
        if((ib.itemBox.ItemInfo.ItemID == GameMgr.GetMainWeaponID()) || ib.itemBox.ItemInfo.ItemID == GameMgr.GetSubWeaponID())
        {
            return;
        }
        TcpChannel.sfReqEquipItem(ib.itemBox.instanceInfo.ItemID, ib.itemBox.instanceInfo.UniqueID, 13);
    }
    //return;    
}

function bool Internal_OnPreDraw(Canvas C)
{
    // End:0x1F
    if(CharacterModel != none)
    {
        UIModel.cModel = CharacterModel;
    }
    // End:0x3A
    if(bLRMousePressed)
    {
        CharacterModel.SetRotationLeft();        
    }
    else
    {
        // End:0x52
        if(bRRMousePressed)
        {
            CharacterModel.SetRotationRight();
        }
    }
    CharRotByDrag();
    return false;
    //return;    
}

function CharRotByDrag()
{
    local int i;

    // End:0x5F
    if((Controller.MouseX < UIModel.AWinPos.X1) || Controller.MouseX > UIModel.AWinPos.X2)
    {
        UIModel.bLMouseDn = false;
    }
    // End:0xBE
    if((Controller.MouseY < UIModel.AWinPos.Y1) || Controller.MouseY > UIModel.AWinPos.Y2)
    {
        UIModel.bLMouseDn = false;
    }
    UIModel.bAcceptsInput = true;
    // End:0x117
    if(ButtonLR.IsInBounds() || ButtonRR.IsInBounds())
    {
        UIModel.bLMouseDn = false;
        UIModel.bAcceptsInput = false;
    }
    i = 0;
    J0x11E:

    // End:0x1A0 [Loop If]
    if(i < 8)
    {
        // End:0x196
        if(((EquipItemSlot[i] != none) && EquipItemSlot[i].Controller != none) && EquipItemSlot[i].IsInBounds())
        {
            UIModel.bLMouseDn = false;
            UIModel.bAcceptsInput = false;
            // [Explicit Break]
            goto J0x1A0;
        }
        i++;
        // [Loop Continue]
        goto J0x11E;
    }
    J0x1A0:

    // End:0x1EF
    if(UIModel.bLMouseDn)
    {
        nOffsetMouseDis = int(float(nOldMouseX) - Controller.MouseX);
        CharacterModel.PawnRot.Yaw += (nOffsetMouseDis * 100);
    }
    nOldMouseX = int(Controller.MouseX);
    //return;    
}

function bool ButtonAF_OnClick(GUIComponent Sender)
{
    CharacterModel.ChangeTeam(0);
    ButtonAF.bSelect = true;
    ButtonAF.bSelectHighlight = true;
    ButtonRSA.bSelect = false;
    ButtonRSA.bSelectHighlight = false;
    return true;
    //return;    
}

function bool ButtonRSA_OnClick(GUIComponent Sender)
{
    CharacterModel.ChangeTeam(1);
    ButtonRSA.bSelect = true;
    ButtonRSA.bSelectHighlight = true;
    ButtonAF.bSelect = false;
    ButtonAF.bSelectHighlight = false;
    return true;
    //return;    
}

function Refresh()
{
    local wGameManager GameMgr;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local int i;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    i = 18;
    J0x37:

    // End:0xE9 [Loop If]
    if(i < 26)
    {
        instanceInfo = none;
        ItemInfo = none;
        instanceInfo = GameMgr.FindInstanceItemBySlotPos(i);
        // End:0xDF
        if(instanceInfo != none)
        {
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            // End:0xDF
            if((ItemInfo != none) && int(ItemInfo.byModeItem) == 0)
            {
                EquipItemSlot[i - 18].SetData(ItemInfo, instanceInfo);
            }
        }
        i++;
        // [Loop Continue]
        goto J0x37;
    }
    //return;    
}

defaultproperties
{
    // Reference: ButtonGroups'GUIWarfareControls_Decompressed.BTTPInventoryEquipItem.mgroups'
    begin object name="mgroups" class=GUIWarfareControls_Decompressed.ButtonGroups
    end object
    InvenGroup=mgroups
    fbEquipItemSlot[0]=(X1=227.0000000,Y1=138.0000000,X2=303.0000000,Y2=223.0000000)
    fbEquipItemSlot[1]=(X1=227.0000000,Y1=227.0000000,X2=303.0000000,Y2=312.0000000)
    fbEquipItemSlot[2]=(X1=227.0000000,Y1=316.0000000,X2=303.0000000,Y2=401.0000000)
    fbEquipItemSlot[3]=(X1=28.0000000,Y1=642.0000000,X2=104.0000000,Y2=727.0000000)
    fbEquipItemSlot[4]=(X1=108.0000000,Y1=642.0000000,X2=184.0000000,Y2=727.0000000)
    fbEquipItemSlot[5]=(X1=227.0000000,Y1=642.0000000,X2=303.0000000,Y2=727.0000000)
    fbEquipItemSlot[6]=(X1=227.0000000,Y1=405.0000000,X2=303.0000000,Y2=490.0000000)
    fbEquipItemSlot[7]=(X1=227.0000000,Y1=494.0000000,X2=303.0000000,Y2=579.0000000)
    strEquipItemSlot[0]="???????????"
    strEquipItemSlot[1]="??????"
    strEquipItemSlot[2]="Backpack"
    strEquipItemSlot[3]="AF character"
    strEquipItemSlot[4]="RSA character"
    strEquipItemSlot[5]="??"
    strEquipItemSlot[6]="Pouch"
    strEquipItemSlot[7]="Pattern ?????"
    strAF="AF"
    strRSA="RSA"
    OnPreDraw=BTTPInventoryEquipItem.Internal_OnPreDraw
}