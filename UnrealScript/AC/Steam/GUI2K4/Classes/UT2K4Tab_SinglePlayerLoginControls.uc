/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4Tab_SinglePlayerLoginControls.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:3
 *
 *******************************************************************************/
class UT2K4Tab_SinglePlayerLoginControls extends UT2K4Tab_PlayerLoginControls
    editinlinenew
    instanced;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    b_Team.Hide();
}

function bool ButtonClicked(GUIComponent Sender)
{
    // End:0x22
    if(Sender == i_JoinRed || Sender == i_JoinBlue)
    {
        return true;
    }
    return super.ButtonClicked(Sender);
}

function SetupGroups()
{
    RemoveComponent(b_Spec);
    super.SetupGroups();
}
