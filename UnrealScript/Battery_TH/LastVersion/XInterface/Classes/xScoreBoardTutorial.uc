class xScoreBoardTutorial extends xScoreBoardTeamGame
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

struct stTutorialContent
{
    var bool bCompleted;
    var int iGoal;
    var int iCurrent;
    var int iTutorialID;
    var string sContents;
};

var localized string TutorialNumber;
var localized string TutorialContents;
var localized string TutorialResult[3];
var localized string TutorialList[17];
var float fNumberX1;
var float fNumberX2;
var float fContentX1;
var float fContentX2;
var float fResultX1;
var float fResultX2;
var array<stTutorialContent> aTutorialContents;
var int iCurrentTutorialID;

function PostBeginPlay()
{
    super.PostBeginPlay();
    PushTutorialList();
    //return;    
}

function PushTutorialList()
{
    local int i;

    aTutorialContents.Length = 17;
    i = 0;
    J0x10:

    // End:0x78 [Loop If]
    if(i < 17)
    {
        // End:0x39
        if((i == 7) || i == 13)
        {
            // [Explicit Continue]
            goto J0x6E;
        }
        aTutorialContents[i].sContents = TutorialList[i];
        aTutorialContents[i].iTutorialID = i + 1;
        J0x6E:

        i++;
        // [Loop Continue]
        goto J0x10;
    }
    aTutorialContents[0].iGoal = 4;
    aTutorialContents[9].iGoal = 3;
    aTutorialContents[10].iGoal = 5;
    aTutorialContents[11].iGoal = 10;
    aTutorialContents[12].iGoal = 2;
    aTutorialContents[15].iGoal = 1;
    aTutorialContents[16].iGoal = 20;
    //return;    
}

