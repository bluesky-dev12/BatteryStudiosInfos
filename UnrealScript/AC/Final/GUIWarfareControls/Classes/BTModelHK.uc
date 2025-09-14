class BTModelHK extends GUITabPanel
    editinlinenew
    instanced;

var BTROModelNew cModel;
var bool bLMouseDn;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    //return;    
}

function bool Internal_OnDraw(Canvas C)
{
    // End:0x0D
    if(cModel == none)
    {
        return false;
    }
    cModel.AWinPos = self.RWinPos;
    cModel.Render(C);
    return false;
    //return;    
}

function bool Internal_OnKeyEvent(out byte key, out byte Action, float Delta)
{
    local int i;
    local Interactions.EInputKey iKey;
    local Interactions.EInputAction iAction;

    iKey = key;
    iAction = Action;
    // End:0x45
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
    {
        return true;
    }
    // End:0x1D29
    if(int(Action) == 1)
    {
        switch(iKey)
        {
            // End:0x82
            case 81:
                cModel.LightPosToCenter[cModel.CurrentModifyLight] += float(1);
                return true;
            // End:0xAD
            case 87:
                cModel.Roll[cModel.CurrentModifyLight] += 0.1000000;
                return true;
            // End:0xD6
            case 69:
                cModel.lightHeight[cModel.CurrentModifyLight] += float(1);
                return true;
            // End:0xFF
            case 65:
                cModel.LightPosToCenter[cModel.CurrentModifyLight] -= float(1);
                return true;
            // End:0x12A
            case 83:
                cModel.Roll[cModel.CurrentModifyLight] -= 0.1000000;
                return true;
            // End:0x153
            case 68:
                cModel.lightHeight[cModel.CurrentModifyLight] -= float(1);
                return true;
            // End:0x17D
            case 90:
                cModel.lightDist[cModel.CurrentModifyLight] += float(2);
                return true;
            // End:0x1A7
            case 88:
                cModel.lightDist[cModel.CurrentModifyLight] -= float(2);
                return true;
            // End:0x2B3
            case 82:
                // End:0x23A
                if(cModel.TeamIndex == 0)
                {
                    cModel.LightColor_AF[cModel.CurrentModifyLight].R += byte(1);
                    // End:0x237
                    if(int(cModel.LightColor_AF[cModel.CurrentModifyLight].R) > 255)
                    {
                        cModel.LightColor_AF[cModel.CurrentModifyLight].R = 0;
                    }                    
                }
                else
                {
                    cModel.LightColor_RSA[cModel.CurrentModifyLight].R += byte(1);
                    // End:0x2B1
                    if(int(cModel.LightColor_RSA[cModel.CurrentModifyLight].R) > 255)
                    {
                        cModel.LightColor_RSA[cModel.CurrentModifyLight].R = 0;
                    }
                }
                return true;
            // End:0x3BF
            case 84:
                // End:0x346
                if(cModel.TeamIndex == 0)
                {
                    cModel.LightColor_AF[cModel.CurrentModifyLight].G += byte(1);
                    // End:0x343
                    if(int(cModel.LightColor_AF[cModel.CurrentModifyLight].G) > 255)
                    {
                        cModel.LightColor_AF[cModel.CurrentModifyLight].G = 0;
                    }                    
                }
                else
                {
                    cModel.LightColor_RSA[cModel.CurrentModifyLight].G += byte(1);
                    // End:0x3BD
                    if(int(cModel.LightColor_RSA[cModel.CurrentModifyLight].G) > 255)
                    {
                        cModel.LightColor_RSA[cModel.CurrentModifyLight].G = 0;
                    }
                }
                return true;
            // End:0x4CB
            case 89:
                // End:0x452
                if(cModel.TeamIndex == 0)
                {
                    cModel.LightColor_AF[cModel.CurrentModifyLight].B += byte(1);
                    // End:0x44F
                    if(int(cModel.LightColor_AF[cModel.CurrentModifyLight].B) > 255)
                    {
                        cModel.LightColor_AF[cModel.CurrentModifyLight].B = 0;
                    }                    
                }
                else
                {
                    cModel.LightColor_RSA[cModel.CurrentModifyLight].B += byte(1);
                    // End:0x4C9
                    if(int(cModel.LightColor_RSA[cModel.CurrentModifyLight].B) > 255)
                    {
                        cModel.LightColor_RSA[cModel.CurrentModifyLight].B = 0;
                    }
                }
                return true;
            // End:0x5D9
            case 70:
                // End:0x55F
                if(cModel.TeamIndex == 0)
                {
                    cModel.LightColor_AF[cModel.CurrentModifyLight].R -= byte(1);
                    // End:0x55C
                    if(int(cModel.LightColor_AF[cModel.CurrentModifyLight].R) < 0)
                    {
                        cModel.LightColor_AF[cModel.CurrentModifyLight].R = byte(255);
                    }                    
                }
                else
                {
                    cModel.LightColor_RSA[cModel.CurrentModifyLight].R -= byte(1);
                    // End:0x5D7
                    if(int(cModel.LightColor_RSA[cModel.CurrentModifyLight].R) < 0)
                    {
                        cModel.LightColor_RSA[cModel.CurrentModifyLight].R = byte(255);
                    }
                }
                return true;
            // End:0x6E7
            case 71:
                // End:0x66D
                if(cModel.TeamIndex == 0)
                {
                    cModel.LightColor_AF[cModel.CurrentModifyLight].G -= byte(1);
                    // End:0x66A
                    if(int(cModel.LightColor_AF[cModel.CurrentModifyLight].G) < 0)
                    {
                        cModel.LightColor_AF[cModel.CurrentModifyLight].G = byte(255);
                    }                    
                }
                else
                {
                    cModel.LightColor_RSA[cModel.CurrentModifyLight].G -= byte(1);
                    // End:0x6E5
                    if(int(cModel.LightColor_RSA[cModel.CurrentModifyLight].G) < 0)
                    {
                        cModel.LightColor_RSA[cModel.CurrentModifyLight].G = byte(255);
                    }
                }
                return true;
            // End:0x7F5
            case 72:
                // End:0x77B
                if(cModel.TeamIndex == 0)
                {
                    cModel.LightColor_AF[cModel.CurrentModifyLight].B -= byte(1);
                    // End:0x778
                    if(int(cModel.LightColor_AF[cModel.CurrentModifyLight].B) < 0)
                    {
                        cModel.LightColor_AF[cModel.CurrentModifyLight].B = byte(255);
                    }                    
                }
                else
                {
                    cModel.LightColor_RSA[cModel.CurrentModifyLight].B -= byte(1);
                    // End:0x7F3
                    if(int(cModel.LightColor_RSA[cModel.CurrentModifyLight].B) > 0)
                    {
                        cModel.LightColor_RSA[cModel.CurrentModifyLight].B = byte(255);
                    }
                }
                return true;
            // End:0xB0B
            case 85:
                // End:0x888
                if(cModel.TeamIndex == 0)
                {
                    cModel.LightColor_AF[cModel.CurrentModifyLight].R += byte(1);
                    // End:0x885
                    if(int(cModel.LightColor_AF[cModel.CurrentModifyLight].R) > 255)
                    {
                        cModel.LightColor_AF[cModel.CurrentModifyLight].R = 0;
                    }                    
                }
                else
                {
                    cModel.LightColor_RSA[cModel.CurrentModifyLight].R += byte(1);
                    // End:0x8FF
                    if(int(cModel.LightColor_RSA[cModel.CurrentModifyLight].R) > 255)
                    {
                        cModel.LightColor_RSA[cModel.CurrentModifyLight].R = 0;
                    }
                }
                // End:0x98D
                if(cModel.TeamIndex == 0)
                {
                    cModel.LightColor_AF[cModel.CurrentModifyLight].G += byte(1);
                    // End:0x98A
                    if(int(cModel.LightColor_AF[cModel.CurrentModifyLight].G) > 255)
                    {
                        cModel.LightColor_AF[cModel.CurrentModifyLight].G = 0;
                    }                    
                }
                else
                {
                    cModel.LightColor_RSA[cModel.CurrentModifyLight].G += byte(1);
                    // End:0xA04
                    if(int(cModel.LightColor_RSA[cModel.CurrentModifyLight].G) > 255)
                    {
                        cModel.LightColor_RSA[cModel.CurrentModifyLight].G = 0;
                    }
                }
                // End:0xA92
                if(cModel.TeamIndex == 0)
                {
                    cModel.LightColor_AF[cModel.CurrentModifyLight].B += byte(1);
                    // End:0xA8F
                    if(int(cModel.LightColor_AF[cModel.CurrentModifyLight].B) > 255)
                    {
                        cModel.LightColor_AF[cModel.CurrentModifyLight].B = 0;
                    }                    
                }
                else
                {
                    cModel.LightColor_RSA[cModel.CurrentModifyLight].B += byte(1);
                    // End:0xB09
                    if(int(cModel.LightColor_RSA[cModel.CurrentModifyLight].B) > 255)
                    {
                        cModel.LightColor_RSA[cModel.CurrentModifyLight].B = 0;
                    }
                }
                return true;
            // End:0xE27
            case 74:
                // End:0xB9F
                if(cModel.TeamIndex == 0)
                {
                    cModel.LightColor_AF[cModel.CurrentModifyLight].R -= byte(1);
                    // End:0xB9C
                    if(int(cModel.LightColor_AF[cModel.CurrentModifyLight].R) < 0)
                    {
                        cModel.LightColor_AF[cModel.CurrentModifyLight].R = byte(255);
                    }                    
                }
                else
                {
                    cModel.LightColor_RSA[cModel.CurrentModifyLight].R -= byte(1);
                    // End:0xC17
                    if(int(cModel.LightColor_RSA[cModel.CurrentModifyLight].R) < 0)
                    {
                        cModel.LightColor_RSA[cModel.CurrentModifyLight].R = byte(255);
                    }
                }
                // End:0xCA6
                if(cModel.TeamIndex == 0)
                {
                    cModel.LightColor_AF[cModel.CurrentModifyLight].G -= byte(1);
                    // End:0xCA3
                    if(int(cModel.LightColor_AF[cModel.CurrentModifyLight].G) < 0)
                    {
                        cModel.LightColor_AF[cModel.CurrentModifyLight].G = byte(255);
                    }                    
                }
                else
                {
                    cModel.LightColor_RSA[cModel.CurrentModifyLight].G -= byte(1);
                    // End:0xD1E
                    if(int(cModel.LightColor_RSA[cModel.CurrentModifyLight].G) < 0)
                    {
                        cModel.LightColor_RSA[cModel.CurrentModifyLight].G = byte(255);
                    }
                }
                // End:0xDAD
                if(cModel.TeamIndex == 0)
                {
                    cModel.LightColor_AF[cModel.CurrentModifyLight].B -= byte(1);
                    // End:0xDAA
                    if(int(cModel.LightColor_AF[cModel.CurrentModifyLight].B) < 0)
                    {
                        cModel.LightColor_AF[cModel.CurrentModifyLight].B = byte(255);
                    }                    
                }
                else
                {
                    cModel.LightColor_RSA[cModel.CurrentModifyLight].B -= byte(1);
                    // End:0xE25
                    if(int(cModel.LightColor_RSA[cModel.CurrentModifyLight].B) < 0)
                    {
                        cModel.LightColor_RSA[cModel.CurrentModifyLight].B = byte(255);
                    }
                }
                return true;
            // End:0x14E5
            case 73:
                // End:0x14E3
                if(cModel.bModifyLight == false)
                {
                    cModel.bModifyLight = true;
                    cModel.cameraPos.X = float(PlayerOwner().ConsoleCommand("GETCONFIG_FLOAT CharacterModel CameraPosX"));
                    cModel.cameraPos.Z = float(PlayerOwner().ConsoleCommand("GETCONFIG_FLOAT CharacterModel CameraPosZ"));
                    cModel.cameraDir.X = float(PlayerOwner().ConsoleCommand("GETCONFIG_FLOAT CharacterModel CameraDirX"));
                    cModel.cameraDir.Z = float(PlayerOwner().ConsoleCommand("GETCONFIG_FLOAT CharacterModel CameraDirZ"));
                    // End:0x1098
                    if((((cModel.cameraPos.X == float(0)) && cModel.cameraPos.Z == float(0)) && cModel.cameraDir.X == float(0)) && cModel.cameraDir.Z == float(0))
                    {
                        cModel.cameraPos.X = cModel.default.cameraPos.X;
                        cModel.cameraPos.Z = cModel.default.cameraPos.Z;
                        cModel.cameraDir.X = cModel.default.cameraDir.X;
                        cModel.cameraDir.Z = cModel.default.cameraDir.Z;
                    }
                    i = 0;
                    J0x109F:

                    // End:0x14E3 [Loop If]
                    if(i < 5)
                    {
                        cModel.LightOnOff[i] = byte(PlayerOwner().ConsoleCommand("GETCONFIG_FLOAT CharacterModel LightOn" $ string(i)));
                        cModel.lightDist[i] = float(PlayerOwner().ConsoleCommand("GETCONFIG_FLOAT CharacterModel LightDist" $ string(i)));
                        cModel.LightPosToCenter[i] = float(PlayerOwner().ConsoleCommand("GETCONFIG_FLOAT CharacterModel LightRadius" $ string(i)));
                        cModel.Roll[i] = float(PlayerOwner().ConsoleCommand("GETCONFIG_FLOAT CharacterModel LightRoll" $ string(i)));
                        cModel.lightHeight[i] = float(PlayerOwner().ConsoleCommand("GETCONFIG_FLOAT CharacterModel LightHeight" $ string(i)));
                        cModel.LightColor_AF[i].R = byte(int(PlayerOwner().ConsoleCommand(("GETCONFIG_INT CharacterModel LightColor_AF" $ string(i)) $ "_Red")));
                        cModel.LightColor_AF[i].G = byte(int(PlayerOwner().ConsoleCommand(("GETCONFIG_INT CharacterModel LightColor_AF" $ string(i)) $ "_Green")));
                        cModel.LightColor_AF[i].B = byte(int(PlayerOwner().ConsoleCommand(("GETCONFIG_INT CharacterModel LightColor_AF" $ string(i)) $ "_Blue")));
                        cModel.LightColor_RSA[i].R = byte(int(PlayerOwner().ConsoleCommand(("GETCONFIG_INT CharacterModel LightColor_RSA" $ string(i)) $ "_Red")));
                        cModel.LightColor_RSA[i].G = byte(int(PlayerOwner().ConsoleCommand(("GETCONFIG_INT CharacterModel LightColor_RSA" $ string(i)) $ "_Green")));
                        cModel.LightColor_RSA[i].B = byte(int(PlayerOwner().ConsoleCommand(("GETCONFIG_INT CharacterModel LightColor_RSA" $ string(i)) $ "_Blue")));
                        i++;
                        // [Loop Continue]
                        goto J0x109F;
                    }
                }
                return true;
            // End:0x1AA4
            case 75:
                // End:0x1AA2
                if(cModel.bModifyLight)
                {
                    cModel.bModifyLight = false;
                    PlayerOwner().ConsoleCommand("SETCONFIG_FLOAT CharacterModel CameraPosX" @ string(cModel.cameraPos.X));
                    PlayerOwner().ConsoleCommand("SETCONFIG_FLOAT CharacterModel CameraPosZ" @ string(cModel.cameraPos.Z));
                    PlayerOwner().ConsoleCommand("SETCONFIG_FLOAT CharacterModel CameraDirX" @ string(cModel.cameraDir.X));
                    PlayerOwner().ConsoleCommand("SETCONFIG_FLOAT CharacterModel CameraDirZ" @ string(cModel.cameraDir.Z));
                    i = 0;
                    J0x1654:

                    // End:0x1AA2 [Loop If]
                    if(i < 5)
                    {
                        PlayerOwner().ConsoleCommand(("SETCONFIG_FLOAT CharacterModel LightOn" $ string(i)) @ string(cModel.LightOnOff[i]));
                        PlayerOwner().ConsoleCommand(("SETCONFIG_FLOAT CharacterModel LightDist" $ string(i)) @ string(cModel.lightDist[i]));
                        PlayerOwner().ConsoleCommand(("SETCONFIG_FLOAT CharacterModel LightRadius" $ string(i)) @ string(cModel.LightPosToCenter[i]));
                        PlayerOwner().ConsoleCommand(("SETCONFIG_FLOAT CharacterModel LightRoll" $ string(i)) @ string(cModel.Roll[i]));
                        PlayerOwner().ConsoleCommand(("SETCONFIG_FLOAT CharacterModel LightHeight" $ string(i)) @ string(cModel.lightHeight[i]));
                        PlayerOwner().ConsoleCommand((("SETCONFIG_INT CharacterModel LightColor_AF" $ string(i)) $ "_Red") @ string(cModel.LightColor_AF[i].R));
                        PlayerOwner().ConsoleCommand((("SETCONFIG_INT CharacterModel LightColor_AF" $ string(i)) $ "_Green") @ string(cModel.LightColor_AF[i].G));
                        PlayerOwner().ConsoleCommand((("SETCONFIG_INT CharacterModel LightColor_AF" $ string(i)) $ "_Blue") @ string(cModel.LightColor_AF[i].B));
                        PlayerOwner().ConsoleCommand((("SETCONFIG_INT CharacterModel LightColor_RSA" $ string(i)) $ "_Red") @ string(cModel.LightColor_RSA[i].R));
                        PlayerOwner().ConsoleCommand((("SETCONFIG_INT CharacterModel LightColor_RSA" $ string(i)) $ "_Green") @ string(cModel.LightColor_RSA[i].G));
                        PlayerOwner().ConsoleCommand((("SETCONFIG_INT CharacterModel LightColor_RSA" $ string(i)) $ "_Blue") @ string(cModel.LightColor_RSA[i].B));
                        i++;
                        // [Loop Continue]
                        goto J0x1654;
                    }
                }
                return true;
            // End:0x1AFC
            case 49:
                // End:0x1AD7
                if(int(cModel.LightOnOff[0]) > 0)
                {
                    cModel.LightOnOff[0] = 0;                    
                }
                else
                {
                    cModel.LightOnOff[0] = 1;
                }
                cModel.CurrentModifyLight = 0;
                return true;
            // End:0x1B54
            case 50:
                // End:0x1B2F
                if(int(cModel.LightOnOff[1]) > 0)
                {
                    cModel.LightOnOff[1] = 0;                    
                }
                else
                {
                    cModel.LightOnOff[1] = 1;
                }
                cModel.CurrentModifyLight = 1;
                return true;
            // End:0x1BB0
            case 51:
                // End:0x1B89
                if(int(cModel.LightOnOff[2]) > 0)
                {
                    cModel.LightOnOff[2] = 0;                    
                }
                else
                {
                    cModel.LightOnOff[2] = 1;
                }
                cModel.CurrentModifyLight = 2;
                return true;
            // End:0x1C0C
            case 52:
                // End:0x1BE5
                if(int(cModel.LightOnOff[3]) > 0)
                {
                    cModel.LightOnOff[3] = 0;                    
                }
                else
                {
                    cModel.LightOnOff[3] = 1;
                }
                cModel.CurrentModifyLight = 3;
                return true;
            // End:0x1C68
            case 53:
                // End:0x1C41
                if(int(cModel.LightOnOff[4]) > 0)
                {
                    cModel.LightOnOff[4] = 0;                    
                }
                else
                {
                    cModel.LightOnOff[4] = 1;
                }
                cModel.CurrentModifyLight = 4;
                return true;
            // End:0x1C87
            case 79:
                cModel.cameraPos.Z -= float(1);
                return true;
            // End:0x1CA6
            case 80:
                cModel.cameraPos.Z += float(1);
                return true;
            // End:0x1CC5
            case 219:
                cModel.cameraPos.X += float(1);
                return true;
            // End:0x1CE4
            case 221:
                cModel.cameraPos.X -= float(1);
                return true;
            // End:0x1D05
            case 57:
                cModel.cameraDir.Z += 0.0050000;
                return true;
            // End:0x1D26
            case 48:
                cModel.cameraDir.Z -= 0.0050000;
                return true;
            // End:0xFFFF
            default:
                break;
            }
    }
    else
    {
        // End:0x1D48
        if(int(Action) == 3)
        {
            switch(iKey)
            {
                // End:0x1D45
                case 80:
                    return true;
                // End:0xFFFF
                default:
                    break;
                }
        }
        else
        {
            return false;
            //return;            
        }
    }
}

function InternalMousePress(GUIComponent Sender, bool bRepeat)
{
    bLMouseDn = true;
    //return;    
}

function InteranlMouseRelease(GUIComponent Sender)
{
    bLMouseDn = false;
    //return;    
}

defaultproperties
{
    OnDraw=BTModelHK.Internal_OnDraw
    OnMousePressed=BTModelHK.InternalMousePress
    OnMouseRelease=BTModelHK.InteranlMouseRelease
    OnKeyEvent=BTModelHK.Internal_OnKeyEvent
}