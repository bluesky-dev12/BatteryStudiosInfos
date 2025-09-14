class UT2K4SP_HighScores extends UT2K4GUIPage
    editinlinenew
    instanced;

var() automated GUIImage imgBackground;
var() automated GUIImage imgDraw;
var() automated GUIButton btnExport;
var() automated GUIVertScrollBar sbScores;
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
    HS = PlayerOwner().Level.Game.LoadDataObject(Class'GUI2K4_Decompressed.SPHighScore', "SPHighScore", Class'GUI2K4_Decompressed.UT2K4SP_Main'.default.HighScoreFile);
    // End:0xE9
    if(HS == none)
    {
        Log("UT2K4SP_HighScores - UT2004HighScores doesn't exist, creating...");
        HS = PlayerOwner().Level.Game.CreateDataObject(Class'GUI2K4_Decompressed.SPHighScore', "SPHighScore", Class'GUI2K4_Decompressed.UT2K4SP_Main'.default.HighScoreFile);
    }
    MainFont = new Class'GUI2K4_Decompressed.fntUT2k4Large';
    TinyFont = new Class'GUI2K4_Decompressed.fntUT2k4Small';
    bInit = false;
    StartOffset = 0;
    sbScores.ItemCount = HS.Scores.Length;
    sbScores.ItemsPerPage = 10;
    sbScores.BigStep = 5;
    sbScores.CurPos = StartOffset;
    Class'WGame.wUtil'.static.GetPlayerList(PlayerList);
    // End:0x19B
    if(SpinnyDude == none)
    {
        SpinnyDude = PlayerOwner().Spawn(Class'XInterface.SpinnyWeap');
    }
    SpinnyDude.SetDrawType(2);
    SpinnyDude.SetDrawScale(0.9000000);
    SpinnyDude.spinRate = 2004;
    SpinnyDude.bPlayCrouches = false;
    SpinnyDude.bPlayRandomAnims = true;
    SpinnyDude.AnimChangeInterval = 5.0000000;
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
    //return;    
}

event HandleParameters(string Param1, string Param2)
{
    SetTimer(0.0200000, true);
    HilighEntry = -1;
    // End:0x30
    if(Param1 != "")
    {
        HilighEntry = int(Param1);        
    }
    else
    {
        bFinished = true;
        bTimerRepeat = false;
        TimerInterval = 0.0000000;
        sbScores.bVisible = true;
    }
    //return;    
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
    //return;    
}

event Timer()
{
    // End:0x0D
    if(!bInit)
    {
        return;
    }
    CurY += IncY;
    // End:0x5A
    if(CurY >= (lineHeight / float(2)))
    {
        bFinished = true;
        bTimerRepeat = false;
        TimerInterval = 0.0000000;
        sbScores.bVisible = true;
    }
    //return;    
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
    SpinnyDude.SetLocation(((CamPos + (SpinnyDudeOffset.X * X)) + (SpinnyDudeOffset.Y * Y)) + (SpinnyDudeOffset.Z * Z));
    Canvas.DrawActorClipped(SpinnyDude, false, imgDraw.ActualLeft(), imgDraw.ActualTop(), imgDraw.ActualWidth(), imgDraw.ActualHeight(), true, float(nfov));
    Canvas.OrgX = oOrgX;
    Canvas.OrgY = oOrgY;
    Canvas.ClipX = oClipX;
    Canvas.ClipY = oClipY;
    OnDrawScores(Canvas);
    return false;
    //return;    
}

