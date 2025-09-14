/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPStoreHKCN.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class BTTPStoreHKCN extends BTTPStoreHK
    editinlinenew
    instanced;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local export editinline GUITabPanel serverTP;
    local FloatBox fb;
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    i = 0;
    J0x17:
    // End:0x115 [While If]
    if(i < 1)
    {
        // End:0x47
        if(i == 0)
        {
            TPWeapon = new class'BTTPStoreWeaponHKCN';
            serverTP = TPWeapon;
        }
        serverTP.bUseAWinPos = true;
        fb.X1 = AWinPos.X1;
        fb.Y1 = AWinPos.Y1 + float(23);
        fb.X2 = AWinPos.X2;
        fb.Y2 = AWinPos.Y2;
        serverTP.AWinPos = fb;
        serverTP.RenderWeight = 0.50;
        serverTP.InitComponent(Controller, self);
        AppendComponent(serverTP);
        TPInven[i] = serverTP;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
    CharacterModel = Controller.ViewportOwner.Actor.Level.Spawn(class'BTROModelNew');
    CharacterModel.Init();
    CharacterModel.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(17.0, 117.0, 330.0, 500.0);
    CharacterModel.cameraPos.X = -340.0;
    CharacterModel.cameraPos.Y = 15.0;
    CharacterModel.cameraPos.Z = 2.50;
    TPWeapon.CharacterModel = CharacterModel;
    TabControl.SetVisiblePanel(0);
}

defaultproperties
{
    TabControl=mTabControl
}