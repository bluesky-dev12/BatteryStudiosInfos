/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4SP_CGBRTrade.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:5
 *
 *******************************************************************************/
class UT2K4SP_CGBRTrade extends UT2K4SP_CGBRUnTrade
    dependson(UT2K4SP_CGBRUnTrade)
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUICharacterListTeam clSelChar;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnNextChar;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnPrevChar;
var localized string FullTeamWarning;
var localized string FireInfo;
var bool bHasFullTeam;
var UT2K4GameProfile GP;

event InitComponent(GUIController MyController, GUIComponent myOwner)
{
    lblTitle.WinWidth = 0.7625010;
    lblTitle.WinHeight = 0.058750;
    lblTitle.WinLeft = 0.0240630;
    lblTitle.WinTop = 0.0678460;
    imgPictureBg.WinWidth = 0.1216670;
    imgPictureBg.WinHeight = 0.326250;
    imgPictureBg.WinLeft = 0.0447220;
    imgPictureBg.WinTop = 0.1491980;
    imgPicture.WinWidth = 0.1166670;
    imgPicture.WinHeight = 0.31250;
    imgPicture.WinLeft = 0.0484720;
    imgPicture.WinTop = 0.1641980;
    btnOk.WinWidth = 0.2222220;
    btnOk.WinHeight = 0.0506940;
    btnOk.WinLeft = 0.360070;
    btnOk.WinTop = 0.8210640;
    sbMessage.WinWidth = 0.4583320;
    sbMessage.WinHeight = 0.3061110;
    sbMessage.WinLeft = 0.2135420;
    sbMessage.WinTop = 0.1829760;
    super(FloatingWindow).InitComponent(MyController, myOwner);
    GP = UT2K4GameProfile(PlayerOwner().Level.Game.CurrentGameProfile);
    bHasFullTeam = GP.HasFullTeam();
    clSelChar.PopulateList(GP.PlayerTeam);
    clSelChar.Index = 0;
    // End:0x244
    if(!bHasFullTeam)
    {
        btnNextChar.DisableMe();
        btnPrevChar.DisableMe();
        clSelChar.DisableMe();
    }
}

function SetDescription()
{
    local string tmp;

    // End:0xf7
    if(bHasFullTeam)
    {
        tmp = Message $ "||" $ FullTeamWarning $ "||" $ FireInfo;
        tmp = Repl(tmp, "%player%", TargetPlayerName);
        tmp = Repl(tmp, "%enemyteam%", ETI.default.TeamName);
        tmp = Repl(tmp, "%fireplayer%", clSelChar.GetName());
        tmp = Repl(tmp, "%refund%", GP.MoneyToString(GP.GetBotPrice(clSelChar.GetName())));
        sbMessage.SetContent(tmp);
    }
    // End:0xfd
    else
    {
        super.SetDescription();
    }
}

function UpdateDetails(GUIComponent Sender)
{
    SetDescription();
}

function bool onSelectChar(GUIComponent Sender)
{
    // End:0x21
    if(Sender == btnPrevChar)
    {
        clSelChar.ScrollLeft();
    }
    // End:0x3f
    else
    {
        // End:0x3f
        if(Sender == btnNextChar)
        {
            clSelChar.ScrollRight();
        }
    }
    return true;
}

function OnClose(optional bool bCancel)
{
    // End:0x27
    if(bHasFullTeam)
    {
        GP.ReleaseTeammate(clSelChar.GetName());
    }
    GP.AddTeammate(TargetPlayerName);
}

defaultproperties
{
    begin object name=CGBclSelChar class=GUICharacterListTeam
        FixedItemsPerPage=1
        StyleName="CharButton"
        Hint="???? ???? ?????."
        WinTop=0.1495840
        WinLeft=0.8072130
        WinWidth=0.1246940
        WinHeight=0.3250
        TabOrder=0
        bBoundToParent=true
        OnClick=InternalOnClick
        OnRightClick=InternalOnRightClick
        OnMousePressed=InternalOnMousePressed
        OnMouseRelease=InternalOnMouseRelease
        OnChange=UpdateDetails
        OnKeyEvent=InternalOnKeyEvent
        OnBeginDrag=InternalOnBeginDrag
        OnEndDrag=InternalOnEndDrag
        OnDragDrop=InternalOnDragDrop
        OnDragEnter=InternalOnDragEnter
        OnDragLeave=InternalOnDragLeave
        OnDragOver=InternalOnDragOver
    object end
    // Reference: GUICharacterListTeam'UT2K4SP_CGBRTrade.CGBclSelChar'
    clSelChar=CGBclSelChar
    begin object name=CGBbtnNextChar class=GUIButton
        StyleName="ArrowRight"
        Hint="??? ???? ??????."
        WinTop=0.8066670
        WinLeft=0.8984380
        WinWidth=0.048750
        WinHeight=0.061250
        bBoundToParent=true
        bNeverFocus=true
        bRepeatClick=true
        OnClickSound=3
        OnClick=onSelectChar
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SP_CGBRTrade.CGBbtnNextChar'
    btnNextChar=CGBbtnNextChar
    begin object name=CGBbtnPrevChar class=GUIButton
        StyleName="ArrowLeft"
        Hint="??? ???? ??????."
        WinTop=0.8066670
        WinLeft=0.8050010
        WinWidth=0.048750
        WinHeight=0.061250
        bBoundToParent=true
        bNeverFocus=true
        bRepeatClick=true
        OnClickSound=4
        OnClick=onSelectChar
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SP_CGBRTrade.CGBbtnPrevChar'
    btnPrevChar=CGBbtnPrevChar
    FullTeamWarning="?? ? ??? ? ????. ?? ??? ? ??? ???? ???. ?? ??? ??? ??? ???? ???? ???."
    FireInfo="%fireplayer%(?)? ????? ???????. ??? ???? %refund% ???."
    Message="%enemyteam%(?)?? ?????? ???????. %player%(?)? ?? ?? ?? ???? ???."
    DefaultLeft=0.10
    DefaultWidth=0.80
    WinLeft=0.10
    WinWidth=0.80
}