function OnDrawScores(Canvas Canvas)
{
    local int i;
    local float cX, cY, outX, outY, columns;

    // End:0x8E
    if(!bInit)
    {
        lineHeight = float(Canvas.SizeY / 11);
        // End:0x58
        if(!bFinished)
        {
            CurY = (-1.0000000 * float(HS.Scores.Length)) * lineHeight;            
        }
        else
        {
            CurY = lineHeight / float(2);
        }
        IncY = float(Canvas.SizeY) * 0.0100000;
        bInit = true;
    }
    Canvas.Reset();
    Canvas.Style = 5;
    cY = CurY;
    cX = float(Canvas.SizeX) * 0.0500000;
    columns[0] = cX * float(2);
    columns[1] = columns[0] + (cX * float(7));
    columns[2] = columns[1] + (cX * float(6));
    columns[3] = columns[2] + (cX * float(2));
    columns[4] = columns[3] + (cX * float(2));
    i = 0;
    J0x165:

    // End:0x555 [Loop If]
    if(i < HS.Scores.Length)
    {
        // End:0x19B
        if(cY > float(Canvas.SizeY))
        {
            // [Explicit Break]
            goto J0x555;
        }
        // End:0x1BE
        if((i + StartOffset) >= HS.Scores.Length)
        {
            // [Explicit Break]
            goto J0x555;
        }
        // End:0x525
        if((cY + lineHeight) > float(0))
        {
            // End:0x20D
            if(MainFont != none)
            {
                Canvas.Font = MainFont.GetFont(Canvas.SizeX / 3);
            }
            // End:0x241
            if(HilighEntry == (i + StartOffset))
            {
                Canvas.SetDrawColor(byte(255), 225, 0, byte(255));                
            }
            else
            {
                // End:0x285
                if(HS.Scores[i + StartOffset].bDrone)
                {
                    Canvas.SetDrawColor(byte(255), byte(255), byte(255), 128);                    
                }
                else
                {
                    Canvas.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
                }
            }
            Canvas.DrawTextJustified(string((i + StartOffset) + 1) $ ". ", 2, 0.0000000, cY, columns[0], cY + lineHeight);
            Canvas.DrawTextJustified(HS.Scores[i + StartOffset].Name, 0, columns[0], cY, columns[2], cY + lineHeight);
            Canvas.StrLen(HS.Scores[i + StartOffset].Name, outX, outY);
            Canvas.DrawTextJustified(Class'WGame.UT2K4GameProfile'.static.MoneyToString(HS.Scores[i + StartOffset].Balance), 2, columns[0], cY, columns[2], cY + lineHeight);
            Canvas.DrawTextJustified(string(HS.Scores[i + StartOffset].Matches), 2, columns[2], cY, columns[3], cY + lineHeight);
            Canvas.DrawTextJustified(string(HS.Scores[i + StartOffset].Wins), 2, columns[3], cY, columns[4], cY + lineHeight);
            // End:0x4AF
            if(TinyFont != none)
            {
                Canvas.Font = TinyFont.GetFont(Canvas.SizeX);
            }
            Canvas.DrawTextJustified(Class'GUI2K4_Decompressed.UT2K4SPTab_ProfileNew'.default.DifficultyLevels[int(HS.Scores[i + StartOffset].Difficulty)], 0, columns[0], (cY + outY) + (lineHeight * 0.2000000), columns[1], cY + lineHeight);
        }
        cY += lineHeight;
        // End:0x54B
        if(bFinished && i == 9)
        {
            // [Explicit Break]
            goto J0x555;
        }
        i++;
        // [Loop Continue]
        goto J0x165;
    }
    J0x555:

    // End:0x864
    if(bFinished)
    {
        Canvas.SetDrawColor(byte(255), byte(255), byte(255), 196);
        cY = lineHeight * 0.1000000;
        // End:0x5C4
        if(TinyFont != none)
        {
            Canvas.Font = TinyFont.GetFont(Canvas.SizeX);
        }
        Canvas.DrawTextJustified(ColumnHeaders[0], 1, columns[0], cY, columns[1], cY + (lineHeight / float(2)));
        Canvas.DrawTextJustified(ColumnHeaders[1], 1, columns[1], cY, columns[2], cY + (lineHeight / float(2)));
        Canvas.DrawTextJustified(ColumnHeaders[2], 1, columns[2], cY, columns[3], cY + (lineHeight / float(2)));
        Canvas.DrawTextJustified(ColumnHeaders[3], 1, columns[3], cY, columns[4], cY + (lineHeight / float(2)));
        Canvas.CurX = cX / float(2);
        Canvas.DrawHorizontal(cY + (lineHeight / float(2)), cX * 18.5000000);
        // End:0x73D
        if(TinyFont != none)
        {
            Canvas.Font = TinyFont.GetFont(Canvas.SizeX);
        }
        Canvas.TextSize(ClickToExit, outX, outY);
        outY *= 1.0050000;
        Canvas.SetDrawColor(0, 0, 0, 196);
        Canvas.DrawTextJustified(ClickToExit, 1, 0.0000000 + (float(Canvas.SizeX) * 0.0010000), (float(Canvas.SizeY) - outY) * 1.0010000, float(Canvas.SizeX) * 1.0010000, float(Canvas.SizeY) * 1.0010000);
        Canvas.SetDrawColor(226, 196, 0, 196);
        Canvas.DrawTextJustified(ClickToExit, 1, 0.0000000, float(Canvas.SizeY) - outY, float(Canvas.SizeX), float(Canvas.SizeY));
    }
    //return;    
}

function bool OnImgClick(GUIComponent Sender)
{
    Log(string(Sender));
    return Controller.CloseMenu(false);
    //return;    
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
    //return;    
}

