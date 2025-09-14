class BTCMMessengerBanHK extends BTContextMenuHK
    editinlinenew
    instanced;

var localized string strContextMenuName[2];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0x42 [Loop If]
    if(i < 1)
    {
        self.AddItem(strContextMenuName[i]);
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    //return;    
}

defaultproperties
{
    strContextMenuName="??????"
}