class wVignette extends Vignette
    transient;

var array<string> MapNames;
var array<Material> Images;
var array<float> Widths;
var array<float> Heights;
var array<string> BGMList;
var int Index;

simulated event Init()
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x41 [Loop If]
    if(lp1 < MapNames.Length)
    {
        // End:0x37
        if(MapNames[lp1] == MapName)
        {
            Index = lp1;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

simulated event DrawVignette(Canvas C, float Progress)
{
    Level.GetLocalPlayerController().Player.Console.SetBGM(BGMList);
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    C.SetPos(0.0000000, 0.0000000);
    C.DrawTile(Images[Index], C.ClipX, C.ClipY, 0.0000000, 0.0000000, Widths[Index], Heights[Index]);
    //return;    
}

defaultproperties
{
    MapNames[0]="DM-sdmap"
    MapNames[1]="DM-Repair"
    MapNames[2]="DM-Downtown"
    Images[0]=Texture'Warfare_UI.loading.Loading_downtown'
    Images[1]=Texture'Warfare_UI.loading.Loading_repair'
    Images[2]=Texture'Warfare_UI.loading.Loading_downtown'
    Widths[0]=1024.0000000
    Widths[1]=1024.0000000
    Widths[2]=1024.0000000
    Heights[0]=768.0000000
    Heights[1]=768.0000000
    Heights[2]=768.0000000
}