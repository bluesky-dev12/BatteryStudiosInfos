class BTTPOptionHK extends BTTabPanelHK
    editinlinenew
    instanced;

var localized string strButtonTab[5];
var export editinline TabControlMocker TabControl;
var FloatBox fbButtonTab[5];
var export editinline BTOwnerDrawCaptionButtonHK ButtonTab[5];
var FloatBox fbTPPanel;
var export editinline BTTPOptionBaseHK TPPanel[5];
var export editinline BTTPOptionGraphicHK TPGraphic;
var export editinline BTTPOptionSoundHK TPSound;
var export editinline BTTPOptionInputHK TPInput;
var export editinline BTTPOptionCommunityHK TPCommunity;
var export editinline BTTPOptionETCHK TPETC;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local FloatBox fb;

    super(GUIPanel).InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0x2B2 [Loop If]
    if(i < 5)
    {
        fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(fbButtonTab[i].X1, fbButtonTab[i].Y1, fbButtonTab[i].X2, fbButtonTab[i].Y2);
        ButtonTab[i] = NewButtonComponent(fb);
        ButtonTab[i].SetTabButtonFontColor();
        ButtonTab[i].Caption = strButtonTab[i];
        ButtonTab[i].SetFontSizeAll(9);
        ButtonTab[i].SetBigTabButtonImage();
        fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1, AWinPos.Y1 + float(24), AWinPos.X2, AWinPos.Y2);
        // End:0x171
        if(i == 0)
        {
            TPGraphic = BTTPOptionGraphicHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionGraphicHK', fb));
            TPPanel[i] = TPGraphic;            
        }
        else
        {
            // End:0x1AF
            if(i == 1)
            {
                TPSound = BTTPOptionSoundHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionSoundHK', fb));
                TPPanel[i] = TPSound;                
            }
            else
            {
                // End:0x1EE
                if(i == 2)
                {
                    TPInput = BTTPOptionInputHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionInputHK', fb));
                    TPPanel[i] = TPInput;                    
                }
                else
                {
                    // End:0x22D
                    if(i == 3)
                    {
                        TPCommunity = BTTPOptionCommunityHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionCommunityHK', fb));
                        TPPanel[i] = TPCommunity;                        
                    }
                    else
                    {
                        // End:0x269
                        if(i == 4)
                        {
                            TPETC = BTTPOptionETCHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionETCHK', fb));
                            TPPanel[i] = TPETC;
                        }
                    }
                }
            }
        }
        TabControl.BindTabButtonAndPanel(ButtonTab[i], TPPanel[i]);
        ButtonTab[i].__OnClick__Delegate = ButtonTab_OnClick;
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    TabControl.SetVisiblePanel(0);
    TPPanel[0].Internal_OnClick(none);
    BTTPOptionGQAdvanceHK(TPGraphic.Content[5]).ButtonAdvance.__OnClick__Delegate = ButtonAdvance_OnClick;
    TPGraphic.__OnChangeScreen__Delegate = TPETC.OnChangeScreen;
    TPETC.OnChangeScreen(TPGraphic.CurrentInfo.width, TPGraphic.CurrentInfo.Height);
    //return;    
}

function bool ButtonTab_OnClick(GUIComponent Sender)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x75 [Loop If]
    if(lp1 < TabControl.Buttons.Length)
    {
        // End:0x6B
        if(TabControl.Buttons[lp1] == Sender)
        {
            TabControl.SetVisiblePanel(lp1);
            TPPanel[lp1].Internal_OnClick(none);
            // [Explicit Break]
            goto J0x75;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x75:

    return true;
    //return;    
}

function bool ButtonAdvance_OnClick(GUIComponent Sender)
{
    local PlayerController PC;
    local wMatchMaker MM;

    PC = PlayerOwner();
    MM = PC.Level.GetMatchMaker();
    // End:0x55
    if((MM != none) && MM.InGamePlaying)
    {
        MM.SetTcpTimeOutInTempReset();
    }
    SaveData();
    Controller.OpenMenu("GUIWarfareControls.BTWindowOptionAdvanceHK");
    return true;
    //return;    
}

function SaveData()
{
    TPGraphic.SaveData();
    TPSound.SaveData();
    TPInput.SaveData();
    TPETC.SaveData();
    TPCommunity.SaveData();
    //return;    
}

function ResetData()
{
    TPGraphic.ResetData();
    TPSound.ResetData();
    TPInput.ResetData();
    TPETC.ResetData();
    TPCommunity.ResetData();
    //return;    
}

function DefaultResetData()
{
    switch(TabControl.CurrentTabIndex)
    {
        // End:0x26
        case 0:
            TPGraphic.DefaultResetData();
            // End:0x84
            break;
        // End:0x3C
        case 1:
            TPSound.DefaultResetData();
            // End:0x84
            break;
        // End:0x53
        case 2:
            TPInput.DefaultResetData();
            // End:0x84
            break;
        // End:0x6A
        case 3:
            TPCommunity.ResetData();
            // End:0x84
            break;
        // End:0x81
        case 4:
            TPETC.DefaultResetData();
            // End:0x84
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

defaultproperties
{
    strButtonTab[0]="???????"
    strButtonTab[1]="?????"
    strButtonTab[2]="??????"
    strButtonTab[3]="Community"
    strButtonTab[4]="?????"
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTTPOptionHK.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl
    fbButtonTab[0]=(X1=252.0000000,Y1=87.0000000,X2=355.0000000,Y2=119.0000000)
    fbButtonTab[1]=(X1=356.0000000,Y1=87.0000000,X2=459.0000000,Y2=119.0000000)
    fbButtonTab[2]=(X1=460.0000000,Y1=87.0000000,X2=563.0000000,Y2=119.0000000)
    fbButtonTab[3]=(X1=564.0000000,Y1=87.0000000,X2=667.0000000,Y2=119.0000000)
    fbButtonTab[4]=(X1=668.0000000,Y1=87.0000000,X2=771.0000000,Y2=119.0000000)
    fbTPPanel=(X1=242.0000000,Y1=141.0000000,X2=760.0000000,Y2=605.0000000)
}