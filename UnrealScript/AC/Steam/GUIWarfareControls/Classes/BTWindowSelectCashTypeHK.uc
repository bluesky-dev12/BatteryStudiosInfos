/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowSelectCashTypeHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:9
 *	Functions:7
 *
 *******************************************************************************/
class BTWindowSelectCashTypeHK extends BTWindowSelectHK
    dependson(BTWindowSelectHK)
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawCaptionButtonHK ButtonPCash;
var FloatBox fbButtonPCash;
var localized string strCaption;
var localized string strCCoin;
var localized string strPCoin;
var BTROItemBoxHK ROItemBox;
var int selectBuyType;
var byte selectCashType;
var delegate<OnPCoin> __OnPCoin__Delegate;

delegate bool OnPCoin(GUIComponent Sender)
{
    FadeOut(false, true);
    return true;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    ButtonPCash = new class'BTOwnerDrawCaptionButtonHK';
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
}

function SetDataCash(BTROItemBoxHK ro, bool EnablePCoin, bool EnableCCoin)
{
    ROItemBox = ro;
    ButtonPCash.SetEnabled(EnablePCoin);
    ButtonOK.SetEnabled(EnableCCoin);
    SetData(strTitle, 5, strCaption, strCCoin, strCancel);
}

static function ShowWindowSelectCashType(GUIController con, BTROItemBoxHK ro, bool EnablePCoin, bool EnableCCoin)
{
    con.OpenMenu("GUIWarfareControls.BTWindowSelectCashTypeHK");
    BTWindowSelectCashTypeHK(con.TopPage()).SetDataCash(ro, EnablePCoin, EnableCCoin);
}

function UpdateDefaultWindow()
{
    ButtonPCash.AWinPos = fbButtonPCash;
    ButtonPCash.ApplyAWinPos();
    ButtonPCash.Caption = strPCoin;
    super(BTWindowHK).UpdateDefaultWindow();
}

function bool ButtonPCoin_OnClick(GUIComponent Sender)
{
    selectCashType = class'wItemBoxCashHK'.static.PCoinType();
    return OnPCoin(Sender);
}

function bool ButtonOK_OnClick(GUIComponent Sender)
{
    selectCashType = class'wItemBoxCashHK'.static.CCoinType();
    return OnOK(Sender);
}

defaultproperties
{
    fbButtonPCash=(X1=450.0,Y1=407.0,X2=574.0,Y2=438.0)
    strCaption="Would you like to purchase?"
    strCCoin="W coin(C)"
    strPCoin="W coin(P)"
    fbButtonOK=(X1=324.0,Y1=407.0,X2=448.0,Y2=438.0)
    fbButtonCancel=(X1=576.0,Y1=407.0,X2=700.0,Y2=438.0)
    strTitle="Select"
}