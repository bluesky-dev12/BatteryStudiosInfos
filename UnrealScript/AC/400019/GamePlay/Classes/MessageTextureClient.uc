class MessageTextureClient extends Info
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() ScriptedTexture MessageTexture;
var() localized string ScrollingMessage;
var localized string HisMessage;
var localized string HerMessage;
var() Font Font;
var() Color FontColor;
var() bool bCaps;
var string OldText;

simulated function PostNetBeginPlay()
{
    // End:0x1B
    if(MessageTexture != none)
    {
        MessageTexture.Client = self;
    }
    SetTimer(1.0000000, true);
    //return;    
}

simulated function Timer()
{
    local string Text;
    local PlayerReplicationInfo Leading, PRI;

    Text = ScrollingMessage;
    // End:0x103
    if((InStr(Text, "%lf") != -1) || InStr(Text, "%lp") != -1)
    {
        Leading = none;
        // End:0xA0
        foreach AllActors(Class'Engine.PlayerReplicationInfo', PRI)
        {
            // End:0x9F
            if(!PRI.bIsSpectator && (Leading == none) || PRI.Score > Leading.Score)
            {
                Leading = PRI;
            }            
        }        
        // End:0xFB
        if(Leading != none)
        {
            Text = Replace(Text, "%lp", Leading.PlayerName);
            Text = Replace(Text, "%lf", string(int(Leading.Score)));            
        }
        else
        {
            Text = "";
        }
    }
    // End:0x119
    if(bCaps)
    {
        Text = Caps(Text);
    }
    // End:0x143
    if(Text != OldText)
    {
        OldText = Text;
        MessageTexture.Revision++;
    }
    //return;    
}

simulated event RenderTexture(ScriptedTexture Tex)
{
    local int SizeX, SizeY;

    Tex.TextSize(OldText, Font, SizeX, SizeY);
    Tex.DrawText(int(float(Tex.USize - SizeX) * 0.5000000), int(float(Tex.VSize - SizeY) * 0.5000000), OldText, Font, FontColor);
    //return;    
}

simulated function string Replace(string Text, string Match, string Replacement)
{
    local int i;

    i = InStr(Text, Match);
    // End:0x5F
    if(i != -1)
    {
        return (Left(Text, i) $ Replacement) $ (Replace(Mid(Text, i + Len(Match)), Match, Replacement));        
    }
    else
    {
        return Text;
    }
    //return;    
}

defaultproperties
{
    HisMessage="??"
    HerMessage="???"
    bNoDelete=true
    RemoteRole=2
}