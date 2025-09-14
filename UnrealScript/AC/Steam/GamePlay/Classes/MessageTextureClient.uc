/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\MessageTextureClient.uc
 * Package Imports:
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:8
 *	Functions:4
 *
 *******************************************************************************/
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
    // End:0x1b
    if(MessageTexture != none)
    {
        MessageTexture.Client = self;
    }
    SetTimer(1.0, true);
}

simulated function Timer()
{
    local string Text;
    local PlayerReplicationInfo Leading, PRI;

    Text = ScrollingMessage;
    // End:0x103
    if(InStr(Text, "%lf") != -1 || InStr(Text, "%lp") != -1)
    {
        Leading = none;
        // End:0xa0
        foreach AllActors(class'PlayerReplicationInfo', PRI)
        {
            // End:0x9f
            if(!PRI.bIsSpectator && Leading == none || PRI.Score > Leading.Score)
            {
                Leading = PRI;
            }                        
        }
        // End:0xfb
        if(Leading != none)
        {
            Text = Replace(Text, "%lp", Leading.PlayerName);
            Text = Replace(Text, "%lf", string(int(Leading.Score)));
        }
        // End:0x103
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
        ++ MessageTexture.Revision;
    }
}

simulated event RenderTexture(ScriptedTexture Tex)
{
    local int SizeX, SizeY;

    Tex.TextSize(OldText, Font, SizeX, SizeY);
    Tex.DrawText(int(float(Tex.USize - SizeX) * 0.50), int(float(Tex.VSize - SizeY) * 0.50), OldText, Font, FontColor);
}

simulated function string Replace(string Text, string Match, string Replacement)
{
    local int i;

    i = InStr(Text, Match);
    // End:0x5f
    if(i != -1)
    {
        return Left(Text, i) $ Replacement $ Replace(Mid(Text, i + Len(Match)), Match, Replacement);
    }
    // End:0x65
    else
    {
        return Text;
    }
}

defaultproperties
{
    HisMessage="??"
    HerMessage="???"
    bNoDelete=true
    RemoteRole=2
}