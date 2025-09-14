/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\StreamTag.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:11
 *	Functions:3
 *
 *******************************************************************************/
class StreamTag extends StreamBase within Stream
    native;

var() const editconst ID3Field TagID;
var() const editconst ID3Field TrackNumber;
var() const editconst ID3Field Title;
var() const editconst ID3Field Artist;
var() const editconst ID3Field Album;
var() const editconst ID3Field Year;
var() const editconst ID3Field Genre;
var() editconst ID3Field Duration;
var() const editconstarray editconst array<editconst ID3Field> Fields;
var private transient pointer NativeID3Tag[2];
var delegate<OnRefresh> __OnRefresh__Delegate;

delegate OnRefresh();
function DumpScriptTag()
{
    local int i;

    Log("================");
    Log("      TagID:" $ TagID.FieldName @ "#" @ TagID.FieldValue);
    Log("TrackNumber:" $ TrackNumber.FieldName @ "#" @ TrackNumber.FieldValue);
    Log("      Title:" $ Title.FieldName @ "#" @ Title.FieldValue);
    Log("     Artist:" $ Artist.FieldName @ "#" @ Artist.FieldValue);
    Log("      Album:" $ Album.FieldName @ "#" @ Album.FieldValue);
    Log("       Year:" $ Year.FieldName @ "#" @ Year.FieldValue);
    Log("      Genre:" $ Genre.FieldName @ "#" @ Genre.FieldValue);
    Log("   Duration:" $ Duration.FieldName @ "#" @ Duration.FieldValue);
    Log("  == All Fields == ");
    i = 0;
    J0x19a:
    // End:0x219 [While If]
    if(i < Fields.Length)
    {
        Log("    " $ string(i) $ ") ID:" $ string(Fields[i].FieldID) @ "Name:" $ Fields[i].FieldName @ "Value:" $ Fields[i].FieldValue);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x19a;
    }
    Log("");
}

// Export UStreamTag::execDumpTag(FFrame&, void* const)
native final function DumpTag();
