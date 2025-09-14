/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\TextToSpeechAlias.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:2
 *
 *******************************************************************************/
class TextToSpeechAlias extends Object
    native
    abstract;

struct native SpeechReplacement
{
    var array<string> MatchWords;
    var string ReplaceWord;
};

var array<SpeechReplacement> Aliases;
var string RemoveCharacters;

defaultproperties
{
    Aliases=// Object reference not set to an instance of an object.
    
    RemoveCharacters="|:][}{^/~()*"
}