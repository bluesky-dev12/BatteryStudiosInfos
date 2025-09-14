class BTContextMenuUser extends GUIContextMenu
    editinlinenew
    instanced;

var localized string Caption_MigrateHost;
var localized string Caption_DetailedInfo;
var localized string Caption_Whisper;
var localized string Caption_AddToFriends;
var localized string Caption_JoinClan;
var localized string Caption_ClanInfo;
var bool bLocalizedStringsAreApplied;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    ApplyLocalizedStrings();
    super(GUIComponent).InitComponent(MyController, myOwner);
    //return;    
}

function ApplyLocalizedStrings()
{
    bLocalizedStringsAreApplied = true;
    ContextItems[0] = Caption_MigrateHost;
    ContextItems[1] = Caption_DetailedInfo;
    ContextItems[2] = Caption_Whisper;
    ContextItems[3] = Caption_AddToFriends;
    ContextItems[4] = Caption_JoinClan;
    ContextItems[5] = Caption_ClanInfo;
    //return;    
}

function bool InternalOnPreDraw(Canvas C)
{
    // End:0x11
    if(!bLocalizedStringsAreApplied)
    {
        ApplyLocalizedStrings();
    }
    return false;
    //return;    
}

defaultproperties
{
    Caption_MigrateHost="??? ??"
    Caption_DetailedInfo="????"
    Caption_Whisper="????"
    Caption_AddToFriends="????"
    Caption_JoinClan="??????"
    Caption_ClanInfo="????"
    ContextItems=/* Array type was not detected. */
    SelectionStyleName="STY2Warfare_ContextMenuSelected"
    ItemHeight=24
    bAutoItemHeight=false
    StyleName="STY2Warfare_ContextMenu"
    OnPreDraw=BTContextMenuUser.InternalOnPreDraw
}