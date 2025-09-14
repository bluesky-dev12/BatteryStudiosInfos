class MoveLineTree extends Object;

var MoveLineNode pkInfo;
var MoveLineTree pkChilds[4];
var const float fMaxRadius;

function Create(Vector vLTPos, Vector vRBPos)
{
    pkInfo = new Class'Engine_Decompressed.MoveLineNode';
    pkInfo.vLTPos.X = 0.0000000;
    pkInfo.vLTPos.Y = 0.0000000;
    pkInfo.vLTPos.Z = 0.0000000;
    pkInfo.vRBPos.X = Abs(vLTPos.X - vRBPos.X);
    pkInfo.vRBPos.Y = Abs(vLTPos.Y - vRBPos.Y);
    pkInfo.vRBPos.Z = 0.0000000;
    pkInfo.vCenterPos = (pkInfo.vLTPos + pkInfo.vRBPos) * 0.5000000;
    pkInfo.fRadius = VSize(pkInfo.vRBPos - pkInfo.vLTPos);
    SubDivide();
    //return;    
}

function SetChild(float fX1, float fY1, float fX2, float fY2)
{
    local Vector vDist;

    pkInfo = new Class'Engine_Decompressed.MoveLineNode';
    pkInfo.vLTPos.X = fX1;
    pkInfo.vLTPos.Y = fY1;
    pkInfo.vLTPos.Z = 0.0000000;
    pkInfo.vRBPos.X = fX2;
    pkInfo.vRBPos.Y = fY2;
    pkInfo.vRBPos.Z = 0.0000000;
    pkInfo.vCenterPos = (pkInfo.vLTPos + pkInfo.vRBPos) * 0.5000000;
    pkInfo.fRadius = VSize(pkInfo.vRBPos - pkInfo.vLTPos);
    //return;    
}

function Destroy()
{
    pkChilds[0].Destroy();
    pkChilds[1].Destroy();
    pkChilds[2].Destroy();
    pkChilds[3].Destroy();
    //return;    
}

function SubDivide()
{
    // End:0x2C
    if(VSize(pkInfo.vRBPos - pkInfo.vLTPos) <= fMaxRadius)
    {
        return;
    }
    pkChilds[0] = new Class'Engine_Decompressed.MoveLineTree';
    pkChilds[0].SetChild(pkInfo.vLTPos.X, pkInfo.vLTPos.Y, pkInfo.vCenterPos.X, pkInfo.vCenterPos.Y);
    pkChilds[1] = new Class'Engine_Decompressed.MoveLineTree';
    pkChilds[1].SetChild(pkInfo.vCenterPos.X, pkInfo.vLTPos.Y, pkInfo.vRBPos.X, pkInfo.vCenterPos.Y);
    pkChilds[2] = new Class'Engine_Decompressed.MoveLineTree';
    pkChilds[2].SetChild(pkInfo.vLTPos.X, pkInfo.vCenterPos.Y, pkInfo.vCenterPos.X, pkInfo.vRBPos.Y);
    pkChilds[3] = new Class'Engine_Decompressed.MoveLineTree';
    pkChilds[3].SetChild(pkInfo.vCenterPos.X, pkInfo.vCenterPos.Y, pkInfo.vRBPos.X, pkInfo.vRBPos.Y);
    // End:0x206
    if(pkChilds[0] != none)
    {
        pkChilds[0].SubDivide();
    }
    // End:0x224
    if(pkChilds[1] != none)
    {
        pkChilds[1].SubDivide();
    }
    // End:0x244
    if(pkChilds[2] != none)
    {
        pkChilds[2].SubDivide();
    }
    // End:0x264
    if(pkChilds[3] != none)
    {
        pkChilds[3].SubDivide();
    }
    //return;    
}

function bool AddItem(Vector vCenterPos, CombatSituationLine kLineElement)
{
    local int i;

    // End:0x47
    if(VSize(vCenterPos - pkInfo.vCenterPos) <= fMaxRadius)
    {
        pkInfo.Elements[pkInfo.Elements.Length] = kLineElement;
        return true;
    }
    i = 0;
    J0x4E:

    // End:0x9F [Loop If]
    if(i < 4)
    {
        // End:0x6E
        if(pkChilds[i] == none)
        {
            // [Explicit Continue]
            goto J0x95;
        }
        // End:0x95
        if(pkChilds[i].AddItem(vCenterPos, kLineElement) == true)
        {
            return true;
        }
        J0x95:

        ++i;
        // [Loop Continue]
        goto J0x4E;
    }
    return false;
    //return;    
}

function bool CheckVisibleFromCamera(Vector camLoc, float fCullDist, array<CombatSituationLine> kLines)
{
    local int i;
    local bool Result;

    // End:0x2E
    if(VSize(camLoc - pkInfo.vCenterPos) <= fCullDist)
    {
        GetCombatSituationLines(kLines);
        return true;
    }
    i = 0;
    J0x35:

    // End:0x95 [Loop If]
    if(i < 4)
    {
        // End:0x8B
        if(pkChilds[i] != none)
        {
            Result = pkChilds[i].CheckVisibleFromCamera(camLoc, fCullDist, kLines);
            // End:0x8B
            if(Result == true)
            {
                return true;
            }
        }
        ++i;
        // [Loop Continue]
        goto J0x35;
    }
    return false;
    //return;    
}

function GetCombatSituationLines(array<CombatSituationLine> kLines)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4B [Loop If]
    if(i < pkInfo.Elements.Length)
    {
        kLines[kLines.Length] = pkInfo.Elements[i];
        ++i;
        // [Loop Continue]
        goto J0x07;
    }
    i = 0;
    J0x52:

    // End:0x93 [Loop If]
    if(i < 4)
    {
        // End:0x89
        if(pkChilds[i] != none)
        {
            pkChilds[i].GetCombatSituationLines(kLines);
        }
        ++i;
        // [Loop Continue]
        goto J0x52;
    }
    //return;    
}

defaultproperties
{
    fMaxRadius=100.0000000
}