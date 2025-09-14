/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTModelHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:5
 *
 *******************************************************************************/
class BTModelHK extends GUITabPanel
    editinlinenew
    instanced;

var BTROModelNew cModel;
var bool bLMouseDn;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
}

function bool Internal_OnDraw(Canvas C)
{
    // End:0x0d
    if(cModel == none)
    {
        return false;
    }
    cModel.AWinPos = self.RWinPos;
    cModel.Render(C);
    return false;
}

function bool Internal_OnKeyEvent(out byte key, out byte Action, float Delta)
{
    local int i;
    local Engine.Interactions.EInputKey iKey;
    local Engine.Interactions.EInputAction iAction;

    iKey = key;
    iAction = Action;
    // End:0x45
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
    {
        return true;
    }
    // End:0x1d29
    if(Action == 1)
    {
        switch(iKey)
        {
            // End:0x82
            case 81:
                cModel.LightPosToCenter[cModel.CurrentModifyLight] += float(1);
                return true;
            // End:0xad
            case 87:
                cModel.Roll[cModel.CurrentModifyLight] += 0.10;
                return true;
            // End:0xd6
            case 69:
                cModel.lightHeight[cModel.CurrentModifyLight] += float(1);
                return true;
            // End:0xff
            case 65:
                cModel.LightPosToCenter[cModel.CurrentModifyLight] -= float(1);
                return true;
            // End:0x12a
            case 83:
                cModel.Roll[cModel.CurrentModifyLight] -= 0.10;
                return true;
            // End:0x153
            case 68:
                cModel.lightHeight[cModel.CurrentModifyLight] -= float(1);
                return true;
            // End:0x17d
            case 90:
                cModel.lightDist[cModel.CurrentModifyLight] += float(2);
                return true;
            // End:0x1a7
            case 88:
                cModel.lightDist[cModel.CurrentModifyLight] -= float(2);
                return true;
            // End:0x2b3
            case 82:
                // End:0x23a
                if(cModel.TeamIndex == 0)
                {
                    cModel.LightColor_AF[cModel.CurrentModifyLight].R += byte(1);
                    // End:0x237
                    if(cModel.LightColor_AF[cModel.CurrentModifyLight].R > 255)
                    {
                        cModel.LightColor_AF[cModel.CurrentModifyLight].R = 0;
                    }
                }
                // End:0x2b1
                else
                {
                    cModel.LightColor_RSA[cModel.CurrentModifyLight].R += byte(1);
                    // End:0x2b1
                    if(cModel.LightColor_RSA[cModel.CurrentModifyLight].R > 255)
                    {
                        cModel.LightColor_RSA[cModel.CurrentModifyLight].R = 0;
                    }
                }
                return true;
            // End:0x3bf
            case 84:
                // End:0x346
                if(cModel.TeamIndex == 0)
                {
                    cModel.LightColor_AF[cModel.CurrentModifyLight].G += byte(1);
                    // End:0x343
                    if(cModel.LightColor_AF[cModel.CurrentModifyLight].G > 255)
                    {
                        cModel.LightColor_AF[cModel.CurrentModifyLight].G = 0;
                    }
                }
                // End:0x3bd
                else
                {
                    cModel.LightColor_RSA[cModel.CurrentModifyLight].G += byte(1);
                    // End:0x3bd
                    if(cModel.LightColor_RSA[cModel.CurrentModifyLight].G > 255)
                    {
                        cModel.LightColor_RSA[cModel.CurrentModifyLight].G = 0;
                    }
                }
                return true;
            // End:0x4cb
            case 89:
                // End:0x452
                if(cModel.TeamIndex == 0)
                {
                    cModel.LightColor_AF[cModel.CurrentModifyLight].B += byte(1);
                    // End:0x44f
                    if(cModel.LightColor_AF[cModel.CurrentModifyLight].B > 255)
                    {
                        cModel.LightColor_AF[cModel.CurrentModifyLight].B = 0;
                    }
                }
                // End:0x4c9
                else
                {
                    cModel.LightColor_RSA[cModel.CurrentModifyLight].B += byte(1);
                    // End:0x4c9
                    if(cModel.LightColor_RSA[cModel.CurrentModifyLight].B > 255)
                    {
                        cModel.LightColor_RSA[cModel.CurrentModifyLight].B = 0;
                    }
                }
                return true;
            // End:0x5d9
            case 70:
                // End:0x55f
                if(cModel.TeamIndex == 0)
                {
                    cModel.LightColor_AF[cModel.CurrentModifyLight].R -= byte(1);
                    // End:0x55c
                    if(cModel.LightColor_AF[cModel.CurrentModifyLight].R < 0)
                    {
                        cModel.LightColor_AF[cModel.CurrentModifyLight].R = byte(255);
                    }
                }
                // End:0x5d7
                else
                {
                    cModel.LightColor_RSA[cModel.CurrentModifyLight].R -= byte(1);
                    // End:0x5d7
                    if(cModel.LightColor_RSA[cModel.CurrentModifyLight].R < 0)
                    {
                        cModel.LightColor_RSA[cModel.CurrentModifyLight].R = byte(255);
                    }
                }
                return true;
            // End:0x6e7
            case 71:
                // End:0x66d
                if(cModel.TeamIndex == 0)
                {
                    cModel.LightColor_AF[cModel.CurrentModifyLight].G -= byte(1);
                    // End:0x66a
                    if(cModel.LightColor_AF[cModel.CurrentModifyLight].G < 0)
                    {
                        cModel.LightColor_AF[cModel.CurrentModifyLight].G = byte(255);
                    }
                }
                // End:0x6e5
                else
                {
                    cModel.LightColor_RSA[cModel.CurrentModifyLight].G -= byte(1);
                    // End:0x6e5
                    if(cModel.LightColor_RSA[cModel.CurrentModifyLight].G < 0)
                    {
                        cModel.LightColor_RSA[cModel.CurrentModifyLight].G = byte(255);
                    }
                }
                return true;
            // End:0x7f5
            case 72:
                // End:0x77b
                if(cModel.TeamIndex == 0)
                {
                    cModel.LightColor_AF[cModel.CurrentModifyLight].B -= byte(1);
                    // End:0x778
                    if(cModel.LightColor_AF[cModel.CurrentModifyLight].B < 0)
                    {
                        cModel.LightColor_AF[cModel.CurrentModifyLight].B = byte(255);
                    }
                }
                // End:0x7f3
                else
                {
                    cModel.LightColor_RSA[cModel.CurrentModifyLight].B -= byte(1);
                    // End:0x7f3
                    if(cModel.LightColor_RSA[cModel.CurrentModifyLight].B > 0)
                    {
                        cModel.LightColor_RSA[cModel.CurrentModifyLight].B = byte(255);
                    }
                }
                return true;
            // End:0xb0b
            case 85:
                // End:0x888
                if(cModel.TeamIndex == 0)
                {
                    cModel.LightColor_AF[cModel.CurrentModifyLight].R += byte(1);
                    // End:0x885
                    if(cModel.LightColor_AF[cModel.CurrentModifyLight].R > 255)
                    {
                        cModel.LightColor_AF[cModel.CurrentModifyLight].R = 0;
                    }
                }
                // End:0x8ff
                else
                {
                    cModel.LightColor_RSA[cModel.CurrentModifyLight].R += byte(1);
                    // End:0x8ff
                    if(cModel.LightColor_RSA[cModel.CurrentModifyLight].R > 255)
                    {
                        cModel.LightColor_RSA[cModel.CurrentModifyLight].R = 0;
                    }
                }
                // End:0x98d
                if(cModel.TeamIndex == 0)
                {
                    cModel.LightColor_AF[cModel.CurrentModifyLight].G += byte(1);
                    // End:0x98a
                    if(cModel.LightColor_AF[cModel.CurrentModifyLight].G > 255)
                    {
                        cModel.LightColor_AF[cModel.CurrentModifyLight].G = 0;
                    }
                }
                // End:0xa04
                else
                {
                    cModel.LightColor_RSA[cModel.CurrentModifyLight].G += byte(1);
                    // End:0xa04
                    if(cModel.LightColor_RSA[cModel.CurrentModifyLight].G > 255)
                    {
                        cModel.LightColor_RSA[cModel.CurrentModifyLight].G = 0;
                    }
                }
                // End:0xa92
                if(cModel.TeamIndex == 0)
                {
                    cModel.LightColor_AF[cModel.CurrentModifyLight].B += byte(1);
                    // End:0xa8f
                    if(cModel.LightColor_AF[cModel.CurrentModifyLight].B > 255)
                    {
                        cModel.LightColor_AF[cModel.CurrentModifyLight].B = 0;
                    }
                }
                // End:0xb09
                else
                {
                    cModel.LightColor_RSA[cModel.CurrentModifyLight].B += byte(1);
                    // End:0xb09
                    if(cModel.LightColor_RSA[cModel.CurrentModifyLight].B > 255)
                    {
                        cModel.LightColor_RSA[cModel.CurrentModifyLight].B = 0;
                    }
                }
                return true;
            // End:0xe27
            case 74:
                // End:0xb9f
                if(cModel.TeamIndex == 0)
                {
                    cModel.LightColor_AF[cModel.CurrentModifyLight].R -= byte(1);
                    // End:0xb9c
                    if(cModel.LightColor_AF[cModel.CurrentModifyLight].R < 0)
                    {
                        cModel.LightColor_AF[cModel.CurrentModifyLight].R = byte(255);
                    }
                }
                // End:0xc17
                else
                {
                    cModel.LightColor_RSA[cModel.CurrentModifyLight].R -= byte(1);
                    // End:0xc17
                    if(cModel.LightColor_RSA[cModel.CurrentModifyLight].R < 0)
                    {
                        cModel.LightColor_RSA[cModel.CurrentModifyLight].R = byte(255);
                    }
                }
                // End:0xca6
                if(cModel.TeamIndex == 0)
                {
                    cModel.LightColor_AF[cModel.CurrentModifyLight].G -= byte(1);
                    // End:0xca3
                    if(cModel.LightColor_AF[cModel.CurrentModifyLight].G < 0)
                    {
                        cModel.LightColor_AF[cModel.CurrentModifyLight].G = byte(255);
                    }
                }
                // End:0xd1e
                else
                {
                    cModel.LightColor_RSA[cModel.CurrentModifyLight].G -= byte(1);
                    // End:0xd1e
                    if(cModel.LightColor_RSA[cModel.CurrentModifyLight].G < 0)
                    {
                        cModel.LightColor_RSA[cModel.CurrentModifyLight].G = byte(255);
                    }
                }
                // End:0xdad
                if(cModel.TeamIndex == 0)
                {
                    cModel.LightColor_AF[cModel.CurrentModifyLight].B -= byte(1);
                    // End:0xdaa
                    if(cModel.LightColor_AF[cModel.CurrentModifyLight].B < 0)
                    {
                        cModel.LightColor_AF[cModel.CurrentModifyLight].B = byte(255);
                    }
                }
                // End:0xe25
                else
                {
                    cModel.LightColor_RSA[cModel.CurrentModifyLight].B -= byte(1);
                    // End:0xe25
                    if(cModel.LightColor_RSA[cModel.CurrentModifyLight].B < 0)
                    {
                        cModel.LightColor_RSA[cModel.CurrentModifyLight].B = byte(255);
                    }
                }
                return true;
            // End:0x14e5
            case 73:
                // End:0x14e3
                if(cModel.bModifyLight == false)
                {
                    cModel.bModifyLight = true;
                    cModel.cameraPos.X = float(PlayerOwner().ConsoleCommand("GETCONFIG_FLOAT CharacterModel CameraPosX"));
                    cModel.cameraPos.Z = float(PlayerOwner().ConsoleCommand("GETCONFIG_FLOAT CharacterModel CameraPosZ"));
                    cModel.cameraDir.X = float(PlayerOwner().ConsoleCommand("GETCONFIG_FLOAT CharacterModel CameraDirX"));
                    cModel.cameraDir.Z = float(PlayerOwner().ConsoleCommand("GETCONFIG_FLOAT CharacterModel CameraDirZ"));
                    // End:0x1098
                    if(cModel.cameraPos.X == float(0) && cModel.cameraPos.Z == float(0) && cModel.cameraDir.X == float(0) && cModel.cameraDir.Z == float(0))
                    {
                        cModel.cameraPos.X = cModel.default.cameraPos.X;
                        cModel.cameraPos.Z = cModel.default.cameraPos.Z;
                        cModel.cameraDir.X = cModel.default.cameraDir.X;
                        cModel.cameraDir.Z = cModel.default.cameraDir.Z;
                    }
                    i = 0;
                    J0x109f:
                    // End:0x14e3 [While If]
                    if(i < 5)
                    {
                        cModel.LightOnOff[i] = byte(PlayerOwner().ConsoleCommand("GETCONFIG_FLOAT CharacterModel LightOn" $ string(i)));
                        cModel.lightDist[i] = float(PlayerOwner().ConsoleCommand("GETCONFIG_FLOAT CharacterModel LightDist" $ string(i)));
                        cModel.LightPosToCenter[i] = float(PlayerOwner().ConsoleCommand("GETCONFIG_FLOAT CharacterModel LightRadius" $ string(i)));
                        cModel.Roll[i] = float(PlayerOwner().ConsoleCommand("GETCONFIG_FLOAT CharacterModel LightRoll" $ string(i)));
                        cModel.lightHeight[i] = float(PlayerOwner().ConsoleCommand("GETCONFIG_FLOAT CharacterModel LightHeight" $ string(i)));
                        cModel.LightColor_AF[i].R = byte(int(PlayerOwner().ConsoleCommand("GETCONFIG_INT CharacterModel LightColor_AF" $ string(i) $ "_Red")));
                        cModel.LightColor_AF[i].G = byte(int(PlayerOwner().ConsoleCommand("GETCONFIG_INT CharacterModel LightColor_AF" $ string(i) $ "_Green")));
                        cModel.LightColor_AF[i].B = byte(int(PlayerOwner().ConsoleCommand("GETCONFIG_INT CharacterModel LightColor_AF" $ string(i) $ "_Blue")));
                        cModel.LightColor_RSA[i].R = byte(int(PlayerOwner().ConsoleCommand("GETCONFIG_INT CharacterModel LightColor_RSA" $ string(i) $ "_Red")));
                        cModel.LightColor_RSA[i].G = byte(int(PlayerOwner().ConsoleCommand("GETCONFIG_INT CharacterModel LightColor_RSA" $ string(i) $ "_Green")));
                        cModel.LightColor_RSA[i].B = byte(int(PlayerOwner().ConsoleCommand("GETCONFIG_INT CharacterModel LightColor_RSA" $ string(i) $ "_Blue")));
                        ++ i;
                        // This is an implied JumpToken; Continue!
                        goto J0x109f;
                    }
                }
                return true;
            // End:0x1aa4
            case 75:
                // End:0x1aa2
                if(cModel.bModifyLight)
                {
                    cModel.bModifyLight = false;
                    PlayerOwner().ConsoleCommand("SETCONFIG_FLOAT CharacterModel CameraPosX" @ string(cModel.cameraPos.X));
                    PlayerOwner().ConsoleCommand("SETCONFIG_FLOAT CharacterModel CameraPosZ" @ string(cModel.cameraPos.Z));
                    PlayerOwner().ConsoleCommand("SETCONFIG_FLOAT CharacterModel CameraDirX" @ string(cModel.cameraDir.X));
                    PlayerOwner().ConsoleCommand("SETCONFIG_FLOAT CharacterModel CameraDirZ" @ string(cModel.cameraDir.Z));
                    i = 0;
                    J0x1654:
                    // End:0x1aa2 [While If]
                    if(i < 5)
                    {
                        PlayerOwner().ConsoleCommand("SETCONFIG_FLOAT CharacterModel LightOn" $ string(i) @ string(cModel.LightOnOff[i]));
                        PlayerOwner().ConsoleCommand("SETCONFIG_FLOAT CharacterModel LightDist" $ string(i) @ string(cModel.lightDist[i]));
                        PlayerOwner().ConsoleCommand("SETCONFIG_FLOAT CharacterModel LightRadius" $ string(i) @ string(cModel.LightPosToCenter[i]));
                        PlayerOwner().ConsoleCommand("SETCONFIG_FLOAT CharacterModel LightRoll" $ string(i) @ string(cModel.Roll[i]));
                        PlayerOwner().ConsoleCommand("SETCONFIG_FLOAT CharacterModel LightHeight" $ string(i) @ string(cModel.lightHeight[i]));
                        PlayerOwner().ConsoleCommand("SETCONFIG_INT CharacterModel LightColor_AF" $ string(i) $ "_Red" @ string(cModel.LightColor_AF[i].R));
                        PlayerOwner().ConsoleCommand("SETCONFIG_INT CharacterModel LightColor_AF" $ string(i) $ "_Green" @ string(cModel.LightColor_AF[i].G));
                        PlayerOwner().ConsoleCommand("SETCONFIG_INT CharacterModel LightColor_AF" $ string(i) $ "_Blue" @ string(cModel.LightColor_AF[i].B));
                        PlayerOwner().ConsoleCommand("SETCONFIG_INT CharacterModel LightColor_RSA" $ string(i) $ "_Red" @ string(cModel.LightColor_RSA[i].R));
                        PlayerOwner().ConsoleCommand("SETCONFIG_INT CharacterModel LightColor_RSA" $ string(i) $ "_Green" @ string(cModel.LightColor_RSA[i].G));
                        PlayerOwner().ConsoleCommand("SETCONFIG_INT CharacterModel LightColor_RSA" $ string(i) $ "_Blue" @ string(cModel.LightColor_RSA[i].B));
                        ++ i;
                        // This is an implied JumpToken; Continue!
                        goto J0x1654;
                    }
                }
                return true;
            // End:0x1afc
            case 49:
                // End:0x1ad7
                if(cModel.LightOnOff[0] > 0)
                {
                    cModel.LightOnOff[0] = 0;
                }
                // End:0x1aea
                else
                {
                    cModel.LightOnOff[0] = 1;
                }
                cModel.CurrentModifyLight = 0;
                return true;
            // End:0x1b54
            case 50:
                // End:0x1b2f
                if(cModel.LightOnOff[1] > 0)
                {
                    cModel.LightOnOff[1] = 0;
                }
                // End:0x1b42
                else
                {
                    cModel.LightOnOff[1] = 1;
                }
                cModel.CurrentModifyLight = 1;
                return true;
            // End:0x1bb0
            case 51:
                // End:0x1b89
                if(cModel.LightOnOff[2] > 0)
                {
                    cModel.LightOnOff[2] = 0;
                }
                // End:0x1b9d
                else
                {
                    cModel.LightOnOff[2] = 1;
                }
                cModel.CurrentModifyLight = 2;
                return true;
            // End:0x1c0c
            case 52:
                // End:0x1be5
                if(cModel.LightOnOff[3] > 0)
                {
                    cModel.LightOnOff[3] = 0;
                }
                // End:0x1bf9
                else
                {
                    cModel.LightOnOff[3] = 1;
                }
                cModel.CurrentModifyLight = 3;
                return true;
            // End:0x1c68
            case 53:
                // End:0x1c41
                if(cModel.LightOnOff[4] > 0)
                {
                    cModel.LightOnOff[4] = 0;
                }
                // End:0x1c55
                else
                {
                    cModel.LightOnOff[4] = 1;
                }
                cModel.CurrentModifyLight = 4;
                return true;
            // End:0x1c87
            case 79:
                cModel.cameraPos.Z -= float(1);
                return true;
            // End:0x1ca6
            case 80:
                cModel.cameraPos.Z += float(1);
                return true;
            // End:0x1cc5
            case 219:
                cModel.cameraPos.X += float(1);
                return true;
            // End:0x1ce4
            case 221:
                cModel.cameraPos.X -= float(1);
                return true;
            // End:0x1d05
            case 57:
                cModel.cameraDir.Z += 0.0050;
                return true;
            // End:0x1d26
            case 48:
                cModel.cameraDir.Z -= 0.0050;
                return true;
            // End:0xffff
            default:
            }
            // End:0x1d48
            if(Action == 3)
            {
                switch(iKey)
                {
                    // End:0x1d45
                    case 80:
                        return true;
                    // End:0xffff
                    default:
                    }
                    return false;
}

function InternalMousePress(GUIComponent Sender, bool bRepeat)
{
    bLMouseDn = true;
}

function InteranlMouseRelease(GUIComponent Sender)
{
    bLMouseDn = false;
}

defaultproperties
{
    OnDraw=Internal_OnDraw
    OnMousePressed=InternalMousePress
    OnMouseRelease=InteranlMouseRelease
    OnKeyEvent=Internal_OnKeyEvent
}