/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\CoolImage.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:10
 *	Functions:5
 *
 *******************************************************************************/
class CoolImage extends GUIComponent
    native
    editinlinenew
    instanced;

struct native init AnimInfo
{
    var float cX;
    var float cY;
    var float Scale;
    var float FadeTime;
    var float Alpha;
    var float TargetAlpha;
    var float ResetDelay;
    var float TravelTime;
};

var() Material Image;
var array<AnimInfo> Anims;
var int NoAnims;
var float MaxScale;
var float MinScale;
var float MinFadeTime;
var float MaxFadeTime;
var float MinResetDelay;
var float MaxResetDelay;
var int FullAlpha;

event InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    // End:0x2a
    if(Image == none || NoAnims == 0)
    {
        return;
    }
    Anims.Length = NoAnims;
    i = 0;
    J0x3d:
    // End:0x61 [While If]
    if(i < NoAnims)
    {
        ResetItem(i);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3d;
    }
}

function GetPos(float Scale, out float X, out float Y)
{
    local float AW, AH;

    AW = ActualWidth();
    AH = ActualHeight();
    switch(Rand(2))
    {
        // End:0x67
        case 0:
            X = 0.0;
            Y = AH * 1.50 * FRand();
            // End:0x64
            if(Y > AH)
            {
                Y = Y - AH / float(2);
            }
            // End:0xb3
            break;
        // End:0xb0
        case 1:
            Y = AH;
            X = AW * 1.50 * FRand();
            // End:0xad
            if(X > AW)
            {
                X = X - AW;
            }
            // End:0xb3
            break;
        // End:0xffff
        default:
}

function bool DoCollisionTest(int i)
{
    local int j;

    j = 0;
    J0x07:
    // End:0x46 [While If]
    if(j < NoAnims)
    {
        // End:0x3c
        if(j != i && TestCollision(i, j))
        {
            return true;
        }
        ++ j;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function bool TestCollision(int i, int j)
{
    local float W, H, l1, l2, r1, r2,
	    t1, t2, b1, b2;

    W = float(Image.MaterialUSize());
    H = float(Image.MaterialVSize());
    l1 = Anims[i].cX;
    t1 = Anims[i].cY;
    r1 = l1 + W * Anims[i].Scale;
    b1 = t1 + H * Anims[i].Scale;
    l2 = Anims[j].cX;
    t2 = Anims[j].cY;
    r2 = l2 + W * Anims[j].Scale;
    b2 = t2 + H * Anims[j].Scale;
    // End:0x127
    if(t1 > b2)
    {
        return false;
    }
    // End:0x138
    if(t2 > b1)
    {
        return false;
    }
    // End:0x149
    if(l1 > r2)
    {
        return false;
    }
    // End:0x15a
    if(l2 > r1)
    {
        return false;
    }
    return true;
}

event ResetItem(int i)
{
    local bool Collide;
    local int cnt;

    Anims[i].Scale = MinScale + FRand() * MaxScale - MinScale;
    Anims[i].FadeTime = MinFadeTime + FRand() * MaxFadeTime - MinFadeTime;
    Anims[i].ResetDelay = 0.0;
    Anims[i].TargetAlpha = float(FullAlpha);
    Anims[i].Alpha = 0.0;
    Anims[i].TravelTime = 0.250 + 0.250 * FRand();
    Collide = true;
    J0xbd:
    // End:0x18d [While If]
    if(Collide)
    {
        GetPos(Anims[i].Scale, Anims[i].cX, Anims[i].cY);
        Collide = DoCollisionTest(i);
        // End:0x18a
        if(Collide)
        {
            ++ cnt;
            // End:0x18a
            if(cnt > 20)
            {
                Anims[i].ResetDelay = 0.50;
                Anims[i].FadeTime = 0.0;
                Anims[i].Alpha = 0.0;
                Anims[i].TargetAlpha = 0.0;
                Collide = false;
            }
        }
        // This is an implied JumpToken; Continue!
        goto J0xbd;
    }
}
