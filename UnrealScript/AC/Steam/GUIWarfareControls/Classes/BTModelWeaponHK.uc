/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTModelWeaponHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:3
 *
 *******************************************************************************/
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
}

function bool Internal_OnDraw(Canvas C)
{
    local float Delta;

    // End:0x0d
    if(cModel == none)
    {
        return false;
    }
    // End:0x1b
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
    return false;
}

function bool Internal_OnKeyEvent(out byte key, out byte Action, float Delta)
{
    local Engine.Interactions.EInputKey iKey;
    local Engine.Interactions.EInputAction iAction;

    iKey = key;
    iAction = Action;
    PlayerOwner().dblog("BTModelWeaponHK KeyEvent=" @ string(iKey));
    // End:0xa8
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() && Controller.ViewportOwner.Actor.Level.bServiceBuildHK == false)
    {
        return true;
    }
    // End:0x4fd
    if(Action == 1)
    {
        switch(iKey)
        {
            // End:0xdb
            case 81:
                cModel.cameraPosAdd.X += float(1);
                return true;
            // End:0xfa
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
            // End:0x1b2
            case 70:
                cModel.pawnRotAdd.Yaw -= 200;
                return true;
            // End:0x1d2
            case 84:
                cModel.lightDist.X += float(10);
                return true;
            // End:0x226
            case 71:
                cModel.lightDist.X -= float(10);
                // End:0x224
                if(cModel.lightDist.X < float(0))
                {
                    cModel.lightDist.X = 0.0;
                }
                return true;
            // End:0x246
            case 89:
                cModel.lightDist.Y += float(10);
                return true;
            // End:0x29a
            case 72:
                cModel.lightDist.Y -= float(10);
                // End:0x298
                if(cModel.lightDist.Y < float(0))
                {
                    cModel.lightDist.Y = 0.0;
                }
                return true;
            // End:0x2ba
            case 85:
                cModel.lightDist.Z += float(10);
                return true;
            // End:0x30e
            case 74:
                cModel.lightDist.Z -= float(10);
                // End:0x30c
                if(cModel.lightDist.Z < float(0))
                {
                    cModel.lightDist.Z = 0.0;
                }
                return true;
            // End:0x32f
            case 90:
                cModel.lightAngle.X += 0.050;
                return true;
            // End:0x350
            case 88:
                cModel.lightAngle.X -= 0.050;
                return true;
            // End:0x371
            case 67:
                cModel.lightAngle.Y += 0.050;
                return true;
            // End:0x392
            case 86:
                cModel.lightAngle.Y -= 0.050;
                return true;
            // End:0x3b3
            case 66:
                cModel.lightAngle.Z += 0.050;
                return true;
            // End:0x3d4
            case 78:
                cModel.lightAngle.Z -= 0.050;
                return true;
            // End:0x3ea
            case 73:
                cModel.BeginModel();
                return true;
            // End:0x400
            case 75:
                cModel.EndModel();
                return true;
            // End:0x41c
            case 79:
                cModel.FOV += 1.0;
                return true;
            // End:0x438
            case 76:
                cModel.FOV -= 1.0;
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
                // End:0x4fd
                break;
            // End:0x4b9
            case 52:
                cModel.lightHeight.Y -= float(10);
                return true;
            // End:0x4da
            case 53:
                cModel.lightHeight.Z += float(10);
                // End:0x4fd
                break;
            // End:0x4fa
            case 54:
                cModel.lightHeight.Z -= float(10);
                return true;
            // End:0xffff
            default:
            }
            // End:0x7a4
            if(Action == 3)
            {
                switch(iKey)
                {
                    // End:0x7a1
                    case 80:
                        PlayerOwner().dblog("(" $ string(cModel.cameraPos.X + cModel.cameraPosAdd.X) $ ", " $ string(cModel.cameraPos.Y + cModel.cameraPosAdd.Y) $ ", " $ string(cModel.cameraPos.Z + cModel.cameraPosAdd.Z) $ ") (" $ string(cModel.PawnRot.Pitch + cModel.pawnRotAdd.Pitch) $ ", " $ string(cModel.PawnRot.Yaw + cModel.pawnRotAdd.Yaw) $ ", " $ string(cModel.PawnRot.Roll + cModel.pawnRotAdd.Roll) $ ")");
                        LogStr = "(" $ string(cModel.cameraPos.X + cModel.cameraPosAdd.X) $ ", " $ string(cModel.cameraPos.Y + cModel.cameraPosAdd.Y) $ ", " $ string(cModel.cameraPos.Z + cModel.cameraPosAdd.Z) $ ") (" $ string(cModel.PawnRot.Pitch + cModel.pawnRotAdd.Pitch) $ ", " $ string(cModel.PawnRot.Yaw + cModel.pawnRotAdd.Yaw) $ ", " $ string(cModel.PawnRot.Roll + cModel.pawnRotAdd.Roll) $ ") fov=" $ string(cModel.FOV);
                        return true;
                    // End:0xffff
                    default:
                    }
                    return false;
}

defaultproperties
{
    OnDraw=Internal_OnDraw
    OnKeyEvent=Internal_OnKeyEvent
}