function ExportToFile()
{
    local int i;
    local FileLog output;

    output = PlayerOwner().Spawn(Class'Engine.FileLog');
    output.OpenLog("UT2004_HighScores", "txt");
    output.Logf(((((((Chr(9) $ "name") $ Chr(9)) $ "balance") $ Chr(9)) $ "matches") $ Chr(9)) $ "wins");
    output.Logf("--------------------------------------------------------------------------------");
    i = 0;
    J0xEF:

    // End:0x1B5 [Loop If]
    if(i < HS.Scores.Length)
    {
        output.Logf((((((((string(i + 1) $ Chr(9)) $ HS.Scores[i].Name) $ Chr(9)) $ string(HS.Scores[i].Balance)) $ Chr(9)) $ string(HS.Scores[i].Matches)) $ Chr(9)) $ string(HS.Scores[i].Wins));
        i++;
        // [Loop Continue]
        goto J0xEF;
    }
    output.CloseLog();
    //return;    
}

function bool WindowOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x0D
    if(!bFinished)
    {
        return false;
    }
    // End:0x1C
    if(int(State) != 1)
    {
        return false;
    }
    // End:0x4E
    if((int(key) == 38) || int(key) == 236)
    {
        sbScores.WheelUp();
        return true;        
    }
    else
    {
        // End:0x80
        if((int(key) == 40) || int(key) == 237)
        {
            sbScores.WheelDown();
            return true;            
        }
        else
        {
            // End:0xAB
            if(int(key) == 50)
            {
                SpinnyDudeOffset.X = SpinnyDudeOffset.X + float(1);                
            }
            else
            {
                // End:0xD6
                if(int(key) == 49)
                {
                    SpinnyDudeOffset.X = SpinnyDudeOffset.X - float(1);                    
                }
                else
                {
                    // End:0x101
                    if(int(key) == 52)
                    {
                        SpinnyDudeOffset.Y = SpinnyDudeOffset.Y + float(1);                        
                    }
                    else
                    {
                        // End:0x12C
                        if(int(key) == 51)
                        {
                            SpinnyDudeOffset.Y = SpinnyDudeOffset.Y - float(1);                            
                        }
                        else
                        {
                            // End:0x157
                            if(int(key) == 54)
                            {
                                SpinnyDudeOffset.Z = SpinnyDudeOffset.Z + float(1);                                
                            }
                            else
                            {
                                // End:0x182
                                if(int(key) == 53)
                                {
                                    SpinnyDudeOffset.Z = SpinnyDudeOffset.Z - float(1);                                    
                                }
                                else
                                {
                                    // End:0x1B3
                                    if(int(key) == 56)
                                    {
                                        SpinnyDude.spinRate = SpinnyDude.spinRate + 1;                                        
                                    }
                                    else
                                    {
                                        // End:0x1E4
                                        if(int(key) == 55)
                                        {
                                            SpinnyDude.spinRate = SpinnyDude.spinRate - 1;                                            
                                        }
                                        else
                                        {
                                            // End:0x23C
                                            if(int(key) == 48)
                                            {
                                                Log((("SpinnyDudeOffset =" @ string(SpinnyDudeOffset)) @ " SpinnyDudeSpinRate =") @ string(SpinnyDude.spinRate));
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
    //return;    
}

function OnScrollPosChanged(int NewPos)
{
    StartOffset = NewPos;
    //return;    
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
        // End:0xF8
        if(GP.bCompleted && GP.PlayerCharacter ~= "Mr.Crow")
        {
            PlayerMesh = Mesh(DynamicLoadObject("GenericSD.TC", Class'Engine.Mesh'));
            SpinnyDude.LinkMesh(PlayerMesh);
            SpinnyDude.Skins[0] = Texture(DynamicLoadObject("GenericSD.ToiletCar", Class'Engine.Texture'));
            SpinnyDudeOffset = vect(354.0000000, 0.0000000, -19.0000000);
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
    // End:0x1A3
    if(BodySkinName != "")
    {
        idx = 0;
        J0x164:

        // End:0x19B [Loop If]
        if(idx < PlayerList.Length)
        {
            // End:0x191
            if(PlayerList[idx].DefaultName ~= BodySkinName)
            {
                // [Explicit Break]
                goto J0x19B;
            }
            idx++;
            // [Loop Continue]
            goto J0x164;
        }
        J0x19B:

        BodySkinName = "";
    }
    // End:0x1D2
    if((idx >= PlayerList.Length) || idx == -1)
    {
        idx = Rand(PlayerList.Length);
    }
    // End:0x1F1
    if((idx < 0) || idx >= PlayerList.Length)
    {
        return;
    }
    Rec = PlayerList[idx];
    // End:0x27C
    if((((Rec.Race ~= "Juggernaut") || Rec.DefaultName ~= "Axon") || Rec.DefaultName ~= "Cyclops") || Rec.DefaultName ~= "Virus")
    {
        SpinnyDudeOffset = vect(273.0000000, 0.0000000, -11.0000000);        
    }
    else
    {
        SpinnyDudeOffset = vect(273.0000000, 0.0000000, -17.0000000);
    }
    PlayerMesh = Mesh(DynamicLoadObject(Rec.MeshName, Class'Engine.Mesh'));
    // End:0x2FE
    if(PlayerMesh == none)
    {
        Log((("Could not load mesh: " $ Rec.MeshName) $ " for player: ") $ Rec.DefaultName);
        return;
    }
    BodySkinName = Rec.BodySkinName;
    HeadSkinName = Rec.FaceSkinName;
    BodySkin = Material(DynamicLoadObject(BodySkinName, Class'Engine.Material'));
    // End:0x391
    if(BodySkin == none)
    {
        Log((("Could not load body material: " $ Rec.BodySkinName) $ " For player: ") $ Rec.DefaultName);
        return;
    }
    HeadSkin = Material(DynamicLoadObject(HeadSkinName, Class'Engine.Material'));
    // End:0x3FF
    if(HeadSkin == none)
    {
        Log((("Could not load head material: " $ HeadSkinName) $ " For player: ") $ Rec.DefaultName);
        return;
    }
    SpinnyDude.LinkMesh(PlayerMesh);
    SpinnyDude.Skins[0] = BodySkin;
    SpinnyDude.Skins[1] = HeadSkin;
    SpinnyDude.LoopAnim('Idle_Rest', 1.0000000 / SpinnyDude.Level.TimeDilation);
    //return;    
}

function free()
{
    super(GUIPage).free();
    // End:0x1D
    if(SpinnyDude != none)
    {
        SpinnyDude.Destroy();
    }
    SpinnyDude = none;
    //return;    
}

defaultproperties
{
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SP_HighScores.SPMimgBackground'
    begin object name="SPMimgBackground" class=XInterface.GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        RenderWeight=0.0010000
        bAcceptsInput=true
        bNeverFocus=true
        OnClick=UT2K4SP_HighScores.OnImgClick
        OnKeyEvent=UT2K4SP_HighScores.WindowOnKeyEvent
    end object
    imgBackground=SPMimgBackground
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SP_HighScores.SPMimgDraw'
    begin object name="SPMimgDraw" class=XInterface.GUIImage
        RenderWeight=0.0020000
        bAcceptsInput=true
        bNeverFocus=true
        OnDraw=UT2K4SP_HighScores.InternalOnDraw
        OnClick=UT2K4SP_HighScores.OnImgClick
        OnKeyEvent=UT2K4SP_HighScores.WindowOnKeyEvent
    end object
    imgDraw=SPMimgDraw
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SP_HighScores.SPMbtnExport'
    begin object name="SPMbtnExport" class=XInterface.GUIButton
        Caption="??? ????"
        FontScale=0
        WinTop=0.9500000
        WinLeft=0.4000000
        WinWidth=0.2000000
        WinHeight=0.0040000
        RenderWeight=0.2000000
        bVisible=false
        OnClick=UT2K4SP_HighScores.OnExportClick
        OnKeyEvent=SPMbtnExport.InternalOnKeyEvent
    end object
    btnExport=SPMbtnExport
    // Reference: GUIVertScrollBar'GUI2K4_Decompressed.UT2K4SP_HighScores.SPMsbScores'
    begin object name="SPMsbScores" class=XInterface.GUIVertScrollBar
        PositionChanged=UT2K4SP_HighScores.OnScrollPosChanged
        WinLeft=0.9625000
        WinWidth=0.0375000
        RenderWeight=1.0000000
        bVisible=false
        OnPreDraw=SPMsbScores.GripPreDraw
    end object
    sbScores=SPMsbScores
    ColumnHeaders[0]="??"
    ColumnHeaders[1]="???"
    ColumnHeaders[2]="??"
    ColumnHeaders[3]="?? ??"
    ClickToExit="? ? ? ? ? ? ? ? ? ? ? ?"
    SpinnyDudeOffset=(X=273.0000000,Y=0.0000000,Z=-11.0000000)
    nfov=15
    OnKeyEvent=UT2K4SP_HighScores.WindowOnKeyEvent
}