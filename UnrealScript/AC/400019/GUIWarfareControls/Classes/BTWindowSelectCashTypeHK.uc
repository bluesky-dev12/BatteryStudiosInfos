class BTWindowSelectCashTypeHK extends BTWindowSelectHK
    editinlinenew
    instanced;

var() automated BTOwnerDrawCaptionButtonHK ButtonPCash;
var FloatBox fbButtonPCash;
var localized string strCaption;
var localized string strCCoin;
var localized string strPCoin;
var BTROItemBoxHK roItemBox;
var int selectBuyType;
var byte selectCashType;
//var delegate<SelectCoin> __SelectCoin__Delegate;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    ButtonPCash = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    ButtonPCash.bUseAWinPos = true;
    ButtonPCash.SetDefaultButtonImage();
    ButtonPCash.SetDefaultFontColor();
    ButtonPCash.SetFontSizeAll(11);
    ButtonPCash.CaptionDrawType = 4;
    ButtonPCash.Caption = strPCoin;
    ButtonPCash.__OnClick__Delegate = ButtonPCoin_OnClick;
    ButtonPCash.OnClickSound = 0;
    ButtonPCash.InitComponent(MyController, self);
    AppendComponent(ButtonPCash);
    super.InitComponent(MyController, myOwner);
    //return;    
}

function SetDataCash(BTROItemBoxHK Ro, int _selectBuyType)
{
    roItemBox = Ro;
    ButtonPCash.SetEnabled(Ro.instanceInfo.cashItemInfo.EnablePCoin);
    // End:0x59
    if(_selectBuyType == 1)
    {
        ButtonOK.SetEnabled(false);        
    }
    else
    {
        ButtonOK.SetEnabled(Ro.instanceInfo.cashItemInfo.EnableCCoin);
    }
    selectBuyType = _selectBuyType;
    SetData(strTitle, 5, strCaption, strCCoin, strCancel);
    //return;    
}

static function ShowWindowSelectCashType(GUIController con, BTROItemBoxHK Ro, int _selectBuyType)
{
    con.OpenMenu("GUIWarfareControls.BTWindowSelectCashTypeHK");
    BTWindowSelectCashTypeHK(con.TopPage()).SetDataCash(Ro, _selectBuyType);
    //return;    
}

function UpdateDefaultWindow()
{
    ButtonPCash.AWinPos = fbButtonPCash;
    ButtonPCash.ApplyAWinPos();
    ButtonPCash.Caption = strPCoin;
    super(BTWindowHK).UpdateDefaultWindow();
    //return;    
}

delegate SelectCoin(int buyType, int cashType, BTROItemBoxHK Ro)
{
    //return;    
}

function bool ButtonPCoin_OnClick(GUIComponent Sender)
{
    selectCashType = Class'Engine.wItemBoxCashHK'.static.PCoinType();
    OnOK(Sender);
    SelectCoin(selectBuyType, int(selectCashType), roItemBox);
    return true;
    //return;    
}

function bool ButtonOK_OnClick(GUIComponent Sender)
{
    selectCashType = Class'Engine.wItemBoxCashHK'.static.CCoinType();
    OnOK(Sender);
    SelectCoin(selectBuyType, int(selectCashType), roItemBox);
    return true;
    //return;    
}

defaultproperties
{
    fbButtonPCash=(X1=450.0000000,Y1=407.0000000,X2=574.0000000,Y2=438.0000000)
    strCaption="Would you like to purchase?"
    strCCoin="W coin(C)"
    strPCoin="W coin(P)"
    fbButtonOK=(X1=324.0000000,Y1=407.0000000,X2=448.0000000,Y2=438.0000000)
    fbButtonCancel=(X1=576.0000000,Y1=407.0000000,X2=700.0000000,Y2=438.0000000)
    strTitle="Select"
}