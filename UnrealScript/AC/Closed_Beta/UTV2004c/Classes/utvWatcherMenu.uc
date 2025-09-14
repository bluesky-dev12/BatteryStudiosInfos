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
    Controls[0].WinTop = 0.5000000 - (0.5000000 * BoxHeight);
    Controls[0].WinLeft = 0.5000000 - (0.5000000 * BoxWidth);
    Controls[1].WinHeight = ItemHeight;
    Controls[1].WinWidth = BoxWidth - (MarginWidth * float(2));
    Controls[1].WinTop = Controls[0].WinTop + 0.0100000;
    Controls[1].WinLeft = Controls[0].WinLeft + MarginWidth;
    Controls[2].WinHeight = ItemHeight;
    Controls[2].WinWidth = Controls[1].WinWidth;
    Controls[2].WinTop = (Controls[1].WinTop + (ItemGap * float(2))) + ItemHeight;
    Controls[2].WinLeft = Controls[1].WinLeft;
    Controls[3].WinHeight = ItemHeight;
    Controls[3].WinWidth = Controls[1].WinWidth;
    Controls[3].WinTop = (Controls[2].WinTop + ItemHeight) - ItemGap;
    Controls[3].WinLeft = Controls[1].WinLeft;
    moComboBox(Controls[3]).AddItem("Locked during free flight");
    moComboBox(Controls[3]).AddItem("Completely locked");
    moComboBox(Controls[3]).AddItem("Completely free");
    moComboBox(Controls[3]).ReadOnly(true);
    moComboBox(Controls[3]).SetIndex(Class'UTV2004c_Decompressed.utvReplication'.default.ViewMode);
    Controls[4].WinHeight = ItemHeight;
    Controls[4].WinWidth = Controls[3].WinWidth;
    Controls[4].WinTop = (Controls[3].WinTop + (ItemGap * float(2))) + ItemHeight;
    Controls[4].WinLeft = Controls[3].WinLeft;
    Controls[5].WinHeight = ItemHeight;
    Controls[5].WinWidth = Controls[4].WinWidth;
    Controls[5].WinTop = (Controls[4].WinTop + ItemGap) + ItemHeight;
    Controls[5].WinLeft = Controls[4].WinLeft;
    Controls[6].WinHeight = ItemHeight;
    Controls[6].WinWidth = Controls[1].WinWidth / float(2);
    Controls[6].WinTop = (Controls[5].WinTop + (ItemHeight * float(4))) + ItemGap;
    Controls[6].WinLeft = 0.5000000 - (0.5000000 * Controls[6].WinWidth);
    Controls[7].WinHeight = ItemHeight;
    Controls[7].WinWidth = Controls[5].WinWidth;
    Controls[7].WinTop = (Controls[5].WinTop + ItemGap) + ItemHeight;
    Controls[7].WinLeft = Controls[5].WinLeft;
    Controls[8].WinHeight = ItemHeight;
    Controls[8].WinWidth = ItemHeight;
    Controls[8].WinTop = Controls[5].WinTop + ItemHeight;
    Controls[8].WinLeft = Controls[5].WinLeft + (Controls[5].WinWidth / float(2));
    Controls[9].WinHeight = ItemHeight;
    Controls[9].WinWidth = Controls[7].WinWidth;
    Controls[9].WinTop = (Controls[7].WinTop + ItemGap) + ItemHeight;
    Controls[9].WinLeft = Controls[7].WinLeft;
    Controls[10].WinHeight = ItemHeight;
    Controls[10].WinWidth = ItemHeight;
    Controls[10].WinTop = Controls[7].WinTop + ItemHeight;
    Controls[10].WinLeft = Controls[7].WinLeft + (Controls[7].WinWidth / float(2));
    __OnClose__Delegate = InternalOnClose;
    // End:0x71E
    foreach AllObjects(Class'UTV2004c_Decompressed.utvInteraction', tui)
    {
        ui = tui;        
    }    
    // End:0x73A
    foreach AllObjects(Class'UTV2004c_Decompressed.utvReplication', tur)
    {
        ur = tur;        
    }    
    GUILabel(Controls[4]).Caption = string('Delay ') $ string(ui.Delay);
    GUILabel(Controls[5]).Caption = string('Total clients ') $ string(ui.Clients);
    GUICheckBoxButton(Controls[8]).bChecked = ur.FollowPrimary;
    GUICheckBoxButton(Controls[10]).bChecked = !ur.MuteChat;
    // End:0x85B
    if(!ur.SeeAll)
    {
        GUILabel(Controls[7]).Caption = "See all mode disabled";
        Controls[8].WinHeight = 0.0000000;
        Controls[8].WinWidth = 0.0000000;
    }
    // End:0x8D7
    if(ur.NoPrimary)
    {
        GUILabel(Controls[7]).Caption = "See all mode without primary client";
        Controls[8].WinHeight = 0.0000000;
        Controls[8].WinWidth = 0.0000000;
    }
    // End:0x990
    if(ur.IsDemo)
    {
        // End:0x930
        if(ur.SeeAll)
        {
            GUILabel(Controls[7]).Caption = "Watching server side demo";            
        }
        else
        {
            GUILabel(Controls[7]).Caption = "Watching client side demo";
        }
        Controls[8].WinHeight = 0.0000000;
        Controls[8].WinWidth = 0.0000000;
    }
    //return;    
}

