/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4ServerLoading.uc
 * Package Imports:
 *	GUI2K4
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:5
 *
 *******************************************************************************/
class UT2K4ServerLoading extends UT2K4LoadingPageBase
    transient;

var() array<string> Backgrounds;

simulated event Init()
{
    super(Vignette).Init();
    SetImage();
}

simulated function SetImage()
{
    local int i, cnt;
    local string str;
    local Material mat;

    mat = texture'MenuBlack';
    DrawOpImage(Operations[0]).Image = mat;
    // End:0x64
    if(Backgrounds.Length == 0)
    {
        Warn("No background images configured for" @ string(Name));
        return;
    }
    i = Rand(Backgrounds.Length);
    // End:0xbf
    if(str == "")
    {
        Warn("Invalid value for " $ string(Name) $ ".Backgrounds[" $ string(i) $ "]");
    }
    // End:0xd0
    else
    {
        mat = DLOTexture(str);
    }
    // End:0x64
    if(mat != none || ++ cnt >= 10)
    	goto J0x64;
    // End:0x13a
    if(mat == none)
    {
        Warn("Unable to find any valid images for vignette class" @ string(Name) $ "!");
    }
    DrawOpImage(Operations[0]).Image = mat;
}

simulated function string StripMap(string S)
{
    local int P;

    P = Len(S);
    J0x0d:
    // End:0x4f [While If]
    if(P > 0)
    {
        // End:0x45
        if(Mid(S, P, 1) == ".")
        {
            S = Left(S, P);
            // This is an implied JumpToken;
            goto J0x4f;
        }
        // End:0x4c
        else
        {
            -- P;
        }
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
    J0x4f:
    P = Len(S);
    J0x5c:
    // End:0xd0 [While If]
    if(P > 0)
    {
        // End:0xc6
        if(Mid(S, P, 1) == "\\" || Mid(S, P, 1) == "/" || Mid(S, P, 1) == ":")
        {
            return Right(S, Len(S) - P - 1);
        }
        // End:0xcd
        else
        {
            -- P;
        }
        // This is an implied JumpToken; Continue!
        goto J0x5c;
    }
    return S;
}

simulated function SetText()
{
    local DrawOpText HintOp;
    local string Hint;

    DrawOpText(Operations[2]).Text = StripMap(MapName);
    // End:0x36
    if(Level.IsSoftwareRendering())
    {
        return;
    }
    HintOp = DrawOpText(Operations[3]);
    // End:0x56
    if(HintOp == none)
    {
        return;
    }
    // End:0x97
    if(GameClass == none)
    {
        Warn("Invalid game class, so cannot draw loading hint!");
        return;
    }
    Hint = GameClass.static.GetLoadingHint(Level.GetLocalPlayerController(), MapName, HintOp.DrawColor);
    // End:0x111
    if(Hint == "")
    {
        Log("No loading hint configured for " @ string(GameClass.Name));
        return;
    }
    HintOp.Text = Hint;
}

simulated function SetText2()
{
    DrawOpText(Operations[1]).Text = "Now Loading...";
}

defaultproperties
{
    Backgrounds=// Object reference not set to an instance of an object.
    
    Operations=// Object reference not set to an instance of an object.
    
}