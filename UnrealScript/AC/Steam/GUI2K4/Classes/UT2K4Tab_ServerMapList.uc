/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4Tab_ServerMapList.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:4
 *
 *******************************************************************************/
class UT2K4Tab_ServerMapList extends MidGamePanel
    editinlinenew
    instanced;

var() bool bClean;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIListBoxBase lb_Maps;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_BG;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_BG2;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_Title;
var() localized string DefaultText;
var() bool bReceivedMaps;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    bClean = true;
    // End:0x41
    if(GUIScrollTextBox(lb_Maps) != none)
    {
        GUIScrollTextBox(lb_Maps).SetContent(DefaultText);
    }
}

function ShowPanel(bool bShow)
{
    super(GUITabPanel).ShowPanel(bShow);
    // End:0x31
    if(bShow && !bReceivedMaps)
    {
        SetTimer(3.0, true);
        Timer();
    }
}

function Timer()
{
    // End:0x1e
    if(bReceivedMaps || wPlayer(PlayerOwner()) == none)
    {
        KillTimer();
        return;
    }
    wPlayer(PlayerOwner()).__ProcessMapName__Delegate = ProcessMapName;
    wPlayer(PlayerOwner()).ServerRequestMapList();
}

function ProcessMapName(string NewMap)
{
    bReceivedMaps = true;
    // End:0x38
    if(NewMap == "")
    {
        bClean = true;
        GUIScrollTextBox(lb_Maps).SetContent(DefaultText);
    }
    // End:0x7e
    else
    {
        // End:0x5d
        if(bClean)
        {
            GUIScrollTextBox(lb_Maps).SetContent(NewMap);
        }
        // End:0x76
        else
        {
            GUIScrollTextBox(lb_Maps).AddText(NewMap);
        }
        bClean = false;
    }
}

defaultproperties
{
    begin object name=InfoText class=GUIScrollTextBox
        bNoTeletype=true
        CharDelay=0.00250
        EOLDelay=0.0
        TextAlign=1
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.143750
        WinHeight=0.8343750
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
    object end
    // Reference: GUIScrollTextBox'UT2K4Tab_ServerMapList.InfoText'
    lb_Maps=InfoText
    begin object name=ServerInfoBK1 class=GUIImage
        ImageColor=(R=255,G=255,B=255,A=160)
        ImageStyle=1
        WinTop=0.0707790
        WinLeft=0.0216410
        WinWidth=0.4184370
        WinHeight=0.0165220
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: GUIImage'UT2K4Tab_ServerMapList.ServerInfoBK1'
    i_BG=ServerInfoBK1
    begin object name=ServerInfoBK2 class=GUIImage
        ImageColor=(R=255,G=255,B=255,A=160)
        ImageStyle=1
        WinTop=0.0707790
        WinLeft=0.5763290
        WinWidth=0.3950
        WinHeight=0.0165220
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: GUIImage'UT2K4Tab_ServerMapList.ServerInfoBK2'
    i_BG2=ServerInfoBK2
    begin object name=ServerInfoLabel class=GUILabel
        Caption="?"
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.0453120
        WinHeight=32.0
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: GUILabel'UT2K4Tab_ServerMapList.ServerInfoLabel'
    l_Title=ServerInfoLabel
    DefaultText="????? ? ???? ?? ?..."
}