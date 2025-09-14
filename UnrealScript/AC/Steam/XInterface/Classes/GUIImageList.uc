/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIImageList.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:9
 *
 *******************************************************************************/
class GUIImageList extends GUIImage
    editinlinenew
    instanced;

var() editinline array<editinline string> MatNames;
var() array<Material> Materials;
var() editconst int CurIndex;
var() bool bWrap;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIComponent).InitComponent(MyController, myOwner);
    __OnKeyEvent__Delegate = internalKeyEvent;
}

function AddMaterial(string matName, out Material mat)
{
    local int i;

    // End:0x39
    if(mat != none)
    {
        i = Materials.Length;
        Materials[i] = mat;
        MatNames[i] = matName;
    }
}

function string GetCurMatName()
{
    // End:0x29
    if(CurIndex >= 0 && CurIndex < Materials.Length)
    {
        return MatNames[CurIndex];
    }
    return "";
}

function SetIndex(int Index)
{
    // End:0x3c
    if(Index >= 0 && Index < Materials.Length)
    {
        CurIndex = Index;
        Image = Materials[Index];
    }
    // End:0x4e
    else
    {
        Image = none;
        CurIndex = -1;
    }
}

function bool internalKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x10
    if(State != 3)
    {
        return false;
    }
    switch(key)
    {
        // End:0x1c
        case 37:
        // End:0x21
        case 38:
        // End:0x26
        case 100:
        // End:0x2b
        case 104:
        // End:0x38
        case 236:
            PrevImage();
            return true;
        // End:0x3d
        case 39:
        // End:0x42
        case 40:
        // End:0x47
        case 98:
        // End:0x4c
        case 102:
        // End:0x59
        case 237:
            NextImage();
            return true;
        // End:0x5e
        case 36:
        // End:0x6b
        case 103:
            FirstImage();
            return true;
        // End:0x70
        case 35:
        // End:0x7d
        case 97:
            LastImage();
            return true;
        // End:0xffff
        default:
            return false;
    }
}

function PrevImage()
{
    // End:0x26
    if(CurIndex < 1)
    {
        // End:0x23
        if(bWrap)
        {
            SetIndex(Materials.Length - 1);
        }
    }
    // End:0x34
    else
    {
        SetIndex(CurIndex - 1);
    }
}

function NextImage()
{
    // End:0x15
    if(CurIndex < 0)
    {
        SetIndex(0);
    }
    // End:0x49
    else
    {
        // End:0x3b
        if(CurIndex + 1 >= Materials.Length)
        {
            // End:0x38
            if(bWrap)
            {
                SetIndex(0);
            }
        }
        // End:0x49
        else
        {
            SetIndex(CurIndex + 1);
        }
    }
}

function FirstImage()
{
    // End:0x13
    if(Materials.Length > 0)
    {
        SetIndex(0);
    }
}

function LastImage()
{
    // End:0x1b
    if(Materials.Length > 0)
    {
        SetIndex(Materials.Length - 1);
    }
}

defaultproperties
{
    StyleName="NoBackground"
    bTabStop=true
    bAcceptsInput=true
    bCaptureMouse=true
}