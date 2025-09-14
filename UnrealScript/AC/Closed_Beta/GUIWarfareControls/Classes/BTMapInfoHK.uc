class BTMapInfoHK extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var BTROMapInfoHK mapInfo;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIComponent).InitComponent(MyController, myOwner);
    mapInfo = new Class'GUIWarfareControls_Decompressed.BTROMapInfoHK';
    mapInfo.Init();
    //return;    
}

function SetMapName(string MapName)
{
    local array<wMapInfo> Maps;
    local wMapInfo mInfo;
    local Material MapImg, ImgSupply;
    local int i;

    Maps = PlayerOwner().Level.GetMatchMaker().MapSettings.GetAllMapInfos(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild());
    i = 0;
    J0x60:

    // End:0x1AE [Loop If]
    if(i < Maps.Length)
    {
        // End:0x1A4
        if(Maps[i].FriendlyName == MapName)
        {
            MapImg = Material(DynamicLoadObject(Maps[i].ResourceMapImage, Class'Engine.Material'));
            mInfo = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfo(Maps[i].File);
            i = 0;
            J0x102:

            // End:0x173 [Loop If]
            if(i < 3)
            {
                // End:0x139
                if(mInfo.ResourceSupplyImages[i] == "")
                {
                    ImgSupply[i] = none;
                    // [Explicit Continue]
                    goto J0x169;
                }
                ImgSupply[i] = Material(DynamicLoadObject(mInfo.ResourceSupplyImages[i], Class'Engine.Material'));
                J0x169:

                i++;
                // [Loop Continue]
                goto J0x102;
            }
            mapInfo.SetData(MapName, MapImg, ImgSupply[0], ImgSupply[1], ImgSupply[2]);
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x60;
    }
    //return;    
}

function Internal_OnRendered(Canvas C)
{
    local float OldValueX, OldValueY;

    // End:0x0E
    if(bVisible == false)
    {
        return;
    }
    C.Style = 5;
    // End:0x66
    if(BackgroundImage.Image != none)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, Bounds[0], Bounds[1], Bounds[2], Bounds[3]);
    }
    // End:0x1C4
    if(Caption != "")
    {
        C.DrawColor = FontColor[int(self.MenuState)];
        // End:0x10C
        if(bUseFontScaleValue)
        {
            OldValueX = C.ClipX;
            OldValueY = C.ClipY;
            C.ClipX = FontScaleValue * C.ClipX;
            C.ClipY = FontScaleValue * C.ClipY;
        }
        Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Caption, CaptionDrawType, float(FontSize[int(self.MenuState)]), Bounds[0], Bounds[1], Bounds[2], Bounds[3], CaptionPadding[0], CaptionPadding[1], CaptionPadding[2], CaptionPadding[3], FontShadowColor[int(self.MenuState)], 0, bUseFontScaleValue);
        // End:0x1C4
        if(bUseFontScaleValue)
        {
            C.ClipX = OldValueX;
            C.ClipY = OldValueY;
        }
    }
    mapInfo.AWinPos = RWinPos;
    mapInfo.Render(C);
    // End:0x30E
    if(((bDrawToolTips == true) && decoToolTips != none) && decoToolTips.OriginalString.Text != "")
    {
        decoToolTips.AWinPos = AWinPos;
        // End:0x30E
        if(decoToolTips.CheckIn(Controller.MouseX, Controller.MouseY))
        {
            decoToolTips.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(Controller.MouseX, Controller.MouseY, Controller.MouseX + (AWinPos.X2 - AWinPos.X1), Controller.MouseY + (AWinPos.Y2 - AWinPos.Y1));
            decoToolTips.bNeedUpdate = true;
            decoToolTips.Render(C);
        }
    }
    //return;    
}
