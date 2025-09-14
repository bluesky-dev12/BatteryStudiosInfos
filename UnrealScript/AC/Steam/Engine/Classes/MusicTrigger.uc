/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\MusicTrigger.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:1
 *
 *******************************************************************************/
class MusicTrigger extends Triggers
    placeable;

var() string Song;
var() float FadeInTime;
var() float FadeOutTime;
var() bool FadeOutAllSongs;
var transient bool Triggered;
var transient int SongHandle;

function Trigger(Actor Other, Pawn EventInstigator)
{
    // End:0x40
    if(!Triggered)
    {
        Triggered = true;
        // End:0x27
        if(FadeOutAllSongs)
        {
            StopAllMusic(FadeOutTime);
        }
        SongHandle = PlayMusic(Song, FadeInTime);
    }
    // End:0x86
    else
    {
        Triggered = false;
        // End:0x66
        if(SongHandle != 0)
        {
            StopMusic(SongHandle, FadeOutTime);
        }
        // End:0x86
        else
        {
            Log("WARNING: invalid song handle");
        }
    }
}

defaultproperties
{
    bCollideActors=true
}