/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4SP_HighScores.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:19
 *	Functions:13
 *
 *******************************************************************************/
class UT2K4SP_HighScores extends UT2K4GUIPage
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage imgBackground;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage imgDraw;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnExport;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIVertScrollBar sbScores;
var SPHighScore HS;
var float CurY;
var float IncY;
var float lineHeight;
var bool bFinished;
var int HilighEntry;
var int StartOffset;
var export editinline GUIFont MainFont;
var export editinline GUIFont TinyFont;
var localized string ColumnHeaders[4];
var localized string ClickToExit;
var array<PlayerRecord> PlayerList;
var SpinnyWeap SpinnyDude;
var Vector SpinnyDudeOffset;
var int nfov;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPage).InitComponent(MyController, myOwner);
    HS = PlayerOwner().Level.Game.LoadDataObject(class'SPHighScore', "SPHighScore", class'UT2K4SP_Main'.default.HighScoreFile);
    // End:0xe9
    if(HS == none)
    {
        Log("UT2K4SP_HighScores - UT2004HighScores doesn't exist, creating...");
        HS = PlayerOwner().Level.Game.CreateDataObject(class'SPHighScore', "SPHighScore", class'UT2K4SP_Main'.default.HighScoreFile);
    }
    MainFont = new class'fntUT2k4Large';
    TinyFont = new class'fntUT2k4Small';
    bInit = false;
    StartOffset = 0;
    sbScores.ItemCount = HS.Scores.Length;
    sbScores.ItemsPerPage = 10;
    sbScores.BigStep = 5;
    sbScores.CurPos = StartOffset;
    class'wUtil'.static.GetPlayerList(PlayerList);
    // End:0x19b
    if(SpinnyDude == none)
    {
        SpinnyDude = PlayerOwner().Spawn(class'SpinnyWeap');
    }
    SpinnyDude.SetDrawType(2);
    SpinnyDude.SetDrawScale(0.90);
    SpinnyDude.spinRate = 2004;
    SpinnyDude.bPlayCrouches = false;
    SpinnyDude.bPlayRandomAnims = true;
    SpinnyDude.AnimChangeInterval = 5.0;
    SpinnyDude.AnimNames.Length = 0;
    SpinnyDude.AnimNames[0] = 'Idle_Rest';
    SpinnyDude.AnimNames[1] = 'Idle_Rest';
    SpinnyDude.AnimNames[2] = 'Idle_Rest';
    SpinnyDude.AnimNames[3] = 'Idle_Rest';
    SpinnyDude.AnimNames[4] = 'Idle_Rest';
    SpinnyDude.AnimNames[5] = 'gesture_cheer';
    SpinnyDude.AnimNames[6] = 'Gesture_Taunt01';
    SpinnyDude.AnimNames[7] = 'Gesture_Taunt02';
    SpinnyDude.AnimNames[8] = 'PThrust';
    UpdateSpinnyDude();
}

event HandleParameters(string Param1, string Param2)
{
    SetTimer(0.020, true);
    HilighEntry = -1;
    // End:0x30
    if(Param1 != "")
    {
        HilighEntry = int(Param1);
    }
    // End:0x5c
    else
    {
        bFinished = true;
        bTimerRepeat = false;
        TimerInterval = 0.0;
        sbScores.bVisible = true;
    }
}

event Opened(GUIComponent Sender)
{
    local Rotator R;

    super(GUIMultiComponent).Opened(Sender);
    // End:0x46
    if(SpinnyDude != none)
    {
        R.Yaw = 32768;
        SpinnyDude.SetRotation(R + PlayerOwner().Rotation);
    }
}

event Timer()
{
    // End:0x0d
    if(!bInit)
    {
        return;
    }
    CurY += IncY;
    // End:0x5a
    if(CurY >= lineHeight / float(2))
    {
        bFinished = true;
        bTimerRepeat = false;
        TimerInterval = 0.0;
        sbScores.bVisible = true;
    }
}

