class BTCMMessengerClanHK extends BTCMMessengerOnOffline
    editinlinenew
    instanced;

var localized string strContextMenuName[5];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(BTContextMenuHK).InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0x43 [Loop If]
    if(i < 5)
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
    strContextMenuName[0]="Detailed Info"
    strContextMenuName[1]="Clan Info"
    strContextMenuName[2]="Whisper"
    strContextMenuName[3]="Follow"
    strContextMenuName[4]="Invite to Game"
}