class Tab_DetailSettings extends UT2K3TabPanel
    editinlinenew
    instanced;

var bool bExpert;
var localized string DetailLevels[7];
var int prevWorldDetail;
var int prevTextureDetail;
var int prevCharDetail;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0x4B [Loop If]
    if(i < Controls.Length)
    {
        Controls[i].__OnChange__Delegate = InternalOnChange;
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    // End:0xE4
    if(PlayerOwner().Level.IsDemoBuild())
    {
        i = 0;
        J0x6B:

        // End:0xA2 [Loop If]
        if(i < 4)
        {
            moComboBox(Controls[1]).AddItem(DetailLevels[i]);
            i++;
            // [Loop Continue]
            goto J0x6B;
        }
        i = 0;
        J0xA9:

        // End:0xE1 [Loop If]
        if(i < 4)
        {
            moComboBox(Controls[2]).AddItem(DetailLevels[i]);
            i++;
            // [Loop Continue]
            goto J0xA9;
        }        
    }
    else
    {
        i = 0;
        J0xEB:

        // End:0x122 [Loop If]
        if(i < 7)
        {
            moComboBox(Controls[1]).AddItem(DetailLevels[i]);
            i++;
            // [Loop Continue]
            goto J0xEB;
        }
        i = 0;
        J0x129:

        // End:0x161 [Loop If]
        if(i < 7)
        {
            moComboBox(Controls[2]).AddItem(DetailLevels[i]);
            i++;
            // [Loop Continue]
            goto J0x129;
        }
    }
    moComboBox(Controls[1]).ReadOnly(true);
    moComboBox(Controls[2]).ReadOnly(true);
    moComboBox(Controls[3]).AddItem(DetailLevels[3]);
    moComboBox(Controls[3]).AddItem(DetailLevels[4]);
    moComboBox(Controls[3]).AddItem(DetailLevels[6]);
    moComboBox(Controls[3]).ReadOnly(true);
    i = 2;
    J0x20D:

    // End:0x245 [Loop If]
    if(i < 5)
    {
        moComboBox(Controls[4]).AddItem(DetailLevels[i]);
        i++;
        // [Loop Continue]
        goto J0x20D;
    }
    moComboBox(Controls[4]).ReadOnly(true);
    i = 2;
    J0x265:

    // End:0x29D [Loop If]
    if(i < 5)
    {
        moComboBox(Controls[10]).AddItem(DetailLevels[i]);
        i++;
        // [Loop Continue]
        goto J0x265;
    }
    moComboBox(Controls[10]).ReadOnly(true);
    //return;    
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    local int i;
    local bool A, B;

    // End:0xF8
    if(Sender == Controls[1])
    {
        // End:0x2F
        if(S == "UltraLow")
        {
            prevTextureDetail = 0;            
        }
        else
        {
            // End:0x48
            if(S == "Low")
            {
                prevTextureDetail = 1;                
            }
            else
            {
                // End:0x64
                if(S == "Lower")
                {
                    prevTextureDetail = 2;                    
                }
                else
                {
                    // End:0x81
                    if(S == "Normal")
                    {
                        prevTextureDetail = 3;                        
                    }
                    else
                    {
                        // End:0x9E
                        if(S == "Higher")
                        {
                            prevTextureDetail = 4;                            
                        }
                        else
                        {
                            // End:0xB9
                            if(S == "High")
                            {
                                prevTextureDetail = 5;                                
                            }
                            else
                            {
                                // End:0xD6
                                if(S == "UltraHigh")
                                {
                                    prevTextureDetail = 6;
                                }
                            }
                        }
                    }
                }
            }
        }
        moComboBox(Sender).SetText(DetailLevels[prevTextureDetail]);        
    }
    else
    {
        // End:0x1F1
        if(Sender == Controls[2])
        {
            // End:0x128
            if(S == "UltraLow")
            {
                prevCharDetail = 0;                
            }
            else
            {
                // End:0x141
                if(S == "Low")
                {
                    prevCharDetail = 1;                    
                }
                else
                {
                    // End:0x15D
                    if(S == "Lower")
                    {
                        prevCharDetail = 2;                        
                    }
                    else
                    {
                        // End:0x17A
                        if(S == "Normal")
                        {
                            prevCharDetail = 3;                            
                        }
                        else
                        {
                            // End:0x197
                            if(S == "Higher")
                            {
                                prevCharDetail = 4;                                
                            }
                            else
                            {
                                // End:0x1B2
                                if(S == "High")
                                {
                                    prevCharDetail = 5;                                    
                                }
                                else
                                {
                                    // End:0x1CF
                                    if(S == "UltraHigh")
                                    {
                                        prevCharDetail = 6;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            moComboBox(Sender).SetText(DetailLevels[prevCharDetail]);            
        }
        else
        {
            // End:0x2F0
            if(Sender == Controls[3])
            {
                A = bool(PlayerOwner().ConsoleCommand("get ini:Engine.Engine.RenderDevice HighDetailActors"));
                B = bool(PlayerOwner().ConsoleCommand("get ini:Engine.Engine.RenderDevice SuperHighDetailActors"));
                // End:0x2B2
                if(B)
                {
                    prevWorldDetail = 6;                    
                }
                else
                {
                    // End:0x2C6
                    if(A)
                    {
                        prevWorldDetail = 4;                        
                    }
                    else
                    {
                        prevWorldDetail = 3;
                    }
                }
                moComboBox(Sender).SetText(DetailLevels[prevWorldDetail]);                
            }
            else
            {
                // End:0x39F
                if(Sender == Controls[4])
                {
                    // End:0x341
                    if(int(PlayerOwner().Level.default.PhysicsDetailLevel) == int(0))
                    {
                        moComboBox(Sender).SetText(DetailLevels[2]);                        
                    }
                    else
                    {
                        // End:0x380
                        if(int(PlayerOwner().Level.default.PhysicsDetailLevel) == int(1))
                        {
                            moComboBox(Sender).SetText(DetailLevels[3]);                            
                        }
                        else
                        {
                            moComboBox(Sender).SetText(DetailLevels[4]);
                        }
                    }                    
                }
                else
                {
                    // End:0x3D7
                    if(Sender == Controls[5])
                    {
                        moCheckBox(Sender).Checked(Class'UnrealGame.UnrealPawn'.default.bPlayerShadows);                        
                    }
                    else
                    {
                        // End:0x409
                        if(Sender == Controls[7])
                        {
                            moCheckBox(Sender).Checked(!bool(S));                            
                        }
                        else
                        {
                            // End:0x4AF
                            if(Sender == Controls[10])
                            {
                                i = int(PlayerOwner().Level.default.DecalStayScale);
                                switch(i)
                                {
                                    // End:0x462
                                    case 0:
                                        moComboBox(Sender).SetText(DetailLevels[2]);
                                        // End:0x4AC
                                        break;
                                    // End:0x485
                                    case 1:
                                        moComboBox(Sender).SetText(DetailLevels[3]);
                                        // End:0x4AC
                                        break;
                                    // End:0x4A9
                                    case 2:
                                        moComboBox(Sender).SetText(DetailLevels[4]);
                                        // End:0x4AC
                                        break;
                                    // End:0xFFFF
                                    default:
                                        break;
                                }                                
                            }
                            else
                            {
                                // End:0x4E7
                                if(Sender == Controls[14])
                                {
                                    moCheckBox(Sender).Checked(Class'UnrealGame.UnrealPawn'.default.bBlobShadow);                                    
                                }
                                else
                                {
                                    moCheckBox(Sender).Checked(bool(S));
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    //return;    
}

function string InternalOnSaveINI(GUIComponent Sender)
{
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    local string t, V;
    local bool B, goingUp;
    local int newDetail;

    // End:0x16
    if(!Controller.bCurMenuInitialized)
    {
        return;
    }
    // End:0x2BF
    if(Sender == Controls[1])
    {
        t = "set ini:Engine.Engine.ViewportManager TextureDetail";
        // End:0x9C
        if(moComboBox(Sender).GetText() == DetailLevels[0])
        {
            V = "UltraLow";
            newDetail = 0;            
        }
        else
        {
            // End:0xD1
            if(moComboBox(Sender).GetText() == DetailLevels[1])
            {
                V = "Low";
                newDetail = 1;                
            }
            else
            {
                // End:0x10A
                if(moComboBox(Sender).GetText() == DetailLevels[2])
                {
                    V = "Lower";
                    newDetail = 2;                    
                }
                else
                {
                    // End:0x144
                    if(moComboBox(Sender).GetText() == DetailLevels[3])
                    {
                        V = "Normal";
                        newDetail = 3;                        
                    }
                    else
                    {
                        // End:0x17E
                        if(moComboBox(Sender).GetText() == DetailLevels[4])
                        {
                            V = "Higher";
                            newDetail = 4;                            
                        }
                        else
                        {
                            // End:0x1B6
                            if(moComboBox(Sender).GetText() == DetailLevels[5])
                            {
                                V = "High";
                                newDetail = 5;                                
                            }
                            else
                            {
                                // End:0x1F0
                                if(moComboBox(Sender).GetText() == DetailLevels[6])
                                {
                                    V = "UltraHigh";
                                    newDetail = 6;
                                }
                            }
                        }
                    }
                }
            }
        }
        PlayerOwner().ConsoleCommand((t $ "Terrain") @ V);
        PlayerOwner().ConsoleCommand((t $ "World") @ V);
        PlayerOwner().ConsoleCommand((t $ "Rendermap") @ V);
        PlayerOwner().ConsoleCommand((t $ "Lightmap") @ V);
        PlayerOwner().ConsoleCommand("flush");
        // End:0x2B1
        if(newDetail > prevTextureDetail)
        {
            goingUp = true;
        }
        prevTextureDetail = newDetail;        
    }
    else
    {
        // End:0x524
        if(Sender == Controls[2])
        {
            t = "set ini:Engine.Engine.ViewportManager TextureDetail";
            // End:0x346
            if(moComboBox(Sender).GetText() == DetailLevels[0])
            {
                V = "UltraLow";
                newDetail = 0;                
            }
            else
            {
                // End:0x37B
                if(moComboBox(Sender).GetText() == DetailLevels[1])
                {
                    V = "Low";
                    newDetail = 1;                    
                }
                else
                {
                    // End:0x3B4
                    if(moComboBox(Sender).GetText() == DetailLevels[2])
                    {
                        V = "Lower";
                        newDetail = 2;                        
                    }
                    else
                    {
                        // End:0x3EE
                        if(moComboBox(Sender).GetText() == DetailLevels[3])
                        {
                            V = "Normal";
                            newDetail = 3;                            
                        }
                        else
                        {
                            // End:0x428
                            if(moComboBox(Sender).GetText() == DetailLevels[4])
                            {
                                V = "Higher";
                                newDetail = 4;                                
                            }
                            else
                            {
                                // End:0x460
                                if(moComboBox(Sender).GetText() == DetailLevels[5])
                                {
                                    V = "High";
                                    newDetail = 5;                                    
                                }
                                else
                                {
                                    // End:0x49A
                                    if(moComboBox(Sender).GetText() == DetailLevels[6])
                                    {
                                        V = "UltraHigh";
                                        newDetail = 6;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            PlayerOwner().ConsoleCommand((t $ "WeaponSkin") @ V);
            PlayerOwner().ConsoleCommand((t $ "PlayerSkin") @ V);
            PlayerOwner().ConsoleCommand("flush");
            // End:0x516
            if(newDetail > prevCharDetail)
            {
                goingUp = true;
            }
            prevCharDetail = newDetail;            
        }
        else
        {
            // End:0x7E6
            if(Sender == Controls[3])
            {
                // End:0x60F
                if(moComboBox(Sender).GetText() == DetailLevels[6])
                {
                    PlayerOwner().ConsoleCommand("set ini:Engine.Engine.RenderDevice HighDetailActors True");
                    PlayerOwner().ConsoleCommand("set ini:Engine.Engine.RenderDevice SuperHighDetailActors True");
                    PlayerOwner().Level.DetailChange(2);
                    newDetail = 6;                    
                }
                else
                {
                    // End:0x6E9
                    if(moComboBox(Sender).GetText() == DetailLevels[4])
                    {
                        PlayerOwner().ConsoleCommand("set ini:Engine.Engine.RenderDevice HighDetailActors True");
                        PlayerOwner().ConsoleCommand("set ini:Engine.Engine.RenderDevice SuperHighDetailActors False");
                        PlayerOwner().Level.DetailChange(1);
                        newDetail = 4;                        
                    }
                    else
                    {
                        // End:0x7C1
                        if(moComboBox(Sender).GetText() == DetailLevels[3])
                        {
                            PlayerOwner().ConsoleCommand("set ini:Engine.Engine.RenderDevice HighDetailActors False");
                            PlayerOwner().ConsoleCommand("set ini:Engine.Engine.RenderDevice SuperHighDetailActors False");
                            PlayerOwner().Level.DetailChange(0);
                            newDetail = 3;
                        }
                    }
                }
                // End:0x7D8
                if(newDetail > prevWorldDetail)
                {
                    goingUp = true;
                }
                prevWorldDetail = newDetail;                
            }
            else
            {
                // End:0x8EA
                if(Sender == Controls[4])
                {
                    // End:0x834
                    if(moComboBox(Sender).GetText() == DetailLevels[2])
                    {
                        PlayerOwner().Level.default.PhysicsDetailLevel = 0;                        
                    }
                    else
                    {
                        // End:0x870
                        if(moComboBox(Sender).GetText() == DetailLevels[3])
                        {
                            PlayerOwner().Level.default.PhysicsDetailLevel = 1;                            
                        }
                        else
                        {
                            // End:0x8A9
                            if(moComboBox(Sender).GetText() == DetailLevels[4])
                            {
                                PlayerOwner().Level.default.PhysicsDetailLevel = 2;
                            }
                        }
                    }
                    PlayerOwner().Level.PhysicsDetailLevel = PlayerOwner().Level.default.PhysicsDetailLevel;
                    PlayerOwner().Level.SaveConfig();                    
                }
                else
                {
                    // End:0x997
                    if(Sender == Controls[5])
                    {
                        PlayerOwner().ConsoleCommand("set UnrealPawn bPlayerShadows " $ string(moCheckBox(Sender).IsChecked()));
                        Class'UnrealGame.UnrealPawn'.default.bPlayerShadows = moCheckBox(Sender).IsChecked();
                        Class'UnrealGame.UnrealPawn'.static.StaticSaveConfig();
                        // End:0x994
                        if(moCheckBox(Sender).IsChecked())
                        {
                            goingUp = true;
                        }                        
                    }
                    else
                    {
                        // End:0xA22
                        if(Sender == Controls[14])
                        {
                            PlayerOwner().ConsoleCommand("set UnrealPawn bBlobShadow " $ string(moCheckBox(Sender).IsChecked()));
                            Class'UnrealGame.UnrealPawn'.default.bBlobShadow = moCheckBox(Sender).IsChecked();
                            Class'UnrealGame.UnrealPawn'.static.StaticSaveConfig();                            
                        }
                        else
                        {
                            // End:0xAAE
                            if(Sender == Controls[7])
                            {
                                B = moCheckBox(Sender).IsChecked();
                                B = B != true;
                                PlayerOwner().ConsoleCommand(("set" @ Sender.IniOption) @ string(B));
                                // End:0xAAB
                                if(moCheckBox(Sender).IsChecked())
                                {
                                    goingUp = true;
                                }                                
                            }
                            else
                            {
                                // End:0xBBB
                                if(Sender == Controls[10])
                                {
                                    // End:0xAFF
                                    if(moComboBox(Sender).GetText() == DetailLevels[4])
                                    {
                                        PlayerOwner().Level.default.DecalStayScale = 2.0000000;                                        
                                    }
                                    else
                                    {
                                        // End:0xB3E
                                        if(moComboBox(Sender).GetText() == DetailLevels[3])
                                        {
                                            PlayerOwner().Level.default.DecalStayScale = 1.0000000;                                            
                                        }
                                        else
                                        {
                                            // End:0xB7A
                                            if(moComboBox(Sender).GetText() == DetailLevels[2])
                                            {
                                                PlayerOwner().Level.default.DecalStayScale = 0.0000000;
                                            }
                                        }
                                    }
                                    PlayerOwner().Level.DecalStayScale = PlayerOwner().Level.default.DecalStayScale;
                                    PlayerOwner().Level.SaveConfig();                                    
                                }
                                else
                                {
                                    PlayerOwner().ConsoleCommand(("set" @ Sender.IniOption) @ string(moCheckBox(Sender).IsChecked()));
                                    // End:0xC15
                                    if(moCheckBox(Sender).IsChecked())
                                    {
                                        goingUp = true;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    // End:0xC55
    if(goingUp && !bExpert)
    {
        Controller.OpenMenu("XInterface.UT2PerformWarn");
    }
    //return;    
}

defaultproperties
{
    DetailLevels[0]="??"
    DetailLevels[1]="??"
    DetailLevels[2]="?"
    DetailLevels[3]="??"
    DetailLevels[4]="?"
    DetailLevels[5]="??"
    DetailLevels[6]="??"
    // Reference: GUIImage'XInterface_Decompressed.Tab_DetailSettings.DetailBK'
    begin object name="DetailBK" class=XInterface_Decompressed.GUIImage
        ImageColor=(R=255,G=255,B=255,A=160)
        ImageStyle=1
        WinTop=0.3200000
        WinLeft=0.0216410
        WinWidth=0.9575000
        WinHeight=0.5212500
    end object
    Controls[0]=DetailBK
    // Reference: moComboBox'XInterface_Decompressed.Tab_DetailSettings.DetailWorldDetail'
    begin object name="DetailWorldDetail" class=XInterface_Decompressed.moComboBox
        ComponentJustification=0
        Caption="??? ???"
        OnCreateComponent=DetailWorldDetail.InternalOnCreateComponent
        IniOption="ini:Engine.Engine.ViewportManager TextureDetailWorld"
        IniDefault="High"
        Hint="?? ??? ??? ?????."
        WinTop=0.1000000
        WinLeft=0.0500000
        WinWidth=0.4000000
        WinHeight=0.0500000
        OnLoadINI=Tab_DetailSettings.InternalOnLoadINI
        OnSaveINI=Tab_DetailSettings.InternalOnSaveINI
    end object
    Controls[1]=DetailWorldDetail
    // Reference: moComboBox'XInterface_Decompressed.Tab_DetailSettings.DetailCharacterDetail'
    begin object name="DetailCharacterDetail" class=XInterface_Decompressed.moComboBox
        ComponentJustification=0
        Caption="??? ???"
        OnCreateComponent=DetailCharacterDetail.InternalOnCreateComponent
        IniOption="ini:Engine.Engine.ViewportManager TextureDetailPlayerSkin"
        IniDefault="High"
        Hint="??? ???? ?? ??? ?????."
        WinTop=0.1000000
        WinLeft=0.5500000
        WinWidth=0.4000000
        WinHeight=0.0500000
        OnLoadINI=Tab_DetailSettings.InternalOnLoadINI
        OnSaveINI=Tab_DetailSettings.InternalOnSaveINI
    end object
    Controls[2]=DetailCharacterDetail
    // Reference: moComboBox'XInterface_Decompressed.Tab_DetailSettings.DetailActorDetail'
    begin object name="DetailActorDetail" class=XInterface_Decompressed.moComboBox
        ComponentJustification=0
        Caption="?? ???"
        OnCreateComponent=DetailActorDetail.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="High"
        Hint="??? ?? ?? ??? ?????."
        WinTop=0.2000000
        WinLeft=0.0500000
        WinWidth=0.4000000
        WinHeight=0.0500000
        OnLoadINI=Tab_DetailSettings.InternalOnLoadINI
        OnSaveINI=Tab_DetailSettings.InternalOnSaveINI
    end object
    Controls[3]=DetailActorDetail
    // Reference: moComboBox'XInterface_Decompressed.Tab_DetailSettings.DetailPhysics'
    begin object name="DetailPhysics" class=XInterface_Decompressed.moComboBox
        ComponentJustification=0
        Caption="?? ??"
        OnCreateComponent=DetailPhysics.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="High"
        Hint="???? ????? ??? ?????."
        WinTop=0.2000000
        WinLeft=0.5500000
        WinWidth=0.4000000
        WinHeight=0.0500000
        OnLoadINI=Tab_DetailSettings.InternalOnLoadINI
        OnSaveINI=Tab_DetailSettings.InternalOnSaveINI
    end object
    Controls[4]=DetailPhysics
    // Reference: moCheckBox'XInterface_Decompressed.Tab_DetailSettings.DetailCharacterShadows'
    begin object name="DetailCharacterShadows" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="??? ???"
        OnCreateComponent=DetailCharacterShadows.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="??? ???? ?????."
        WinTop=0.3600000
        WinLeft=0.1000000
        WinWidth=0.3000000
        WinHeight=0.0500000
        OnLoadINI=Tab_DetailSettings.InternalOnLoadINI
        OnSaveINI=Tab_DetailSettings.InternalOnSaveINI
    end object
    Controls[5]=DetailCharacterShadows
    // Reference: moCheckBox'XInterface_Decompressed.Tab_DetailSettings.DetailDecals'
    begin object name="DetailDecals" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="?? ??"
        OnCreateComponent=DetailDecals.InternalOnCreateComponent
        IniOption="ini:Engine.Engine.ViewportManager Decals"
        IniDefault="True"
        Hint="?? ??? ?????."
        WinTop=0.3600000
        WinLeft=0.6000000
        WinWidth=0.3000000
        WinHeight=0.0500000
        OnLoadINI=Tab_DetailSettings.InternalOnLoadINI
        OnSaveINI=Tab_DetailSettings.InternalOnSaveINI
    end object
    Controls[6]=DetailDecals
    // Reference: moCheckBox'XInterface_Decompressed.Tab_DetailSettings.DetailDynamicLighting'
    begin object name="DetailDynamicLighting" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="???? ???"
        OnCreateComponent=DetailDynamicLighting.InternalOnCreateComponent
        IniOption="ini:Engine.Engine.ViewportManager NoDynamicLights"
        IniDefault="True"
        Hint="???? ????? ??? ?????."
        WinTop=0.4600000
        WinLeft=0.1000000
        WinWidth=0.3000000
        WinHeight=0.0500000
        OnLoadINI=Tab_DetailSettings.InternalOnLoadINI
        OnSaveINI=Tab_DetailSettings.InternalOnSaveINI
    end object
    Controls[7]=DetailDynamicLighting
    // Reference: moCheckBox'XInterface_Decompressed.Tab_DetailSettings.DetailCoronas'
    begin object name="DetailCoronas" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="???"
        OnCreateComponent=DetailCoronas.InternalOnCreateComponent
        IniOption="ini:Engine.Engine.ViewportManager Coronas"
        IniDefault="True"
        Hint="???? ?????."
        WinTop=0.4600000
        WinLeft=0.6000000
        WinWidth=0.3000000
        WinHeight=0.0500000
        OnLoadINI=Tab_DetailSettings.InternalOnLoadINI
        OnSaveINI=Tab_DetailSettings.InternalOnSaveINI
    end object
    Controls[8]=DetailCoronas
    // Reference: moCheckBox'XInterface_Decompressed.Tab_DetailSettings.DetailDetailTextures'
    begin object name="DetailDetailTextures" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="??? ???"
        OnCreateComponent=DetailDetailTextures.InternalOnCreateComponent
        IniOption="ini:Engine.Engine.RenderDevice DetailTextures"
        IniDefault="True"
        Hint="??? ???? ?????."
        WinTop=0.5600000
        WinLeft=0.1000000
        WinWidth=0.3000000
        WinHeight=0.0500000
        OnLoadINI=Tab_DetailSettings.InternalOnLoadINI
        OnSaveINI=Tab_DetailSettings.InternalOnSaveINI
    end object
    Controls[9]=DetailDetailTextures
    // Reference: moComboBox'XInterface_Decompressed.Tab_DetailSettings.DetailDecalStay'
    begin object name="DetailDecalStay" class=XInterface_Decompressed.moComboBox
        ComponentJustification=0
        Caption="?? ?? ?? ??"
        OnCreateComponent=DetailDecalStay.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="Normal"
        Hint="?? ??? ?? ??? ?????."
        WinTop=0.5500000
        WinLeft=0.5987500
        WinWidth=0.3500000
        WinHeight=0.0600000
        OnLoadINI=Tab_DetailSettings.InternalOnLoadINI
        OnSaveINI=Tab_DetailSettings.InternalOnSaveINI
    end object
    Controls[10]=DetailDecalStay
    // Reference: moCheckBox'XInterface_Decompressed.Tab_DetailSettings.DetailProjectors'
    begin object name="DetailProjectors" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="????"
        OnCreateComponent=DetailProjectors.InternalOnCreateComponent
        IniOption="ini:Engine.Engine.ViewportManager Projectors"
        IniDefault="True"
        Hint="????? ?????."
        WinTop=0.6562510
        WinLeft=0.1000000
        WinWidth=0.3000000
        WinHeight=0.0400000
        OnLoadINI=Tab_DetailSettings.InternalOnLoadINI
        OnSaveINI=Tab_DetailSettings.InternalOnSaveINI
    end object
    Controls[11]=DetailProjectors
    // Reference: moCheckBox'XInterface_Decompressed.Tab_DetailSettings.DetailDecoLayers'
    begin object name="DetailDecoLayers" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="??"
        OnCreateComponent=DetailDecoLayers.InternalOnCreateComponent
        IniOption="ini:Engine.Engine.ViewportManager DecoLayers"
        IniDefault="True"
        Hint="??? ?? ??? ?????."
        WinTop=0.6562510
        WinLeft=0.5987500
        WinWidth=0.3000000
        WinHeight=0.0400000
        OnLoadINI=Tab_DetailSettings.InternalOnLoadINI
        OnSaveINI=Tab_DetailSettings.InternalOnSaveINI
    end object
    Controls[12]=DetailDecoLayers
    // Reference: moCheckBox'XInterface_Decompressed.Tab_DetailSettings.DetailTrilinear'
    begin object name="DetailTrilinear" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="?????? ???"
        OnCreateComponent=DetailTrilinear.InternalOnCreateComponent
        IniOption="ini:Engine.Engine.RenderDevice UseTrilinear"
        IniDefault="False"
        Hint="?????? ???? ?????. ?? PC? ?????."
        WinTop=0.7500000
        WinLeft=0.1000000
        WinWidth=0.3000000
        WinHeight=0.0400000
        OnLoadINI=Tab_DetailSettings.InternalOnLoadINI
        OnSaveINI=Tab_DetailSettings.InternalOnSaveINI
    end object
    Controls[13]=DetailTrilinear
    // Reference: moCheckBox'XInterface_Decompressed.Tab_DetailSettings.DetailBlob'
    begin object name="DetailBlob" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="??? ???? ?????"
        OnCreateComponent=DetailBlob.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="False"
        Hint="??? ???? ?????. ?? PC? ?????."
        WinTop=0.7500000
        WinLeft=0.5987500
        WinWidth=0.3000000
        WinHeight=0.0400000
        OnLoadINI=Tab_DetailSettings.InternalOnLoadINI
    end object
    Controls[14]=DetailBlob
    WinTop=0.1500000
    WinHeight=0.7400000
}