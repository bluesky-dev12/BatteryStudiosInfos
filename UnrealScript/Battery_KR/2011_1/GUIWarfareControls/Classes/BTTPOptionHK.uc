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

    // End:0x2B8 [Loop If]
    if(i < 5)
    {
        fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox((AWinPos.X1 + float(100 * i)) + float(i), AWinPos.Y1, (AWinPos.X1 + float(100 * (i + 1))) + float(i), AWinPos.Y1 + float(24));
        ButtonTab[i] = NewButtonComponent(fb);
        ButtonTab[i].SetDefaultTabButtonImage();
        ButtonTab[i].SetDefaultTabButtonFontColor();
        ButtonTab[i].Caption = strButtonTab[i];
        fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1, AWinPos.Y1 + float(24), AWinPos.X2, AWinPos.Y2);
        // End:0x177
        if(i == 0)
        {
            TPGraphic = BTTPOptionGraphicHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionGraphicHK', fb));
            TPPanel[i] = TPGraphic;            
        }
        else
        {
            // End:0x1B5
            if(i == 1)
            {
                TPSound = BTTPOptionSoundHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionSoundHK', fb));
                TPPanel[i] = TPSound;                
            }
            else
            {
                // End:0x1F4
                if(i == 2)
                {
                    TPInput = BTTPOptionInputHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionInputHK', fb));
                    TPPanel[i] = TPInput;                    
                }
                else
                {
                    // End:0x233
                    if(i == 3)
                    {
                        TPCommunity = BTTPOptionCommunityHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPOptionCommunityHK', fb));
                        TPPanel[i] = TPCommunity;                        
                    }
                    else
                    {
                        // End:0x26F
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
    BTTPOptionGQAdvanceHK(TPGraphic.Content[7]).ButtonAdvance.__OnClick__Delegate = ButtonAdvance_OnClick;
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
    //return;    
}

function ResetData()
{
    TPGraphic.ResetData();
    TPSound.ResetData();
    TPInput.ResetData();
    TPETC.ResetData();
    //return;    
}

function DefaultResetData()
{
    TPGraphic.DefaultResetData();
    TPSound.DefaultResetData();
    TPInput.DefaultResetData();
    TPETC.DefaultResetData();
    //return;    
}

defaultproperties
{
    strButtonTab[0]="???"
    strButtonTab[1]="???"
    strButtonTab[2]="???"
    strButtonTab[3]="????"
    strButtonTab[4]="??"
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTTPOptionHK.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl
    fbButtonTab[0]=(X1=260.0000000,Y1=59.0000000,X2=360.0000000,Y2=83.0000000)
    fbButtonTab[1]=(X1=361.0000000,Y1=59.0000000,X2=461.0000000,Y2=83.0000000)
    fbButtonTab[2]=(X1=462.0000000,Y1=59.0000000,X2=562.0000000,Y2=83.0000000)
    fbButtonTab[3]=(X1=563.0000000,Y1=59.0000000,X2=663.0000000,Y2=83.0000000)
    fbButtonTab[4]=(X1=664.0000000,Y1=59.0000000,X2=764.0000000,Y2=83.0000000)
    fbTPPanel=(X1=260.0000000,Y1=83.0000000,X2=763.0000000,Y2=664.0000000)
}