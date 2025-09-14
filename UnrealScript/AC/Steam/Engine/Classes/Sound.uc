/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Sound.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:12
 *
 *******************************************************************************/
class Sound extends Object
    hidecategories(Object)
    native
    noexport;

var() native float Likelihood;
var native const byte Data[44];
var native const name FileType;
var native const string fileName;
var native const int OriginalSize;
var native const float Duration;
var native const transient pointer Handle;
var native const int Flags;
var native const int VoiceCodec;
var native const float InitialSeekTime;
var() float BaseRadius;
var() float VelocityScale;

defaultproperties
{
    BaseRadius=2000.0
}