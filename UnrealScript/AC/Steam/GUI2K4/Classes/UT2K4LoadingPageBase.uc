/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4LoadingPageBase.uc
 * Package Imports:
 *	GUI2K4
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:7
 *
 *******************************************************************************/
class UT2K4LoadingPageBase extends Vignette
    transient;

var array<DrawOpBase> Operations;

simulated event DrawVignette(Canvas C, float Progress)
{
    local int i;

    C.Reset();
    i = 0;
    J0x16:
    // End:0x4a [While If]
    if(i < Operations.Length)
    {
        Operations[i].Draw(C);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x16;
    }
}

simulated function DrawOpImage AddImage(Material Image, float Top, float Left, float Height, float width)
{
    local DrawOpImage NewImage;

    NewImage = new (none) class'DrawOpImage';
    Operations[Operations.Length] = NewImage;
    NewImage.Image = Image;
    NewImage.SetPos(Top, Left);
    NewImage.SetSize(Height, width);
    return NewImage;
}

simulated function DrawOpImage AddImageStretched(Material Image, float Top, float Left, float Height, float width)
{
    local DrawOpImage NewImage;

    NewImage = AddImage(Image, Top, Left, Height, width);
    NewImage.ImageStyle = 1;
    return NewImage;
}

simulated function DrawOpText AddText(string Text, float Top, float Left)
{
    local DrawOpText NewText;

    NewText = new (none) class'DrawOpText';
    Operations[Operations.Length] = NewText;
    NewText.SetPos(Top, Left);
    NewText.Text = Text;
    return NewText;
}

simulated function DrawOpText AddMultiLineText(string Text, float Top, float Left, float Height, float width)
{
    local DrawOpText NewText;

    NewText = AddText(Text, Top, Left);
    NewText.SetSize(Height, width);
    return NewText;
}

simulated function DrawOpText AddJustifiedText(string Text, byte Just, float Top, float Left, float Height, float width, optional byte VAlign)
{
    local DrawOpText NewText;

    NewText = AddText(Text, Top, Left);
    NewText.SetSize(Height, width);
    NewText.Justification = Just;
    NewText.VertAlign = VAlign;
    return NewText;
}

simulated function Material DLOTexture(string TextureFullName)
{
    return Material(DynamicLoadObject(TextureFullName, class'Material'));
}
