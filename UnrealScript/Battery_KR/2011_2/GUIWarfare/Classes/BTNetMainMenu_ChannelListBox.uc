class BTNetMainMenu_ChannelListBox extends GUIMultiColumnListBox
    editinlinenew
    instanced;

defaultproperties
{
    // Reference: BTNetMainMenu_ChannelListBoxHeader'GUIWarfare_Decompressed.BTNetMainMenu_ChannelListBox.WarfareListHeader'
    begin object name="WarfareListHeader" class=GUIWarfare_Decompressed.BTNetMainMenu_ChannelListBoxHeader
    end object
    Header=WarfareListHeader
    bDisplayHeader=false
    DefaultListClass="GUIWarfare.BTNetMainMenu_ChannelList"
}