function bool InternalOnDraw(Canvas Canvas)
{
    local Vector CamPos, X, Y, Z;
    local Rotator camRot;
    local float oOrgX, oOrgY, oClipX, oClipY;

    oOrgX = Canvas.OrgX;
    oOrgY = Canvas.OrgY;
    oClipX = Canvas.ClipX;
    oClipY = Canvas.ClipY;
    Canvas.OrgX = imgDraw.ActualLeft();
    Canvas.OrgY = imgDraw.ActualTop();
    Canvas.ClipX = imgDraw.ActualWidth();
    Canvas.ClipY = imgDraw.ActualHeight();
    Canvas.GetCameraLocation(CamPos, camRot);
    GetAxes(camRot, X, Y, Z);
    SpinnyDude.SetLocation(CamPos + SpinnyDudeOffset.X * X + SpinnyDudeOffset.Y * Y + SpinnyDudeOffset.Z * Z);
    Canvas.DrawActorClipped(SpinnyDude, false, imgDraw.ActualLeft(), imgDraw.ActualTop(), imgDraw.ActualWidth(), imgDraw.ActualHeight(), true, float(nfov));
    Canvas.OrgX = oOrgX;
    Canvas.OrgY = oOrgY;
    Canvas.ClipX = oClipX;
    Canvas.ClipY = oClipY;
    OnDrawScores(Canvas);
    return false;
}

function OnDrawScores(Canvas Canvas)
{
    local int i;
    local float cX, cY, outX, outY, columns;

    // End:0x8e
    if(!bInit)
    {
        lineHeight = float(Canvas.SizeY / 11);
        // End:0x58
        if(!bFinished)
        {
            CurY = -1.0 * float(HS.Scores.Length) * lineHeight;
        }
        // End:0x69
        else
        {
            CurY = lineHeight / float(2);
        }
        IncY = float(Canvas.SizeY) * 0.010;
        bInit = true;
    }
    Canvas.Reset();
    Canvas.Style = 5;
    cY = CurY;
    cX = float(Canvas.SizeX) * 0.050;
    columns[0] = cX * float(2);
    columns[1] = columns[0] + cX * float(7);
    columns[2] = columns[1] + cX * float(6);
    columns[3] = columns[2] + cX * float(2);
    columns[4] = columns[3] + cX * float(2);
    i = 0;
    J0x165:
    // End:0x555 [While If]
    if(i < HS.Scores.Length)
    {
        // End:0x19b
        if(cY > float(Canvas.SizeY))
        {
        }
        // End:0x555
        else
        {
            // End:0x1be
            if(i + StartOffset >= HS.Scores.Length)
            {
            }
            // End:0x555
            else
            {
                // End:0x525
                if(cY + lineHeight > float(0))
                {
                    // End:0x20d
                    if(MainFont != none)
                    {
                        Canvas.Font = MainFont.GetFont(Canvas.SizeX / 3);
                    }
                    // End:0x241
                    if(HilighEntry == i + StartOffset)
                    {
                        Canvas.SetDrawColor(byte(255), 225, 0, byte(255));
                    }
                    // End:0x2a4
                    else
                    {
                        // End:0x285
                        if(HS.Scores[i + StartOffset].bDrone)
                        {
                            Canvas.SetDrawColor(byte(255), byte(255), byte(255), 128);
                        }
                        // End:0x2a4
                        else
                        {
                            Canvas.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
                        }
                    }
                    Canvas.DrawTextJustified(string(i + StartOffset + 1) $ ". ", 2, 0.0, cY, columns[0], cY + lineHeight);
                    Canvas.DrawTextJustified(HS.Scores[i + StartOffset].Name, 0, columns[0], cY, columns[2], cY + lineHeight);
                    Canvas.StrLen(HS.Scores[i + StartOffset].Name, outX, outY);
                    Canvas.DrawTextJustified(class'UT2K4GameProfile'.static.MoneyToString(HS.Scores[i + StartOffset].Balance), 2, columns[0], cY, columns[2], cY + lineHeight);
                    Canvas.DrawTextJustified(string(HS.Scores[i + StartOffset].Matches), 2, columns[2], cY, columns[3], cY + lineHeight);
                    Canvas.DrawTextJustified(string(HS.Scores[i + StartOffset].Wins), 2, columns[3], cY, columns[4], cY + lineHeight);
                    // End:0x4af
                    if(TinyFont != none)
                    {
                        Canvas.Font = TinyFont.GetFont(Canvas.SizeX);
                    }
                    Canvas.DrawTextJustified(class'UT2K4SPTab_ProfileNew'.default.DifficultyLevels[int(HS.Scores[i + StartOffset].Difficulty)], 0, columns[0], cY + outY + lineHeight * 0.20, columns[1], cY + lineHeight);
                }
                cY += lineHeight;
                // End:0x54b
                if(bFinished && i == 9)
                {
                }
                // End:0x555
                else
                {
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x165;
                }
            }
        }
    }
    // End:0x864
    if(bFinished)
    {
        Canvas.SetDrawColor(byte(255), byte(255), byte(255), 196);
        cY = lineHeight * 0.10;
        // End:0x5c4
        if(TinyFont != none)
        {
            Canvas.Font = TinyFont.GetFont(Canvas.SizeX);
        }
        Canvas.DrawTextJustified(ColumnHeaders[0], 1, columns[0], cY, columns[1], cY + lineHeight / float(2));
        Canvas.DrawTextJustified(ColumnHeaders[1], 1, columns[1], cY, columns[2], cY + lineHeight / float(2));
        Canvas.DrawTextJustified(ColumnHeaders[2], 1, columns[2], cY, columns[3], cY + lineHeight / float(2));
        Canvas.DrawTextJustified(ColumnHeaders[3], 1, columns[3], cY, columns[4], cY + lineHeight / float(2));
        Canvas.CurX = cX / float(2);
        Canvas.DrawHorizontal(cY + lineHeight / float(2), cX * 18.50);
        // End:0x73d
        if(TinyFont != none)
        {
            Canvas.Font = TinyFont.GetFont(Canvas.SizeX);
        }
        Canvas.TextSize(ClickToExit, outX, outY);
        outY *= 1.0050;
        Canvas.SetDrawColor(0, 0, 0, 196);
        Canvas.DrawTextJustified(ClickToExit, 1, 0.0 + float(Canvas.SizeX) * 0.0010, float(Canvas.SizeY) - outY * 1.0010, float(Canvas.SizeX) * 1.0010, float(Canvas.SizeY) * 1.0010);
        Canvas.SetDrawColor(226, 196, 0, 196);
        Canvas.DrawTextJustified(ClickToExit, 1, 0.0, float(Canvas.SizeY) - outY, float(Canvas.SizeX), float(Canvas.SizeY));
    }
}