function InternalOnClose(optional bool bCanceled)
{
    local PlayerController PC;

    PC = PlayerOwner();
    // End:0x43
    if((PC != none) && PC.Level.Pauser != none)
    {
        PC.SetPause(false);
    }
    OnClose(bCanceled);
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x8B
    if(Sender == Controls[6])
    {
        // End:0x4D
        if(!ur.NoPrimary)
        {
            ur.FollowPrimary = GUICheckBoxButton(Controls[8]).bChecked;
        }
        ur.MuteChat = !GUICheckBoxButton(Controls[10]).bChecked;
        SaveDefaults();
        Controller.CloseMenu();
    }
    return true;
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    //return;    
}

function SaveDefaults()
{
    Class'UTV2004c_Decompressed.utvReplication'.default.ViewMode = moComboBox(Controls[3]).GetIndex();
    Class'UTV2004c_Decompressed.utvReplication'.static.StaticSaveConfig();
    //return;    
}

defaultproperties
{
    BoxHeight=0.4700000
    BoxWidth=0.5000000
    MarginWidth=0.0200000
    ItemHeight=0.0400000
    ItemGap=0.0100000
    bRenderWorld=true
    bRequire640x480=false
    bAllowedAsLast=true
    // Reference: GUIImage'UTV2004c_Decompressed.utvWatcherMenu.Background'
    begin object name="Background" class=XInterface.GUIImage
        ImageStyle=1
        bNeverFocus=true
    end object
    Controls[0]=Background
    // Reference: GUILabel'UTV2004c_Decompressed.utvWatcherMenu.TitleText'
    begin object name="TitleText" class=XInterface.GUILabel
        Caption="UTV2004 Watcher settings"
        TextAlign=1
        TextColor=(R=255,G=255,B=0,A=255)
        bMultiLine=true
    end object
    Controls[1]=TitleText
    // Reference: GUILabel'UTV2004c_Decompressed.utvWatcherMenu.Label1'
    begin object name="Label1" class=XInterface.GUILabel
        Caption="View rotation"
        TextColor=(R=255,G=255,B=255,A=255)
        TextFont="UT2MidGameFont"
        bMultiLine=true
    end object
    Controls[2]=Label1
    // Reference: moComboBox'UTV2004c_Decompressed.utvWatcherMenu.ComboBox'
    begin object name="ComboBox" class=XInterface.moComboBox
        CaptionWidth=0.0000000
        OnCreateComponent=ComboBox.InternalOnCreateComponent
        OnChange=utvWatcherMenu.InternalOnChange
    end object
    Controls[3]=ComboBox
    Controls[4]=Label1
    Controls[5]=Label1
    // Reference: GUIButton'UTV2004c_Decompressed.utvWatcherMenu.OkButton'
    begin object name="OkButton" class=XInterface.GUIButton
        Caption="OK"
        StyleName="MidGameButton"
        OnClick=utvWatcherMenu.InternalOnClick
        OnKeyEvent=OkButton.InternalOnKeyEvent
    end object
    Controls[6]=OkButton
    // Reference: GUILabel'UTV2004c_Decompressed.utvWatcherMenu.Label2'
    begin object name="Label2" class=XInterface.GUILabel
        Caption="Follow primary"
        TextColor=(R=255,G=255,B=255,A=255)
        TextFont="UT2MidGameFont"
        bMultiLine=true
    end object
    Controls[7]=Label2
    // Reference: GUICheckBoxButton'UTV2004c_Decompressed.utvWatcherMenu.Button2'
    begin object name="Button2" class=XInterface.GUICheckBoxButton
        OnKeyEvent=Button2.InternalOnKeyEvent
    end object
    Controls[8]=Button2
    // Reference: GUILabel'UTV2004c_Decompressed.utvWatcherMenu.Label3'
    begin object name="Label3" class=XInterface.GUILabel
        Caption="Show UTV Chat"
        TextColor=(R=255,G=255,B=255,A=255)
        TextFont="UT2MidGameFont"
        bMultiLine=true
    end object
    Controls[9]=Label3
    // Reference: GUICheckBoxButton'UTV2004c_Decompressed.utvWatcherMenu.Button3'
    begin object name="Button3" class=XInterface.GUICheckBoxButton
        OnKeyEvent=Button3.InternalOnKeyEvent
    end object
    Controls[10]=Button3
}