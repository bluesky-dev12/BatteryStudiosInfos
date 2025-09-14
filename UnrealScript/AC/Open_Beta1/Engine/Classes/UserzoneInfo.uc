class UserzoneInfo extends Object
    native;

struct native export SUserGroupInfo
{
    var int nGroupIndex;
    var int nCalcTime;
};

var float fMinimapWidth;
var float fMinimapHeight;
var int nRowCount;
var int nColcount;
var float fCellSize;
var HUD wScoreBoardHud;
var array<SUserGroupInfo> UserGroupInfos;
var Texture kUserzoneTexture;

function CalcMapSize(float _fCellSize)
{
    local float fMinimapW, fMinimapH;
    local int nTotalCount;

    fCellSize = _fCellSize;
    wScoreBoardHud.CalculateMinimapSize(fMinimapW, fMinimapH);
    fMinimapWidth = fMinimapW;
    fMinimapHeight = fMinimapH;
    nRowCount = int(fMinimapWidth / fCellSize);
    nColcount = int(fMinimapHeight / fCellSize);
    nTotalCount = nRowCount * nColcount;
    UserGroupInfos.Length = nTotalCount;
    ResetCalcTime();
    //return;    
}

function Destroy()
{
    kUserzoneTexture = none;
    ResetCalcTime();
    //return;    
}

function ResetCalcTime()
{
    local int nLength, i;

    nLength = UserGroupInfos.Length;
    i = 0;
    J0x13:

    // End:0x54 [Loop If]
    if(i < nLength)
    {
        UserGroupInfos[i].nGroupIndex = i;
        UserGroupInfos[i].nCalcTime = 0;
        ++i;
        // [Loop Continue]
        goto J0x13;
    }
    //return;    
}

event AddCalcTime(Vector kStartPos, Vector kEndPos, float fTime)
{
    local float i;
    local Vector kIntPos;
    local int nIndex;
    local float A;

    i = 0.0000000;
    J0x0B:

    // End:0x8B [Loop If]
    if(i <= fTime)
    {
        // End:0x7C
        if(wScoreBoardHud != none)
        {
            A = i / fTime;
            kIntPos = GetInterpolationPos(kStartPos, kEndPos, A);
            nIndex = GetCellIndex(kIntPos);
            UserGroupInfos[nIndex].nCalcTime += int(1.0000000);
        }
        i += 1.0000000;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function Vector GetInterpolationPos(Vector kStartPos, Vector kEndPos, float A)
{
    local Vector kIntPos;

    kIntPos = (kEndPos * A) + ((1.0000000 - A) * kStartPos);
    return kIntPos;
    //return;    
}

function int GetCellIndex(Vector kPos)
{
    local int nCellIndex;
    local float fMx, fMy;

    wScoreBoardHud.CalculateWorldPostionToMinimapPosition(kPos, fMx, fMy);
    nCellIndex = int(float(int(fMy / fCellSize) * nRowCount) + (fMx / fCellSize));
    return nCellIndex;
    //return;    
}

event GetScreenPos(int nGroupIndex, out int nPosX, out int nPosY)
{
    nPosY = int(float(nGroupIndex / nRowCount) * fCellSize);
    nPosX = int(float(int(float(nGroupIndex) % float(nRowCount))) * fCellSize);
    //return;    
}

function SetScoreboardHud(HUD _hud)
{
    wScoreBoardHud = _hud;
    //return;    
}

event int GetMaxCalcTime()
{
    local int nMaxCalcTime, i, j;

    nMaxCalcTime = 0;
    i = 0;
    J0x0E:

    // End:0x72 [Loop If]
    if(i < nColcount)
    {
        j = 0;
        J0x24:

        // End:0x68 [Loop If]
        if(j < nRowCount)
        {
            nMaxCalcTime = Max(nMaxCalcTime, UserGroupInfos[(i * nRowCount) + j].nCalcTime);
            ++j;
            // [Loop Continue]
            goto J0x24;
        }
        ++i;
        // [Loop Continue]
        goto J0x0E;
    }
    return nMaxCalcTime;
    //return;    
}
