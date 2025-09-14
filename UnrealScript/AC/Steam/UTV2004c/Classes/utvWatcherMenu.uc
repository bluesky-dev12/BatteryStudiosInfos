/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UTV2004c\Classes\utvWatcherMenu.uc
 * Package Imports:
 *	UTV2004c
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:5
 *
 *******************************************************************************/
class utvWatcherMenu extends GUIPage
    editinlinenew
    instanced;

var float BoxHeight;
var float BoxWidth;
var float MarginWidth;
var float ItemHeight;
var float ItemGap;
var utvInteraction ui;
var utvReplication ur;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local utvInteraction tui;
    local utvReplication tur;

    super.InitComponent(MyController, myOwner);
    Controls[0].WinHeight = BoxHeight;
    Controls[0].WinWidth = BoxWidth;
    Controls[0].WinTop = 0.50 - 0.50 * BoxHeight;
    Controls[0].WinLeft = 0.50 - 0.50 * BoxWidth;
    Controls[1].WinHeight = ItemHeight;
    Controls[1].WinWidth = BoxWidth - MarginWidth * float(2);
    Controls[1].WinTop = Controls[0].WinTop + 0.010;
    Controls[1].WinLeft = Controls[0].WinLeft + MarginWidth;
    Controls[2].WinHeight = ItemHeight;
    Controls[2].WinWidth = Controls[1].WinWidth;
    Controls[2].WinTop = Controls[1].WinTop + ItemGap * float(2) + ItemHeight;
    Controls[2].WinLeft = Controls[1].WinLeft;
    Controls[3].WinHeight = ItemHeight;
    Controls[3].WinWidth = Controls[1].WinWidth;
    Controls[3].WinTop = Controls[2].WinTop + ItemHeight - ItemGap;
    Controls[3].WinLeft = Controls[1].WinLeft;
    moComboBox(Controls[3]).AddItem("Locked during free flight");
    moComboBox(Controls[3]).AddItem("Completely locked");
    moComboBox(Controls[3]).AddItem("Completely free");
    moComboBox(Controls[3]).ReadOnly(true);
    moComboBox(Controls[3]).SetIndex(class'utvReplication'.default.ViewMode);
    Controls[4].WinHeight = ItemHeight;
    Controls[4].WinWidth = Controls[3].WinWidth;
    Controls[4].WinTop = Controls[3].WinTop + ItemGap * float(2) + ItemHeight;
    Controls[4].WinLeft = Controls[3].WinLeft;
    Controls[5].WinHeight = ItemHeight;
    Controls[5].WinWidth = Controls[4].WinWidth;
    Controls[5].WinTop = Controls[4].WinTop + ItemGap + ItemHeight;
    Controls[5].WinLeft = Controls[4].WinLeft;
    Controls[6].WinHeight = ItemHeight;
    Controls[6].WinWidth = Controls[1].WinWidth / float(2);
    Controls[6].WinTop = Controls[5].WinTop + ItemHeight * float(4) + ItemGap;
    Controls[6].WinLeft = 0.50 - 0.50 * Controls[6].WinWidth;
    Controls[7].WinHeight = ItemHeight;
    Controls[7].WinWidth = Controls[5].WinWidth;
    Controls[7].WinTop = Controls[5].WinTop + ItemGap + ItemHeight;
    Controls[7].WinLeft = Controls[5].WinLeft;
    Controls[8].WinHeight = ItemHeight;
    Controls[8].WinWidth = ItemHeight;
    Controls[8].WinTop = Controls[5].WinTop + ItemHeight;
    Controls[8].WinLeft = Controls[5].WinLeft + Controls[5].WinWidth / float(2);
    Controls[9].WinHeight = ItemHeight;
    Controls[9].WinWidth = Controls[7].WinWidth;
    Controls[9].WinTop = Controls[7].WinTop + ItemGap + ItemHeight;
    Controls[9].WinLeft = Controls[7].WinLeft;
    Controls[10].WinHeight = ItemHeight;
    Controls[10].WinWidth = ItemHeight;
    Controls[10].WinTop = Controls[7].WinTop + ItemHeight;
    Controls[10].WinLeft = Controls[7].WinLeft + Controls[7].WinWidth / float(2);
    __OnClose__Delegate = InternalOnClose;
    // End:0x71e
    foreach AllObjects(class'utvInteraction', tui)
    {
        ui = tui;                
    }
    // End:0x73a
    foreach AllObjects(class'utvReplication', tur)
    {
        ur = tur;                
    }
    GUILabel(Controls[4]).Caption = string('Delay ') $ string(ui.Delay);
    GUILabel(Controls[5]).Caption = string('Total clients ') $ string(ui.Clients);
    GUICheckBoxButton(Controls[8]).bChecked = ur.FollowPrimary;
    GUICheckBoxButton(Controls[10]).bChecked = !ur.MuteChat;
    // End:0x85b
    if(!ur.SeeAll)
    {
        GUILabel(Controls[7]).Caption = "See all mode disabled";
        Controls[8].WinHeight = 0.0;
        Controls[8].WinWidth = 0.0;
    }
    // End:0x8d7
    if(ur.NoPrimary)
    {
        GUILabel(Controls[7]).Caption = "See all mode without primary client";
        Controls[8].WinHeight = 0.0;
        Controls[8].WinWidth = 0.0;
    }
    // End:0x990
    if(ur.IsDemo)
    {
        // End:0x930
        if(ur.SeeAll)
        {
            GUILabel(Controls[7]).Caption = "Watching server side demo";
        }
        // End:0x962
        else
        {
            GUILabel(Controls[7]).Caption = "Watching client side demo";
        }
        Controls[8].WinHeight = 0.0;
        Controls[8].WinWidth = 0.0;
    }
}

function InternalOnClose(optional bool bCanceled)
{
    local PlayerController PC;

    PC = PlayerOwner();
    // End:0x43
    if(PC != none && PC.Level.Pauser != none)
    {
        PC.SetPause(false);
    }
    OnClose(bCanceled);
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x8b
    if(Sender == Controls[6])
    {
        // End:0x4d
        if(!ur.NoPrimary)
        {
            ur.FollowPrimary = GUICheckBoxButton(Controls[8]).bChecked;
        }
        ur.MuteChat = !GUICheckBoxButton(Controls[10]).bChecked;
        SaveDefaults();
        Controller.CloseMenu();
    }
    return true;
}

function InternalOnChange(GUIComponent Sender);
function SaveDefaults()
{
    class'utvReplication'.default.ViewMode = moComboBox(Controls[3]).GetIndex();
    class'utvReplication'.static.StaticSaveConfig();
}

defaultproperties
{
    BoxHeight=0.470
    BoxWidth=0.50
    MarginWidth=0.020
    ItemHeight=0.040
    ItemGap=0.010
    bRenderWorld=true
    bRequire640x480=true
    bAllowedAsLast=true
    Controls=// Object reference not set to an instance of an object.
    
}