class UT2K4Tab_SinglePlayerLoginControls extends UT2K4Tab_PlayerLoginControls
    editinlinenew
    instanced;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    b_Team.Hide();
    //return;    
}

function bool ButtonClicked(GUIComponent Sender)
{
    // End:0x22
    if((Sender == i_JoinRed) || Sender == i_JoinBlue)
    {
        return true;
    }
    return super.ButtonClicked(Sender);
    //return;    
}

function SetupGroups()
{
    RemoveComponent(b_Spec);
    super.SetupGroups();
    //return;    
}
