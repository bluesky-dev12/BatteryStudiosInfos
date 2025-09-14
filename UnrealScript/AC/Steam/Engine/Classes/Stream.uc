/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Stream.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:15
 *
 *******************************************************************************/
class Stream extends StreamBase
    dependson(StreamBase)
    dependson(StreamTag)
    native;

var() editconst int Handle;
var() private const editconst string DefaultExtension;
var() const editconst editinline StreamTag IDTag;
var() private const editconst editinline FilePath PathName;
var() private const editconst StreamBase.EFileType Type;
var() const editconst bool bReadOnly;

// Export UStream::execSaveID3Tag(FFrame&, void* const)
native final function bool SaveID3Tag();
// Export UStream::execLoadID3Tag(FFrame&, void* const)
native final function bool LoadID3Tag();
function bool IsReadOnly()
{
    return bReadOnly;
}

function int GetHandle()
{
    return Handle;
}

function StreamTag GetTag()
{
    return IDTag;
}

function StreamBase.EFileType GetType()
{
    return Type;
}

function string GetDirectory()
{
    return PathName.Directory;
}

function string GetFileName()
{
    return PathName.fileName;
}

function string GetExtension()
{
    return PathName.Extension;
}

function string GetPath()
{
    return PathName.FullPath;
}

function string GetFullName()
{
    return GetFileName() $ "." $ GetExtension();
}

function string GetSongTitle()
{
    // End:0x2e
    if(IDTag == none || IDTag.Title.FieldValue == "")
    {
        return GetFileName();
    }
    return IDTag.Title.FieldValue;
}

event bool SetHandle(int NewHandle)
{
    Handle = NewHandle;
    return true;
}

function DumpScriptTag()
{
    IDTag.DumpScriptTag();
}

function DumpTags()
{
    IDTag.DumpTag();
}

defaultproperties
{
    Handle=-1
    DefaultExtension="mp3"
}