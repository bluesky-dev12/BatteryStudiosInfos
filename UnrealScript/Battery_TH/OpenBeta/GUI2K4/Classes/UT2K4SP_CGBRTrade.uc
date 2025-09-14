class UT2K4SP_CGBRTrade extends UT2K4SP_CGBRUnTrade
    editinlinenew
    instanced;

var() automated GUICharacterListTeam clSelChar;
var() automated GUIButton btnNextChar;
var() automated GUIButton btnPrevChar;
var localized string FullTeamWarning;
var localized string FireInfo;
var bool bHasFullTeam;
var UT2K4GameProfile GP;

event InitComponent(GUIController MyController, GUIComponent myOwner)
{
    lblTitle.WinWidth = 0.7625010;
    lblTitle.WinHeight = 0.0587500;
    lblTitle.WinLeft = 0.0240630;
    lblTitle.WinTop = 0.0678460;
    imgPictureBg.WinWidth = 0.1216670;
    imgPictureBg.WinHeight = 0.3262500;
    imgPictureBg.WinLeft = 0.0447220;
    imgPictureBg.WinTop = 0.1491980;
    imgPicture.WinWidth = 0.1166670;
    imgPicture.WinHeight = 0.3125000;
    imgPicture.WinLeft = 0.0484720;
    imgPicture.WinTop = 0.1641980;
    btnOk.WinWidth = 0.2222220;
    btnOk.WinHeight = 0.0506940;
    btnOk.WinLeft = 0.3600700;
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
    //return;    
}

function SetDescription()
{
    local string tmp;

    // End:0xF7
    if(bHasFullTeam)
    {
        tmp = (((Message $ "||") $ FullTeamWarning) $ "||") $ FireInfo;
        tmp = Repl(tmp, "%player%", TargetPlayerName);
        tmp = Repl(tmp, "%enemyteam%", ETI.default.TeamName);
        tmp = Repl(tmp, "%fireplayer%", clSelChar.GetName());
        tmp = Repl(tmp, "%refund%", GP.MoneyToString(GP.GetBotPrice(clSelChar.GetName())));
        sbMessage.SetContent(tmp);        
    }
    else
    {
        super.SetDescription();
    }
    //return;    
}

function UpdateDetails(GUIComponent Sender)
{
    SetDescription();
    //return;    
}

function bool onSelectChar(GUIComponent Sender)
{
    // End:0x21
    if(Sender == btnPrevChar)
    {
        clSelChar.ScrollLeft();        
    }
    else
    {
        // End:0x3F
        if(Sender == btnNextChar)
        {
            clSelChar.ScrollRight();
        }
    }
    return true;
    //return;    
}

function OnClose(optional bool bCancel)
{
    // End:0x27
    if(bHasFullTeam)
    {
        GP.ReleaseTeammate(clSelChar.GetName());
    }
    GP.AddTeammate(TargetPlayerName);
    //return;    
}

defaultproperties
{
    // Reference: GUICharacterListTeam'GUI2K4_Decompressed.UT2K4SP_CGBRTrade.CGBclSelChar'
    begin object name="CGBclSelChar" class=XInterface.GUICharacterListTeam
        FixedItemsPerPage=1
        StyleName="CharButton"
        Hint="???? ???? ?????."
        WinTop=0.1495840
        WinLeft=0.8072130
        WinWidth=0.1246940
        WinHeight=0.3250000
        TabOrder=0
        bBoundToParent=true
        OnClick=CGBclSelChar.InternalOnClick
        OnRightClick=CGBclSelChar.InternalOnRightClick
        OnMousePressed=CGBclSelChar.InternalOnMousePressed
        OnMouseRelease=CGBclSelChar.InternalOnMouseRelease
        OnChange=UT2K4SP_CGBRTrade.UpdateDetails
        OnKeyEvent=CGBclSelChar.InternalOnKeyEvent
        OnBeginDrag=CGBclSelChar.InternalOnBeginDrag
        OnEndDrag=CGBclSelChar.InternalOnEndDrag
        OnDragDrop=CGBclSelChar.InternalOnDragDrop
        OnDragEnter=CGBclSelChar.InternalOnDragEnter
        OnDragLeave=CGBclSelChar.InternalOnDragLeave
        OnDragOver=CGBclSelChar.InternalOnDragOver
    end object
    clSelChar=CGBclSelChar
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SP_CGBRTrade.CGBbtnNextChar'
    begin object name="CGBbtnNextChar" class=XInterface.GUIButton
        StyleName="ArrowRight"
        Hint="??? ???? ??????."
        WinTop=0.8066670
        WinLeft=0.8984380
        WinWidth=0.0487500
        WinHeight=0.0612500
        bBoundToParent=true
        bNeverFocus=true
        bRepeatClick=true
        OnClickSound=3
        OnClick=UT2K4SP_CGBRTrade.onSelectChar
        OnKeyEvent=CGBbtnNextChar.InternalOnKeyEvent
    end object
    btnNextChar=CGBbtnNextChar
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SP_CGBRTrade.CGBbtnPrevChar'
    begin object name="CGBbtnPrevChar" class=XInterface.GUIButton
        StyleName="ArrowLeft"
        Hint="??? ???? ??????."
        WinTop=0.8066670
        WinLeft=0.8050010
        WinWidth=0.0487500
        WinHeight=0.0612500
        bBoundToParent=true
        bNeverFocus=true
        bRepeatClick=true
        OnClickSound=4
        OnClick=UT2K4SP_CGBRTrade.onSelectChar
        OnKeyEvent=CGBbtnPrevChar.InternalOnKeyEvent
    end object
    btnPrevChar=CGBbtnPrevChar
    FullTeamWarning="?? ? ??? ? ????. ?? ??? ? ??? ???? ???. ?? ??? ??? ??? ???? ???? ???."
    FireInfo="%fireplayer%(?)? ????? ???????. ??? ???? %refund% ???."
    Message="%enemyteam%(?)?? ?????? ???????. %player%(?)? ?? ?? ?? ???? ???."
    DefaultLeft=0.1000000
    DefaultWidth=0.8000000
    WinLeft=0.1000000
    WinWidth=0.8000000
}