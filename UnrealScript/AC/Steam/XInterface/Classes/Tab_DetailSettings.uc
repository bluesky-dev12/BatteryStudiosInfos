/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\Tab_DetailSettings.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:4
 *
 *******************************************************************************/
class Tab_DetailSettings extends UT2K3TabPanel
    dependson(UT2K3TabPanel)
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
    // End:0x4b [While If]
    if(i < Controls.Length)
    {
        Controls[i].__OnChange__Delegate = InternalOnChange;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
    // End:0xe4
    if(PlayerOwner().Level.IsDemoBuild())
    {
        i = 0;
        J0x6b:
        // End:0xa2 [While If]
        if(i < 4)
        {
            moComboBox(Controls[1]).AddItem(DetailLevels[i]);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x6b;
        }
        i = 0;
        J0xa9:
        // End:0xe1 [While If]
        if(i < 4)
        {
            moComboBox(Controls[2]).AddItem(DetailLevels[i]);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xa9;
        }
    }
    // End:0x161
    else
    {
        i = 0;
        J0xeb:
        // End:0x122 [While If]
        if(i < 7)
        {
            moComboBox(Controls[1]).AddItem(DetailLevels[i]);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xeb;
        }
        i = 0;
        J0x129:
        // End:0x161 [While If]
        if(i < 7)
        {
            moComboBox(Controls[2]).AddItem(DetailLevels[i]);
            ++ i;
            // This is an implied JumpToken; Continue!
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
    J0x20d:
    // End:0x245 [While If]
    if(i < 5)
    {
        moComboBox(Controls[4]).AddItem(DetailLevels[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x20d;
    }
    moComboBox(Controls[4]).ReadOnly(true);
    i = 2;
    J0x265:
    // End:0x29d [While If]
    if(i < 5)
    {
        moComboBox(Controls[10]).AddItem(DetailLevels[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x265;
    }
    moComboBox(Controls[10]).ReadOnly(true);
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    local int i;
    local bool A, B;

    // End:0xf8
    if(Sender == Controls[1])
    {
        // End:0x2f
        if(S == "UltraLow")
        {
            prevTextureDetail = 0;
        }
        // End:0xd6
        else
        {
            // End:0x48
            if(S == "Low")
            {
                prevTextureDetail = 1;
            }
            // End:0xd6
            else
            {
                // End:0x64
                if(S == "Lower")
                {
                    prevTextureDetail = 2;
                }
                // End:0xd6
                else
                {
                    // End:0x81
                    if(S == "Normal")
                    {
                        prevTextureDetail = 3;
                    }
                    // End:0xd6
                    else
                    {
                        // End:0x9e
                        if(S == "Higher")
                        {
                            prevTextureDetail = 4;
                        }
                        // End:0xd6
                        else
                        {
                            // End:0xb9
                            if(S == "High")
                            {
                                prevTextureDetail = 5;
                            }
                            // End:0xd6
                            else
                            {
                                // End:0xd6
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
    // End:0x502
    else
    {
        // End:0x1f1
        if(Sender == Controls[2])
        {
            // End:0x128
            if(S == "UltraLow")
            {
                prevCharDetail = 0;
            }
            // End:0x1cf
            else
            {
                // End:0x141
                if(S == "Low")
                {
                    prevCharDetail = 1;
                }
                // End:0x1cf
                else
                {
                    // End:0x15d
                    if(S == "Lower")
                    {
                        prevCharDetail = 2;
                    }
                    // End:0x1cf
                    else
                    {
                        // End:0x17a
                        if(S == "Normal")
                        {
                            prevCharDetail = 3;
                        }
                        // End:0x1cf
                        else
                        {
                            // End:0x197
                            if(S == "Higher")
                            {
                                prevCharDetail = 4;
                            }
                            // End:0x1cf
                            else
                            {
                                // End:0x1b2
                                if(S == "High")
                                {
                                    prevCharDetail = 5;
                                }
                                // End:0x1cf
                                else
                                {
                                    // End:0x1cf
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
        // End:0x502
        else
        {
            // End:0x2f0
            if(Sender == Controls[3])
            {
                A = bool(PlayerOwner().ConsoleCommand("get ini:Engine.Engine.RenderDevice HighDetailActors"));
                B = bool(PlayerOwner().ConsoleCommand("get ini:Engine.Engine.RenderDevice SuperHighDetailActors"));
                // End:0x2b2
                if(B)
                {
                    prevWorldDetail = 6;
                }
                // End:0x2ce
                else
                {
                    // End:0x2c6
                    if(A)
                    {
                        prevWorldDetail = 4;
                    }
                    // End:0x2ce
                    else
                    {
                        prevWorldDetail = 3;
                    }
                }
                moComboBox(Sender).SetText(DetailLevels[prevWorldDetail]);
            }
            // End:0x502
            else
            {
                // End:0x39f
                if(Sender == Controls[4])
                {
                    // End:0x341
                    if(PlayerOwner().Level.default.PhysicsDetailLevel == 0)
                    {
                        moComboBox(Sender).SetText(DetailLevels[2]);
                    }
                    // End:0x39c
                    else
                    {
                        // End:0x380
                        if(PlayerOwner().Level.default.PhysicsDetailLevel == 1)
                        {
                            moComboBox(Sender).SetText(DetailLevels[3]);
                        }
                        // End:0x39c
                        else
                        {
                            moComboBox(Sender).SetText(DetailLevels[4]);
                        }
                    }
                }
                // End:0x502
                else
                {
                    // End:0x3d7
                    if(Sender == Controls[5])
                    {
                        moCheckBox(Sender).Checked(class'UnrealPawn'.default.bPlayerShadows);
                    }
                    // End:0x502
                    else
                    {
                        // End:0x409
                        if(Sender == Controls[7])
                        {
                            moCheckBox(Sender).Checked(!bool(S));
                        }
                        // End:0x502
                        else
                        {
                            // End:0x4af
                            if(Sender == Controls[10])
                            {
                                i = int(PlayerOwner().Level.default.DecalStayScale);
                                switch(i)
                                {
                                    // End:0x462
                                    case 0:
                                        moComboBox(Sender).SetText(DetailLevels[2]);
                                        // End:0x4ac
                                        break;
                                    // End:0x485
                                    case 1:
                                        moComboBox(Sender).SetText(DetailLevels[3]);
                                        // End:0x4ac
                                        break;
                                    // End:0x4a9
                                    case 2:
                                        moComboBox(Sender).SetText(DetailLevels[4]);
                                        // End:0x4ac
                                        break;
                                    // End:0xffff
                                    default:
                                        // End:0x502 Break;
                                        break;
                                    }
                            }
                            // End:0x4e7
                            if(Sender == Controls[14])
                            {
                                moCheckBox(Sender).Checked(class'UnrealPawn'.default.bBlobShadow);
                            }
                            // End:0x502
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

function string InternalOnSaveINI(GUIComponent Sender);
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
    // End:0x2bf
    if(Sender == Controls[1])
    {
        t = "set ini:Engine.Engine.ViewportManager TextureDetail";
        // End:0x9c
        if(moComboBox(Sender).GetText() == DetailLevels[0])
        {
            V = "UltraLow";
            newDetail = 0;
        }
        // End:0x1f0
        else
        {
            // End:0xd1
            if(moComboBox(Sender).GetText() == DetailLevels[1])
            {
                V = "Low";
                newDetail = 1;
            }
            // End:0x1f0
            else
            {
                // End:0x10a
                if(moComboBox(Sender).GetText() == DetailLevels[2])
                {
                    V = "Lower";
                    newDetail = 2;
                }
                // End:0x1f0
                else
                {
                    // End:0x144
                    if(moComboBox(Sender).GetText() == DetailLevels[3])
                    {
                        V = "Normal";
                        newDetail = 3;
                    }
                    // End:0x1f0
                    else
                    {
                        // End:0x17e
                        if(moComboBox(Sender).GetText() == DetailLevels[4])
                        {
                            V = "Higher";
                            newDetail = 4;
                        }
                        // End:0x1f0
                        else
                        {
                            // End:0x1b6
                            if(moComboBox(Sender).GetText() == DetailLevels[5])
                            {
                                V = "High";
                                newDetail = 5;
                            }
                            // End:0x1f0
                            else
                            {
                                // End:0x1f0
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
        PlayerOwner().ConsoleCommand(t $ "Terrain" @ V);
        PlayerOwner().ConsoleCommand(t $ "World" @ V);
        PlayerOwner().ConsoleCommand(t $ "Rendermap" @ V);
        PlayerOwner().ConsoleCommand(t $ "Lightmap" @ V);
        PlayerOwner().ConsoleCommand("flush");
        // End:0x2b1
        if(newDetail > prevTextureDetail)
        {
            goingUp = true;
        }
        prevTextureDetail = newDetail;
    }
    // End:0xc15
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
            // End:0x49a
            else
            {
                // End:0x37b
                if(moComboBox(Sender).GetText() == DetailLevels[1])
                {
                    V = "Low";
                    newDetail = 1;
                }
                // End:0x49a
                else
                {
                    // End:0x3b4
                    if(moComboBox(Sender).GetText() == DetailLevels[2])
                    {
                        V = "Lower";
                        newDetail = 2;
                    }
                    // End:0x49a
                    else
                    {
                        // End:0x3ee
                        if(moComboBox(Sender).GetText() == DetailLevels[3])
                        {
                            V = "Normal";
                            newDetail = 3;
                        }
                        // End:0x49a
                        else
                        {
                            // End:0x428
                            if(moComboBox(Sender).GetText() == DetailLevels[4])
                            {
                                V = "Higher";
                                newDetail = 4;
                            }
                            // End:0x49a
                            else
                            {
                                // End:0x460
                                if(moComboBox(Sender).GetText() == DetailLevels[5])
                                {
                                    V = "High";
                                    newDetail = 5;
                                }
                                // End:0x49a
                                else
                                {
                                    // End:0x49a
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
            PlayerOwner().ConsoleCommand(t $ "WeaponSkin" @ V);
            PlayerOwner().ConsoleCommand(t $ "PlayerSkin" @ V);
            PlayerOwner().ConsoleCommand("flush");
            // End:0x516
            if(newDetail > prevCharDetail)
            {
                goingUp = true;
            }
            prevCharDetail = newDetail;
        }
        // End:0xc15
        else
        {
            // End:0x7e6
            if(Sender == Controls[3])
            {
                // End:0x60f
                if(moComboBox(Sender).GetText() == DetailLevels[6])
                {
                    PlayerOwner().ConsoleCommand("set ini:Engine.Engine.RenderDevice HighDetailActors True");
                    PlayerOwner().ConsoleCommand("set ini:Engine.Engine.RenderDevice SuperHighDetailActors True");
                    PlayerOwner().Level.DetailChange(2);
                    newDetail = 6;
                }
                // End:0x7c1
                else
                {
                    // End:0x6e9
                    if(moComboBox(Sender).GetText() == DetailLevels[4])
                    {
                        PlayerOwner().ConsoleCommand("set ini:Engine.Engine.RenderDevice HighDetailActors True");
                        PlayerOwner().ConsoleCommand("set ini:Engine.Engine.RenderDevice SuperHighDetailActors False");
                        PlayerOwner().Level.DetailChange(1);
                        newDetail = 4;
                    }
                    // End:0x7c1
                    else
                    {
                        // End:0x7c1
                        if(moComboBox(Sender).GetText() == DetailLevels[3])
                        {
                            PlayerOwner().ConsoleCommand("set ini:Engine.Engine.RenderDevice HighDetailActors False");
                            PlayerOwner().ConsoleCommand("set ini:Engine.Engine.RenderDevice SuperHighDetailActors False");
                            PlayerOwner().Level.DetailChange(0);
                            newDetail = 3;
                        }
                    }
                }
                // End:0x7d8
                if(newDetail > prevWorldDetail)
                {
                    goingUp = true;
                }
                prevWorldDetail = newDetail;
            }
            // End:0xc15
            else
            {
                // End:0x8ea
                if(Sender == Controls[4])
                {
                    // End:0x834
                    if(moComboBox(Sender).GetText() == DetailLevels[2])
                    {
                        PlayerOwner().Level.default.PhysicsDetailLevel = 0;
                    }
                    // End:0x8a9
                    else
                    {
                        // End:0x870
                        if(moComboBox(Sender).GetText() == DetailLevels[3])
                        {
                            PlayerOwner().Level.default.PhysicsDetailLevel = 1;
                        }
                        // End:0x8a9
                        else
                        {
                            // End:0x8a9
                            if(moComboBox(Sender).GetText() == DetailLevels[4])
                            {
                                PlayerOwner().Level.default.PhysicsDetailLevel = 2;
                            }
                        }
                    }
                    PlayerOwner().Level.PhysicsDetailLevel = PlayerOwner().Level.default.PhysicsDetailLevel;
                    PlayerOwner().Level.SaveConfig();
                }
                // End:0xc15
                else
                {
                    // End:0x997
                    if(Sender == Controls[5])
                    {
                        PlayerOwner().ConsoleCommand("set UnrealPawn bPlayerShadows " $ string(moCheckBox(Sender).IsChecked()));
                        class'UnrealPawn'.default.bPlayerShadows = moCheckBox(Sender).IsChecked();
                        class'UnrealPawn'.static.StaticSaveConfig();
                        // End:0x994
                        if(moCheckBox(Sender).IsChecked())
                        {
                            goingUp = true;
                        }
                    }
                    // End:0xc15
                    else
                    {
                        // End:0xa22
                        if(Sender == Controls[14])
                        {
                            PlayerOwner().ConsoleCommand("set UnrealPawn bBlobShadow " $ string(moCheckBox(Sender).IsChecked()));
                            class'UnrealPawn'.default.bBlobShadow = moCheckBox(Sender).IsChecked();
                            class'UnrealPawn'.static.StaticSaveConfig();
                        }
                        // End:0xc15
                        else
                        {
                            // End:0xaae
                            if(Sender == Controls[7])
                            {
                                B = moCheckBox(Sender).IsChecked();
                                B = B != true;
                                PlayerOwner().ConsoleCommand("set" @ Sender.IniOption @ string(B));
                                // End:0xaab
                                if(moCheckBox(Sender).IsChecked())
                                {
                                    goingUp = true;
                                }
                            }
                            // End:0xc15
                            else
                            {
                                // End:0xbbb
                                if(Sender == Controls[10])
                                {
                                    // End:0xaff
                                    if(moComboBox(Sender).GetText() == DetailLevels[4])
                                    {
                                        PlayerOwner().Level.default.DecalStayScale = 2.0;
                                    }
                                    // End:0xb7a
                                    else
                                    {
                                        // End:0xb3e
                                        if(moComboBox(Sender).GetText() == DetailLevels[3])
                                        {
                                            PlayerOwner().Level.default.DecalStayScale = 1.0;
                                        }
                                        // End:0xb7a
                                        else
                                        {
                                            // End:0xb7a
                                            if(moComboBox(Sender).GetText() == DetailLevels[2])
                                            {
                                                PlayerOwner().Level.default.DecalStayScale = 0.0;
                                            }
                                        }
                                    }
                                    PlayerOwner().Level.DecalStayScale = PlayerOwner().Level.default.DecalStayScale;
                                    PlayerOwner().Level.SaveConfig();
                                }
                                // End:0xc15
                                else
                                {
                                    PlayerOwner().ConsoleCommand("set" @ Sender.IniOption @ string(moCheckBox(Sender).IsChecked()));
                                    // End:0xc15
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
    // End:0xc55
    if(goingUp && !bExpert)
    {
        Controller.OpenMenu("XInterface.UT2PerformWarn");
    }
}

defaultproperties
{
    DetailLevels[0]="Lowest"
    DetailLevels[1]="Lower"
    DetailLevels[2]="Low"
    DetailLevels[3]="Normal"
    DetailLevels[4]="High"
    DetailLevels[5]="Higher"
    DetailLevels[6]="Highest"
    Controls=// Object reference not set to an instance of an object.
    
    WinTop=0.150
    WinHeight=0.740
}