function OnTutorialResult(int iTutorialID, int iCurrent, optional bool bCompleted)
{
    local int i;

    i = 0;
    J0x07:

    // End:0xCB [Loop If]
    if(i < aTutorialContents.Length)
    {
        // End:0xC1
        if(aTutorialContents[i].iTutorialID == iTutorialID)
        {
            aTutorialContents[i].iCurrent = iCurrent;
            // End:0x97
            if((aTutorialContents[i].iGoal > 0) && aTutorialContents[i].iCurrent >= aTutorialContents[i].iGoal)
            {
                aTutorialContents[i].bCompleted = true;
            }
            // End:0xB3
            if(bCompleted)
            {
                aTutorialContents[i].bCompleted = true;
            }
            iCurrentTutorialID = iTutorialID;
            // [Explicit Break]
            goto J0xCB;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0xCB:

    //return;    
}

simulated event DrawScoreboard(Canvas C)
{
    DrawTeamBG(C);
    DrawContentDescription(C, 0.0000000, 49.0000000);
    DrawTeamListSectionStripe(C, 311.0000000, 16);
    DrawTeamListSection(C);
    //return;    
}

simulated event DrawMiniMap(Canvas C)
{
    DrawMap(C);
    //return;    
}

function DrawTeamBG(Canvas C)
{
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    DrawTeamListBG_Tut(C);
    //return;    
}

function DrawContentDescription(Canvas C, float _OffSetX, float _OffSetY)
{
    local CalCoordsW calW;
    local float fOffSetX, fOffSetY;

    WContentBG.OffsetX = 467;
    WContentBG.OffsetY = 225;
    CalculateCoordinate(C, WContentBG, 667.0000000, 37.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WContentBG.WidgetTexture, calW.XL, calW.YL);
    fOffSetX = (_OffSetX * ScreenRatioXEx) * C.ClipX;
    fOffSetY = (_OffSetY * ScreenRatioYEx) * C.ClipY;
    C.DrawColor = DefaultFontColor;
    C.BtrDrawTextJustifiedWithVolumeLine(TutorialNumber, 1, C.ClipX * 0.2931250, C.ClipY * 0.1950000, (C.ClipX * 0.2931250) + (C.ClipX * 0.0356250), (C.ClipY * 0.1950000) + (C.ClipY * 0.0158330), int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    C.BtrDrawTextJustifiedWithVolumeLine(TutorialContents, 1, C.ClipX * 0.3431250, C.ClipY * 0.1950000, (C.ClipX * 0.3431250) + (C.ClipX * 0.2999800), (C.ClipY * 0.1950000) + (C.ClipY * 0.0158330), int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    C.BtrDrawTextJustifiedWithVolumeLine(TutorialResult[0], 1, (C.ClipX * 0.3431250) + (C.ClipX * 0.2999800), C.ClipY * 0.1950000, ((C.ClipX * 0.3431250) + (C.ClipX * 0.2999800)) + (C.ClipX * 0.0634700), (C.ClipY * 0.1950000) + (C.ClipY * 0.0158330), int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    //return;    
}

function DrawTeamListSection(Canvas C)
{
    local int lpPRI, lpCount;

    lpPRI = 0;
    J0x07:

    // End:0x68 [Loop If]
    if(lpPRI < aTutorialContents.Length)
    {
        // End:0x30
        if(aTutorialContents[lpPRI].iTutorialID <= 0)
        {
            // [Explicit Continue]
            goto J0x5E;
        }
        DrawTeamListSection_C(C, lpCount, none, lpPRI, "", 264.0000000, 258.0000000, 0.0000000);
        lpCount++;
        J0x5E:

        lpPRI++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function DrawTeamListSection_C(Canvas C, int lpCount, PlayerReplicationInfo currPRI, int lpQuestNumber, string HostName, float beginY, float markBeginY, float markPingY)
{
    local int FontSize;
    local float X1, Y1, X2, Y2;
    local string sTemp;
    local stTutorialContent stTemp;

    Y1 = ((C.ClipY * 0.2200000) + ((float(lpCount) * 0.0383000) * C.ClipY)) + (float(lpCount) * (0.0025000 * C.ClipY));
    Y2 = Y1 + (0.0383000 * C.ClipY);
    FontSize = int(TeamListMemberFontSize * C.ClipY);
    stTemp = aTutorialContents[lpQuestNumber];
    // End:0xD0
    if(stTemp.bCompleted)
    {
        C.DrawColor = DeadFontColor;        
    }
    else
    {
        // End:0xFB
        if(iCurrentTutorialID == stTemp.iTutorialID)
        {
            C.DrawColor = FriendlyColor;            
        }
        else
        {
            C.DrawColor = DefaultFontColor;
        }
    }
    X1 = 0.2937500 * C.ClipX;
    X2 = X1 + (C.ClipX * 0.0306250);
    C.BtrDrawTextJustifiedWithVolumeLine(string(lpCount + 1), 1, X1, Y1, X2, Y2, FontSize, DefaultFontShadowColor);
    X1 = 0.3431250 * C.ClipX;
    X2 = X1 + (0.3006250 * C.ClipX);
    // End:0x216
    if(aTutorialContents[lpQuestNumber].iGoal > 0)
    {
        sTemp = ((((stTemp.sContents $ "(") $ string(stTemp.iCurrent)) $ "/") $ string(stTemp.iGoal)) $ ")";        
    }
    else
    {
        sTemp = aTutorialContents[lpQuestNumber].sContents;
    }
    C.BtrDrawTextJustifiedWithVolumeLine(sTemp, 0, X1, Y1, X2, Y2, FontSize, DefaultFontShadowColor);
    // End:0x299
    if(stTemp.bCompleted)
    {
        C.SetDrawColor(byte(255), 150, 0, byte(255));
        sTemp = TutorialResult[1];        
    }
    else
    {
        // End:0x2D2
        if(iCurrentTutorialID == stTemp.iTutorialID)
        {
            C.DrawColor = FriendlyColor;
            sTemp = TutorialResult[2];            
        }
        else
        {
            sTemp = "";
        }
    }
    X1 = X2;
    X2 = X1 + (0.0637500 * C.ClipX);
    C.BtrDrawTextJustifiedWithVolumeLine(sTemp, 1, X1, Y1, X2, Y2, FontSize, DefaultFontShadowColor);
    //return;    
}

defaultproperties
{
    TutorialNumber="?????"
    TutorialContents="???????????"
    TutorialResult[0]="??????"
    TutorialResult[1]="??????"
    TutorialResult[2]="?????????"
    TutorialList[0]="???????????????"
    TutorialList[1]="????????????????????? (???? / ??? / ???? / ????)"
    TutorialList[2]="?????????????????????"
    TutorialList[3]="??????????????????????????"
    TutorialList[4]="?????????????????????????"
    TutorialList[5]="???????????????????????"
    TutorialList[6]="???????????"
    TutorialList[7]="????????????!"
    TutorialList[8]="???????????????????????????"
    TutorialList[9]="???????? 3 ??????"
    TutorialList[10]="???????????"
    TutorialList[11]="??????????"
    TutorialList[12]="?????????????"
    TutorialList[13]="?????? Rocket Launcher"
    TutorialList[14]="????"
    TutorialList[15]="?????????????????"
    TutorialList[16]="?????????????"
    fNumberX1=0.4580070
    fNumberX2=0.5136700
    fContentX1=0.3046875
    fContentX2=0.3294270
    fResultX1=0.8506250
    fResultX2=0.9206250
    WFFABG=(WidgetTexture=Texture'Warfare_TH_UI_UI.HUD_ETC.img_scoreboard_teammark_all',RenderStyle=5,TextureCoords=(X1=0,Y1=141,X2=667,Y2=188),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=467,OffsetY=178,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
}