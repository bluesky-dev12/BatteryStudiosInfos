class wHudPart_Tutorial extends wHudPart_DisplayBase
    transient;

var localized string lsQKill3Enemy;
var localized string lsQKillAim;
var localized string lsQSprint;
var localized string lsQMeleeAttack;
var localized string lsQKillWithGrenade;
var localized string lsQComplete;
var localized string lsNext;
var localized string lsQStartTutorial;
var localized string lsCStartTutorial;
var localized string lsQQuitTutorial;
var localized string lsCQuitTutorial;
var localized string lsCKill3Enemy;
var localized string lsCKillAim;
var localized string lsCSprint;
var localized string lsCMeleeAttack;
var localized string lsCKillWithGrenade;
var string SoundQuest;
var Sound SoundQuestEnd;
var int iGoal;
var int iCurrent;
var int iProgress;
var string SQuest;
var string sComment;
var string sComment2;
var bool bDrawMessage;
var bool bDrawMessage_QuestComplete;
var bool bDrawKey;
var bool bDrawBGKey;
var bool bDrawProgress;
var bool bOnEndMessage;
var float fBeginMessageTime;
var float fMessageDrawTime;
var float fFadeOutTime;
var float fKeyWidth;
var float fKeyHight;
var() SpriteWidget WQuestBG1;
var() SpriteWidget WQuestBG2;
var() SpriteWidget WQuestBGKey;
var() SpriteWidget WQuestBGKeyShift;
var() SpriteWidget WQuestBGKeyE;
var() SpriteWidget WQuestKey;
var() SpriteWidget WQuestKeyShift;
var() SpriteWidget WQuestKeyMouse;
var() SpriteWidget WQuestKeyLeftMouse;
var() SpriteWidget WQuestKeyRightMouse;
var() SpriteWidget WQuestKeyE;

function OnKill3Enemy()
{
    //return;    
}

function OnMeleeAttack()
{
    //return;    
}

function OnKillGrenade()
{
    //return;    
}

function OnRunSprint(int iSec)
{
    //return;    
}

function OnKillAim()
{
    //return;    
}

function OnPickUpHealthPack()
{
    //return;    
}

function OnBeginMessage()
{
    fBeginMessageTime = Level.TimeSeconds;
    bDrawMessage = true;
    bDrawMessage_QuestComplete = false;
    // End:0x3B
    if(iProgress >= 100)
    {
        bOnEndMessage = true;        
    }
    else
    {
        bOnEndMessage = false;
    }
    //return;    
}

function OnEndMessage()
{
    // End:0x17
    if(float(iProgress) >= 100.0000000)
    {
        OnCompleteQuest();
    }
    //return;    
}

function OnBeginQuest()
{
    //return;    
}

function OnCompleteQuest()
{
    fBeginMessageTime = Level.TimeSeconds;
    bDrawMessage_QuestComplete = true;
    bDrawMessage = false;
    SQuest = lsQComplete;
    sComment = lsNext;
    PlaySoundQuest();
    //return;    
}

function OnBeginTutorial()
{
    fBeginMessageTime = Level.TimeSeconds;
    bDrawMessage_QuestComplete = true;
    SQuest = lsQStartTutorial;
    sComment = lsCStartTutorial;
    //return;    
}

function OnNextQuest()
{
    //return;    
}

function PlaySoundQuest()
{
    HudOwner.PlayerOwner.FmodClientPlaySound(SoundQuest,,, 0);
    //return;    
}

function PlaySoundQuestEnd()
{
    //return;    
}

