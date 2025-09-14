class UT2K4ServerLoading extends UT2K4LoadingPageBase
    transient;

var() array<string> Backgrounds;

simulated event Init()
{
    super(Vignette).Init();
    SetImage();
    //return;    
}

simulated function SetImage()
{
    local int i, cnt;
    local string str;
    local Material mat;

    mat = Texture'Engine.MenuBlack';
    DrawOpImage(Operations[0]).Image = mat;
    // End:0x64
    if(Backgrounds.Length == 0)
    {
        Warn("No background images configured for" @ string(Name));
        return;
    }
    J0x64:

    i = Rand(Backgrounds.Length);
    // End:0xBF
    if(str == "")
    {
        Warn(((("Invalid value for " $ string(Name)) $ ".Backgrounds[") $ string(i)) $ "]");        
    }
    else
    {
        mat = DLOTexture(str);
    }
    // End:0x64
    if(!((mat != none) || ++cnt >= 10))
        goto J0x64;
    // End:0x13A
    if(mat == none)
    {
        Warn(("Unable to find any valid images for vignette class" @ string(Name)) $ "!");
    }
    DrawOpImage(Operations[0]).Image = mat;
    //return;    
}

simulated function string StripMap(string S)
{
    local int P;

    P = Len(S);
    J0x0D:

    // End:0x4F [Loop If]
    if(P > 0)
    {
        // End:0x45
        if(Mid(S, P, 1) == ".")
        {
            S = Left(S, P);
            // [Explicit Break]
            goto J0x4F;            
        }
        else
        {
            P--;
        }
        // [Loop Continue]
        goto J0x0D;
    }
    J0x4F:

    P = Len(S);
    J0x5C:

    // End:0xD0 [Loop If]
    if(P > 0)
    {
        // End:0xC6
        if(((Mid(S, P, 1) == "\\") || Mid(S, P, 1) == "/") || Mid(S, P, 1) == ":")
        {
            return Right(S, (Len(S) - P) - 1);            
        }
        else
        {
            P--;
        }
        // [Loop Continue]
        goto J0x5C;
    }
    return S;
    //return;    
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
    //return;    
}

simulated function SetText2()
{
    DrawOpText(Operations[1]).Text = "Now Loading...";
    //return;    
}

defaultproperties
{
    Backgrounds[0]="2k4Menus.loading.warefare_loading"
    // Reference: DrawOpImage'GUI2K4_Decompressed.UT2K4ServerLoading.OpBackground'
    begin object name="OpBackground" class=XInterface.DrawOpImage
        SubXL=1024.0000000
        SubYL=768.0000000
        Height=1.0000000
        Width=1.0000000
    end object
    Operations[0]=OpBackground
    // Reference: DrawOpText'GUI2K4_Decompressed.UT2K4ServerLoading.OpLoading'
    begin object name="OpLoading" class=XInterface.DrawOpText
        Text=". . ."
        FontName="XInterface.UT2LargeFont"
        bWrapText=false
        Top=0.4800000
        Lft=0.5000000
        Height=0.0500000
        Width=0.4900000
        Justification=2
    end object
    Operations[1]=OpLoading
    // Reference: DrawOpText'GUI2K4_Decompressed.UT2K4ServerLoading.OpMapname'
    begin object name="OpMapname" class=XInterface.DrawOpText
        FontName="XInterface.UT2LargeFont"
        bWrapText=false
        Top=0.6000000
        Lft=0.5000000
        Height=0.0500000
        Width=0.4900000
        Justification=2
    end object
    Operations[2]=OpMapname
    // Reference: DrawOpText'GUI2K4_Decompressed.UT2K4ServerLoading.OpHint'
    begin object name="OpHint" class=XInterface.DrawOpText
        FontName="GUI2K4.fntUT2k4SmallHeader"
        Top=0.8000000
        Lft=0.0500000
        Height=0.2000000
        Width=0.9300000
        Justification=2
    end object
    Operations[3]=OpHint
}