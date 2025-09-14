/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\xScoreBoardTutorial.uc
 * Package Imports:
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:12
 *	Functions:9
 *
 *******************************************************************************/
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
}

function PushTutorialList()
{
    local int i;

    aTutorialContents.Length = 17;
    i = 0;
    J0x10:
    // End:0x78 [While If]
    if(i < 17)
    {
        // End:0x39
        if(i == 7 || i == 13)
        {
        }
        // End:0x6e
        else
        {
            aTutorialContents[i].sContents = TutorialList[i];
            aTutorialContents[i].iTutorialID = i + 1;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x10;
    }
    aTutorialContents[0].iGoal = 4;
    aTutorialContents[9].iGoal = 3;
    aTutorialContents[10].iGoal = 5;
    aTutorialContents[11].iGoal = 10;
    aTutorialContents[12].iGoal = 2;
    aTutorialContents[15].iGoal = 1;
    aTutorialContents[16].iGoal = 20;
}

function OnTutorialResult(int iTutorialID, int iCurrent, optional bool bCompleted)
{
    local int i;

    i = 0;
    J0x07:
    // End:0xcb [While If]
    if(i < aTutorialContents.Length)
    {
        // End:0xc1
        if(aTutorialContents[i].iTutorialID == iTutorialID)
        {
            aTutorialContents[i].iCurrent = iCurrent;
            // End:0x97
            if(aTutorialContents[i].iGoal > 0 && aTutorialContents[i].iCurrent >= aTutorialContents[i].iGoal)
            {
                aTutorialContents[i].bCompleted = true;
            }
            // End:0xb3
            if(bCompleted)
            {
                aTutorialContents[i].bCompleted = true;
            }
            iCurrentTutorialID = iTutorialID;
        }
        // End:0xcb
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }
}

simulated event DrawScoreboard(Canvas C)
{
    DrawTeamBG(C);
    DrawContentDescription(C, 0.0, 49.0);
    DrawTeamListSectionStripe(C, 311.0, 16);
    DrawTeamListSection(C);
}

simulated event DrawMiniMap(Canvas C)
{
    DrawMap(C);
}

function DrawTeamBG(Canvas C)
{
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    DrawTeamListBG_Tut(C);
}

function DrawContentDescription(Canvas C, float _OffSetX, float _OffSetY)
{
    local CalCoordsW calW;
    local float fOffSetX, fOffSetY;

    WContentBG.OffsetX = 467;
    WContentBG.OffsetY = 225;
    CalculateCoordinate(C, WContentBG, 667.0, 37.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WContentBG.WidgetTexture, calW.XL, calW.YL);
    fOffSetX = _OffSetX * ScreenRatioXEx * C.ClipX;
    fOffSetY = _OffSetY * ScreenRatioYEx * C.ClipY;
    C.DrawColor = DefaultFontColor;
    C.BtrDrawTextJustifiedWithVolumeLine(TutorialNumber, 1, C.ClipX * 0.2931250, C.ClipY * 0.1950, C.ClipX * 0.2931250 + C.ClipX * 0.0356250, C.ClipY * 0.1950 + C.ClipY * 0.0158330, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    C.BtrDrawTextJustifiedWithVolumeLine(TutorialContents, 1, C.ClipX * 0.3431250, C.ClipY * 0.1950, C.ClipX * 0.3431250 + C.ClipX * 0.299980, C.ClipY * 0.1950 + C.ClipY * 0.0158330, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    C.BtrDrawTextJustifiedWithVolumeLine(TutorialResult[0], 1, C.ClipX * 0.3431250 + C.ClipX * 0.299980, C.ClipY * 0.1950, C.ClipX * 0.3431250 + C.ClipX * 0.299980 + C.ClipX * 0.063470, C.ClipY * 0.1950 + C.ClipY * 0.0158330, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
}

function DrawTeamListSection(Canvas C)
{
    local int lpPRI, lpCount;

    lpPRI = 0;
    J0x07:
    // End:0x68 [While If]
    if(lpPRI < aTutorialContents.Length)
    {
        // End:0x30
        if(aTutorialContents[lpPRI].iTutorialID <= 0)
        {
        }
        // End:0x5e
        else
        {
            DrawTeamListSection_C(C, lpCount, none, lpPRI, "", 264.0, 258.0, 0.0);
            ++ lpCount;
        }
        ++ lpPRI;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function DrawTeamListSection_C(Canvas C, int lpCount, PlayerReplicationInfo currPRI, int lpQuestNumber, string HostName, float beginY, float markBeginY, float markPingY)
{
    local int FontSize;
    local float X1, Y1, X2, Y2;
    local string sTemp;
    local stTutorialContent stTemp;

    Y1 = C.ClipY * 0.220 + float(lpCount) * 0.03830 * C.ClipY + float(lpCount) * 0.00250 * C.ClipY;
    Y2 = Y1 + 0.03830 * C.ClipY;
    FontSize = int(TeamListMemberFontSize * C.ClipY);
    stTemp = aTutorialContents[lpQuestNumber];
    // End:0xd0
    if(stTemp.bCompleted)
    {
        C.DrawColor = DeadFontColor;
    }
    // End:0x10f
    else
    {
        // End:0xfb
        if(iCurrentTutorialID == stTemp.iTutorialID)
        {
            C.DrawColor = FriendlyColor;
        }
        // End:0x10f
        else
        {
            C.DrawColor = DefaultFontColor;
        }
    }
    X1 = 0.293750 * C.ClipX;
    X2 = X1 + C.ClipX * 0.0306250;
    C.BtrDrawTextJustifiedWithVolumeLine(string(lpCount + 1), 1, X1, Y1, X2, Y2, FontSize, DefaultFontShadowColor);
    X1 = 0.3431250 * C.ClipX;
    X2 = X1 + 0.3006250 * C.ClipX;
    // End:0x216
    if(aTutorialContents[lpQuestNumber].iGoal > 0)
    {
        sTemp = stTemp.sContents $ "(" $ string(stTemp.iCurrent) $ "/" $ string(stTemp.iGoal) $ ")";
    }
    // End:0x22c
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
    // End:0x2da
    else
    {
        // End:0x2d2
        if(iCurrentTutorialID == stTemp.iTutorialID)
        {
            C.DrawColor = FriendlyColor;
            sTemp = TutorialResult[2];
        }
        // End:0x2da
        else
        {
            sTemp = "";
        }
    }
    X1 = X2;
    X2 = X1 + 0.063750 * C.ClipX;
    C.BtrDrawTextJustifiedWithVolumeLine(sTemp, 1, X1, Y1, X2, Y2, FontSize, DefaultFontShadowColor);
}

defaultproperties
{
    TutorialNumber="Number"
    TutorialContents="Mission List"
    TutorialResult[0]="Completed"
    TutorialResult[1]="Completed"
    TutorialResult[2]="Ongoing"
    TutorialList[0]="Identifying Mouse Controls"
    TutorialList[1]="Basic Movement (left/right/forward/back)"
    TutorialList[2]="Moving through Obstacles"
    TutorialList[3]="Crouching"
    TutorialList[4]="Crawling"
    TutorialList[5]="Jumping Over Obstacles"
    TutorialList[6]="Climbing Ladders"
    TutorialList[7]="Falling"
    TutorialList[8]="Recovering with Health Packs"
    TutorialList[9]="Sprinting"
    TutorialList[10]="Normal Fire"
    TutorialList[11]="Aimed Shot"
    TutorialList[12]="Melee Attacks"
    TutorialList[13]="Equipping the AT-4"
    TutorialList[14]="Firing the AT-4"
    TutorialList[15]="Grenade Training"
    TutorialList[16]="Live-fire Training"
    fNumberX1=0.4580070
    fNumberX2=0.513670
    fContentX1=0.3046880
    fContentX2=0.3294270
    fResultX1=0.8506250
    fResultX2=0.9206250
}