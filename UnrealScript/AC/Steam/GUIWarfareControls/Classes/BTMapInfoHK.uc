/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTMapInfoHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:3
 *
 *******************************************************************************/
class BTMapInfoHK extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var BTROMapInfoHK mapInfo;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIComponent).InitComponent(MyController, myOwner);
    mapInfo = new class'BTROMapInfoHK';
    mapInfo.Init();
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
    // End:0x1ae [While If]
    if(i < Maps.Length)
    {
        // End:0x1a4
        if(Maps[i].FriendlyName == MapName)
        {
            MapImg = Material(DynamicLoadObject(Maps[i].ResourceMapImage, class'Material'));
            mInfo = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfo(Maps[i].File);
            i = 0;
            J0x102:
            // End:0x173 [While If]
            if(i < 3)
            {
                // End:0x139
                if(mInfo.ResourceSupplyImages[i] == "")
                {
                    ImgSupply[i] = none;
                }
                // End:0x169
                else
                {
                    ImgSupply[i] = Material(DynamicLoadObject(mInfo.ResourceSupplyImages[i], class'Material'));
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x102;
            }
            mapInfo.SetData(MapName, MapImg, ImgSupply[0], ImgSupply[1], ImgSupply[2]);
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x60;
    }
}

function Internal_OnRendered(Canvas C)
{
    local float OldValueX, OldValueY;

    // End:0x0e
    if(bVisible == false)
    {
        return;
    }
    C.Style = 5;
    // End:0x66
    if(BackgroundImage.Image != none)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, Bounds[0], Bounds[1], Bounds[2], Bounds[3]);
    }
    // End:0x1c4
    if(Caption != "")
    {
        C.DrawColor = FontColor[self.MenuState];
        // End:0x10c
        if(bUseFontScaleValue)
        {
            OldValueX = C.ClipX;
            OldValueY = C.ClipY;
            C.ClipX = FontScaleValue * C.ClipX;
            C.ClipY = FontScaleValue * C.ClipY;
        }
        class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Caption, CaptionDrawType, float(FontSize[self.MenuState]), Bounds[0], Bounds[1], Bounds[2], Bounds[3], CaptionPadding[0], CaptionPadding[1], CaptionPadding[2], CaptionPadding[3], FontShadowColor[self.MenuState], 0, bUseFontScaleValue);
        // End:0x1c4
        if(bUseFontScaleValue)
        {
            C.ClipX = OldValueX;
            C.ClipY = OldValueY;
        }
    }
    mapInfo.AWinPos = RWinPos;
    mapInfo.Render(C);
    // End:0x30e
    if(bDrawToolTips == true && decoToolTips != none && decoToolTips.OriginalString.Text != "")
    {
        decoToolTips.AWinPos = AWinPos;
        // End:0x30e
        if(decoToolTips.CheckIn(Controller.MouseX, Controller.MouseY))
        {
            decoToolTips.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(Controller.MouseX, Controller.MouseY, Controller.MouseX + AWinPos.X2 - AWinPos.X1, Controller.MouseY + AWinPos.Y2 - AWinPos.Y1);
            decoToolTips.bNeedUpdate = true;
            decoToolTips.Render(C);
        }
    }
}