function CallEvent(optional bool ItemCheck, optional int iReservation1, optional int iReservation2)
{
    switch(iReservation2)
    {
        // End:0x21
        case Class'Engine.wMessage_Quest'.default.Code_Quest_Kill:
            OnKill3Enemy();
            // End:0xAB
            break;
        // End:0x3B
        case Class'Engine.wMessage_Quest'.default.Code_Quest_MeeleAttackKill:
            OnMeleeAttack();
            // End:0xAB
            break;
        // End:0x55
        case Class'Engine.wMessage_Quest'.default.Code_Quest_KillGrenade:
            OnKillGrenade();
            // End:0xAB
            break;
        // End:0x74
        case Class'Engine.wMessage_Quest'.default.Code_Quest_SprintTime:
            OnRunSprint(iReservation1);
            // End:0xAB
            break;
        // End:0x8E
        case Class'Engine.wMessage_Quest'.default.Code_Quest_AimedKill:
            OnKillAim();
            // End:0xAB
            break;
        // End:0xA8
        case Class'Engine.wMessage_Quest'.default.Code_Quest_AcquireTrophy:
            OnPickUpHealthPack();
            // End:0xAB
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function Initialize(HudBase myOwner, LevelInfo Level)
{
    super.Initialize(myOwner, Level);
    //return;    
}

function UpdateHelpKeyControll()
{
    // End:0x47
    if((HudOwner.PlayerOwner.Player == none) && HudOwner.PlayerOwner.Player.GUIController == none)
    {
        return;
    }
    //return;    
}

function DrawHudPassA(Canvas C)
{
    // End:0x14
    if(bDrawMessage)
    {
        DrawQuest(C);
    }
    // End:0x28
    if(bDrawMessage_QuestComplete)
    {
        DrawQuestComplete(C);
    }
    //return;    
}

function DrawSpectatingHud(Canvas C)
{
    // End:0x14
    if(bDrawMessage)
    {
        DrawQuest(C);
    }
    // End:0x28
    if(bDrawMessage_QuestComplete)
    {
        DrawQuestComplete(C);
    }
    //return;    
}

function DrawQuest(Canvas C)
{
    local CalCoordsW calW;
    local int fX1, fY1, fX2, fY2;
    local float _iPosX, _iPosY, fDeltaTime;
    local string sProgress;

    fDeltaTime = Level.TimeSeconds - fBeginMessageTime;
    // End:0x42
    if(fDeltaTime >= (fMessageDrawTime + fFadeOutTime))
    {
        // End:0x42
        if(bOnEndMessage)
        {
            OnEndMessage();
            return;
        }
    }
    _iPosX = 395.0000000;
    _iPosY = 173.0000000;
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    WQuestBG1.OffsetX = int(_iPosX);
    WQuestBG1.OffsetY = int(_iPosY);
    CalculateCoordinateEx(C, WQuestBG1, 810.0000000, 76.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WQuestBG1.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    CalculateCoordinateEx(C, WQuestBG2, 509.0000000, 24.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WQuestBG2.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    // End:0x325
    if(bDrawKey)
    {
        // End:0x27E
        if(bDrawBGKey)
        {
            CalculateCoordinateEx(C, WQuestBGKey, fKeyWidth + float(8), fKeyHight + float(8), calW);
            C.SetPos(calW.X1, calW.Y1);
            C.DrawTile(WQuestBGKey.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        }
        // End:0x325
        if(WQuestKey.WidgetTexture != none)
        {
            CalculateCoordinateEx(C, WQuestKey, fKeyWidth, fKeyHight, calW);
            C.SetPos(calW.X1, calW.Y1);
            C.DrawTile(WQuestKey.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        }
    }
    fX1 = int(float(616) * _reX);
    fY1 = int(float(186) * _reY);
    fX2 = int(float(1060) * _reX);
    fY2 = int(float(213) * _reY);
    // End:0x3A5
    if(bDrawProgress)
    {
        sProgress = ((("(" $ string(iCurrent)) $ "/") $ string(iGoal)) $ ")";
    }
    C.SetDrawColor(byte(255), 153, 0, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(SQuest $ sProgress, 1, float(fX1), float(fY1), float(fX2), float(fY2), int(float(29) * _reY), color_Shadow);
    fX1 = int(float(616) * _reX);
    fY1 = int(float(227) * _reY);
    fX2 = int(float(1060) * _reX);
    fY2 = int(float(240) * _reY);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(sComment, 1, float(fX1), float(fY1), float(fX2), float(fY2), int(float(15) * _reY), color_Shadow);
    //return;    
}

function DrawQuestComplete(Canvas C)
{
    local CalCoordsW calW;
    local int iAlpha, fX1, fY1, fX2, fY2;

    local float _iPosX, _iPosY, fFadeOut, fDeltaTime;

    fDeltaTime = Level.TimeSeconds - fBeginMessageTime;
    // End:0x39
    if(fDeltaTime >= (fMessageDrawTime + fFadeOutTime))
    {
        OnNextQuest();
        return;
    }
    _iPosX = 395.0000000;
    _iPosY = 173.0000000;
    // End:0x6C
    if(fDeltaTime < fMessageDrawTime)
    {
        fFadeOut = 1.0000000;        
    }
    else
    {
        fFadeOut = 1.0000000 - ((fDeltaTime - fMessageDrawTime) / fFadeOutTime);
    }
    iAlpha = int(float(255) * fFadeOut);
    // End:0xBD
    if(float(iAlpha) < MinAlpha)
    {
        iAlpha = int(MinAlpha);
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    WQuestBG1.OffsetX = int(_iPosX);
    WQuestBG1.OffsetY = int(_iPosY);
    CalculateCoordinateEx(C, WQuestBG1, 810.0000000, 76.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WQuestBG1.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    CalculateCoordinateEx(C, WQuestBG2, 509.0000000, 24.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WQuestBG2.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    fX1 = int(float(616) * _reX);
    fY1 = int(float(186) * _reY);
    fX2 = int(float(1060) * _reX);
    fY2 = int(float(213) * _reY);
    C.SetDrawColor(byte(255), 153, 0, byte(iAlpha));
    C.BtrDrawTextJustifiedWithVolumeLine(SQuest, 1, float(fX1), float(fY1), float(fX2), float(fY2), int(float(29) * _reY), color_Shadow);
    fX1 = int(float(616) * _reX);
    fY1 = int(float(220) * _reY);
    fX2 = int(float(1060) * _reX);
    fY2 = int(float(238) * _reY);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    C.BtrDrawTextJustifiedWithVolumeLine(sComment, 1, float(fX1), float(fY1), float(fX2), float(fY2), int(float(17) * _reY), color_Shadow);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    //return;    
}

auto state initial
{
    function BeginState()
    {
        // End:0x23
        if(Level.GetMatchMaker().BotTutorial)
        {
            GotoState('StartTutorial');
        }
        //return;        
    }

    function EndState()
    {
        //return;        
    }
    stop;    
}

state QuestBase
{
    function BeginState()
    {
        iCurrent = 0;
        iProgress = 0;
        fKeyHight = 52.0000000;
        fKeyWidth = 52.0000000;
        bDrawKey = true;
        bDrawProgress = true;
        bDrawBGKey = true;
        WQuestBGKey = WQuestBGKeyE;
        //return;        
    }

    function Timer()
    {
        //return;        
    }

    function EndState()
    {
        iGoal = 0;
        iCurrent = 0;
        iProgress = 0;
        //return;        
    }
    stop;    
}

state StartTutorial extends QuestBase
{
    function BeginState()
    {
        iGoal = 0;
        iCurrent = 0;
        iProgress = 0;
        bDrawKey = false;
        bDrawProgress = false;
        OnBeginTutorial();
        //return;        
    }

    function OnNextQuest()
    {
        GotoState('Kill3Enemy');
        //return;        
    }
    stop;    
}

state Kill3Enemy extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        iGoal = 3;
        SQuest = lsQKill3Enemy;
        sComment = lsCKill3Enemy;
        OnBeginMessage();
        bDrawBGKey = false;
        WQuestKey = WQuestKeyLeftMouse;
        //return;        
    }

    function OnKill3Enemy()
    {
        // End:0x13
        if(float(iProgress) >= 100.0000000)
        {
            return;
        }
        ++iCurrent;
        iProgress = int(float(iCurrent / iGoal) * 100.0000000);
        OnBeginMessage();
        //return;        
    }

    function OnNextQuest()
    {
        GotoState('KillAim');
        //return;        
    }
    stop;    
}

state KillAim extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        iGoal = 5;
        SQuest = lsQKillAim;
        sComment = lsCKillAim;
        bDrawBGKey = false;
        WQuestKey = WQuestKeyRightMouse;
        OnBeginMessage();
        //return;        
    }

    function OnKillAim()
    {
        // End:0x13
        if(float(iProgress) >= 100.0000000)
        {
            return;
        }
        ++iCurrent;
        // End:0x34
        if(iCurrent > iGoal)
        {
            iCurrent = iGoal;
        }
        iProgress = int(float(iCurrent / iGoal) * 100.0000000);
        OnBeginMessage();
        //return;        
    }

    function OnNextQuest()
    {
        GotoState('RunSprint');
        //return;        
    }
    stop;    
}

state RunSprint extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        fKeyHight = 52.0000000;
        fKeyWidth = 106.0000000;
        iGoal = 5;
        SQuest = lsQSprint;
        sComment = lsCSprint;
        OnBeginMessage();
        WQuestBGKey = WQuestBGKeyShift;
        GetKeyTexture("Shift", WQuestKey);
        WQuestKey.OffsetX = WQuestKeyShift.OffsetX;
        WQuestKey.OffsetY = WQuestKeyShift.OffsetY;
        //return;        
    }

    function OnRunSprint(int iSec)
    {
        // End:0x13
        if(float(iProgress) >= 100.0000000)
        {
            return;
        }
        iCurrent += iSec;
        // End:0x39
        if(iCurrent > iGoal)
        {
            iCurrent = iGoal;
        }
        iProgress = int(float(iCurrent / iGoal) * 100.0000000);
        OnBeginMessage();
        //return;        
    }

    function OnNextQuest()
    {
        GotoState('KillMeleeAttack');
        //return;        
    }
    stop;    
}

state KillMeleeAttack extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        iGoal = 2;
        SQuest = lsQMeleeAttack;
        sComment = lsCMeleeAttack;
        OnBeginMessage();
        GetKeyTexture("E", WQuestKey);
        WQuestKey.OffsetX = WQuestKeyE.OffsetX;
        WQuestKey.OffsetY = WQuestKeyE.OffsetY;
        //return;        
    }

    function OnMeleeAttack()
    {
        // End:0x13
        if(float(iProgress) >= 100.0000000)
        {
            return;
        }
        ++iCurrent;
        iProgress = int(float(iCurrent / iGoal) * 100.0000000);
        OnBeginMessage();
        //return;        
    }

    function OnNextQuest()
    {
        GotoState('KillGranade');
        //return;        
    }
    stop;    
}

state KillGranade extends QuestBase
{
    function BeginState()
    {
        super.BeginState();
        iGoal = 1;
        SQuest = lsQKillWithGrenade;
        sComment = lsCKillWithGrenade;
        OnBeginMessage();
        bDrawBGKey = false;
        GetKeyTexture("C", WQuestKey);
        WQuestKey.OffsetX = WQuestKeyMouse.OffsetX;
        WQuestKey.OffsetY = WQuestKeyMouse.OffsetY;
        //return;        
    }

    function OnKillGrenade()
    {
        // End:0x13
        if(float(iProgress) >= 100.0000000)
        {
            return;
        }
        ++iCurrent;
        iProgress = int(float(iCurrent / iGoal) * 100.0000000);
        OnBeginMessage();
        //return;        
    }

    function OnNextQuest()
    {
        GotoState('QuitTutorial');
        //return;        
    }
    stop;    
}

state QuitTutorial extends QuestBase
{
    function BeginState()
    {
        bDrawKey = false;
        bDrawProgress = false;
        OnQuitTutorial();
        //return;        
    }

    function OnQuitTutorial()
    {
        SQuest = lsQQuitTutorial;
        sComment = lsCQuitTutorial;
        OnBeginMessage();
        PlaySoundQuestEnd();
        bOnEndMessage = true;
        //return;        
    }

    function OnEndMessage()
    {
        bDrawMessage = false;
        // End:0x34
        if(HudOwner.PlayerOwner != none)
        {
            HudOwner.PlayerOwner.ScriptResetInput();
        }
        // End:0x85
        if(Level.GetMatchMaker().kExp == 0)
        {
            HudOwner.PlayerOwner.ConsoleCommand("ShowTutorialEndWindow");            
        }
        else
        {
            HudOwner.PlayerOwner.ConsoleCommand("endTutorial");
        }
        //return;        
    }

    function EndState()
    {
        //return;        
    }
    stop;    
}

defaultproperties
{
    lsQKill3Enemy="???????? 3 ??"
    lsQKillAim="???????? 5 ????????????????"
    lsQSprint="?????????? 5 ?????????????"
    lsQMeleeAttack="???????? 2 ????????????????????????"
    lsQKillWithGrenade="?????????????????????"
    lsQComplete="???????????????????"
    lsQStartTutorial="???????????????"
    lsQQuitTutorial="??????????????????????"
    lsCKill3Enemy="??????????????????????????????? bot"
    lsCKillAim="?????????????????????????????????????????"
    lsCSprint="????????? Shift ???????????????????????"
    lsCMeleeAttack="???????????? E ?????????????????????????"
    lsCKillWithGrenade="???????????????? ????????????????????????"
    SoundQuest="Warfare_Sound_Object/Tutorial/ui_reward"
    fMessageDrawTime=2.5000000
    fFadeOutTime=1.5000000
    WQuestBG1=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Common.img_HUD_tutorial_quest_bg1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=810,Y2=76),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=395,OffsetY=173,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WQuestBG2=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Common.img_HUD_tutorial_quest_bg2',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=509,Y2=24),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=616,OffsetY=220,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WQuestBGKeyShift=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Common.img_HUD_tutorial_quest_shift',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=106,Y2=54),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=484,OffsetY=180,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WQuestBGKeyE=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Common.img_HUD_tutorial_quest_E',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=54,Y2=54),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=535,OffsetY=180,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WQuestKeyShift=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=133,Y2=61),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=488,OffsetY=184,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WQuestKeyMouse=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Common.img_HUD_tutorial_quest_mouse',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=61,Y2=61),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=545,OffsetY=180,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WQuestKeyLeftMouse=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Common.img_HUD_tutorial_quest_mouse_1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=61,Y2=61),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=545,OffsetY=180,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WQuestKeyRightMouse=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Common.img_HUD_tutorial_quest_mouse_2',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=61,Y2=61),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=545,OffsetY=180,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WQuestKeyE=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=61,Y2=61),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=539,OffsetY=184,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
}