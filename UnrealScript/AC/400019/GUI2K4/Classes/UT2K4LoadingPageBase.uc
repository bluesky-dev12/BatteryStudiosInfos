class UT2K4LoadingPageBase extends Vignette
    transient;

var array<DrawOpBase> Operations;

simulated event DrawVignette(Canvas C, float Progress)
{
    local int i;

    C.Reset();
    i = 0;
    J0x16:

    // End:0x4A [Loop If]
    if(i < Operations.Length)
    {
        Operations[i].Draw(C);
        i++;
        // [Loop Continue]
        goto J0x16;
    }
    //return;    
}

simulated function DrawOpImage AddImage(Material Image, float Top, float Left, float Height, float width)
{
    local DrawOpImage NewImage;

    NewImage = new (none) Class'XInterface.DrawOpImage';
    Operations[Operations.Length] = NewImage;
    NewImage.Image = Image;
    NewImage.SetPos(Top, Left);
    NewImage.SetSize(Height, width);
    return NewImage;
    //return;    
}

simulated function DrawOpImage AddImageStretched(Material Image, float Top, float Left, float Height, float width)
{
    local DrawOpImage NewImage;

    NewImage = AddImage(Image, Top, Left, Height, width);
    NewImage.ImageStyle = 1;
    return NewImage;
    //return;    
}

simulated function DrawOpText AddText(string Text, float Top, float Left)
{
    local DrawOpText NewText;

    NewText = new (none) Class'XInterface.DrawOpText';
    Operations[Operations.Length] = NewText;
    NewText.SetPos(Top, Left);
    NewText.Text = Text;
    return NewText;
    //return;    
}

simulated function DrawOpText AddMultiLineText(string Text, float Top, float Left, float Height, float width)
{
    local DrawOpText NewText;

    NewText = AddText(Text, Top, Left);
    NewText.SetSize(Height, width);
    return NewText;
    //return;    
}

simulated function DrawOpText AddJustifiedText(string Text, byte Just, float Top, float Left, float Height, float width, optional byte VAlign)
{
    local DrawOpText NewText;

    NewText = AddText(Text, Top, Left);
    NewText.SetSize(Height, width);
    NewText.Justification = Just;
    NewText.VertAlign = VAlign;
    return NewText;
    //return;    
}

simulated function Material DLOTexture(string TextureFullName)
{
    return Material(DynamicLoadObject(TextureFullName, Class'Engine.Material'));
    //return;    
}