function bool OnImgClick(GUIComponent Sender)
{
    Log(string(Sender));
    return Controller.CloseMenu(false);
}

function bool OnExportClick(GUIComponent Sender)
{
    local export editinline GUIQuestionPage QPage;

    ExportToFile();
    // End:0x99
    if(Controller.OpenMenu("GUI2K4.GUI2K4QuestionPage"))
    {
        QPage = GUIQuestionPage(Controller.TopPage());
        QPage.SetupQuestion("High scores saved to: ..\\UserLogs\\UT2004_HighScores.txt", 1, 1);
    }
    return true;
}

function ExportToFile()
{
    local int i;
    local FileLog output;

    output = PlayerOwner().Spawn(class'FileLog');
    output.OpenLog("UT2004_HighScores", "txt");
    output.Logf(Chr(9) $ "name" $ Chr(9) $ "balance" $ Chr(9) $ "matches" $ Chr(9) $ "wins");
    output.Logf("--------------------------------------------------------------------------------");
    i = 0;
    J0xef:
    // End:0x1b5 [While If]
    if(i < HS.Scores.Length)
    {
        output.Logf(string(i + 1) $ Chr(9) $ HS.Scores[i].Name $ Chr(9) $ string(HS.Scores[i].Balance) $ Chr(9) $ string(HS.Scores[i].Matches) $ Chr(9) $ string(HS.Scores[i].Wins));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xef;
    }
    output.CloseLog();
}

