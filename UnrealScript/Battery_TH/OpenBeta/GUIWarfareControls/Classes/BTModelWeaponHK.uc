class BTModelWeaponHK extends GUITabPanel
    editinlinenew
    instanced;

var string LogStr;
var float CurrentTime;
var float LastTime;
var BTROModelWeapon cModel;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    //return;    
}

function bool Internal_OnDraw(Canvas C)
{
    local float Delta;

    // End:0x0D
    if(cModel == none)
    {
        return false;
    }
    // End:0x1B
    if(bVisible == false)
    {
        return false;
    }
    C.Style = 1;
    cModel.AWinPos = self.RWinPos;
    CurrentTime = PlayerOwner().Level.TimeSeconds;
    Delta = CurrentTime - LastTime;
    LastTime = CurrentTime;
    cModel.Render(C, Delta);
    C.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite();
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, "C" @ LogStr, 0, 10.0000000, 10.0000000, 10.0000000, 300.0000000, 150.0000000);
    return false;
    //return;    
}

function bool Internal_OnKeyEvent(out byte key, out byte Action, float Delta)
{
    local Interactions.EInputKey iKey;
    local Interactions.EInputAction iAction;

    iKey = key;
    iAction = Action;
    PlayerOwner().dblog("BTModelWeaponHK KeyEvent=" @ string(iKey));
    // End:0xA8
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() && Controller.ViewportOwner.Actor.Level.bServiceBuildHK == false)
    {
        return true;
    }
    // End:0x4FD
    if(int(Action) == 1)
    {
        switch(iKey)
        {
            // End:0xDB
            case 81:
                cModel.cameraPosAdd.X += float(1);
                return true;
            // End:0xFA
            case 65:
                cModel.cameraPosAdd.X -= float(1);
                return true;
            // End:0x119
            case 87:
                cModel.cameraPosAdd.Y += float(1);
                return true;
            // End:0x138
            case 83:
                cModel.cameraPosAdd.Y -= float(1);
                return true;
            // End:0x157
            case 69:
                cModel.cameraPosAdd.Z += float(1);
                return true;
            // End:0x176
            case 68:
                cModel.cameraPosAdd.Z -= float(1);
                return true;
            // End:0x194
            case 82:
                cModel.pawnRotAdd.Yaw += 200;
                return true;
            // End:0x1B2
            case 70:
                cModel.pawnRotAdd.Yaw -= 200;
                return true;
            // End:0x1D2
            case 84:
                cModel.lightDist.X += float(10);
                return true;
            // End:0x226
            case 71:
                cModel.lightDist.X -= float(10);
                // End:0x224
                if(cModel.lightDist.X < float(0))
                {
                    cModel.lightDist.X = 0.0000000;
                }
                return true;
            // End:0x246
            case 89:
                cModel.lightDist.Y += float(10);
                return true;
            // End:0x29A
            case 72:
                cModel.lightDist.Y -= float(10);
                // End:0x298
                if(cModel.lightDist.Y < float(0))
                {
                    cModel.lightDist.Y = 0.0000000;
                }
                return true;
            // End:0x2BA
            case 85:
                cModel.lightDist.Z += float(10);
                return true;
            // End:0x30E
            case 74:
                cModel.lightDist.Z -= float(10);
                // End:0x30C
                if(cModel.lightDist.Z < float(0))
                {
                    cModel.lightDist.Z = 0.0000000;
                }
                return true;
            // End:0x32F
            case 90:
                cModel.lightAngle.X += 0.0500000;
                return true;
            // End:0x350
            case 88:
                cModel.lightAngle.X -= 0.0500000;
                return true;
            // End:0x371
            case 67:
                cModel.lightAngle.Y += 0.0500000;
                return true;
            // End:0x392
            case 86:
                cModel.lightAngle.Y -= 0.0500000;
                return true;
            // End:0x3B3
            case 66:
                cModel.lightAngle.Z += 0.0500000;
                return true;
            // End:0x3D4
            case 78:
                cModel.lightAngle.Z -= 0.0500000;
                return true;
            // End:0x3EA
            case 73:
                cModel.BeginModel();
                return true;
            // End:0x400
            case 75:
                cModel.EndModel();
                return true;
            // End:0x41C
            case 79:
                cModel.FOV += 1.0000000;
                return true;
            // End:0x438
            case 76:
                cModel.FOV -= 1.0000000;
                return true;
            // End:0x458
            case 49:
                cModel.lightHeight.X += float(10);
                return true;
            // End:0x478
            case 50:
                cModel.lightHeight.X -= float(10);
                return true;
            // End:0x499
            case 51:
                cModel.lightHeight.Y += float(10);
                // End:0x4FD
                break;
            // End:0x4B9
            case 52:
                cModel.lightHeight.Y -= float(10);
                return true;
            // End:0x4DA
            case 53:
                cModel.lightHeight.Z += float(10);
                // End:0x4FD
                break;
            // End:0x4FA
            case 54:
                cModel.lightHeight.Z -= float(10);
                return true;
            // End:0xFFFF
            default:
                break;
        }
    }
    else
    {
        // End:0x7A4
        if(int(Action) == 3)
        {
            switch(iKey)
            {
                // End:0x7A1
                case 80:
                    PlayerOwner().dblog(((((((((((("(" $ string(cModel.cameraPos.X + cModel.cameraPosAdd.X)) $ ", ") $ string(cModel.cameraPos.Y + cModel.cameraPosAdd.Y)) $ ", ") $ string(cModel.cameraPos.Z + cModel.cameraPosAdd.Z)) $ ") (") $ string(cModel.PawnRot.Pitch + cModel.pawnRotAdd.Pitch)) $ ", ") $ string(cModel.PawnRot.Yaw + cModel.pawnRotAdd.Yaw)) $ ", ") $ string(cModel.PawnRot.Roll + cModel.pawnRotAdd.Roll)) $ ")");
                    LogStr = (((((((((((("(" $ string(cModel.cameraPos.X + cModel.cameraPosAdd.X)) $ ", ") $ string(cModel.cameraPos.Y + cModel.cameraPosAdd.Y)) $ ", ") $ string(cModel.cameraPos.Z + cModel.cameraPosAdd.Z)) $ ") (") $ string(cModel.PawnRot.Pitch + cModel.pawnRotAdd.Pitch)) $ ", ") $ string(cModel.PawnRot.Yaw + cModel.pawnRotAdd.Yaw)) $ ", ") $ string(cModel.PawnRot.Roll + cModel.pawnRotAdd.Roll)) $ ") fov=") $ string(cModel.FOV);
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

defaultproperties
{
    OnDraw=BTModelWeaponHK.Internal_OnDraw
    OnKeyEvent=BTModelWeaponHK.Internal_OnKeyEvent
}