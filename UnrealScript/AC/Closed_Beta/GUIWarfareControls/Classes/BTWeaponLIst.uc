class BTWeaponLIst extends BTContextMenuHK
    editinlinenew
    instanced;

var localized string strContextMenuName[9];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    self.AddItem("Total Weapone");
    self.AddItem("Main Weapone");
    self.AddItem("Sub Weapone");
    //return;    
}
