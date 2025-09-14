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
    //return;    
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
    //return;    
}

function string GetCurMatName()
{
    // End:0x29
    if((CurIndex >= 0) && CurIndex < Materials.Length)
    {
        return MatNames[CurIndex];
    }
    return "";
    //return;    
}

function SetIndex(int Index)
{
    // End:0x3C
    if((Index >= 0) && Index < Materials.Length)
    {
        CurIndex = Index;
        Image = Materials[Index];        
    }
    else
    {
        Image = none;
        CurIndex = -1;
    }
    //return;    
}

function bool internalKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x10
    if(int(State) != 3)
    {
        return false;
    }
    switch(key)
    {
        // End:0x1C
        case 37:
        // End:0x21
        case 38:
        // End:0x26
        case 100:
        // End:0x2B
        case 104:
        // End:0x38
        case 236:
            PrevImage();
            return true;
        // End:0x3D
        case 39:
        // End:0x42
        case 40:
        // End:0x47
        case 98:
        // End:0x4C
        case 102:
        // End:0x59
        case 237:
            NextImage();
            return true;
        // End:0x5E
        case 36:
        // End:0x6B
        case 103:
            FirstImage();
            return true;
        // End:0x70
        case 35:
        // End:0x7D
        case 97:
            LastImage();
            return true;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return;    
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
    else
    {
        SetIndex(CurIndex - 1);
    }
    //return;    
}

function NextImage()
{
    // End:0x15
    if(CurIndex < 0)
    {
        SetIndex(0);        
    }
    else
    {
        // End:0x3B
        if((CurIndex + 1) >= Materials.Length)
        {
            // End:0x38
            if(bWrap)
            {
                SetIndex(0);
            }            
        }
        else
        {
            SetIndex(CurIndex + 1);
        }
    }
    //return;    
}

function FirstImage()
{
    // End:0x13
    if(Materials.Length > 0)
    {
        SetIndex(0);
    }
    //return;    
}

function LastImage()
{
    // End:0x1B
    if(Materials.Length > 0)
    {
        SetIndex(Materials.Length - 1);
    }
    //return;    
}

defaultproperties
{
    StyleName="NoBackground"
    bTabStop=true
    bAcceptsInput=true
    bCaptureMouse=true
}