function bool WindowOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x0d
    if(!bFinished)
    {
        return false;
    }
    // End:0x1c
    if(State != 1)
    {
        return false;
    }
    // End:0x4e
    if(key == 38 || key == 236)
    {
        sbScores.WheelUp();
        return true;
    }
    // End:0x23c
    else
    {
        // End:0x80
        if(key == 40 || key == 237)
        {
            sbScores.WheelDown();
            return true;
        }
        // End:0x23c
        else
        {
            // End:0xab
            if(key == 50)
            {
                SpinnyDudeOffset.X = SpinnyDudeOffset.X + float(1);
            }
            // End:0x23c
            else
            {
                // End:0xd6
                if(key == 49)
                {
                    SpinnyDudeOffset.X = SpinnyDudeOffset.X - float(1);
                }
                // End:0x23c
                else
                {
                    // End:0x101
                    if(key == 52)
                    {
                        SpinnyDudeOffset.Y = SpinnyDudeOffset.Y + float(1);
                    }
                    // End:0x23c
                    else
                    {
                        // End:0x12c
                        if(key == 51)
                        {
                            SpinnyDudeOffset.Y = SpinnyDudeOffset.Y - float(1);
                        }
                        // End:0x23c
                        else
                        {
                            // End:0x157
                            if(key == 54)
                            {
                                SpinnyDudeOffset.Z = SpinnyDudeOffset.Z + float(1);
                            }
                            // End:0x23c
                            else
                            {
                                // End:0x182
                                if(key == 53)
                                {
                                    SpinnyDudeOffset.Z = SpinnyDudeOffset.Z - float(1);
                                }
                                // End:0x23c
                                else
                                {
                                    // End:0x1b3
                                    if(key == 56)
                                    {
                                        SpinnyDude.spinRate = SpinnyDude.spinRate + 1;
                                    }
                                    // End:0x23c
                                    else
                                    {
                                        // End:0x1e4
                                        if(key == 55)
                                        {
                                            SpinnyDude.spinRate = SpinnyDude.spinRate - 1;
                                        }
                                        // End:0x23c
                                        else
                                        {
                                            // End:0x23c
                                            if(key == 48)
                                            {
                                                Log("SpinnyDudeOffset =" @ string(SpinnyDudeOffset) @ " SpinnyDudeSpinRate =" @ string(SpinnyDude.spinRate));
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return false;
}

function OnScrollPosChanged(int NewPos)
{
    StartOffset = NewPos;
}

function UpdateSpinnyDude()
{
    local int idx;
    local PlayerRecord Rec;
    local Mesh PlayerMesh;
    local Material BodySkin, HeadSkin;
    local string BodySkinName, HeadSkinName;
    local UT2K4GameProfile GP;

    GP = UT2K4GameProfile(PlayerOwner().Level.Game.CurrentGameProfile);
    // End:0x146
    if(GP != none)
    {
        // End:0xf8
        if(GP.bCompleted && GP.PlayerCharacter ~= "Mr.Crow")
        {
            PlayerMesh = Mesh(DynamicLoadObject("GenericSD.TC", class'Mesh'));
            SpinnyDude.LinkMesh(PlayerMesh);
            SpinnyDude.Skins[0] = Texture(DynamicLoadObject("GenericSD.ToiletCar", class'Texture'));
            SpinnyDudeOffset = vect(354.0, 0.0, -19.0);
            SpinnyDude.bPlayRandomAnims = false;
            return;
        }
        // End:0x146
        if(GP.bCompleted)
        {
            // End:0x146
            if(HS.UnlockedChars.Length > 0)
            {
                BodySkinName = HS.UnlockedChars[HS.UnlockedChars.Length - 1];
            }
        }
    }
    idx = -1;
    // End:0x1a3
    if(BodySkinName != "")
    {
        idx = 0;
        J0x164:
        // End:0x19b [While If]
        if(idx < PlayerList.Length)
        {
            // End:0x191
            if(PlayerList[idx].DefaultName ~= BodySkinName)
            {
            }
            // End:0x19b
            else
            {
                ++ idx;
                // This is an implied JumpToken; Continue!
                goto J0x164;
            }
        }
        BodySkinName = "";
    }
    // End:0x1d2
    if(idx >= PlayerList.Length || idx == -1)
    {
        idx = Rand(PlayerList.Length);
    }
    // End:0x1f1
    if(idx < 0 || idx >= PlayerList.Length)
    {
        return;
    }
    Rec = PlayerList[idx];
    // End:0x27c
    if(Rec.Race ~= "Juggernaut" || Rec.DefaultName ~= "Axon" || Rec.DefaultName ~= "Cyclops" || Rec.DefaultName ~= "Virus")
    {
        SpinnyDudeOffset = vect(273.0, 0.0, -11.0);
    }
    // End:0x28f
    else
    {
        SpinnyDudeOffset = vect(273.0, 0.0, -17.0);
    }
    PlayerMesh = Mesh(DynamicLoadObject(Rec.MeshName, class'Mesh'));
    // End:0x2fe
    if(PlayerMesh == none)
    {
        Log("Could not load mesh: " $ Rec.MeshName $ " for player: " $ Rec.DefaultName);
        return;
    }
    BodySkinName = Rec.BodySkinName;
    HeadSkinName = Rec.FaceSkinName;
    BodySkin = Material(DynamicLoadObject(BodySkinName, class'Material'));
    // End:0x391
    if(BodySkin == none)
    {
        Log("Could not load body material: " $ Rec.BodySkinName $ " For player: " $ Rec.DefaultName);
        return;
    }
    HeadSkin = Material(DynamicLoadObject(HeadSkinName, class'Material'));
    // End:0x3ff
    if(HeadSkin == none)
    {
        Log("Could not load head material: " $ HeadSkinName $ " For player: " $ Rec.DefaultName);
        return;
    }
    SpinnyDude.LinkMesh(PlayerMesh);
    SpinnyDude.Skins[0] = BodySkin;
    SpinnyDude.Skins[1] = HeadSkin;
    SpinnyDude.LoopAnim('Idle_Rest', 1.0 / SpinnyDude.Level.TimeDilation);
}

function free()
{
    super(GUIPage).free();
    // End:0x1d
    if(SpinnyDude != none)
    {
        SpinnyDude.Destroy();
    }
    SpinnyDude = none;
}

defaultproperties
{
    begin object name=SPMimgBackground class=GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        RenderWeight=0.0010
        bAcceptsInput=true
        bNeverFocus=true
        OnClick=OnImgClick
        OnKeyEvent=WindowOnKeyEvent
    object end
    // Reference: GUIImage'UT2K4SP_HighScores.SPMimgBackground'
    imgBackground=SPMimgBackground
    begin object name=SPMimgDraw class=GUIImage
        RenderWeight=0.0020
        bAcceptsInput=true
        bNeverFocus=true
        OnDraw=InternalOnDraw
        OnClick=OnImgClick
        OnKeyEvent=WindowOnKeyEvent
    object end
    // Reference: GUIImage'UT2K4SP_HighScores.SPMimgDraw'
    imgDraw=SPMimgDraw
    begin object name=SPMbtnExport class=GUIButton
        Caption="??? ????"
        FontScale=0
        WinTop=0.950
        WinLeft=0.40
        WinWidth=0.20
        WinHeight=0.0040
        RenderWeight=0.20
        bVisible=true
        OnClick=OnExportClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SP_HighScores.SPMbtnExport'
    btnExport=SPMbtnExport
    begin object name=SPMsbScores class=GUIVertScrollBar
        PositionChanged=OnScrollPosChanged
        WinLeft=0.96250
        WinWidth=0.03750
        RenderWeight=1.0
        bVisible=true
        OnPreDraw=GripPreDraw
    object end
    // Reference: GUIVertScrollBar'UT2K4SP_HighScores.SPMsbScores'
    sbScores=SPMsbScores
    ColumnHeaders[0]="??"
    ColumnHeaders[1]="???"
    ColumnHeaders[2]="??"
    ColumnHeaders[3]="?? ??"
    ClickToExit="? ? ? ? ? ? ? ? ? ? ? ?"
    SpinnyDudeOffset=(X=273.0,Y=0.0,Z=-11.0)
    nfov=15
    OnKeyEvent=WindowOnKeyEvent
}