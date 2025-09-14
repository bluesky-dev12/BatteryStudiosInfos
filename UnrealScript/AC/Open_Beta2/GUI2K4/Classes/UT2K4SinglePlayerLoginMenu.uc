class UT2K4SinglePlayerLoginMenu extends UT2K4PlayerLoginMenu
    editinlinenew
    instanced;

function AddPanels()
{
    Panels[0].ClassName = "GUI2K4.UT2K4Tab_SinglePlayerLoginControls";
    super.AddPanels();
    //return;    
}
