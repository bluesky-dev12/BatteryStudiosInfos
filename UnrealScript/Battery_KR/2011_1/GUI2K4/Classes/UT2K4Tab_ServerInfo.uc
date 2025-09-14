class UT2K4Tab_ServerInfo extends MidGamePanel
    editinlinenew
    instanced;

var bool bClean;
var() automated GUIScrollTextBox lb_Text;
var() automated GUIImage i_BG;
var() automated GUIImage i_BG2;
var() automated GUILabel l_Title;
var localized string DefaultText;
var bool bReceivedRules;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    bClean = true;
    lb_Text.SetContent(DefaultText);
    //return;    
}

function ShowPanel(bool bShow)
{
    super(GUITabPanel).ShowPanel(bShow);
    // End:0x31
    if(bShow && !bReceivedRules)
    {
        SetTimer(3.0000000, true);
        Timer();
    }
    //return;    
}

function Timer()
{
    // End:0x1E
    if(bReceivedRules || wPlayer(PlayerOwner()) == none)
    {
        KillTimer();
        return;
    }
    wPlayer(PlayerOwner()).__ProcessRule__Delegate = ProcessRule;
    wPlayer(PlayerOwner()).ServerRequestRules();
    //return;    
}

function ProcessRule(string NewRule)
{
    bReceivedRules = true;
    // End:0x33
    if(NewRule == "")
    {
        bClean = true;
        lb_Text.SetContent(DefaultText);        
    }
    else
    {
        // End:0x53
        if(bClean)
        {
            lb_Text.SetContent(NewRule);            
        }
        else
        {
            lb_Text.AddText(NewRule);
        }
        bClean = false;
    }
    //return;    
}

defaultproperties
{
    // Reference: GUIScrollTextBox'GUI2K4_Decompressed.UT2K4Tab_ServerInfo.InfoText'
    begin object name="InfoText" class=XInterface.GUIScrollTextBox
        bNoTeletype=true
        CharDelay=0.0025000
        EOLDelay=0.0000000
        TextAlign=1
        OnCreateComponent=InfoText.InternalOnCreateComponent
        WinTop=0.1437500
        WinHeight=0.8660160
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
    end object
    lb_Text=InfoText
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4Tab_ServerInfo.ServerInfoBK1'
    begin object name="ServerInfoBK1" class=XInterface.GUIImage
        ImageColor=(R=255,G=255,B=255,A=160)
        ImageStyle=1
        WinTop=0.0707790
        WinLeft=0.0216410
        WinWidth=0.4184370
        WinHeight=0.0165220
        bBoundToParent=true
        bScaleToParent=true
    end object
    i_BG=ServerInfoBK1
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4Tab_ServerInfo.ServerInfoBK2'
    begin object name="ServerInfoBK2" class=XInterface.GUIImage
        ImageColor=(R=255,G=255,B=255,A=160)
        ImageStyle=1
        WinTop=0.0707790
        WinLeft=0.5763290
        WinWidth=0.3950000
        WinHeight=0.0165220
        bBoundToParent=true
        bScaleToParent=true
    end object
    i_BG2=ServerInfoBK2
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4Tab_ServerInfo.ServerInfoLabel'
    begin object name="ServerInfoLabel" class=XInterface.GUILabel
        Caption="??"
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.0427080
        WinHeight=32.0000000
        bBoundToParent=true
        bScaleToParent=true
    end object
    l_Title=ServerInfoLabel
    DefaultText="????? ???? ?? ?...||?? ?? ??? ??? ??? ?????."
}